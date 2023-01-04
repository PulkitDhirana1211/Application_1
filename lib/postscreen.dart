import 'package:flutter/material.dart';
import 'dart:math';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  int random1 = Random().nextInt(10000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              "Request id: $random1",
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "deeplink: benammes://search?category=abc",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
