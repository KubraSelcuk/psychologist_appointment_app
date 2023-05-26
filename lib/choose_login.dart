import 'package:flutter/material.dart';
import 'main.dart';
import 'patient_login.dart';

class ChooseLogin extends StatelessWidget {
  const ChooseLogin({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
      home: const ChooseLoginPage(),
      routes: {
        '/main': (context) => const MyApp(),
        '/patient_login': (context) => const PatientLogin(),
      },
    );
  }
}

class ChooseLoginPage extends StatefulWidget {
  const ChooseLoginPage({super.key});

  @override
  State<ChooseLoginPage> createState() => _ChooseLoginPageState();
}

class _ChooseLoginPageState extends State<ChooseLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giriş Yap'),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/main');
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/patient_login');
              },
              child: const Text('Kullanıcı Girişi'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/doctor_login');
              },
              child: const Text('Doktor Girişi'),
            ),
          ],
        ),
      ),
    );
  }
}
