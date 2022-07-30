import 'package:flutter/material.dart';
import 'secondscreen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF0A0E21),
      ),
      scaffoldBackgroundColor: Color(0xFF0A0E21),
    ),
    home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: BMI(),
      ),
    ),
  ));
}

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  Color maleCardColor = Color(0xFF1D1E33);
  Color femaleCardColor = Color(0xFF1D1E33);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  femaleCardColor = const Color(0xFF111328);
                  maleCardColor = const Color(0xFF1D1E33);
                });
              },
              child: GenderCard(
                Text(
                  'Male',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF8D8E98),
                  ),
                ),
                Icon(
                  Icons.male_rounded,
                  size: 50,
                ),
                maleCardColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  maleCardColor = const Color(0xFF111328);
                  femaleCardColor = const Color(0xFF1D1E33);
                });
              },
              child: GenderCard(
                Text(
                  'Female',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF8D8E98),
                  ),
                ),
                Icon(
                  Icons.female_rounded,
                  size: 50,
                ),
                femaleCardColor,
              ),
            ),
          ],
        ),
        DecoratedSlider(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomCard(Text('WEIGHT'), 60),
            BottomCard(Text('AGE'), 25),
          ],
        ),
        Expanded(child: bottombutton()),
      ],
    );
  }
}

class DecoratedSlider extends StatefulWidget {
  const DecoratedSlider({Key? key}) : super(key: key);

  @override
  State<DecoratedSlider> createState() => _DecoratedSliderState();
}

class _DecoratedSliderState extends State<DecoratedSlider> {
  double sliderValue = 100;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 340,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'HEIGHT',
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xFF8D8E98),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                sliderValue.round().toString(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'cm',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          SliderTheme(
            data: const SliderThemeData(
              activeTrackColor: Color(0xFFEB1555),
              inactiveTrackColor: Color(0xFF8D8E98),
              thumbColor: Color(0xFFEB1555),
              overlayColor: Color(0x29EB1555),
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 7,
              ),
            ),
            child: Slider(
                min: 100,
                max: 200,
                value: sliderValue,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                }),
          )
        ],
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final Text cardtext;
  final Icon cardicon;
  final Color cardcolor;
  GenderCard(this.cardtext, this.cardicon, this.cardcolor);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 150,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardcolor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            cardicon,
            const SizedBox(
              height: 20,
            ),
            cardtext,
          ],
        ),
      ),
    );
  }
}

class BottomCard extends StatefulWidget {
  BottomCard(this.cardtext, this.cardvalue);
  final Text cardtext;
  int cardvalue;

  @override
  State<BottomCard> createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 150,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.cardtext,
          SizedBox(
            height: 15,
          ),
          Text(
            widget.cardvalue.toString(),
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Color(0xFF4C4F5C),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.cardvalue--;
                    });
                  },
                  icon: const Icon(Icons.remove),
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 5),
              CircleAvatar(
                backgroundColor: Color(0xFF4C4F5C),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.cardvalue++;
                    });
                  },
                  icon: const Icon(Icons.add),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class bottombutton extends StatelessWidget {
  const bottombutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return secondscreen();
            },
          ),
        );
      },
      child: Container(
        child: Center(
          child: Text(
            'CALCULATE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10.0),
        width: 330,
        height: 30,
      ),
    );
  }
}

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("result page"),
    );
  }
}
