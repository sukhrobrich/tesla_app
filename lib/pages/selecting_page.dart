import 'package:flutter/material.dart';
import 'package:tesla_app/services/constants/colors.dart';
import 'package:tesla_app/services/constants/fonts.dart';
import 'package:tesla_app/services/constants/strings.dart';
import 'package:tesla_app/views/custom_elevated_button.dart';

import '../config/service_locator.dart';
import '../views/primary_configuration.dart';

class SelectingPage extends StatefulWidget {
  final void Function()? onPressed;
  final String text;

  const SelectingPage({super.key, required this.text, this.onPressed});

  @override
  State<SelectingPage> createState() => _SelectingPageState();
}

class _SelectingPageState extends State<SelectingPage> {
  bool firstSelectedItem = true;
  bool secondSelectedItem = false;

  @override
  Widget build(BuildContext context) {
    double y = MediaQuery.of(context).size.height;
    double x = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomSheet: Container(
        height: y / 3,
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
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const Spacer(),
                Column(
                  children: [
                    /// #HeaderText 3,5 seconds
                    Text(
                      CustomStrings.accelerationSecondsSelectingPage,
                      style: CustomFonts.acceleration(),
                    ),

                    const SizedBox(height: 15),

                    /// #Acceleration Speed 150mph
                    Text(
                      CustomStrings.accelerationSpeedSelectingPage,
                      style: CustomFonts.accelerationSpeed(),
                    ),
                  ],
                ),

                const Spacer(),

                /// #Divider Container
                Container(
                  width: 1,
                  height: 42,
                  color: CustomColors.darkBlack.withOpacity(0.3),
                ),

                const Spacer(),

                Column(
                  children: [
                    /// #HeaderText 150mph
                    Text(
                      CustomStrings.topSpeed150mph,
                      style: CustomFonts.acceleration(),
                    ),

                    const SizedBox(height: 8),

                    /// #SubText Top Speed
                    Text(
                      CustomStrings.topSpeed,
                      style: CustomFonts.accelerationSpeed(),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),

            const SizedBox(height: 10),

            /// #Description Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                CustomStrings.information,
                softWrap: true,
                style: CustomFonts.information(),
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /// #Total Price
                  StreamWidget(textStyle: CustomFonts.performanceCost2()),

                  /// #Elevated Button
                  CustomElevatedButton(
                    onPressed: () {
                      widget.onPressed!();
                      shoppingDetails.exteriorPrice = 2000;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// #Header Text Select Your Car
            Align(
              alignment: const Alignment(-0.85, 0),
              child: Text(
                CustomStrings.selectYourCar,
                style: CustomFonts.select(),
              ),
            ),

            /// #Red Image Tesla
            Image.asset(
              "assets/images/red_tesla.png",
              width: 400,
              height: x * 0.7,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              child: Row(
                children: [
                  /// #Text Performance
                  GestureDetector(
                    onTap: () {
                      firstSelectedItem = true;
                      secondSelectedItem = false;
                      shoppingDetails.carPrice = 55700;
                      setState(() {});
                    },
                    child: PrimaryConfigurationTextView(
                      configurationText: CustomStrings.performance,
                      configurationPriceText: CustomStrings.performanceCost55,
                      selectedItemIndex: firstSelectedItem,
                    ),
                  ),

                  const Spacer(flex: 4),

                  /// #Text Long Range
                  GestureDetector(
                    onTap: () {
                      firstSelectedItem = false;
                      secondSelectedItem = true;
                      shoppingDetails.carPrice = 46700;
                      setState(() {});
                    },
                    child: PrimaryConfigurationTextView(
                      configurationText: CustomStrings.longRange,
                      configurationPriceText: CustomStrings.longRangeCost,
                      selectedItemIndex: secondSelectedItem,
                    ),
                  ),

                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StreamWidget extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;

  const StreamWidget({super.key, this.textStyle, this.text});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          return Text(
            snapshot.data!,
            style: textStyle,
          );
        }
        return const CircularProgressIndicator.adaptive();
      },
      stream: shoppingDetails.stream,
    );
  }
}
