import 'package:flutter/material.dart';
import 'package:horizontal_picker_tabs/picker_tabs.dart';

class HorizontalPickerTabBar extends StatefulWidget {
  final List<String> tabs;
  final TabController? controller;
  final EdgeInsetsGeometry? padding;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final TextStyle labelStyle;
  final TextStyle unselectedLabelStyle;

  const HorizontalPickerTabBar({
    super.key,
    required this.tabs,
    this.controller,
    this.padding,
    this.labelColor,
    this.unselectedLabelColor,
    required this.labelStyle,
    required this.unselectedLabelStyle,
  });

  @override
  State<StatefulWidget> createState() {
    return HorizontalPickerTabBarState();
  }
}

class HorizontalPickerTabBarState extends State<HorizontalPickerTabBar> {
  double marginTabBarStart = 0;
  double marginTabBarEnd = 0;
  double tabPaddingLeftRight = 20;

  @override
  Widget build(BuildContext context) {
    return PickerTabBar(
      controller: widget.controller,
      padding: widget.padding,
      // indicatorPadding: const EdgeInsets.all(2),
      indicatorPadding: EdgeInsets.zero,
      // 设置为零以去掉间距
      indicator: const BoxDecoration(color: Colors.transparent),
      // indicatorSize: TabBarIndicatorSize.label,
      labelPadding: EdgeInsets.zero,
      labelColor: widget.labelColor,
      labelStyle: widget.labelStyle,
      unselectedLabelColor: const Color(0x99FFFFFF),
      unselectedLabelStyle: widget.unselectedLabelStyle,
      isScrollable: true,
      tabs: getTitleViewList(widget.tabs),
    );
  }

  getTitleViewList(List<String> tabs) {
    double screenWidth = MediaQuery.of(context).size.width;
    marginTabBarStart = screenWidth / 2 -
        getTextWidth(tabs[0], widget.labelStyle) / 2 -
        tabPaddingLeftRight;
    marginTabBarEnd = screenWidth / 2 -
        getTextWidth(tabs[tabs.length - 1], widget.labelStyle) / 2 -
        tabPaddingLeftRight;

    //遍历dataListList
    List<Widget> list = [];
    int len = tabs.length;
    for (int i = 0; i < len; i++) {
      list.add(Container(
        padding: EdgeInsetsDirectional.only(
            start: tabPaddingLeftRight, end: tabPaddingLeftRight),
        margin: EdgeInsetsDirectional.only(
          start: i == 0 ? marginTabBarStart : 0,
          end: i == len - 1 ? marginTabBarEnd : 0,
        ),
        child: Column(
          children: [
            Text(tabs[i]),
            const SizedBox(
              height: 34,
            ),
          ],
        ),
      ));
    }
    return list;
  }

  isRtl() {
    TextDirection currentTextDirection = getTextDirection();
    // 判断是否是从右向左的文本布局
    return currentTextDirection == TextDirection.rtl;
  }

  // 获取当前文本的布局方向
  TextDirection getTextDirection() {
    return Directionality.of(context);
  }

  double getTextWidth(String? text, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text ?? "",
        style: style, // You can set your desired text style
      ),
      textDirection: isRtl() ? TextDirection.rtl : TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.width; // This is important to calculate the text width
  }
}
