import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stat_tracker/screens/tracker.dart';
import 'package:animated_background/animated_background.dart';

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
  bool _bool = false;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 27, 82),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.only(left: 20, right: 10, top: 10),
              elevation: 1,
              child: Center(
                child: Container(
                  color: const Color.fromARGB(255, 35, 27, 82),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.75,

                  child: Stack(
                    children: [
                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 80, right: 30),
                          child: Image.asset(
                            'assets/images/images/Logo.png',
                            width: MediaQuery.of(context).size.width / 2,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        alignment: Alignment.topRight,
                        child: AnimatedCrossFade(firstChild: Image.asset('assets/images/images/card_bg_splash.png'), secondChild: Image.asset('assets/images/images/card_bg_splash.png'), crossFadeState: _bool? CrossFadeState.showFirst : CrossFadeState.showSecond, duration: Duration(milliseconds: 500))),
                      AnimatedBackground(vsync: this, behaviour:EmptyBehaviour(), child: Container(
                      )),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        alignment: Alignment.topRight,
                        child: AnimatedCrossFade(firstChild: Image.asset('assets/images/images/background_splash_1.png'), secondChild: Image.asset('assets/images/images/background_splash_1.png'), crossFadeState: _bool? CrossFadeState.showFirst : CrossFadeState.showSecond, duration: Duration(milliseconds: 500))),
                      AnimatedBackground(vsync: this, behaviour:EmptyBehaviour(), child: Container(
                      )),
                      
                      Container(
                        padding: const EdgeInsets.only(top: 140,right: 20),
                        child:
                            Image.asset('assets/images/images/mask_group.png'),
                      ),
                      Container(
                        width: 120,
                        child: Positioned(
                          child: Transform.scale(
                            scale: 1.22,
                            origin: const Offset(-125, -450),
                            child: ShaderMask(
                              shaderCallback: (rect) {
                                return const LinearGradient(colors: [
                                  Color.fromARGB(255, 203, 224, 12),
                                  Color.fromARGB(255, 20, 219, 27),
                                ]).createShader(rect);
                              },
                              child: Positioned(
                                left: 100,
                                child: DefaultTextStyle(
                                  style: const TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none
                                  ),
                                  child: AnimatedTextKit(
                                    repeatForever: false,
                                    totalRepeatCount: 1,
                                    animatedTexts: [
                                      RotateAnimatedText('CLASS\nABOVE\nTHE REST',rotateOut: false )
                                  ]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                     Positioned(
                        top: 220,
                        left: 20,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white60,
                              decoration: TextDecoration.none),

                         child: AnimatedTextKit(
                                    repeatForever: false,
                                    totalRepeatCount: 1,
                                    animatedTexts: [
                                      RotateAnimatedText('Start tracking your\nWeekend League\nmatches to generate\nnew stats',rotateOut: false )
                                  ]),),
                        
                      ),
                      Row(
                        children: [
                          Card(
                            margin:
                                const EdgeInsets.only(left: 15, right: 5, top: 320),
                            elevation: 2,
                            child: Container(
                              height: 120,
                              width: 100,
                              color: const Color.fromARGB(255, 35, 27, 82),
                              child: Stack(
                                children: [
                                  const Padding(
                                    padding:  EdgeInsets.all(10.0),
                                    child: Text('MATCHES', style: TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.bold ),),
                                  ),
                                  Transform.scale(
                                    scale: 1.40,
                                    origin: const Offset(-30, -30 ),
                                    child:
                                  Image.asset('assets/images/images/card_bg_splash.png'),),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50,left: 70),
                                    child: Text('${counter1}', style: const TextStyle(color: Colors.green, fontSize: 25),),
                                  ),
                                  Transform.scale(
                                    scale: 1.40,
                                    origin: const Offset(-40, -30 ),
                                    child: Image.asset(
                                      'assets/images/images/ico_man_play.png',
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ),
                          ),
                          Card(
                            margin:
                                const EdgeInsets.only(left: 5, right: 5, top: 320),
                            elevation: 5,
                            child: Container(
                              height: 120,
                              width: 100,
                              color: const Color.fromARGB(255, 35, 27, 82),
                              child: Stack(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text('WON', style: TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.bold ),),
                                  ),
                                  Transform.scale(
                                    scale: 1.40,
                                    origin: const Offset(-30, -30 ),
                                    child:
                                  Image.asset('assets/images/images/card_bg_splash.png'),),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50,left: 70),
                                    child: Text('$counter2', style: const TextStyle(color: Colors.green, fontSize: 25),),
                                  ),
                                  Transform.scale(
                                    scale: 1.40,
                                    origin: const Offset(-40, -30 ),
                                    child: Image.asset(
                                      'assets/images/images/ico_man_victory.png',
                                    ),
                                  ),
                                  
                                ],
                              ),
                            
                            ),
                          ),
                          Card(
                            margin:
                                const EdgeInsets.only(left: 5, right: 5, top: 320),
                            elevation: 5,
                            child: Container(
                              height: 120,
                              width: 100,
                              color: const Color.fromARGB(255, 35, 27, 82),
                              child: Stack(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text('LOSS', style: TextStyle(color: Colors.white, fontSize: 12 ,fontWeight: FontWeight.bold),),
                                  ),
                                  Transform.scale(
                                    scale: 1.20,
                                    origin: const Offset(10, -100 ),
                                    child:
                                  Image.asset('assets/images/images/card_bg_splash.png'),),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50,left: 70),
                                    child: Text('$counter3', style: const TextStyle(color: Colors.green, fontSize: 25),),
                                  ),
                                  Transform.scale(
                                    scale: 1.40,
                                    origin: const Offset(-40, -30 ),
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
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                  child: Text(
                    'LATEST MATCH',
                    style: TextStyle(color: Colors.white),
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
            Row(
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
            SizedBox(
              height: 150,
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
