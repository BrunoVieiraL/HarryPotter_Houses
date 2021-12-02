import 'package:flutter/material.dart';
import 'package:hp_houses/helper.dart';
import 'helper.dart';

void main() => runApp(const HarryPotterHouses());

class HarryPotterHouses extends StatelessWidget {
  const HarryPotterHouses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const HarryPoterPage(),
    );
  }
}

Helper helper = Helper();

class HarryPoterPage extends StatefulWidget {
  const HarryPoterPage({Key? key}) : super(key: key);

  @override
  _HarryPoterPageState createState() => _HarryPoterPageState();
}

class _HarryPoterPageState extends State<HarryPoterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'imagens/harrypotter.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: Text(
                      helper.getQuestion(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    setState(() {
                      helper.nextQuestion(1);
                    });
                  },
                  child: Text(
                    helper.getChoice1(),
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: helper.buttonShoudBeVisible(),
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.purple),
                    onPressed: () {
                      setState(() {
                        helper.nextQuestion(2);
                      });
                    },
                    child: Text(
                      helper.getChoice2(),
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

