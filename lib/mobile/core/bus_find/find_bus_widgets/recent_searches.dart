import 'package:flutter/material.dart';
import 'package:fyp/mobile/core/bus_find/finded_bus_screen.dart';
import 'package:provider/provider.dart';

import '../../../../global/global_providers/find_bus_provider.dart';
import '../../../../global/global_widgets/fyp_text.dart';
import '../../../../utils/constants.dart';

class RecentSearchesWidget extends StatefulWidget {
  @override
  State<RecentSearchesWidget> createState() => _RecentSearchesWidgetState();
}

class _RecentSearchesWidgetState extends State<RecentSearchesWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<FindBusProvider>();
    final recents = provider.recentSearches;

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FypText(text: "Recent Searches:", color: primaryColor, fontWeight: FontWeight.bold),
            const SizedBox(height: 12),
            provider.isLoading
                ? Center(
              child: CircularProgressIndicator(color: primaryColor),
            )
                : context.read<FindBusProvider>().recentSearches.isNotEmpty
                ? Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(
                recents.length,
                    (index) {
                  return Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<FindBusProvider>().destinationController.text = recents[index].searchQuery;
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> FindedBusScreen()));
                        },
                        child: Container(
                          height: 30,
                          padding: const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 26),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Theme.of(context).primaryColor.withOpacity(0.3),
                              width: 2,
                            ),
                          ),
                          child: FypText(text: recents[index].searchQuery, color: Colors.black),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async{
                          await provider.deleteSearch(context,recents[index].searchQuery.toString());
                          setState(() {
                            provider.getSearches(context);
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(right: 5),
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.clear,
                            size: 16,
                            color: primaryColor,
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            )
                : Center(child: FypText(text: "No recent searches", color: Colors.black,))
            ,
          ],
        ),
      ),
    );
  }
}
