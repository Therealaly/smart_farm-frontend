import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'component/logo.dart';
import 'component/glassmorphism.dart';
import 'package:smart_farm/models/category.dart';
import 'dashboard.dart';

class Homepage extends StatefulWidget {
  @override
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/aurora-background.png"), fit: BoxFit.cover)
            ),
          ),
          Positioned.fill(
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
                      // burger menu
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          DropdownButton<Category>(
                            value: selectedCategory,
                            onChanged: (Category? newValue) {
                              setState(() {
                                selectedCategory = newValue;
                                print("Selected Category: $selectedCategory"); //development
                              });
                            },
                            items: categories.map((Category category) {
                              return DropdownMenuItem<Category>(
                                value: category,
                                child:
                                Text(
                                  category.name,
                                  style: TextStyle(
                                    color: CupertinoColors.systemGrey2,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      )
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 25,
                        crossAxisSpacing: 25,
                        childAspectRatio: (1 / 0.8),
                      ),
                      itemCount: gridViewItems[selectedCategory]?.length ?? 0,
                      itemBuilder: (context, index) {
                        print("GridView Item: $index"); //development
                        GridViewItem? item = gridViewItems[selectedCategory]?[index] as GridViewItem?;
                        return item != null
                          ? GridTile(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                // Navigate to the Dashboard page and pass the selected GridViewItem
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Dashboard(
                                      // Pass the selected GridViewItem details to the Dashboard
                                      dap: item.dap,
                                      water: item.water,
                                      air: item.air,
                                      humidity: item.humidity,
                                      heater: item.heater,
                                      fan: item.fan,
                                      ec: item.ec,
                                      aNutrition: item.aNutrition,
                                      bNutrition: item.bNutrition,
                                      ph: item.ph,
                                      phUp: item.phUp,
                                      phDown: item.phDown,
                                      waterFlow: item.waterFlow,
                                      aPump: item.aPump,
                                      bPump: item.bPump,
                                    ),
                                  ),
                                );
                              },
                              child: Glassmorphism(
                                blur: 20,
                                opacity: 0.1,
                                radius: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  //width: double.infinity,
                                  //height: 50,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        CupertinoIcons.game_controller_solid,
                                        color: Colors.white,
                                        size: 50,
                                      ),
                                      SizedBox(height: 10,),
                                      Text(
                                        item.title,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Container(
                                        child: Row(
                                          children: [
                                            Text(
                                              'status: ${item.status}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                            Icon(
                                              size: 14,
                                              CupertinoIcons.circle_fill,
                                              color: (item.status == 'active') ? Color.fromRGBO(0, 255, 10, 1) : Color.fromRGBO(255, 0, 0, 1),
                                            ),
                                          ],
                                        ) ,
                                      )
                                    ],
                                  ),
                                )
                              ),
                            )
                          )
                        )
                            : Container();
                      }
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