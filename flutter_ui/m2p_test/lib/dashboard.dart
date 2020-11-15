import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:m2p_test/custom_clipper.dart';
import 'package:rubber/rubber.dart';

class DashboardScreen extends StatelessWidget {
  // ignore: non_constant_identifier_names
  static var ROUTE = "/dashboard";

  @override
  Widget build(BuildContext context) {
    return DashboardView();
  }
}

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  RubberAnimationController _controller;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _controller = RubberAnimationController(
        vsync: this,
        lowerBoundValue: AnimationControllerValue(percentage: 0),
        halfBoundValue: AnimationControllerValue(percentage: 0.5),
        upperBoundValue: AnimationControllerValue(percentage: 0.8),
        duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: customBottomNavigation(),
        backgroundColor: Color(0xfffbfbfb),
        body: Container(
          child: RubberBottomSheet(
            scrollController: _scrollController,
            animationController: _controller,
            upperLayer: _getUpperLayer(context),
            lowerLayer: SingleChildScrollView(
              child: Stack(
                children: [
                  ClipPath(
                    clipper: CustomShapeClipper(),
                    child: Container(
                      height: 335,
                      color: Color(0xff003A63),
                    ),
                  ),
                  Column(
                    children: [
                      customAppBar(),
                      SizedBox(
                        height: 25,
                      ),
                      PriceView(),
                      tipsView(context),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "* Rates are indicative and may vary ",
                        style: TextStyle(color: Color(0xff7B7B7B)),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      OptionsView(),
                      exploreView()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget exploreView() {
    return Container(
      height: 200,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 30,),
              Text(
                "Exclusive Options",
                style: TextStyle(fontFamily: "Roboto", fontSize: 20,fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Expanded(
            child: Swiper(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Image.asset("images/carousel.png"));
              },
              controller: SwiperController(),
              loop: false,
              indicatorLayout: PageIndicatorLayout.NONE,
              viewportFraction: 0.7,
              scale: 0.8,
            ),
          )
        ],
      ),
    );
  }

  Widget customAppBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Row(
        children: [
          languageView("EN"),
          Spacer(),
          Image.asset(
            "images/notification.png",
            height: 20,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget languageView(String language) {
    return Row(
      children: [
        Text(
          language,
          style: TextStyle(
              fontFamily: "Ubuntu", fontSize: 14, color: Colors.white),
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: Colors.blueAccent,
          size: 20,
        )
      ],
    );
  }

  Widget tipsView(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 39, vertical: 10),
      child: Row(
        children: [
          Image.asset(
            "images/tips.png",
            height: 22,
            width: 22,
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              showTipsSheet(context);
            },
            child: Text(
              "Tips",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Spacer(),
          Text(
            "Set Rate Alerts",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            width: 10,
          ),
          FlutterSwitch(
              height: 22.0,
              width: 36.0,
              padding: 2.5,
              toggleSize: 18.0,
              borderRadius: 10.0,
              inactiveColor: Color(0xffC4C4C4),
              value: false,
              onToggle: (val) {})
        ],
      ),
    );
  }

  Widget customBottomNavigation() {
    return Container(
      color: Color(0xfffbfbfb),
      height: 70,
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(22), topRight: Radius.circular(22)),
          child: Material(
            elevation: 10,
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  bottomNavigationItem("images/explore.png", "Home"),
                  bottomNavigationItem("images/track.png", "Track"),
                  Image.asset(
                    "images/logo.png",
                    height: 85,
                  ),
                  bottomNavigationItem("images/bulb_fill.png", "Help"),
                  bottomNavigationItem("images/menu.png", "More")
                ],
              ),
            ),
          )),
    );
  }

  Widget bottomNavigationItem(String path, String title) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            path,
            height: 25,
            width: 20,
          ),
          Text(title)
        ],
      ),
    );
  }

  showTipsSheet(BuildContext context) {
    _controller.halfExpand();
  }

  Widget ListItem(String s) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xfff0f7fc)),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        children: [
          Image.asset(
            "images/emoji.png",
            height: 20,
          ),
          SizedBox(
            width: 20,
          ),
          Container(width: 270, child: Text(s)),
          Spacer(),
          Icon(Icons.navigate_next),
        ],
      ),
    );
  }

  _getUpperLayer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        _controller.collapse();
                      },
                    ),
                  ),
                  Image.asset(
                    "images/emoji.png",
                    height: 40,
                  ),
                  Image.asset(
                    "images/underline.png",
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tips",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )),
          Expanded(
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: _scrollController,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListItem(
                      "Expat tips to save when transferring money abroad");
                }),
          )
        ],
      ),
    );
  }
}

class PriceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Bank Transfer",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 23,
              color: Colors.white,
              fontFamily: "Roboto"),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 230,
          child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            elevation: 20,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                paymentWidget("You Send", true),
                dividerWidget(),
                paymentWidget("They Receive", true)
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget paymentWidget(String title, bool isDropdownVisible) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Text(
                "00.00",
                style: TextStyle(
                    color: Color(0xff242424),
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Image.asset("images/flag.png", height: 20, width: 20),
              SizedBox(
                width: 10,
              ),
              Text(
                "AED",
                style: TextStyle(color: Colors.black, fontSize: 15),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget dividerWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Stack(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: Divider(color: Colors.black12)),
          Center(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                    color: Color(0xffF2F2F7),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "1 AED = 20.35 INR",
                  style: TextStyle(fontSize: 14, color: Colors.black45),
                )),
          ),
        ],
      ),
    );
  }
}

class OptionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 20),
        height: 300,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                singleGridView("images/account_balance.png", "Bank Transfer"),
                singleGridView("images/account_balance.png", "Bank Transfer"),
                singleGridView("images/payments.png", "Client Wallet transfer")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                singleGridView("images/account_balance.png", "Bank Transfer"),
                singleGridView("images/account_balance.png", "Bank Transfer"),
                singleGridView("images/payments.png", "Client Wallet transfer")
              ],
            ),
          ],
        ));
  }
}

Widget singleGridView(String path, String title) {
  return Container(
    height: 100,
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Column(
      children: [
        ClipOval(
            child: Container(
                color: Color(0xfff0f7fc),
                padding: EdgeInsets.all(15),
                child: Image.asset(path))),
        SizedBox(height: 10),
        Container(
          width: 80,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    ),
  );
}
