import 'color_scheme.dart';
import 'package:flutter/material.dart';

class DocInfoPage extends StatelessWidget {
  const DocInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
      ),
      home: const docInfoPage(),
    );
  }
}
// ignore: camel_case_types
class docInfoPage extends StatefulWidget {
  const docInfoPage({super.key});

  @override
  State<docInfoPage> createState() => _DocInfoPageState();
}

class _DocInfoPageState extends State<docInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [getStartedColorStart, getStartedColorEnd],
            begin: Alignment(0, -1.15),
            end: Alignment(0,0.1),
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height*0.4,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/images/docinfo/bg1.png'),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.6,
                width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: bgColor,
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset('assets/images/docprofile/doc1.png'),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Dr. Kübra Selçuk", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),),
                              Text("Psikiyatirist Uzmanı", style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),)
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text("Doktor Hakkında", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),),
                            const SizedBox(height: 10,),
                            const Text("Lütfen doktorun tanımını buraya yazınız. Bu, doktor ve doktorun son yıllarda sahip olduğu roller ve başarılar hakkında ayrıntılı bir bilgi olacaktır.", style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),),
                            const SizedBox(height: 10,),
                            const Text("Musait olunan zaman dilimleri", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),),
                            const SizedBox(height: 5,),
                            timeSlotWidget("13", "Mayıs", "Muayene", "Pazar 9:00-11.30"),
                            timeSlotWidget("14", "Mayıs", "Muayene", "Pazartesi 10:00-12.30"),
                            timeSlotWidget("1", "Mayıs", "Muayene", "Wednesday 8:00-12.30 pm"),
                            timeSlotWidget("3", "Mayıs", "Muayene", "Cuma 8:00-13:00"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
  Container timeSlotWidget(String date, String month, String slotType, String time)
  {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: docContentBgColor
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              width: 70,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: dateBgColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(date, style: const TextStyle(
                    color: dateColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w800
                  ),),
                  Text(month, style: const TextStyle(
                    color: dateColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w800
                  ),)
                ],
              ),
            ),
            const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(slotType, style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),),
                Text(time, style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}