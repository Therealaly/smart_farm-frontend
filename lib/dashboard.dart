import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'component/glassmorphism.dart';
import 'models/category.dart';

class Dashboard extends StatefulWidget {
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
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
                  image: AssetImage("assets/images/aurora-background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
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
                  _dateCard(dap: widget.dap),
                  SizedBox(height: 20,),
                  Container(
                    height: 135,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: _temperatureCard(water: widget.water, air: widget.air),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          flex: 1,
                          child: _humidityCard(humidity: widget.humidity),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  _heaterFanControl(heater: widget.heater, fan: widget.fan),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    child: PreferredSize(
                      preferredSize: Size.fromHeight(50),
                      child: Container(
                        color: Colors.transparent,
                        child: TabBar(
                          indicatorColor: Colors.white,
                          tabs: [
                            Tab(
                              child: Text(
                                'EC',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'pH',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Humidity & Air Temp',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Pump',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // first tab bar view widget
                        Container(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              _ecTab(aNutrition: widget.aNutrition, bNutrition: widget.bNutrition, ec: widget.ec),
                              SizedBox(height: 20,),
                              Container(
                                child: Text('Placeholder'),
                              )
                            ],
                          )
                        ),
                        // second tab bar view widget
                        Container(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              _phTab(phUp: widget.phUp, phDown: widget.phDown, ph: widget.ph),
                              SizedBox(height: 20,),
                              Container(
                                child: Text('Placeholder'),
                              )
                            ],
                          )
                        ),
                        // third tab bar view widget
                        Container(
                          color: Colors.transparent,
                          child: Center(
                            child: Text(
                              'people',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        // fourth tab bar view widget
                        Container(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              _pumpTab(aPump: widget.aPump, bPump: widget.bPump, waterFlow: widget.waterFlow),
                              SizedBox(height: 20,),
                              Container(
                                child: Text('Placeholder'),
                              )
                            ],
                          )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _dateCard({required String dap}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.transparent,
      boxShadow: [
        BoxShadow(
          color: Colors.black38.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 7,
          offset: Offset(2, 5), // changes position of shadow
        ),
      ],
    ),
    child: Glassmorphism(
      blur: 10,
      opacity: 0.07,
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
    )
  );
}

Widget _temperatureCard({required String water, air}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.transparent,
      boxShadow: [
        BoxShadow(
          color: Colors.black38.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 7,
          offset: Offset(2, 5), // changes position of shadow
        ),
      ],
    ),
    child: Glassmorphism(
      blur: 20,
      opacity: 0.07,
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
                      '$water°C',
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
                      '$air°C',
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
    )
  );
}

Widget _humidityCard({required String humidity}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.transparent,
      boxShadow: [
        BoxShadow(
          color: Colors.black38.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 7,
          offset: Offset(2, 5), // changes position of shadow
        ),
      ],
    ),
    child: Glassmorphism(
      blur: 20,
      opacity: 0.07,
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
              '$humidity%',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            )
          ],
        )
      ),
    )
  );
}

Widget _heaterFanControl({required bool heater, fan}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.transparent,
      boxShadow: [
        BoxShadow(
          color: Colors.black38.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 7,
          offset: Offset(2, 5), // changes position of shadow
        ),
      ],
    ),
    child: Glassmorphism(
      blur: 20,
      opacity: 0.07,
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
                    (heater == true) ? 'On' : 'Off',
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
                    (fan == true) ? 'On' : 'Off',
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
    )
  );
}

Widget _ecTab({required bool aNutrition, bNutrition, required String ec}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.transparent,
      boxShadow: [
        BoxShadow(
          color: Colors.black38.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 7,
          offset: Offset(3, 6), // changes position of shadow
        ),
      ],
    ),
    child: Glassmorphism(
      blur: 20,
      opacity: 0.07,
      radius: 8,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 30, right: 40, bottom: 30, left: 40),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EC (2.56)',
                  style: TextStyle(
                    color: CupertinoColors.systemGrey5,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  ec,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10,),
                // Calibrate Button
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    child: Container(
                      child: Glassmorphism(
                        blur: 20,
                        opacity: 0.1,
                        radius: 5,
                        child: Container(
                          height: 45,
                          width: 100,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Calibrate',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ]
                          )
                        )
                      )
                    ),
                    onTap: () {},
                  )
                )
              ],
            ),
            SizedBox(width: 50,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'A. Nutrition',
                  style: TextStyle(
                    color: CupertinoColors.systemGrey5,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  (aNutrition == true) ? 'On' : 'Off',
                  style: TextStyle(
                    color: (aNutrition == true) ? Color.fromRGBO(0, 255, 10, 1) : Color.fromRGBO(255, 0, 0, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  'B. Nutrition',
                  style: TextStyle(
                    color: CupertinoColors.systemGrey5,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  (bNutrition == true) ? 'On' : 'Off',
                  style: TextStyle(
                    color: (bNutrition == true) ? Color.fromRGBO(0, 255, 10, 1) : Color.fromRGBO(255, 0, 0, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    ),
  );
}

Widget _phTab({required bool phUp, phDown, required String ph}){
  return Container(
    decoration: BoxDecoration(
      color: Colors.transparent,
      boxShadow: [
        BoxShadow(
          color: Colors.black38.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 7,
          offset: Offset(2, 5), // changes position of shadow
        ),
      ],
    ),
    child: Glassmorphism(
      blur: 20,
      opacity: 0.07,
      radius: 8,
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 30, right: 40, bottom: 30, left: 40),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PH (5.60 - 7.50)',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey5,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    ph,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 50,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'pH Up',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey5,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    (phUp == true) ? 'On' : 'Off',
                    style: TextStyle(
                      color: (phUp == true) ? Color.fromRGBO(0, 255, 10, 1) : Color.fromRGBO(255, 0, 0, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'pH Down',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey5,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    (phDown == true) ? 'On' : 'Off',
                    style: TextStyle(
                      color: (phDown == true) ? Color.fromRGBO(0, 255, 10, 1) : Color.fromRGBO(255, 0, 0, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          )
      ),
    ),
  );
}

Widget _pumpTab({required bool aPump, bPump, required String waterFlow}){
  return Container(
    decoration: BoxDecoration(
      color: Colors.transparent,
      boxShadow: [
        BoxShadow(
          color: Colors.black38.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 7,
          offset: Offset(2, 5), // changes position of shadow
        ),
      ],
    ),
    child: Glassmorphism(
      blur: 20,
      opacity: 0.07,
      radius: 8,
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 30, right: 40, bottom: 30, left: 40),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Waterflow',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey5,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    waterFlow,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 50,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pump 1',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey5,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    (aPump == true) ? 'On' : 'Off',
                    style: TextStyle(
                      color: (aPump == true) ? Color.fromRGBO(0, 255, 10, 1) : Color.fromRGBO(255, 0, 0, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Pump 2',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey5,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    (bPump == true) ? 'On' : 'Off',
                    style: TextStyle(
                      color: (bPump == true) ? Color.fromRGBO(0, 255, 10, 1) : Color.fromRGBO(255, 0, 0, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          )
      ),
    ),
  );
}