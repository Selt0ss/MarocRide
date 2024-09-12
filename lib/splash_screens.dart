import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _splashData = [
    {
      "title": "Multiplied earnings",
      "text": "Perceive up to 3 times the amount of the ride",
      "image": "assets/taxi1.png",
    },
    {
      "title": "Exceptional bonuses",
      "text": "Up to 100% welcome bonus the first week",
      "image": "assets/taxi2.png",
    },
    {
      "title": "Quick start",
      "text": "Your registration is validate within 12 hours",
      "image": "assets/taxi3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _splashData.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) => SplashContent(
              title: _splashData[index]["title"]!,
              text: _splashData[index]["text"]!,
              image: _splashData[index]["image"]!,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              children: List.generate(
                _splashData.length,
                    (index) => buildDot(index: index),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen() as Widget),
                );
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.amber),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.amber : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class LoginScreen {
  const LoginScreen();
}

class SplashContent extends StatelessWidget {
  final String title, text, image;

  const SplashContent({
    Key? key,
    required this.title,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const Text(
          "Marocride",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        Image.asset(
          image,
          height: 200,
          width: 200,
        ),
        const Spacer(),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70),
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}