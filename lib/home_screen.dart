import 'package:api_calling/Screens/PostScreens/post_screen.dart';
import 'package:api_calling/Screens/auth_screen.dart';
import 'package:api_calling/Screens/form_screen.dart';
import 'package:api_calling/Screens/hydrated_bloc_screen.dart';
import 'package:api_calling/Screens/notification_screen.dart';
import 'package:api_calling/Screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'Screens/PostScreens/LocalCrud/local_crud_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF7E99A3), Color(0xFFA5BFCC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          /// Main Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// App Title
                  const Text(
                    "Dashboard",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// Glassmorphic Menu Cards
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: [
                        _buildMenuCard(
                          context,
                          "Get API",
                          Icons.cloud_download,
                          PostScreen(),
                        ),
                        _buildMenuCard(
                          context,
                          "Post API",
                          Icons.cloud_upload,
                          const FormScreen(),
                        ),
                        _buildMenuCard(
                          context,
                          "Local DB",
                          Icons.storage,
                          const LocalCrudScreen(),
                        ),
                        _buildMenuCard(
                          context,
                          "Auth",
                          Icons.lock,
                          AuthScreen(),
                        ),
                        _buildMenuCard(
                          context,
                          "Products",
                          Icons.shopping_bag,
                          ProductScreen(),
                        ),
                        _buildMenuCard(
                          context,
                          "Counter Hydrated",
                          Icons.shopping_bag,
                          const HydratedBlocScreen(),
                        ),
                        _buildMenuCard(
                          context,
                          "Notification",
                          Icons.shopping_bag,
                          const NotificationScreen(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Glassmorphism Card Widget
  Widget _buildMenuCard(
      BuildContext context, String title, IconData icon, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: GlassmorphicContainer(
        width: double.infinity,
        height: 120,
        borderRadius: 20,
        blur: 10,
        alignment: Alignment.center,
        border: 2,
        linearGradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.2),
            Colors.white.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderGradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.3),
            Colors.white.withOpacity(0.1),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
