import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'component/glassmorphism.dart';

class Dashboard extends StatelessWidget {
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
                  _dateCard(),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _dateCard() {
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
            const Column(
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
                  '42 Days',
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
      )
  );
}

Widget _temperatureCard() {
  return Glassmorphism(
    blur: 20,
    opacity: 0.1,
    radius: 8,
    child: Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: Column(

      ),
    ),
  );
}