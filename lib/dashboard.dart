import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_farm/card/ecCard.dart';
import 'package:smart_farm/card/heaterFanCard.dart';
import 'package:smart_farm/card/humidityCard.dart';
import 'package:smart_farm/card/phCard.dart';
import 'package:smart_farm/card/pumpCard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_farm/card/dateCard.dart';
import 'package:smart_farm/card/temperatureCard.dart';

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
  final String duration;
  final String checking;

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
    required this.duration,
    required this.checking,
  });

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
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
                    SizedBox(height: 10.h,),
                    Column(
                      children: [
                        DateCard(dap: widget.dap),
                        SizedBox(height: 15.h,),
                        Container(
                          height: 113.h,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: TemperatureCard(water: widget.water, air: widget.air),
                              ),
                              SizedBox(width: 16.w,),
                              Expanded(
                                flex: 2,
                                child: HumidityCard(humidity: widget.humidity),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h,),
                        HeaterFanCard(heater: widget.heater, fan: widget.fan),
                        SizedBox(height: 15.h,),
                        EcCard(aNutrition: widget.aNutrition, bNutrition: widget.bNutrition, ec: widget.ec),
                        SizedBox(height: 15.h,),
                        PhCard(phUp: widget.phUp, phDown: widget.phDown, ph: widget.ph),
                        SizedBox(height: 15.h,),
                        PumpCard(duration: widget.duration, checking: widget.checking),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}