import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'component/glassmorphism.dart';
import 'models/category.dart';

class Dashboard extends StatelessWidget {
  final String dap;
  final String water;
  final String air;
  final String humidity;
  final bool heater;
  final bool fan;
  final String ec;
  final bool aNutrition;
  final bool bNutrition;
  final String ph;
  final bool phUp;
  final bool phDown;
  final String waterFlow;
  final bool aPump;
  final bool bPump;

  Dashboard({
    required this.dap,
    required this.water,
    required this.air,
    required this.humidity,
    required this.heater,
    required this.fan,
    required this.ec,
    required this.aNutrition,
    required this.bNutrition,
    required this.ph,
    required this.phUp,
    required this.phDown,
    required this.waterFlow,
    required this.aPump,
    required this.bPump,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Back"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/aurora-background.png"), fit: BoxFit.cover)
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 90, left: 30, right: 30),
              color: Colors.transparent,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.power,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  _dateCard(dap: dap),
                  SizedBox(height: 20,),
                  Container(
                    height: 135,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: _temperatureCard(),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          flex: 1,
                          child: _humidityCard(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  _heaterFanControl(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _dateCard({required String dap}) {
  return Glassmorphism(
    blur: 20,
    opacity: 0.1,
    radius: 8,
    child: Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'DATETIME',
                style: TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.systemGrey2,
                ),
              ),
              const SizedBox(height: 10,),
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(width: 30,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DAP',
                style: TextStyle(
                  fontSize: 16,
                  color: CupertinoColors.systemGrey2,
                ),
              ),
              SizedBox(height: 10,),
              /* text diganti stateful, data dari database */
              Text(
                dap,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}



Widget _temperatureCard() {
  return Glassmorphism(
    blur: 20,
    opacity: 0.1,
    radius: 8,
    child: Container(
      padding: const EdgeInsets.all(20),
      //width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Temperature",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Water',
                    style: TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.systemGrey2,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    '12.19°C',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
              SizedBox(width: 40,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Air',
                    style: TextStyle(
                      fontSize: 16,
                      color: CupertinoColors.systemGrey2,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    '24°C',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget _humidityCard() {
  return Glassmorphism(
    blur: 20,
    opacity: 0.1,
    radius: 8,
    child: Container(
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Humidity',
            style: TextStyle(
              fontSize: 16,
              color: CupertinoColors.systemGrey2,
            ),
          ),
          SizedBox(height: 10,),
          Text(
            '50%',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          )
        ],
      )
    ),
  );
}

Widget _heaterFanControl() {
  return Glassmorphism(
    blur: 20,
    opacity: 0.1,
    radius: 8,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.thermometer_sun,
                  color: Colors.white,
                ),
                SizedBox(width: 10,),
                Text(
                  'Off',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 30,),
          Container(
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.thermometer_snowflake,
                  color: Colors.white,
                ),
                SizedBox(width: 10,),
                Text(
                  'Off',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )
  );
}