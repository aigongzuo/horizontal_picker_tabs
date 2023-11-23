import 'package:flutter/material.dart';
import 'package:horizontal_picker_tabs/horizontal_picker_tabs.dart';
import 'package:horizontal_picker_tabs/picker_tabs.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  List<String> tabs = ["tabs1", "tabs2", "tabs3", "tabs4", "tabs5"];

  MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int currentPage = 0;
  TextStyle labelStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  TextStyle unselectedLabelStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: widget.tabs.length)
      ..addListener(() {
        if (currentPage != _tabController.index) {
          setState(() {
            currentPage = _tabController.index;
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Stack(children: [
        PickerTabBarView(
          controller: _tabController,
          children: getTabViewList(),
        ),

        //装饰底部卡尺
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 100,
            color: Colors.black54,
          ),
        ),

        //装饰底部卡尺
        const Positioned(
          bottom: 14,
          left: 0,
          right: 0,
          child: Image(
            height: 20,
            fit: BoxFit.fill,
            image: AssetImage("assets/images/lm_horizontal_picker_bottom_icon.png"),
          ),
        ),

        Positioned(
          bottom: 14,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(top: 2),
              width: 2,
              height: 16,
              color: const Color(0xFF7F5EFF),
            ),
          ),
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            HorizontalPickerTabBar(
              controller: _tabController,
              padding: const EdgeInsets.only(top: 15, bottom: 5),
              // indicatorPadding: const EdgeInsets.all(2),
              labelColor: Colors.white,
              labelStyle: labelStyle,
              unselectedLabelColor: const Color(0x99FFFFFF),
              unselectedLabelStyle: unselectedLabelStyle,
              tabs: widget.tabs,
            ),
          ],
        )
      ]),
    );
  }

  @override
  void dispose() {
    //释放 tabController
    _tabController.dispose();
    super.dispose();
  }

  getTabViewList() {
    List<Widget> list = [];
    for (int i = 0; i < widget.tabs.length; i++) {
      list.add(Image.asset("assets/images/img_$i.webp", fit: BoxFit.cover));
    }
    return list;
  }
}
