import 'dart:io';
import 'package:camera_filter/widget/Carousel.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;

  const DisplayPictureScreen({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  _DisplayPictureScreenState createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  Color _selectedFilterColor = Colors.transparent;

  Widget _buildImageWidget() {
    return kIsWeb
        ? Image.network(
            widget.imagePath,
            color: _selectedFilterColor.withOpacity(0.5),
            colorBlendMode: BlendMode.color,
            fit: BoxFit.cover,
          )
        : Image.file(
            File(widget.imagePath),
            color: _selectedFilterColor.withOpacity(0.5),
            colorBlendMode: BlendMode.color,
            fit: BoxFit.cover,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Gambar dengan filter
          Positioned.fill(
            child: _buildImageWidget(),
          ),

          // Selector filter di bagian bawah
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: PhotoFilterCarousel(
              onFilterChanged: (color) {
                setState(() {
                  _selectedFilterColor = color;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
