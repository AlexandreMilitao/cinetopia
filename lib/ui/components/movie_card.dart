import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          width: 90,
          height: 120,
          decoration: BoxDecoration(
              color: Color(0xFF000000), borderRadius: BorderRadius.circular(8)),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                "Titulo do Filme",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              "Lançmento do filme : 23-06-1999",
              style: TextStyle(color: Color(0xFFA5A5A5)),
            )
          ],
        )
      ],
    );
  }
}
