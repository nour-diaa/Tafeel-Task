import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imageUrl;
  double size;

  ImageContainer(this.imageUrl, {this.size = 300});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (size * 0.7),
      height: (size * 0.7),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Color(0xff84c1ff)),
      child: Center(
        child: Container(
          width: (size * 0.6),
          height: (size * 0.6),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Color(0xffadd6ff)),
          child: Center(
            child: Container(
              width: (size * 0.5),
              height: (size * 0.5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffadd6ff),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.fill)),
            ),
          ),
        ),
      ),
    );
  }
}
