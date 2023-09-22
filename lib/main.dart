import 'dart:ffi';
import 'mongo.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vertical_stepper/vertical_stepper.dart';
import 'package:vertical_stepper/vertical_stepper.dart' as step;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool result = false;

  List<step.Step> steps = [
    step.Step(
      shimmer: false,
      title: "Order Placed",
      iconStyle: Colors.green,
      content: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("2022/5/20 11:35 AM Order Created !!"),
        ),
      ),
    ),
    step.Step(
      shimmer: false,
      title: "Dispatch in Progress",
      iconStyle: Colors.green,
      content: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("2022/5/20 4:20 PM Parcel Ready to Dispatch !!"),
        ),
      ),
    ),
    step.Step(
      shimmer: false,
      title: "Ready For Pickup",
      iconStyle: Colors.green,
      content: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("2022/5/20 10:30 AM Parcel Sorted !!"),
        ),
      ),
    ),
    step.Step(
      shimmer: false,
      title: "In Transit",
      iconStyle: Colors.green,
      content: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("2022/5/20 5:20 PM Arrived at delivery hub !!"),
        ),
      ),
    ),
    step.Step(
      shimmer: false,
      title: "Out For Delivery",
      iconStyle: Colors.blue,
      content: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(""),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT6Yc_N3xC9akfMD4yRs9kwCBKoaRrie9z-Rg",
                    height: 200,
                  ),
                  Text(
                    "Wool Package Tracker",
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
            ),
          ),
        ),
        body()
      ],
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35.0),
          child: Text(
            "Tracking Number:",
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 310,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "e.g #123456789"),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    result = true;
                  });
                },
                child: Icon(
                  Icons.search,
                  size: 20,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        result
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Result :",
                      style: TextStyle(fontSize: 25),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          result = false;
                        });
                      },
                      child: Icon(
                        Icons.close,
                        size: 25,
                      ),
                    )
                  ],
                ),
              )
            : SizedBox(
                height: 5,
              ),
        result
            ? Padding(
                padding: const EdgeInsets.fromLTRB(15, 2, 15, 0),
                child: VerticalStepper(
                  steps: steps,
                  dashLength: 2,
                ),
              )
            : Transform(
                transform: Matrix4.translationValues(0, -50, 0),
                child: Lottie.network(
                    "https://assets2.lottiefiles.com/packages/lf20_t24tpvcu.json"),
              )
      ],
    );
  }
}
