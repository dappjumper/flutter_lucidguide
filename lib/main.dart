import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';

const headerColor = primaryBlack;
const bodyColor = Colors.black54;

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(_blackPrimaryValue),
    100: Color(_blackPrimaryValue),
    200: Color(_blackPrimaryValue),
    300: Color(_blackPrimaryValue),
    400: Color(_blackPrimaryValue),
    500: Color(_blackPrimaryValue),
    600: Color(_blackPrimaryValue),
    700: Color(_blackPrimaryValue),
    800: Color(_blackPrimaryValue),
    900: Color(_blackPrimaryValue),
  },
);
const int _blackPrimaryValue = 0xFF111111;

TextStyle headline =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32);

TextStyle buttonText =
    TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 22);

TextStyle buttonTextUnderline = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.normal,
    fontSize: 22,
    decoration: TextDecoration.underline);

TextStyle subtitle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 25);

RoundedRectangleBorder buttonShape = new RoundedRectangleBorder(
  borderRadius: new BorderRadius.circular(8.0),
);

RoundedRectangleBorder buttonShapeNoOutline =
    new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0));

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.black,
      ),

      home: Scaffold(
          backgroundColor: Colors.black,
          body: (Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.0,
                      0.75,
                      1
                    ],
                    colors: [
                      const Color(0xFF000000),
                      const Color(0xFF194D65),
                      const Color(0xFFDD9191)
                    ]),
              ),
              child: SafeArea(
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Column(
                      children: [
                        Text('Project LD',
                            textAlign: TextAlign.center, style: headline),
                        Text('Lucid Dreaming Toolbox',
                            textAlign: TextAlign.center, style: subtitle)
                      ],
                    ),
                    Spacer(),
                    Column(children: [
                      OutlineButton(
                          child: Padding(
                            padding: new EdgeInsets.all(16.0),
                            child: new Text("Get started", style: buttonText),
                          ),
                          onPressed: () => {},
                          borderSide:
                              new BorderSide(color: const Color(0xFF116C89)),
                          shape: buttonShape),
                      SizedBox(height: 16),
                      OutlineButton(
                          child: Padding(
                            padding: new EdgeInsets.all(16.0),
                            child: new Text("I have an account",
                                style: buttonTextUnderline),
                          ),
                          onPressed: () => {},
                          shape: buttonShape,
                          borderSide:
                              BorderSide(width: 0.0, color: Colors.transparent))
                    ]),
                    Spacer(),
                    Column(children: [Image.asset('images/wave.png')])
                  ],
                ),
              )))),
    );
  }
}
/*
* Column(
                      children: [
                        Text(
                            'Project LD',
                            textAlign: TextAlign.center,
                            style: headline
                        ),
                        Text(
                            'Lucid Dreaming Toolbox',
                            textAlign: TextAlign.center,
                            style: subtitle
                        )
                      ],
                    ),
                    Column(
                      children: [
                        OutlineButton(
                            child: Padding(
                              padding: new EdgeInsets.all(16.0),
                              child: new Text("Get started", style: buttonText),
                            ),
                            onPressed: ()=>{},
                            borderSide: new BorderSide(color: const Color(0xFF116C89) ),
                            shape: buttonShape
                        ),
                        SizedBox(height: 16),
                        OutlineButton(
                            child: Padding(
                              padding: new EdgeInsets.all(16.0),
                              child: new Text("I have an account", style: buttonTextUnderline),
                            ),
                            onPressed: () => { },
                            shape: buttonShape,
                            borderSide: BorderSide(width: 0.0, color: Colors.transparent)
                        ),
                        Image.asset('images/wave.png'),
                      ],
* */
/*
* Column(
        children: [
          Text(
              'Project LD',
              style: Headline
          ),
          Text(
              'Lucid Dreaming Toolbox',
              style: Subtitle
          )
        ],
      ),
* */
