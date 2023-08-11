import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  String? _selectedMenuItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/aurora-background.png"), fit: BoxFit.cover)
        ),
        child: Container(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 20.h),
          color: Colors.transparent,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment:  Alignment.centerLeft,
                          child: logo,
                        ),
                        PopupMenuButton<String>(
                          icon: Icon(Icons.menu, color: Colors.white),
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem(
                                value: '+ Add Controller',
                                child: Text('+ Add Controller'),
                              ),
                              PopupMenuItem(
                                value: 'User Management',
                                child: Text('User Management'),
                              ),
                              PopupMenuItem(
                                value: 'Profile',
                                child: Text('Profile'),
                              ),
                              PopupMenuItem(
                                value: 'Sign Out',
                                child: Text('Sign Out'),
                              ),
                            ];
                          },
                          onSelected: (String? newValue) {
                            setState(() {
                              _selectedMenuItem = newValue;
                              // Check the selected value and navigate to the corresponding page
                              if (newValue == 'User Management') {
                                Navigator.pushNamed(context, '/user_management');
                              } else if (newValue == '+ Add Controller') {
                                Navigator.pushNamed(context, '/qr_scan');
                              } else if (newValue == 'Profile') {
                                Navigator.pushNamed(context, '/profile');
                              } else if (newValue == 'Sign Out') {
                                Navigator.popAndPushNamed(context, '/signIn');
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'All Controllers',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        DropdownButton<Category>(
                          dropdownColor: Colors.blueGrey[800],
                          style: TextStyle(color: Colors.white),
                          value: selectedCategory,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          underline: Container(
                            height: 1,
                            color: Colors.white,
                          ),
                          onChanged: (Category? newValue) {
                            setState(() {
                              selectedCategory = newValue;
                              //print("Selected Category: $selectedCategory"); //development
                            });
                          },
                          items: categories.map((Category category) {
                            return DropdownMenuItem<Category>(
                              value: category,
                              child:
                              Text(
                                category.name,
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: gridViewItems[selectedCategory]?.length ?? 0,
                  itemBuilder: (context, index) {
                    GridViewItem? item = gridViewItems[selectedCategory]?[index] as GridViewItem?;
                    return item != null ? Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Dashboard(
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
                                duration: item.duration,
                                checking: item.checking,
                              ),
                            ),
                          );
                        },
                        title: Glassmorphism(
                          blur: 20,
                          opacity: 0.1,
                          radius: 8.r,
                          child: Container(
                            //width: 322.w,
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.title,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(height: 2.h,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'status: ${item.status}',
                                              style: TextStyle(
                                                color: CupertinoColors.systemGrey2,
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                            Container(
                                              padding: EdgeInsets.symmetric(vertical: 3.h),
                                              child: Icon(
                                                size: 8.w,
                                                CupertinoIcons.circle_fill,
                                                color: (item.status == 'active') ? Color.fromRGBO(0, 255, 10, 1) : Color.fromRGBO(255, 0, 0, 1),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'DAP',
                                          style: TextStyle(
                                            color: CupertinoColors.systemGrey2,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        Text(
                                          '${item.dap}',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h,),
                                Container(
                                  width: double.infinity,
                                  height: 1.h,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 10.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'EC (2.56)',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: CupertinoColors.systemGrey2,
                                          ),
                                        ),
                                        Text(
                                          item.ec,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 20.h,),
                                        Text(
                                          'Water Temp',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: CupertinoColors.systemGrey2,
                                          ),
                                        ),
                                        Text(
                                          '${item.water}°C',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'pH (5.6 - 7.5)',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: CupertinoColors.systemGrey2,
                                          ),
                                        ),
                                        Text(
                                          item.ph,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 20.h,),
                                        Text(
                                          'Air Temp',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: CupertinoColors.systemGrey2,
                                          ),
                                        ),
                                        Text(
                                          '${item.air}°C',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Humidty',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: CupertinoColors.systemGrey2,
                                          ),
                                        ),
                                        Text(
                                          '${item.humidity}%',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 20.h,),
                                        Text(
                                          'Pump 1',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: CupertinoColors.systemGrey2,
                                          ),
                                        ),
                                        Text(
                                          (item.aPump == true) ? 'On' : 'Off',
                                          style: TextStyle(
                                            color: (item.aPump == true)
                                                ? Color.fromRGBO(0, 255, 10, 1)
                                                : Color.fromRGBO(255, 0, 0, 1),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ) : Container();
                  },
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}