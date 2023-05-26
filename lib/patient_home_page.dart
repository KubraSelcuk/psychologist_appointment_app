//import 'package:psychologist_appointment/service/auth.dart';

import 'doc_info_page.dart';
import 'color_scheme.dart';
import 'package:flutter/material.dart';

class PatientHomePage extends StatelessWidget {
  const PatientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
      home: const MyFirstPage(),
      routes: {
        '/doc_info_page': (context) => const DocInfoPage(),
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
   //AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const UserAccountsDrawerHeader(
                accountName: Text("Kubra Selcuk"),
                accountEmail: Text("kubra.selcuk01@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/beyaz.png"),
                ),
              ),
              ListTile(
                title: const Text('Anasayfa'),
                leading: const Icon(Icons.home),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Profilim'),
                onTap: () {
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.person),
              ),
              const Divider(),
              ListTile(
                title: const Text('Çıkış yap'),
                onTap: () {
                 // _authService.signOut();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.remove_circle),
              ),
            ],
          ),
        ),
      backgroundColor: bgColor,
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CustomPaint(
              painter: PathPainter(),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 10, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Doktor Seçiniz",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        margin: const EdgeInsets.only(top: 10),
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            categoryContainer("category7.png", "Diyetisyen"),
                            categoryContainer("category1.png", "Ortopedi"),
                            categoryContainer("category2.png", "Gatroentoloji"),
                            categoryContainer("category3.png", "KKB"),
                            categoryContainer("category4.png", "Fizyoterapi"),
                            categoryContainer("category5.png", "Nöroloji"),
                            categoryContainer("category6.png", "Kadın-Doğum"),
                            categoryContainer("category8.png", "Diş"),
                          ],
                        ),
                      ),
                      const Text(
                        "Doktorlar",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.0,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: <Widget>[
                              createDocWidget("doc1.png", "Kübra Selçuk"),
                              createDocWidget("doc2.png", "Batuhan Küçükarslan"),
                              createDocWidget("doc3.png", "Sefa Tankal"),
                              createDocWidget("doc1.png", "Kübra Selçuk"),
                              createDocWidget("doc2.png", "Batuhan Küçükarslan"),
                              createDocWidget("doc3.png", "Sefa Tankal"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox categoryContainer(String imgName, String title) {
    return SizedBox(
      width: 130,
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/category/$imgName'),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
          )
        ],
      ),
    );
  }

  InkWell createDocWidget(String imgName, String docName) {
    return InkWell(
      onTap: openDocInfo,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: docContentBgColor,
        ),
        child: Container(
          padding: const EdgeInsets.all(7),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 70,
                height: 90,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/docprofile/$imgName'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Dr. $docName",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    width: 250,
                    height: 50,
                    child: Text(
                      "Buraya doktor hakkında kısa bir bilgi eklenecek . Bu daha çok doktor hakkında bir giriş gibi.",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void openDocInfo() {
    Navigator.pushNamed(context, '/DocInfoPage');
  }
}

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = path2Color;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.3, 0);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.03,
        size.width * 0.42, size.height * 0.17);
    path.quadraticBezierTo(
        size.width * 0.35, size.height * 0.32, 0, size.height * 0.29);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
