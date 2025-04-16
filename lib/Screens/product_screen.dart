// ignore_for_file: prefer_const_constructors

import 'package:api_calling/Bloc/ProductBloc/product_event.dart';
import 'package:api_calling/Bloc/ProductBloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/ProductBloc/product_bloc.dart';
import '../../Models/product_model.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(FetchProducts(0, 10));

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<ProductBloc>().add(FetchProducts(0, 10));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(title: Text('Products')),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading &&
              context.read<ProductBloc>().state is! ProductLoaded) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.products.length + (state.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= state.products.length) {
                  return Center(child: CircularProgressIndicator());
                }

                Product product = state.products[index];
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white, // Set background color
                      borderRadius: BorderRadius.circular(
                          10), // Optional: Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Shadow color
                          spreadRadius: 2, // Spread radius
                          blurRadius: 5, // Blur effect
                          offset: Offset(
                              0, 3), // Shadow position (horizontal, vertical)
                        ),
                      ],
                    ),
                    child: Row(
                      spacing: 20.0,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(product.image, width: 100, height: 100),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 40,
                              child: Text(
                                product.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 20,
                              child: Text(
                                "\$${product.price}",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors
                                      .green, // Highlighting price in green
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );

                // ListTile(
                //   title:
                //   subtitle: Text("\$${product.price}"),
                //   leading:
                // );
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('No Products Available'));
          }
        },
      ),
    );
  }
}
