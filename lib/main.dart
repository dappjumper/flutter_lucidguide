import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/widgets.dart';
import './styles.dart';
import './components/ui.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';

RoundedRectangleBorder buttonShape = new RoundedRectangleBorder(
  borderRadius: new BorderRadius.circular(8.0),
);

RoundedRectangleBorder buttonShapeNoOutline =
    new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0));

var mainGradient = [];

void main() => runApp(InteractiveLogin());

class InteractiveLogin extends StatefulWidget {
  @override
  _InteractiveLoginState createState() => _InteractiveLoginState();

  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _InteractiveLoginState extends State<InteractiveLogin>
    with SingleTickerProviderStateMixin {
  bool _isJWT = false;
  bool _isWallet = false;
  String _address = 'Hello';
  String _wallet;
  String _subState = 'initial';

  void _createWallet(BuildContext context) {
    _subState = 'createWallet';
    _address = "Blank";
    setState(() {
      _address = _address;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyan[600],

          // Define the default font family.
          fontFamily: 'Roboto',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(),
        ),
        home: (Scaffold(
            backgroundColor: Colors.black,
            body: (Container(
                decoration: BoxDecoration(gradient: MainGradient),
                child: SafeArea(
                  child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      lucidLogo,
                      Spacer(),
                      LoginForm(),
                      Spacer(),
                      Image.asset('images/wave.png')
                    ],
                  ),
                ))))));
  }
// ···
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _hasJWT = false;
  bool _hasWallet = false;
  String _walletJSON = '';
  String _address = '0x0000...';
  String _state = 'loading';

  _LoginFormState() {
    checkJWT().then((val) => setState(() {
          //_hasJWT = val;
          if (val != '') {
            //The user has a JWT token stored
            //TODO Validate JWT
            _state = 'validateJWT';
          } else {
            checkWallet().then((val) => setState(() {
                  if (val != '') {
                    //User has Wallet stored
                    //TODO Decrypt wallet
                    _state = 'decryptWallet';
                  } else {
                    //No wallet, no JWT
                    _state = 'initial';
                  }
                }));
          }
        }));
  }

  Widget getWidget() {
    final createWalletPasswordController = TextEditingController();

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      createWalletPasswordController.dispose();
      super.dispose();
    }

    switch (_state) {
      case 'initial':
        return Column(key: ValueKey<String>(_state), children: [
          OutlineButton(
              child: Padding(
                padding: new EdgeInsets.all(16.0),
                child: new Text("Get started", style: buttonText),
              ),
              onPressed: () => {
                    setState(() {
                      _state = 'createWallet';
                    })
                  },
              borderSide: new BorderSide(color: const Color(0xFF116C89)),
              shape: buttonShape),
          SizedBox(height: 16),
          OutlineButton(
              child: Padding(
                padding: new EdgeInsets.all(16.0),
                child:
                    new Text("I have an account", style: buttonTextUnderline),
              ),
              onPressed: () => {
                    setState(() {
                      _state = 'importWallet';
                    })
                  },
              shape: buttonShape,
              borderSide: BorderSide(width: 0.0, color: Colors.transparent))
        ]);
        break;

      case 'createWallet':
        return Column(key: ValueKey<String>(_state), children: [
          Text('Please enter a password', style: subtitle),
          SizedBox(height: 16),
          Container(
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              height: 45.0,
              child: TextField(
                  controller: createWalletPasswordController,
                  obscureText: true,
                  autofocus: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                  ))),
          SizedBox(height: 16),
          OutlineButton(
              child: Padding(
                padding: new EdgeInsets.all(16.0),
                child: new Text("I'm ready", style: buttonText),
              ),
              onPressed: () => {
                    setState(() {

                      _state = 'encryptWallet';
                    })
                  },
              borderSide: new BorderSide(color: const Color(0xFF116C89)),
              shape: buttonShape),
          SizedBox(height: 16),
          OutlineButton(
              child: Padding(
                padding: new EdgeInsets.all(16.0),
                child: new Text("Back", style: buttonTextUnderline),
              ),
              onPressed: () => {
                    setState(() {
                      _state = 'initial';
                    })
                  },
              shape: buttonShape,
              borderSide: BorderSide(width: 0.0, color: Colors.transparent))
        ]);
        break;

      case 'importWallet':
        return Column(key: ValueKey<String>(_state), children: [
          Text('Please choose a method', style: subtitle),
          SizedBox(height: 16),
          OutlineButton(
              child: Padding(
                padding: new EdgeInsets.all(16.0),
                child: new Text("QR Code", style: buttonText),
              ),
              onPressed: () => {
                    setState(() {
                      _state = 'QRView';
                    })
                  },
              borderSide: new BorderSide(color: const Color(0xFF116C89)),
              shape: buttonShape),
          SizedBox(height: 16),
          OutlineButton(
              child: Padding(
                padding: new EdgeInsets.all(16.0),
                child: new Text("From file", style: buttonText),
              ),
              onPressed: () => {
                    setState(() {
                      _state = 'fromFile';
                    })
                  },
              borderSide: new BorderSide(color: const Color(0xFF116C89)),
              shape: buttonShape),
          SizedBox(height: 16),
          OutlineButton(
              child: Padding(
                padding: new EdgeInsets.all(16.0),
                child: new Text("Back", style: buttonTextUnderline),
              ),
              onPressed: () => {
                    setState(() {
                      _state = 'initial';
                    })
                  },
              shape: buttonShape,
              borderSide: BorderSide(width: 0.0, color: Colors.transparent))
        ]);
        break;

      default:
        return Column(key: ValueKey<String>(_state), children: [
          Container(
            child: Center(
              child: Loading(indicator: BallPulseIndicator(), size: 100.0,color: Colors.white),
            ),
          ),
          OutlineButton(
              child: Padding(
                padding: new EdgeInsets.all(16.0),
                child: new Text("Back", style: buttonText),
              ),
              onPressed: () => {
                    setState(() {
                      _state = 'initial';
                    })
                  },
              borderSide: new BorderSide(color: const Color(0xFF116C89)),
              shape: buttonShape),
        ]);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: getWidget()),
    );
  }
}

checkJWT() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String _jwt = (prefs.getString('_jwt') ?? '');
  return _jwt;
}

checkWallet() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String _wallet = (prefs.getString('_wallet') ?? '');
  return _wallet;
}

Scaffold dashboardScreen = Scaffold(
    backgroundColor: Colors.white, body: (Text('Howdy', style: headline)));
