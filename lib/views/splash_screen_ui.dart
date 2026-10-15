import 'package:flutter/material.dart';
import 'package:flutter_taxi_fare_app/views/taxi_fare_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    //TODO: implement initState
    //หน่วงหน้าจอไว้3วิ แล้วเปิดไปหน้าhomeuiแบบย้อนกลับไปไม่ได้
    Future.delayed(
        //เวลาที่หน่วง
        Duration(
          seconds: 5,
        ),
        //ครบเเล้วทำอะไร
        () {
      //เปิดไปหน้าtaxifareui แบบย้อนกลับไปไม่ได้
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TaxiFareUi()),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 244, 253),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/taxi.png',
              width: MediaQuery.of(context).size.height * 0.20,
              height: MediaQuery.of(context).size.height * 0.20,
              fit: BoxFit.cover,
            ),
            Container(
              height: 25,
            ),
            Text(
              'Taxi Fare Calculator',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.025,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 74, 172, 253),
              ),
            ),
            Text(
              'คำนวณค่าโดยสารแท็กซี่',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.020,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 74, 172, 253),
              ),
            ),
            Container(
              height: 25,
            ),
            CircularProgressIndicator(
              color: const Color.fromARGB(255, 249, 212, 48),
            ),
          ],
        ),
      ),
    );
  }
}