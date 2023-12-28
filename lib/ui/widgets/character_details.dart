import 'package:flutter/material.dart';

class CharacterDetails extends StatelessWidget {
  const CharacterDetails(
      {Key? key, required this.title, required this.subTitle})
      : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF5B6975),
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 0.11,
            letterSpacing: 0.50,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          subTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 0.10,
            letterSpacing: 0.25,
          ),
        ),
      ],
    );
  }
}
