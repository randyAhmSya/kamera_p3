import 'package:flutter/material.dart';

@immutable
class PhotoFilterCarousel extends StatefulWidget {
  final ValueChanged<Color> onFilterChanged;

  const PhotoFilterCarousel({
    Key? key,
    required this.onFilterChanged,
  }) : super(key: key);

  @override
  State<PhotoFilterCarousel> createState() => _PhotoFilterCarouselState();
}

class _PhotoFilterCarouselState extends State<PhotoFilterCarousel> {
  final _filters = [
    Colors.transparent,
    Colors.white,
    Colors.red,
    Colors.blue,
    Colors.teal,
    Colors.yellow,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.indigo,
    Colors.cyan,
    Colors.amber,
    Colors.deepOrange,
  ];

  int _selectedIndex = 0;

  void _onFilterChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onFilterChanged(_filters[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black87, Colors.transparent],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_filters.length, (index) {
            bool isSelected = index == _selectedIndex;
            return GestureDetector(
              onTap: () => _onFilterChanged(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.symmetric(horizontal: 1.5),
                width: isSelected ? 85 : 70,
                height: isSelected ? 85 : 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(
                          color: Colors.white.withOpacity(0.8),
                          width: 2,
                        )
                      : null,
                  boxShadow: [
                    BoxShadow(
                      color: isSelected
                          ? Colors.white.withOpacity(0.5)
                          : Colors.black.withOpacity(0.2),
                      spreadRadius: isSelected ? 3 : 1,
                      blurRadius: isSelected ? 10 : 5,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _filters[index],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
