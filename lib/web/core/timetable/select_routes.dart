import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/global/global_providers/route_provider.dart';
import 'package:fyp/global/global_providers/timetable_provider.dart';
import 'package:fyp/global/global_widgets/fyp_navbar.dart';
import 'package:fyp/global/global_widgets/fyp_text.dart';
import 'package:fyp/web/core/timetable/timetable_widgets/routes_saver.dart';
import 'package:provider/provider.dart';
import '../../../global/global_widgets/confirmation_alert.dart';
import '../../../global/global_widgets/fyp_textfield.dart';
import '../../../utils/constants.dart';
import '../route/edit_route.dart';
import '../route/route_widgets/routeContainer.dart';

class SelectRoute extends StatefulWidget {
  const SelectRoute({super.key});

  @override
  State<SelectRoute> createState() => _SelectRouteState();
}

class _SelectRouteState extends State<SelectRoute> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RouteProvider>().getRoutes(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FypNavBar(title: "Select Routes"),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FypText(
                        text: "Selected Routes",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 150,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: RouteSaver(
                              keys: context.read<TimeTableProvider>().selectedRouteIds.keys.toList(),
                              values: context.watch<TimeTableProvider>().selectedRouteIds.values.toList()),
                        ),
                      ),
                      Column(
                        children: [
                          FypText(
                            text: "Routes",
                            color: primaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 10),
                          FypTextField(
                            onChange: (value) {
                              Future.delayed(Duration(milliseconds: 1000), () {
                                setState(() {
                                  if (context.read<RouteProvider>().rSearchController.text.isEmpty) {
                                    context.read<RouteProvider>().getRoutes(context);
                                  } else {
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
                          Consumer<RouteProvider>(
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
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: routeProvider.routes.length,
                                itemBuilder: (context, index) {
                                  final route = routeProvider.routes[index];
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          context.read<TimeTableProvider>().addRouteId(route.id.toString(),"${route.rname},${route.endLocation}");
                                        },
                                        child: routeContainer(
                                          onDelTap: () {
                                            showDialog(
                                              barrierDismissible: false,
                                              barrierColor: Colors.black26,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return ConfirmationAlert(
                                                  isLoading: context.watch<RouteProvider>().isDelLoading,
                                                  title: "Delete?",
                                                  subTitle: "Do you want to delete this route?",
                                                  onTap: () async {
                                                    await context.read<RouteProvider>().deleteRoute(context, int.parse(route.id));
                                                    Navigator.pop(context);
                                                    context.read<RouteProvider>().getRoutes(context);
                                                  },
                                                );
                                              },
                                            );
                                          },
                                          onEditTap: () {
                                            showDialog(
                                              barrierDismissible: false,
                                              barrierColor: Colors.black26,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return EditRouteInfo(route: route);
                                              },
                                            );
                                          },
                                          rname: route.rname,
                                          startlocation: route.startLocation,
                                          endlocation: route.endLocation,
                                          via: route.via,
                                          duration: route.duration,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
