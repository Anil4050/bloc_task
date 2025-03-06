// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _descriptionController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Form Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Description'),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Submit'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
