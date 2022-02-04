import 'package:flutter/material.dart';
import 'package:nnke/ui/widgets/primary_button.dart';
import 'package:nnke/utils/assets.dart';
import 'package:nnke/utils/constants.dart';

class StartUpPage extends StatelessWidget {
  const StartUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                startUpImage,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Book Your Favorite stylist',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Text(
                    'We can help you choose your favorite stylist within the second.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  PrimaryButton(
                    txt: 'Get started',
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        loginPage,
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
