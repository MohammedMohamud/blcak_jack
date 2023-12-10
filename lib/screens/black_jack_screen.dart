import 'package:flutter/material.dart';
import 'dart:math';

import '../widgets/card_grid_view.dart';
import '../widgets/custom_button.dart';

class BlackJackScreen extends StatefulWidget {
  const BlackJackScreen({super.key});

  @override
  State<BlackJackScreen> createState() => _BlackJackScreenState();
}

class _BlackJackScreenState extends State<BlackJackScreen> {

  bool _isGameStarted = false;

  //card images
  List<Image> myCards = [];
  List<Image> dealerCards = [];


  //cards
  String? dealersFirstCard;
  String? dealersSecondCard;

  String? playerFirstCard;
  String? playersSecondCard;

  //Scores
  int dealersScore = 0;
  int playersScore = 0;

  //deck of cards
  final Map<String, int> deckOfCards = {
    "cards/2.1.png": 2,
    "cards/2.2.png": 2,
    "cards/2.3.png": 2,
    "cards/2.4.png": 2,
    "cards/3.1.png": 3,
    "cards/3.2.png": 3,
    "cards/3.3.png": 3,
    "cards/3.4.png": 3,
    "cards/4.1.png": 4,
    "cards/4.2.png": 4,
    "cards/4.3.png": 4,
    "cards/4.4.png": 4,
    "cards/5.1.png": 5,
    "cards/5.2.png": 5,
    "cards/5.3.png": 5,
    "cards/5.4.png": 5,
    "cards/6.1.png": 6,
    "cards/6.2.png": 6,
    "cards/6.3.png": 6,
    "cards/6.4.png": 6,
    "cards/7.1.png": 7,
    "cards/7.2.png": 7,
    "cards/7.3.png": 7,
    "cards/7.4.png": 7,
    "cards/8.1.png": 8,
    "cards/8.2.png": 8,
    "cards/8.3.png": 8,
    "cards/8.4.png": 8,
    "cards/9.1.png": 9,
    "cards/9.2.png": 9,
    "cards/9.3.png": 9,
    "cards/9.4.png": 9,
    "cards/10.1.png": 10,
    "cards/10.2.png": 10,
    "cards/10.3.png": 10,
    "cards/10.4.png": 10,
    "cards/J1.png": 10,
    "cards/J2.png": 10,
    "cards/J3.png": 10,
    "cards/J4.png": 10,
    "cards/Q1.png": 10,
    "cards/Q2.png": 10,
    "cards/Q3.png": 10,
    "cards/Q4.png": 10,
    "cards/K1.png": 10,
    "cards/K2.png": 10,
    "cards/K3.png": 10,
    "cards/K4.png": 10,
    "cards/A1.png": 11,
    "cards/A2.png": 11,
    "cards/A3.png": 11,
    "cards/A4.png": 11,
  };

  Map<String, int> playingCards ={};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playingCards.addAll(deckOfCards);
  }

  //Reset the round and reset cards
  void startNewRound(){

    _isGameStarted = true;
    //start new round with full deckOfCards
    playingCards = {};
    playingCards.addAll(deckOfCards);

    //Reset cards images
    myCards = [];
    dealerCards = [];

    Random random = Random();

    //Random card one for dealer
    String cardOneKey = playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));
    //Remove cardOneKey From playingCards
    playingCards.removeWhere((key, value) => key == cardOneKey);

    //Random card Two for dealer
    String cardTwoKey = playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));
    //Remove cardTwoKey From playingCards
    playingCards.removeWhere((key, value) => key == cardTwoKey);


    //Random card One for player
    String cardThreeKey = playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));
    //Remove cardOneKey From playingCards
    playingCards.removeWhere((key, value) => key == cardThreeKey);


    //Random card Two for player
    String cardFourKey = playingCards.keys.elementAt(random.nextInt(playingCards.keys.length));
    //Remove cardTwoKey From playingCards
    playingCards.removeWhere((key, value) => key == cardFourKey);

    //Assign card keys to dealer's cars
    dealersFirstCard = cardOneKey;
    dealersSecondCard = cardTwoKey;
    //Assign card keys to player's cars
    playerFirstCard = cardThreeKey;
    playersSecondCard = cardFourKey;

    //Adding dealers card images to display them in the grid view
    dealerCards.add(Image.asset(dealersFirstCard!));
    dealerCards.add(Image.asset(dealersSecondCard!));

    //Score for dealers
    dealersScore = deckOfCards[dealersFirstCard]! + deckOfCards[dealersSecondCard]!;

    //Adding Players card images to display them in the grid view
    myCards.add(Image.asset(playerFirstCard!));
    myCards.add(Image.asset(playersSecondCard!));

    //Score for Player
    playersScore = deckOfCards[playerFirstCard]! + deckOfCards[playersSecondCard]!;


    if(dealersScore <= 14){
      String thirdDealersCard = playingCards.keys.elementAt(random.nextInt(playingCards.length));
      dealerCards.add(Image.asset(thirdDealersCard));
      dealersScore = dealersScore + deckOfCards[thirdDealersCard]!;
    }
    setState(() {});
  }

  //add extra cards to play
  void addCard() {
    Random random = Random();

    if(playingCards.length > 0){
      String cardKey = playingCards.keys.elementAt(random.nextInt(playingCards.length));
      playingCards.removeWhere((key, value) => key == cardKey);

      myCards.add(Image.asset(cardKey));

      playersScore = playersScore + deckOfCards[cardKey]!;

      setState(() {});

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isGameStarted
          ? SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text("Dealer's Score: $dealersScore", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: playersScore <= 21 ? Colors.green[900]: Colors.red[900],
                ),),
                //Dealer's card

                CardsGridView(cards: dealerCards),

              ],
            ),


            Column(
              children: [
                Text("Player's Score: $playersScore", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: playersScore <= 21 ? Colors.green[900]: Colors.red[900],

                ),),
                //player's score

                CardsGridView(cards: myCards),
              ],
            ),


            IntrinsicWidth(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomButton(onPressed: (){
                    addCard();
                  }, label: "Add card",),
                  CustomButton(onPressed: () {
                    startNewRound();
                    addCard();
                  },label: "Next Round")

                ],
              ),
            )

          ],
        ),

      ) : Center
        (child: CustomButton(
        onPressed: () => startNewRound(), label: "Start Game",
      )
      ),
    );
  }
}

