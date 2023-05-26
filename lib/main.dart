//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'color_scheme.dart';
import 'choose_login.dart';
//import 'firebase_options.dart';


void main() async {
  //  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
      home: const MyFirstPage(),
      routes: {
        '/main': (context) => const MyApp(),
        '/choose_login': (context) => const ChooseLogin(),
      },
    );
  }
}

class MyFirstPage extends StatefulWidget {
  const MyFirstPage({super.key});

  @override
  State<MyFirstPage> createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  painter: PathPainter(),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(50),
                margin: const EdgeInsets.only(top: 50),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Online Psikolog Terapi Randevu Sistemi",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height / 6.0,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Image.asset('assets/onBoardDoc.png'),
                    )),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: openChooseLogin,
                  child: Container(
                    height: 80,
                    width: 200,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          stops: [0, 1],
                          colors: [getStartedColorStart, getStartedColorEnd],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                        )),
                    child: const Center(
                      child: Text(
                        "Başla",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void openChooseLogin() {
    Navigator.pushNamed(context, '/choose_login');
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = path1Color;
    paint.style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.35, size.height * 0.40,
        size.width * 0.58, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.72, size.height * 0.8,
        size.width * 0.92, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.98, size.height * 0.8, size.width, size.height * 0.82);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
