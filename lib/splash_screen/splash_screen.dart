import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stat_tracker/screens/Login.dart';
import 'package:stat_tracker/utils/background.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final pageController = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }
  Widget buildPage({
    required String urlImage,
    required String title,
  }) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(urlImage,
      fit: BoxFit.cover,
      width: double.infinity,),
      const SizedBox(height: 20,),
      Text(title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 22,
      ),
      textAlign: TextAlign.center,)
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("#2C5364"),
               hexStringToColor("#203A43"),
              hexStringToColor("#0F2027")
            ],
            
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
       
        child: PageView(
          onPageChanged: (index) {
            setState(() =>
              isLastPage = index == 2
            );
          },
          controller: pageController,
          children: [
            buildPage(
              urlImage: 'assets/images/images/Splash-background.png',
              title: 'Track your matches'
            ),
            buildPage(
              urlImage: 'assets/images/images/Stats.png',
              title: 'Track your stats'
            ),
            buildPage(
              urlImage: 'assets/images/images/Chart.png',
              title: 'Maximize your performance'
            ),
           
           
          ],
        ),
      ),
      bottomSheet: Container(
        
        color: Color.fromARGB(255, 23, 40, 53),
        //  Color.fromARGB(1,15,32,39),
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isLastPage ? SizedBox(width: 80,):
            TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen())),
                child: const Text(
                  'SKIP',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
            Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const ScrollingDotsEffect(
                    activeDotColor: Colors.blue,
                     dotHeight: 10,
                     dotWidth: 10,
                    dotColor: Colors.grey,
                    spacing: 10),
                    onDotClicked: (index) => pageController.animateToPage(index, duration: Duration(milliseconds: 100), curve: Curves.easeIn),
              ),
              
            ),
            isLastPage ?
            TextButton(
                onPressed: () =>  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen())), 
                child: const Text('GOT IT',
                    style: TextStyle(color: Colors.white, fontSize: 18))):
            TextButton(
                onPressed: () => pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut),
                child: const Text('NEXT',
                    style: TextStyle(color: Colors.white, fontSize: 18)))
          ],
        ),
      ),
    );
  }
}
