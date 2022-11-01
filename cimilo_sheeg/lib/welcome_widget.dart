import 'package:flutter/material.dart';

class welcome_wigdet extends StatelessWidget {
  const welcome_wigdet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RichText(
            text: const TextSpan(
                text: 'ku so dhawow ',
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    height: 1.5),
                children: [
                  TextSpan(
                    text: '\nC i m i l o Sh e e g - app 🌥️',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
