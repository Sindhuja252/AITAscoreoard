import 'package:flutter/material.dart';

class ScoreProviderValue extends ChangeNotifier {
  int a = 0, b = 0, c = 0; // Player 1 scoring
  int d = 0, e = 0, f = 0; // Player 2 scoring
  int player1Increment = 0;
  int player2Increment = 0;
  bool status = true; // Status indicating whether the game can proceed

  void player1increment(BuildContext context) {
    // Check if Player 1 or Player 2 has already won
    if ((a == 6 && b == 6) || (d == 6 && e == 6)) {
      return;
    }

    // Handle increments for Player 1
    if (player1Increment < 30) {
      player1Increment += 15;
    } else if (player1Increment < 45) {
      player1Increment += 10;
    }

    print("Player 1 Increment: $player1Increment");
    print("Player 2 Increment: $player2Increment");


    if (player1Increment == 40 && player2Increment == 40) {
      status = false;
      notifyListeners();// Pause the game
      print("AD - Advantage situation");
      return;
    }


    status = true;


    if (player1Increment > 40) {
      player1Increment = 0;
      if (a < 6) {
        a += 1;
      } else if (a == 6 && b < 6) {
        b += 1;
      }

      if (a == 6 && b == 6) {
        _showWinPopup(context, "Player 1 Wins!");
      }
    }

    notifyListeners();
  }

  void player2increment(BuildContext context) {
    // Check if Player 2 or Player 1 has already won
    if ((d == 6 && e == 6) || (a == 6 && b == 6)) {
      return;
    }

    // Handle increments for Player 2
    if (player2Increment < 30) {
      player2Increment += 15;
    } else if (player2Increment < 45) {
      player2Increment += 10;
    }

    print("Player 1 Increment: $player1Increment");
    print("Player 2 Increment: $player2Increment");

    // Handle 'AD' case when both increments are 40
    if (player1Increment == 40 && player2Increment == 40) {
      status = false;
      notifyListeners();
      print("AD - Advantage situation");
      return;
    }
    status = true;


    if (player2Increment > 40) {
      player2Increment = 0;
      if (d < 6) {
        d += 1;
      } else if (d == 6 && e < 6) {
        e += 1;
      }

      if (d == 6 && e == 6) {
        _showWinPopup(context, "Player 2 Wins!");
      }
    }

    notifyListeners();
  }

  // Show win popup
  void _showWinPopup(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
