import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/AssetsStrings/assetsurl.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/landingscreen.dart';

class Introscreen extends StatefulWidget {
  const Introscreen({super.key});

  @override
  _IntroscreenState createState() => _IntroscreenState();
}

class _IntroscreenState extends State<Introscreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  final List<Map<String, String>> _pages = [
    {
      'heading': 'Welcome to Emarket - The Ultimate Shopping Experience',
      'subheading':
          'Discover a world of products and brands tailored to meet all your shopping desires, right at your fingertips.',
    },
    {
      'heading': 'Exclusive Offers and Unmatched Discounts Every Day',
      'subheading':
          'Stay ahead of the trends with unbeatable deals and limited-time discounts on a wide variety of products.',
    },
    {
      'heading': 'Fast, Secure, and Convenient Checkout Process',
      'subheading':
          'Enjoy a hassle-free shopping experience with our secure payment options and speedy delivery, ensuring your satisfaction from start to finish.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentIndex < _pages.length - 1) {
        _currentIndex++;
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        _timer?.cancel(); // Stop auto-scroll when reaching the last page
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Move the image outside of PageView.builder
          const Expanded(
            flex: 1,
            child: SizedBox()),
            Expanded(
              flex: 1,
              child: Image.asset(
                AppAssetsUrl.brandLogo,
                height: 250,
                width: 250,
              ),
            ),
            Expanded(
              flex: 1,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.height*.03),
                        child: HeadingsWidet(
                          h1: _pages[index]['heading'] as String,
                          alignment: Alignment.center,
                          h2: _pages[index]['subheading'],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // Dots indicator
            Row(
            
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 10,
                  width: _currentIndex == index ? 12 : 10,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? AppColors.links : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: size.height * .01,
                vertical: size.height * .02,
              ),
              child: ElevatedButtonWidget(
                buttonSize: null,
                function: () {


                  Navigator.pushReplacement
                   (
        context,
                     MaterialPageRoute(
          builder: (context) =>  const LandingScreen(),
        ),
      );
                },
                buttonText: "Explore",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: size.height * .02),
              child: Text(
                'Powered by Softwebies',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * .016,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
