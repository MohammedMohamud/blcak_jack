import 'package:flutter/material.dart';
class CardsGridView extends StatelessWidget {
  const CardsGridView({
    super.key,
    required this.cards,
  });

  final List<Image> cards;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
          ),
          itemCount: cards.length,
          itemBuilder: (context, index) {

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 13.0),
              child: cards[index],
            );
          }),
    );
  }
}
