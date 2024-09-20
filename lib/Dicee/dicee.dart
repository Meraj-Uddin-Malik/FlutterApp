import 'package:flutter/material.dart';
import 'dart:math';



class DiceeApp extends StatefulWidget {
  const DiceeApp({super.key});

  @override
  State<DiceeApp> createState() => _DiceeAppState();
}

class _DiceeAppState extends State<DiceeApp> {
  int LeftDiceNumber = 1;
  int RightDiceNumber = 1;

  int leftConsecutiveSixes = 0;
  int rightConsecutiveSixes = 0;

  String leftDiceMessage = 'Let\'s roll the left dice!';
  String rightDiceMessage = 'Let\'s roll the right dice!';

  int player1Score = 0; // Player 1 score
  int player2Score = 0; // Player 2 score

  bool gameWon = false; // Flag to track if the game is won
  String winnerMessage = ''; // Message for the winner

  bool isLeftDiceTurn = true; // Track whose turn it is

  void rollLeftDice() {
    if (!gameWon && isLeftDiceTurn) {
      setState(() {
        LeftDiceNumber = Random().nextInt(6) + 1;

        if (LeftDiceNumber == 6) {
          leftConsecutiveSixes++;
          leftDiceMessage = 'Player 1: Wow! You got a 6!';
          player1Score += 6; // Add score for 6
          // Player can roll again, keep the turn
        } else {
          leftDiceMessage = 'Player 1: You got $LeftDiceNumber';
          player1Score += LeftDiceNumber; // Add normal score
          isLeftDiceTurn = false; // Switch to right dice turn
        }
        rightDiceMessage = '';
        checkWin();
      });
    }
  }

  void rollRightDice() {
    if (!gameWon && !isLeftDiceTurn) {
      setState(() {
        RightDiceNumber = Random().nextInt(6) + 1;

        if (RightDiceNumber == 6) {
          rightConsecutiveSixes++;
          rightDiceMessage = 'Player 2: Wow! You got a 6!';
          player2Score += 6; // Add score for 6
          // Player can roll again, keep the turn
        } else {
          rightDiceMessage = 'Player 2: You got $RightDiceNumber';
          player2Score += RightDiceNumber; // Add normal score
          isLeftDiceTurn = true; // Switch to left dice turn
        }
        checkWin();
        leftDiceMessage = '';
      });
    }
  }

  void resetScore() {
    setState(() {
      player1Score = 0;
      player2Score = 0;
      leftDiceMessage = 'Let\'s roll the left dice!';
      rightDiceMessage = 'Let\'s roll the right dice!';
      gameWon = false; // Reset game won flag
      winnerMessage = ''; // Reset winner message
    });
  }

  void checkWin() {
    if (player1Score >= 100) {
      gameWon = true;
      winnerMessage = 'Player 1 wins with $player1Score points!';
    } else if (player2Score >= 100) {
      gameWon = true;
      winnerMessage = 'Player 2 wins with $player2Score points!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontFamily: 'Pacifico',
          ),
        ),

        body: Center(
          child: gameWon
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                leftDiceMessage.isNotEmpty
                    ? leftDiceMessage
                    : rightDiceMessage,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: resetScore,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                ),
                child: const Text(
                  'Play Again',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
              : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Lets Play Dice Game',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontFamily: 'Source Code Pro',
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: rollLeftDice,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child:
                      Image.asset('images/dice$LeftDiceNumber.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: rollRightDice,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child:
                      Image.asset('images/dice$RightDiceNumber.png'),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              leftDiceMessage,
              style: TextStyle(
                color: LeftDiceNumber == 6
                    ? Colors.red
                    : Colors.white, // Red if 6
                fontSize: 16.0,
                fontWeight: LeftDiceNumber == 6
                    ? FontWeight.bold
                    : FontWeight.normal, // Bold if 6
              ),
            ),
            Text(
              rightDiceMessage,
              style: TextStyle(
                color: RightDiceNumber == 6
                    ? Colors.red
                    : Colors.white, // Red if 6
                fontSize: 16.0,
                fontWeight: RightDiceNumber == 6
                    ? FontWeight.bold
                    : FontWeight.normal, // Bold if 6
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Player 1 Score: $player1Score',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Player 2 Score: $player2Score',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (gameWon) // Show only the winner message if the game is won
              Text(
                winnerMessage,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: resetScore,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red // Button color
              ), // Reset button calls resetScore function
              child: const Text(
                'Reset Scores',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
