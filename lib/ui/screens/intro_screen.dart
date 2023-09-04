import 'package:flutter/material.dart';
import 'package:hydroalert/ui/screens/auth_screen.dart';
import 'package:hydroalert/ui/widgets/sharedpreference.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentPage = 0;
  List<Map<String, dynamic>> data = [
    {
      "imagePath": Image.asset(
        "images/image1.png",
      ),
      "title": Text(
        "The right quantity of water\n   timely enrich health.",
        style: TextStyle(
            color: Colors.black87, fontSize: 22, fontWeight: FontWeight.w500),
      ),
    },
    {
      "imagePath": Image.asset("images/image2.png"),
      "title": Text(
        "Drinking water is essential \n    for a  good lifestyle.",
        style: TextStyle(
            color: Colors.black87, fontSize: 22, fontWeight: FontWeight.w500),
      ),
    }
  ];

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            children: [
              for (var item in data)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    item["imagePath"],
                    SizedBox(height: 20),
                    item["title"]
                  ],
                )
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: _currentPage == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          child: Text(
                            "Skip",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          onPressed: () {
                            setState(() {
                              _currentPage--;
                            });
                            _pageController.previousPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          }),
                      // IconButton(
                      //     icon: Icon(Icons.arrow_forward_ios_sharp,
                      //         color: Colors.black87),
                      //     onPressed: () {
                      //       setState(() {
                      //         _currentPage++;
                      //       });
                      //       print(_currentPage);
                      //       _pageController.nextPage(
                      //           duration: Duration(milliseconds: 500),
                      //           curve: Curves.easeIn);
                      //     }),
                      ElevatedButton(
                          onPressed: () {
                            // setState(() {
                            //   _currentPage++;
                            // });
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFA2DDF3),
                          ))
                    ],
                  )
                : ElevatedButton(
                    child: Text(
                      "Let's get Hydrated!!",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    onPressed: () {
                      //onTap:(){
                        
                      SharedPref.setGetHydrated();

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => AuthScreen(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFA2DDF3),
                    ),
                  ))
      ]),
    ));
  }
}
