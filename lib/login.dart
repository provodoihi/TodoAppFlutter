import 'package:flutter/material.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isNull = true;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose(); //prevents memory leak
  }

  void _checkNull() {
    if ((_password.text != "") && (_username.text != "")) {
      setState(() {
        _isNull = false;
      });
    } else {
      setState(() {
        _isNull = true;
      });
    }
  }

  void _onPress() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MyHomePage(title: ""),
      ),
    );
  }

  void _onPressBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(""),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          iconSize: 24,
          onPressed: _onPressBack,
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 12, 0, 24),
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            _content(_username, false, "Username", "Enter your Username"),
            _content(_password, true, "Password", "Password"),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 60, 0, 30),
              child: ElevatedButton(
                onPressed: _isNull ? null : _onPress,
                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor:
                      const Color.fromRGBO(134, 135, 231, 0.5),
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: const Color(0XFF8687E7),
                ),
                child: const Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      height: 1,
                      endIndent: 5,
                      color: Color(0XFF979797),
                    ),
                  ),
                  Text(
                    "Or",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0XFF979797),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      height: 1,
                      indent: 5,
                      color: Color(0XFF979797),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size.fromHeight(50),
                      side: const BorderSide(
                        color: Color(0XFF8875FF),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.g_mobiledata_rounded,
                            size: 24,
                            color: Colors.redAccent,
                          ),
                        ),
                        Text(
                          "Login with Google",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size.fromHeight(50),
                    side: const BorderSide(
                      color: Color(0XFF8875FF),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.apple_rounded,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Login with Apple",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account?",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0XFF979797),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _content(
    TextEditingController controller,
    bool obscureText,
    String label,
    String hintText,
  ) {
    return Container(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              label,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          TextField(
            controller: controller,
            onChanged: (text) {
              _checkNull();
            },
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            obscureText: obscureText,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color(0XFF535353),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0XFF979797),
                  width: 1,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0XFF979797),
                  width: 1,
                ),
              ),
              contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            ),
          ),
        ],
      ),
    );
  }
}
