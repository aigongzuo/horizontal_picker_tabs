description: A customizable Flutter library for horizontal-scrolling picker tabs.

## Features

<img src="https://raw.githubusercontent.com/aigongzuo/horizontal_picker_tabs/main/img_0.webp" width="240px" height="426px"/>
<img src="https://raw.githubusercontent.com/aigongzuo/horizontal_picker_tabs/main/img_1.webp" width="426px" height="240px"/>

## Getting started

dart pub add horizontal_picker_tabs

## Usage

```dart
Scaffold(
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
```

