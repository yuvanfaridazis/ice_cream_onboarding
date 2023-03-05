import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class OnboardingPage extends StatefulWidget {

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController pageController = PageController();

  int index = 0;

  List<Color> listColorBackground = [
    "FFE5F1".toColor(),
    "FFDCC8".toColor(),
    "E3F7FF".toColor(),
  ];

  List<Color> listColorButton = [
    "F4A7CD".toColor(),
    "CA7A5F".toColor(),
    "7ECAED".toColor(),
  ];

  List<Color> listColorDots = [
    "BB81AA".toColor(),
    "BB7A68".toColor(),
    "5AA8CE".toColor(),
  ];

  List<String> listTextButton = [
    "Next Slide",
    "Next Slide",
    "Get Started",
  ];

  List<String> listTextTitle = [
    'Find A Lot of Ice Cream Variant',
    "Feel Sweeteness in Every Bite",
    "Taste Ice Cream with One Tap",
  ];

  List<String> listTextDescription = [
    'Try A Dozens of delicious ice cream \nstarted from ice cone, cup, etc',
    "Experience the amazing taste in every\nbites of Ice Cream",
    "Feel an ease to order the ice cream \nin app-purchase",
  ];


  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: listColorBackground[index],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: PageView(
              controller: pageController,
              onPageChanged: (value){
                setState(() {
                  index = value;
                });
              },
              children: [
                Column(
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/ice_cream_1.png')
                          )
                      ),
                    ),
                    SizedBox(height: 120),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/ice_cream_2.png')
                          )
                      ),
                    ),
                    SizedBox(height: 120),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/ice_cream_3.png')
                          )
                      ),
                    ),
                    SizedBox(height: 120),
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dotsItem((index == 0) ? true : false, listColorDots[index]),
                SizedBox(width: 12),
                dotsItem((index == 1) ? true : false, listColorDots[index]),
                SizedBox(width: 12),
                dotsItem((index == 2) ? true : false, listColorDots[index]),
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))
            ),
            child: Column(
              children: [
                Text(listTextTitle[index], textAlign: TextAlign.center,  style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),),
                SizedBox(height: 10),
                Text(listTextDescription[index], textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400),),
                SizedBox(height: 20),
                FlatButton(
                  onPressed: () {

                    if(index >= 2){
                      setState((){
                        index = 0;
                      });
                    } else {
                      setState((){
                        index++;
                      });
                    }

                    pageController.jumpToPage(index);
                  },
                  padding: EdgeInsets.zero,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 2 * 40,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: listColorButton[index]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(listTextButton[index], style: GoogleFonts.poppins(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                        SizedBox(width: 15),
                        Icon(Icons.arrow_forward_outlined, size: 24, color: Colors.white)
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget dotsItem(bool isActive, Color activeColor){
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (isActive == true) ? activeColor : activeColor.withOpacity(0.35)
      ),
    );
  }
}
