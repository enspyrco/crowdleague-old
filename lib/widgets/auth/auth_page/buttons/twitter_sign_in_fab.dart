import 'package:flutter/material.dart';

class TwitterSignInFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: FloatingActionButton(
          child: ImageIcon(AssetImage('assets/images/twitter_logo.png')),
          elevation: 1,
          mini: true,
          onPressed: null),
    );
  }
}
