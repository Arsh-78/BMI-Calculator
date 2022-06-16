import 'package:bmi_calculator/Components/bottom_button.dart';
import 'package:bmi_calculator/Components/gender_card.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import 'package:bmi_calculator/Components/round_icon_button.dart';
import 'package:bmi_calculator/Screens/results_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  int height = 190;
  int weight = 80;
  int age = 35;
  // Color maleCardColor = inactiveCardclr;
  // Color femaleCardColor = inactiveCardclr;
  //
  // void updateColor(Gender selectedGender) {
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColor == inactiveCardclr) {
  //       maleCardColor = activeCardclr;
  //       femaleCardColor = inactiveCardclr;
  //     } else {
  //       maleCardColor = inactiveCardclr;
  //     }
  //   } else {
  //     if (femaleCardColor == inactiveCardclr) {
  //       femaleCardColor = activeCardclr;
  //       maleCardColor = inactiveCardclr;
  //     } else {
  //       femaleCardColor = inactiveCardclr;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    clr: selectedGender == Gender.male
                        ? kActiveCardclr
                        : kInactiveCardclr,
                    cardChild: genderCard(
                      gender: 'MALE',
                      genIcon: FontAwesomeIcons.mars,
                    ),
                    onPress: () {
                      setState(
                        () {
                          selectedGender = Gender.male;
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    clr: selectedGender == Gender.female
                        ? kActiveCardclr
                        : kInactiveCardclr,
                    cardChild: genderCard(
                      gender: 'FEMALE',
                      genIcon: FontAwesomeIcons.venus,
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              clr: kInactiveCardclr,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kHeightTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0XFF8D8E98),
                        thumbColor: Color(0XFFEB1555),
                        activeTrackColor: Colors.white,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 25.0),
                        overlayColor: Color(0x29EB1555)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220,
                        onChanged: (double newVal) {
                          setState(() {
                            height = newVal.toInt();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    clr: kInactiveCardclr,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kTextStyle),
                        Text(
                          weight.toString(),
                          style: kHeightTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    clr: kInactiveCardclr,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kHeightTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiRes: calc.caculateBMI(),
                      resText: calc.getResult(),
                      resComment: calc.getComment(),
                    ),
                  ));
            },
            buttonTitle: 'CALCULATE',
          )
        ],
      ),
    );
  }
}
