import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int playerOScore = 0;
  int playerXScore = 0;

  //this variables indicates if the game is ON or OFF (based on if there is someone who won)
  bool isGameOn = true;

  List<Widget> valuesWidgets = [
    const Text(' '),
    const Text(' '),
    const Text(' '),
    const Text(' '),
    const Text(' '),
    const Text(' '),
    const Text(' '),
    const Text(' '),
    const Text(' ')
  ];

  List<String> valuesString = [
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
    ' ',
  ];

  bool isPlayerOTurn = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Tic Tac Toe'),
        actions: [
          IconButton(
            icon: const Icon(Icons.replay),
            onPressed: () {
              //when pressed re intilize some variables
              setState(() {
                isGameOn = true;
                valuesWidgets = [
                  const Text(' '),
                  const Text(' '),
                  const Text(' '),
                  const Text(' '),
                  const Text(' '),
                  const Text(' '),
                  const Text(' '),
                  const Text(' '),
                  const Text(' ')
                ];
                valuesString = [
                  ' ',
                  ' ',
                  ' ',
                  ' ',
                  ' ',
                  ' ',
                  ' ',
                  ' ',
                  ' ',
                ];
              });
            },
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Player O',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: playerOScore > playerXScore
                            ? Colors.green
                            : playerXScore == playerOScore
                                ? Colors.orange
                                : Colors.red[400]),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '$playerOScore',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              const SizedBox(width: 100),
              Column(
                children: [
                  Text(
                    'Player X',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: playerXScore > playerOScore
                            ? Colors.green
                            : playerXScore == playerOScore
                                ? Colors.orange
                                : Colors.red[400]),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '$playerXScore',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            // width of the column is .33 of table width
            defaultColumnWidth: const FractionColumnWidth(.33),
            border: TableBorder.all(width: 2, color: Colors.grey[700]!),
            children: [
              TableRow(children: [
                GestureDetector(
                  child: SizedBox(
                    width: screenWidth * .33,
                    height: screenWidth * .33,
                    child: valuesWidgets[0],
                  ),
                  onTap: () {
                    setState(() {
                      xOrO(1);
                    });
                  },
                ),
                GestureDetector(
                  child: SizedBox(
                    width: screenWidth * .33,
                    height: screenWidth * .33,
                    child: valuesWidgets[1],
                  ),
                  onTap: () {
                    setState(() {
                      xOrO(2);
                    });
                  },
                ),
                GestureDetector(
                  child: SizedBox(
                    width: screenWidth * .33,
                    height: screenWidth * .33,
                    child: valuesWidgets[2],
                  ),
                  onTap: () {
                    setState(() {
                      xOrO(3);
                    });
                  },
                ),
              ]),
              TableRow(children: [
                GestureDetector(
                  child: SizedBox(
                    width: screenWidth * .33,
                    height: screenWidth * .33,
                    child: valuesWidgets[3],
                  ),
                  onTap: () {
                    setState(() {
                      xOrO(4);
                    });
                  },
                ),
                GestureDetector(
                  child: SizedBox(
                    width: screenWidth * .33,
                    height: screenWidth * .33,
                    child: valuesWidgets[4],
                  ),
                  onTap: () {
                    setState(() {
                      xOrO(5);
                    });
                  },
                ),
                GestureDetector(
                  child: SizedBox(
                    width: screenWidth * .33,
                    height: screenWidth * .33,
                    child: valuesWidgets[5],
                  ),
                  onTap: () {
                    setState(() {
                      xOrO(6);
                    });
                  },
                ),
              ]),
              TableRow(children: [
                GestureDetector(
                  child: SizedBox(
                    width: screenWidth * .33,
                    height: screenWidth * .33,
                    child: valuesWidgets[6],
                  ),
                  onTap: () {
                    setState(() {
                      xOrO(7);
                    });
                  },
                ),
                GestureDetector(
                  child: SizedBox(
                    width: screenWidth * .33,
                    height: screenWidth * .33,
                    child: valuesWidgets[7],
                  ),
                  onTap: () {
                    setState(() {
                      xOrO(8);
                    });
                  },
                ),
                GestureDetector(
                  child: SizedBox(
                    width: screenWidth * .33,
                    height: screenWidth * .33,
                    child: valuesWidgets[8],
                  ),
                  onTap: () {
                    setState(() {
                      xOrO(9);
                    });
                  },
                ),
              ]),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            isPlayerOTurn ? 'Turn of O' : 'Turn of X',
            style: const TextStyle(fontSize: 18, color: Colors.white),
          )
        ],
      ),
    );
  }

  xOrO(int blockNumber) {
    var index = blockNumber - 1;
    if (!isGameOn) {
      return;
    }

    if (valuesString[index] != ' ') {
      return;
    }

    final text = isPlayerOTurn ? 'O' : 'X';

    valuesString[index] = text;

    valuesWidgets[index] = Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 70,
          color: isPlayerOTurn ? Colors.red : Colors.white,
        ),
      ),
    );
    isPlayerOTurn = !isPlayerOTurn;
    checkWhoIsWinner();
  }

  checkWhoIsWinner() {
    String value = '';
    //store the X and O values in this string where the first character is for the first block and so on ...
    for (var character in valuesString) {
      value += character;
    }

    // check if O player is the winner
    bool isOPlayerWinner = RegExp(
            'OOO.*|.*OOO.*|.*OOO|O.{2}O.{2}O.{2}|.O.{2}O.{2}O.|.{2}O.{2}O.{2}O|.{2}O.O.O.{2}|O.{3}O.{3}O')
        .hasMatch(value);

    // check if X player is the winner
    bool isXPlayerWinner = RegExp(
            'XXX.*|.*XXX.*|.*XXX|X.{2}X.{2}X.{2}|.X.{2}X.{2}X.|.{2}X.{2}X.{2}X|.{2}X.X.X.{2}|X.{3}X.{3}X')
        .hasMatch(value);

    if (isOPlayerWinner) {
      playerOScore += 1;
      isGameOn = false;
    }

    if (isXPlayerWinner) {
      playerXScore += 1;
      isGameOn = false;
    }
  }

  //Widget showWinner
}
