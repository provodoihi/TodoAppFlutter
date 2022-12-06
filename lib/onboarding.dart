import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'start.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _position = 0;
  final int _pageLength = 3;
  final PageController _controller = PageController(initialPage: 0);

  void _onPageChange(int page) {
    setState(() {
      _position = page;
    });
  }

  void _onPress() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const StartPage(),
      ),
    );
  }

  void _onChangePage() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onChangePageBack() {
    _controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(""),
        leading: TextButton(
          onPressed: _onPress,
          child: const Text(
            "SKIP",
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.44),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: PageView(
        controller: _controller,
        onPageChanged: _onPageChange,
        children: <Widget>[
          _content(
            "assets/images/Group182.png",
            "Manage your tasks",
            "You can easily manage all of your daily tasks in DoMe for free",
          ),
          _content(
            "assets/images/Group183.png",
            "Create daily routine",
            "In Uptodo you can create your personalized routine to stay productive",
          ),
          _content(
            "assets/images/Group181.png",
            "Organize your tasks",
            "You can organize your daily tasks by adding your tasks into separate categories",
          ),
        ],
      ),
      bottomSheet: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: _position == 0 ? null : _onChangePageBack,
              child: const Text(
                "Back",
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.44),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: _position == 2 ? _onPress : _onChangePage,
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0XFF8875FF),
              ),
              child: Text(
                _position == 2 ? "GET STARTED" : "NEXT",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center _content(String asset, String text1, String text2) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            asset,
            height: 280,
            width: 220,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 32,
            ),
            child: DotsIndicator(
              dotsCount: _pageLength,
              position: _position.toDouble(),
              decorator: DotsDecorator(
                color: const Color(0XFFAFAFAF),
                // Inactive color
                activeColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
                size: const Size(20.0, 6.0),
                activeSize: const Size(20.0, 6.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
            child: Text(
              text1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
            child: Text(
              text2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
