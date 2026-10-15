// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class TaxiFareUi extends StatefulWidget {
  const TaxiFareUi({super.key});

  @override
  State<TaxiFareUi> createState() => _TaxiFareUiState();
}

class _TaxiFareUiState extends State<TaxiFareUi> {
  //ตัวควบคุม Textfield
  TextEditingController distanceCtrl = TextEditingController();
  TextEditingController timeCtrl = TextEditingController();

  //ตัวแปร สำหรับเเสดงค่า BMI และการแปลผล
  String Fare = "0.00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ทำแถบสีเหลืองด้านบน
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Taxi Fare',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),

      backgroundColor: const Color.fromARGB(255, 253, 244, 253),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.0),
                    Image.asset(
                      'assets/images/taxi.png',
                      width: MediaQuery.of(context).size.height * 0.15,
                      height: MediaQuery.of(context).size.height * 0.15,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'คำนวณหาค่าโดยสารแท็กซี่',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    SizedBox(
                      width: 350.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ระยะทาง (กิโลเมตร) 🛣️',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          TextField(
                            controller: distanceCtrl,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              hintText: 'กรุณากรอกระยะทาง',
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 20.0,
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 255, 246, 255),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'เวลารถติด (นาที) ⏰',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          TextField(
                            controller: timeCtrl,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              hintText: 'กรุณากรอกเวลารถติด',
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 20.0,
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 255, 246, 255),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.0),
                    ElevatedButton(
                      onPressed: () {
                        // Validate (ตรวจสอบ) ui ว่าครบรึยัง
                        if (distanceCtrl.text.isEmpty ||
                            timeCtrl.text.isEmpty) {
                          //แสดง SnackBar
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "⚠️ กรุณากรอกข้อมูลให้ครบถ้วน",
                              ),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ),
                          );
                          return; //ห้ามลืม
                        }

                        //คำนวณ ระยะทางและเวลาที่รถติด และเเสดงผล
                        //แปลงค่าที่ป้อน ใน Textfield เป็นตัวเลข
                        double distance = double.parse(distanceCtrl.text);
                        double time = double.parse(timeCtrl.text);
                        double fare = 0.00;

                        //แสดงผลค่า fare พร้อมกับการแสดง การแปรผล
                        //******โค้ดหรือคำสั่งใดๆ ที่มีผลต่อการแสดงผลให้เขียนอยู่ในคำสั่ง setState()******
                        setState(() {
                          //คำนวณค่าโดยสารและเวลารถติด
                          if (distance <= 1) {
                            fare = 35;
                          } else if (distance <= 10) {
                            fare = 35 + ((distance - 1) * 6.50);
                          } else if (distance <= 20) {
                            fare = 35 + (9 * 6.50) + ((distance - 10) * 7.00);
                          } else if (distance <= 40) {
                            fare = 35 + (9 * 6.50) + (10 * 7.00) + ((distance - 20) * 8.00);
                          } else if (distance <= 60) {
                            fare = 35 + (9 * 6.50) + (10 * 7.00) + (20 * 8.00) + ((distance - 40) * 8.50);
                          } else if (distance <= 80) {
                            fare = 35 + (9 * 6.50) + (10 * 7.00) + (20 * 8.00) + (20 * 8.50) + ((distance - 60) * 9.00);
                          } else {
                            fare = 35 +(9 * 6.50) + (10 * 7.00) + (20 * 8.00) + (20 * 8.50) + (20 * 9.00) + ((distance - 80) * 10.50);
                          }
                          //เวลารถติด
                          double trafficFare = time * 3.00;
                          fare += trafficFare;
                        });
                        setState(() {
                          Fare = fare.toStringAsFixed(2);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          350.0,
                          65.0,
                        ),
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        'คำนวณค่าโดยสาร',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    ElevatedButton(
                      onPressed: () {
                        //ล้างข้อมูลทั้งหมดออกให้หน้าจอแสดงเหมือนตอนเปิดเข้าใหม่ๆ
                        setState(() {
                          distanceCtrl.text = "";
                          timeCtrl.text = "";
                          Fare = '0.00';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(350.0, 65.0),
                        backgroundColor: Color.fromARGB(255, 123, 123, 123),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        'ยกเลิก',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(height: 25.0),
                    SizedBox(
                      width: 350.0,
                      height: 200.0,
                      child: Container(
                        padding: EdgeInsets.all(35.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 250, 251, 166),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'ค่าโดยสารแท็กซี่',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              Fare,
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 255, 39, 23),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'บาท',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
