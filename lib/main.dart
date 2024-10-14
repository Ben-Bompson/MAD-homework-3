import 'package:flutter/material.dart';
import 'matchCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Memory Card Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MatchCard> cards = [
    MatchCard('assets/redcard.jpg'),
    MatchCard('assets/redcard.jpg'),
    MatchCard('assets/orangecard.jpg'),
    MatchCard('assets/orangecard.jpg'),
    MatchCard('assets/yellowcard.jpg'),
    MatchCard('assets/yellowcard.jpg'),
    MatchCard('assets/greencard.jpg'),
    MatchCard('assets/greencard.jpg'),
    MatchCard('assets/bluecard.jpg'),
    MatchCard('assets/bluecard.jpg'),
    MatchCard('assets/purplecard.jpg'),
    MatchCard('assets/purplecard.jpg'),
    MatchCard('assets/pinkcard.jpg'),
    MatchCard('assets/pinkcard.jpg'),
    MatchCard('assets/blackcard.jpg'),
    MatchCard('assets/blackcard.jpg'),
  ];

  int flipped = -1;

  @override
  void initState() {
    super.initState();
    cards.shuffle();
  }

  String img(int index) {
    if(cards.elementAt(index).isFaceUp()){
      return cards.elementAt(index).face;
    }
    return 'assets/cardback.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: List.generate(cards.length, (index) {
          return Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  cards.elementAt(index).flip();
                  if (flipped == -1){
                    flipped = index;
                  }
                  else{
                    if(img(index) != cards.elementAt(flipped).face){
                      setState(() {
                        cards.elementAt(index).flip();
                        cards.elementAt(flipped).flip();
                      });
                    }
                    flipped = -1;
                  }
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                
                child: Image.asset(
                  img(index),
                  height: 150,
                  width: 100,
                ),
              ),
            )
          );
        })
      ), 
    );
  }
}