import 'package:flutter/material.dart';
import 'package:tesla_app/config/service_locator.dart';
import 'package:tesla_app/pages/auto_pilot_page.dart';
import 'package:tesla_app/pages/selecting_page.dart';
import 'package:tesla_app/services/constants/fonts.dart';
import 'package:tesla_app/services/constants/images.dart';
import 'package:tesla_app/services/constants/strings.dart';

import '../services/constants/colors.dart';
import '../views/custom_elevated_button.dart';

class InteriorPage extends StatefulWidget {
  final void Function()? onPressed;
  final String text;

  const InteriorPage({super.key, this.onPressed, required this.text});

  @override
  State<InteriorPage> createState() => _InteriorPageState();
}

class _InteriorPageState extends State<InteriorPage> {
  int selected = 0;

  void navigateToAutoPilotScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AutoPilotPage(text: widget.text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    double y = MediaQuery.of(context).size.height;
    double x = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: CustomColors.lightGrey,
      body: Stack(
        children: [
          /// #Black Interior
          if (selected == 0)
            Image(
              fit: BoxFit.cover,
              image: CustomImages.blackTeslaInterior,
              width: MediaQuery.of(context).size.width,
              height: x * 1.2,
            ),

          /// #White Interior
          if (selected == 1)
            Image(
              fit: BoxFit.cover,
              image: CustomImages.whiteTeslaInterior,
              width: MediaQuery.of(context).size.width,
              height: x * 1.2,
            ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: y / 2.9,
              width: x,
              decoration: BoxDecoration(
                color: CustomColors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0XFF41648F).withOpacity(0.3),
                    blurRadius: 8,
                    blurStyle: BlurStyle.normal,
                    offset: const Offset(0, 0),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    const SizedBox(height: 25),

                    /// #Text Select Interior
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        CustomStrings.selectInterior,
                        style: CustomFonts.select(),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// #Black And White
                            Text(
                              CustomStrings.blackAndWhite,
                              style: CustomFonts.performance(),
                            ),

                            const SizedBox(height: 10),

                            /// #Text 1000$
                            Text(
                              CustomStrings.thousandDollar,
                              style: CustomFonts.performanceCost(),
                            ),
                          ],
                        ),
                        const SizedBox(width: 45),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// #Text All Black
                            Text(
                              CustomStrings.allBlack,
                              style: CustomFonts.longRange(),
                            ),

                            const SizedBox(height: 12),

                            /// #Text Included
                            Text(
                              CustomStrings.included,
                              style: CustomFonts.longRangeCost(),
                            ),
                          ],
                        ),
                      ],
                    ),

                    /// #Sub Buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          /// #Black IconButton
                          IconButton(
                            onPressed: () {
                              selected = 0;
                              setState(() {});
                            },
                            icon: Container(
                              height: 49,
                              width: 49,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 3,
                                  color: selected == 0
                                      ? CustomColors.red
                                      : CustomColors.transparent,
                                ),
                                color: CustomColors.darkBlack.withOpacity(1),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(49),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    CustomColors.darkBlack.withOpacity(0.5),
                                    CustomColors.darkBlack.withOpacity(1),
                                  ],
                                ),
                              ),
                            ),
                            iconSize: 49,
                            splashRadius: 1,
                          ),

                          const SizedBox(width: 15),

                          /// #White IconButton
                          IconButton(
                            onPressed: () {
                              selected = 1;
                              setState(() {});
                            },
                            icon: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: const Color(0XFFE2E2E2),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                border: Border.all(
                                  width: 3,
                                  color: selected == 1
                                      ? CustomColors.red
                                      : CustomColors.grey.withOpacity(0.1),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    CustomColors.lightWhite.withOpacity(0.8),
                                    CustomColors.lightWhite.withOpacity(1),
                                  ],
                                ),
                              ),
                            ),
                            iconSize: 49,
                            splashRadius: 1,
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 6.0,
                      ),
                      child: Row(
                        children: [
                          /// #SubText Price
                          StreamWidget(textStyle: CustomFonts.performanceCost2()),

                          SizedBox(width: x * 0.18),

                          /// #Elevated Button Next
                          CustomElevatedButton(
                            onPressed: () {
                              navigateToAutoPilotScreen();
                              shoppingDetails.interiorPrice = 1000;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
