import 'package:flutter/material.dart';
import 'package:fyp/core/lists/bus_list_screen.dart';
import 'package:fyp/core/lists/fav_bus_list.dart';
import 'package:fyp/global_widgets/bus_small_detail_container.dart';
import 'package:fyp/global_widgets/fyp_navbar.dart';
import 'package:fyp/global_widgets/fyp_text.dart';
import 'package:fyp/utils/constants.dart';
import '../bus_find/find_bus_screen.dart';
import '../notifications/notification_screen.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  var imagesList = [
    FypImages.bannerImage3,
    FypImages.bannerImage5,
    FypImages.bannerImage2,
  ];

  var iconsList = [
    FypIcons.findBus,
    FypIcons.notification,
    FypIcons.timeTable,
    FypIcons.busList,
    FypIcons.favBus,
  ];
  var namesList = [
    "Find Bus",
    "Notification",
    "Time Table",
    "Buses List",
    "Favorite Buses"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.grey.shade200,
          child: Column(
            children: [
              FypNavBar(title: "Home"),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      userProfile(),
                      Divider(thickness: 1,color: Colors.grey,),
                      bannerImages(),
                      services(),
                      favoriteBusesList(),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> BusListScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                              ),
                              child: FypText(text: "All Buses",fontSize: 17,)),
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  Container favoriteBusesList() {
    return Container(
      width: double.infinity,
      height: 600,
      padding: EdgeInsets.only(top: 30,left: 30,right: 30),
      decoration: BoxDecoration(
          color: primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: FypText(text: "Favorite Buses :",
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context,index){
              return BusSmallDetailContainer();
            }),
          )
        ],
      ),
    );
  }

  Column services() {
    return Column(
      children: [
        Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: FypText(text: "Discover More :",
                  color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
        Container(
          height: 170,
          child: Expanded(
            child: ListView.builder(
                itemCount: iconsList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: GestureDetector(
                          onTap: (){
                            navigateToScreen(index, context);
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(
                              child: Image.asset(iconsList[index]),
                            ),
                          ),
                        ),
                      ),
                      FypText(text: namesList[index],
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  );
                }),
          ),
        ),
      ],
    );
  }

  Container bannerImages() {
    return Container(
            height: 200,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(imagesList[index],height: 200,),
                    ),
                  );
                },
              ),
            ),
          );
  }

  Padding userProfile() {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Image.asset(FypImages.userAvatar,height: 100,),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FypText(
                      text: "Hi, Malik Shakir !",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    FypText(
                      text: "University of Gujrat",
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
            ),
          );
  }
}

void navigateToScreen(int index, BuildContext context) {
  switch (index) {
    case 0:
    // Navigate to Find Bus screen
      Navigator.push(context, MaterialPageRoute(builder: (context) => FindBusScreen()));
      break;
    case 1:
    // Navigate to Notification screen
      Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
      break;
      case 2:
    // Navigate to Find Bus screen
      Navigator.push(context, MaterialPageRoute(builder: (context) => FindBusScreen()));
      break;
    case 3:
    // Navigate to Notification screen
      Navigator.push(context, MaterialPageRoute(builder: (context) => BusListScreen()));
      break;
      case 4:
    // Navigate to Notification screen
      Navigator.push(context, MaterialPageRoute(builder: (context) => FavBusList()));
      break;
  // Add more cases for other screens
    default:
      break;
  }
}