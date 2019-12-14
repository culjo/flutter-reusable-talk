import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {

  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.star_border, ), activeIcon: Icon(Icons.stars,), title: Text(""), ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border, ), activeIcon: Icon(Icons.favorite, ), title: Text(""), ),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark_border, ), activeIcon: Icon(Icons.bookmark, ), title: Text(""), ),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none, ), activeIcon: Icon(Icons.notifications, ) , title: Text(""), ),
        ],
        onTap: (int selected) {
          setState(() {
            currentTab = selected;

          });
        },
      ),


      appBar: AppBar(
        centerTitle: true,
        title: Text("Food List"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              width: double.infinity,
              child: CupertinoSegmentedControl(
                groupValue: 0,
                children: <int, Widget>{
                  0: Text("Local"),
                  1: Text("Favourites")
                },
                onValueChanged: (int val) {},
              ),
            ),
            Divider(),
            Expanded(
              child: ListView(
                children: List.generate(12, (index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          "images/photo1.jpeg",
                          width: 76,
                          height: 76,
                          fit: BoxFit.cover,
                        ),

                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Fruit Salad",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "30 mins from you",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  "\u20A62,300",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
