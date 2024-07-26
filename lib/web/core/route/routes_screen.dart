import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp/global/global_widgets/confirmation_alert.dart';
import 'package:fyp/global/global_widgets/fyp_button.dart';
import 'package:fyp/web/core/route/add_route.dart';
import 'package:fyp/web/core/route/edit_route.dart';
import 'package:provider/provider.dart';
import '../../../global/global_providers/route_provider.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../global/global_widgets/fyp_textfield.dart';
import '../../../utils/constants.dart';
import '../route/route_widgets/routeContainer.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen({super.key});

  @override
  State<RoutesScreen> createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RouteProvider>().getRoutes(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: primaryColor,
                width: 2,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: FypText(
                        text: "Routes",
                        color: primaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: FypButton(text: "Add New",buttonHeight: 30,buttonWidth: 110,
                        onTap: (){
                          showDialog(
                              barrierDismissible: false,
                              barrierColor: Colors.black26,
                              context: context,
                              builder: (BuildContext context) {
                                return AddRoute();
                              });
                        },
                        ))
                  ],
                ),
                SizedBox(height: 10),
                FypTextField(
                  onChange: (value) {
                    Future.delayed(Duration(milliseconds: 1000),(){
                      setState(() {
                        if(context.read<RouteProvider>().rSearchController.text.isEmpty){
                          context.read<RouteProvider>().getRoutes(context);
                        }else{
                          context.read<RouteProvider>().searchRoutes(context);
                        }
                      });
                    });
        
                  },
                  labelText: "Route",
                  hintText: "Route",
                  labelColor: Colors.black,
                  controller: context.read<RouteProvider>().rSearchController,
                  prefixIcon: Icon(
                    Icons.route,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Consumer<RouteProvider>(
                    builder: (context, routeProvider, child) {
                      if (routeProvider.isLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
        
                      if (routeProvider.routes.isEmpty) {
                        return Center(
                          child: FypText(
                            text: "No routes available",
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        );
                      }
        
                      return ListView.builder(
                        itemCount: routeProvider.routes.length,
                        itemBuilder: (context, index) {
                          final route = routeProvider.routes[index];
                          return Column(
                            children: [
                              routeContainer(
                                onDelTap: (){
                                  showDialog(
                                      barrierDismissible: false,
                                      barrierColor: Colors.black26,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return ConfirmationAlert(
                                            isLoading: context.watch<RouteProvider>().isDelLoading,
                                            title: "Delete?", subTitle: "Do you want to delete this route?", onTap: ()async{
                                              await context.read<RouteProvider>().deleteRoute(context, int.parse(route.id));
                                              Navigator.pop(context);
                                              context.read<RouteProvider>().getRoutes(context);
                                        });
        
                                      });
                                },
                                onEditTap: (){
                                  showDialog(
                                      barrierDismissible: false,
                                      barrierColor: Colors.black26,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return EditRouteInfo(
                                          route: route,
                                        );
                                      });
                                },
                                rname: route.rname,
                                startlocation: route.startLocation,
                                endlocation: route.endLocation,
                                via: route.via,
                                duration: route.duration,
                              ),
                              SizedBox(height: 10,),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
