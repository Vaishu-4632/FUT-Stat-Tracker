import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stat_tracker/screens/tracker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delayed_display/delayed_display.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> with TickerProviderStateMixin {
  int counter1 = 0;
  int counter2 = 0;
  int counter3 = 0;
  final _controller = PageController();
  // bool _bool = false;
  Animation<double>? animation ;
  AnimationController? animationController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: (Duration(milliseconds: 1100)));
    animation = Tween<double>(begin: 200, end: -40).animate(animationController!)
      ..addListener(() {
        setState(() {});
      });
      animationController!.forward();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
       Color.fromARGB(255, 11, 6, 36) ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: const Color.fromARGB(255, 11, 6, 36),
              elevation: 0,
              margin: const EdgeInsets.only( top: 10),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 600,

                  child: Stack(
                    children: [
                     
                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 100, right: 30),
                          child: Image.asset(
                            'assets/images/images/Logo.png',
                            width: MediaQuery.of(context).size.width / 1.9,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                      Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: 
                          Transform.scale(
                            scale: 1.1,
                            child: Transform.translate(
                              
                              offset: Offset(0, animation?.value ?? 0),
                            child: Container(
                              
                              alignment: Alignment.centerRight,
                              decoration: const BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/images/background_splash_1.png'))
                              ),
                            ),
                            ),
                          ),
                        ),
                        
                      
                      Container(
                        padding: const EdgeInsets.only(top: 150),
                        child:
                            Image.asset('assets/images/images/mask_group.png'),
                      ),
                     
                      Container(
                          width: 120,
                          // child: Positioned(
                            child: Transform.scale(
                              scale: 1.2,
                              origin: const Offset(-300, -500),
                              child: ShaderMask(
                                shaderCallback: (rect) {
                                  return const LinearGradient(colors: [
                                    Color.fromARGB(255, 219, 240, 34),
                                    Color.fromARGB(255, 20, 219, 27),
                                    Color.fromARGB(255, 22, 111, 184)
                                  ]).createShader(rect);
                                },
                                child: Positioned(
                                  left: 100,
                                  child:
                                    Align(
                          child: 
                          Transform.translate(
                            offset: Offset(0, animation?.value ?? 0),
                          child: Container(
                            margin: EdgeInsets.only(top: 90),
                            alignment: Alignment.topLeft,
                            child: Text('CLASS\nABOVE\nTHE REST',style: GoogleFonts.bebasNeue(fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),
                            ),
                          ),
                          ),
                        ),
                                ),
                              ),
                            ),
                          // ),
                        ),
                      
                     
                        Positioned(
                          top: 250,
                          left: 40,
                          child:  DefaultTextStyle(
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  decoration: TextDecoration.none),
                                               
                             child:
                               Align(
                            child: 
                            Transform.translate(
                              offset: Offset(0, animation?.value ?? 0),
                            child: Container(
                              margin: EdgeInsets.only(top: 50),
                              alignment: Alignment.topLeft,
                              child: const Text('Start tracking your\nWeekend League\nmatches to generate\nnew stats',
                              ),
                            ),
                            ),
                                                  ),
                            
                                      ),
                          
                          
                        ),
                     
                      Row(
                        children: [
                          Card(
                            color: Color.fromARGB(255, 27, 21, 61),
                            margin:
                                const EdgeInsets.only(left: 12, right: 10, top: 420),
                            elevation: 0,
                            child: Container(
                              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                              height: 115,
                              width: 115,
                              // color: Color.fromARGB(255, 27, 21, 61),
                              child: Stack(
                                children: [
                                  const Padding(
                                    padding:  EdgeInsets.all(10.0),
                                    child: Text('MATCHES', style: TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.bold ),),
                                  ),
                                  Transform.scale(
                                    scale: 1.2,
                                    origin: const Offset(0, -10 ),
                                    child:
                                  Image.asset('assets/images/images/card_bg_splash.png'),),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50,left: 70),
                                    child: Text('${counter1}', style: const TextStyle(color: Colors.green, fontSize: 25),),
                                  ),
                                  Transform.scale(
                                    scale: 1.10,
                                    origin: const Offset(-60, -60 ),
                                    child: Image.asset(
                                      'assets/images/images/ico_man_play.png',
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ),
                          ),
                          Card(
                            color: Color.fromARGB(255, 27, 21, 61),
                            margin:
                                const EdgeInsets.only( right: 10, top: 420),
                            // elevation: 1,
                            child: Container(
                              height: 115,
                              width: 115,
                              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: Stack(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text('WON', style: TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.bold ),),
                                  ),
                                  Transform.scale(
                                    scale: 1.3,
                                    origin: const Offset(0, -10 ),
                                    child:
                                  Image.asset('assets/images/images/card_bg_splash.png'),),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50,left: 70),
                                    child: Text('$counter2', style: const TextStyle(color: Colors.green, fontSize: 25),),
                                  ),
                                  Transform.scale(
                                    scale: 1.10,
                                    origin: const Offset(-60, -60 ),
                                    child: Image.asset(
                                      'assets/images/images/ico_man_victory.png',
                                    ),
                                  ),
                                  
                                ],
                              ),
                            
                            ),
                          ),
                          Card(
                            color: Color.fromARGB(255, 27, 21, 61),
                            margin:
                                const EdgeInsets.only(right: 10, top: 420),
                            // elevation: 5,
                            child: Container(
                              height: 115,
                              width: 115,
                              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                              
                              child: Stack(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text('LOSS', style: TextStyle(color: Colors.white, fontSize: 12 ,fontWeight: FontWeight.bold),),
                                  ),
                                  Transform.scale(
                                    scale: 1.2,
                                    origin: const Offset(0, -10 ),
                                    child:
                                  Image.asset('assets/images/images/card_bg_splash.png'),),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50,left: 70),
                                    child: Text('$counter3', style: const TextStyle(color: Colors.green, fontSize: 25),),
                                  ),
                                  Transform.scale(
                                    scale: 1.10,
                                    origin: const Offset(-60, -60 ),
                                    child: Image.asset(
                                      'assets/images/images/ico_man_defeat.png',
                                    ),
                                  ),
                                  
                                ],
                              ),
                            
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            const Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                  child: Text(
                    'LATEST MATCH',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    '____________________________________',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: 100),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text(
                      'Add a match to start tracking.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TrackerScreen()));
                      },
                      child: const Text(
                        'Click to add a match',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 200,
              // width: 50,
              child: PageView(
                controller: _controller,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/images/scroll_1.png',
                            ),
                            fit: BoxFit.cover)),
                    margin: const EdgeInsets.only(left: 20, right: 20),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/images/scroll_2.png',
                            ),
                            fit: BoxFit.cover)),

                    margin: const EdgeInsets.only(left: 15, right: 15),
                    // color: Colors.yellow ,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/images/scroll_3.png',
                            ),
                            fit: BoxFit.cover)),
                    margin: const EdgeInsets.only(left: 15, right: 15),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.green,
                  dotColor: Colors.white,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 10),
              onDotClicked: (index) => _controller.animateToPage(index,
                  duration: const Duration(milliseconds: 100), curve: Curves.easeIn),
            ),
            Container(
              height: 200,
              width: 350,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/images/podcast.png'))),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  'assets/images/images/scroll_4.png',
                  alignment: Alignment.bottomRight,
                ),
              ),
            )
          ],
        ),
      ),
    
      bottomNavigationBar: ConvexAppBar(
        height: 80,
        cornerRadius: 25,
        style: TabStyle.fixedCircle,
        backgroundColor: const Color.fromARGB(255, 35, 27, 82),
        items: [
          TabItem(icon: Container(margin: EdgeInsets.only(bottom: 5),child: Image.asset('assets/images/images/soccer-field.png',cacheHeight: 30,)),title:'MATCHES' ,isIconBlend: false, ),
          TabItem(icon: Container(margin: EdgeInsets.only(bottom: 5),child: Image.asset('assets/images/images/analytics.png',cacheHeight: 30,)),title: 'STATS'),
           TabItem(icon: FloatingActionButton(onPressed: (){},backgroundColor: Colors.purple, child: const Icon(Icons.add,size: 45,)),),
          // TabItem(icon: Icons.add),
          TabItem(icon: Container(child: Image.asset('assets/images/images/Shape.png',)),title: 'MY CLUB'),
          const TabItem(icon: Icons.settings,title:'MORE' ),
         
          

        ],
        initialActiveIndex: 2,
        onTap: (int i ) => print('click index = $i'),
        
        
      ),
    );

    // );
  }
}
