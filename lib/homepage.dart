import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'component/logo.dart';
import 'component/glassmorphism.dart';
import 'package:smart_farm/models/controller.dart';
import 'package:smart_farm/models/utils.dart';

class Homepage extends StatelessWidget {

  List<Controller> controllers = utils.getMockedController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              color: Colors.transparent,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        alignment:  Alignment.centerLeft,
                        child: logo,
                      ),
                      //burger
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'All Controllers',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                    ],
                  ),
                  Container(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: controllers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Text(
                            controllers[index].name,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                      // scrollDirection: Axis.vertical,
                      // shrinkWrap: true,
                      // //primary: false,
                      // //padding: const EdgeInsets.all(20),
                      // crossAxisSpacing: 10,
                      // mainAxisSpacing: 10,
                      // crossAxisCount: 2,
                      // children: <Widget>[
                      //   Container(
                      //     padding: const EdgeInsets.all(8),
                      //     color: Colors.teal[100],
                      //     child: const Text("He'd have you all unravel at the"),
                      //   ),
                      //   Container(
                      //     padding: const EdgeInsets.all(8),
                      //     color: Colors.teal[200],
                      //     child: const Text('Heed not the rabble'),
                      //   ),
                      //   Container(
                      //     padding: const EdgeInsets.all(8),
                      //     color: Colors.teal[300],
                      //     child: const Text('Sound of screams but the'),
                      //   ),
                      //   Container(
                      //     padding: const EdgeInsets.all(8),
                      //     color: Colors.teal[400],
                      //     child: const Text('Who scream'),
                      //   ),
                      // ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ]
      )
    );
  }
}