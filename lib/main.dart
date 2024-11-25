import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      home: Scaffold(
        appBar: AppBar(title: const Text("Winter Collection")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2, // Two columns
            mainAxisSpacing: 8, // Vertical spacing between rows
            crossAxisSpacing: 8, // Horizontal spacing between columns
            children: [
              buildImageWithText('images/photo1.png', 'EGP 600.000'),
              buildImageWithText('images/photo2.png', 'EGP 500.000'),
              buildImageWithText('images/photo3.jpg', 'EGP 400.000'),
              buildImageWithText('images/photo4.jpg', 'EGP 550.000'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageWithText(String imagePath, String text) {
    return Stack(
      children: [
        // Background Image
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        // Grey Gradient Overlay with Limited Height
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 50, // Limit the height of the grey layer
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}