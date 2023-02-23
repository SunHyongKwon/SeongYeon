import 'dart:async';
import 'package:flutter/material.dart';

class TopButton extends StatefulWidget {
  final StreamController<String> controller;
  const TopButton({super.key, required this.controller});

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.controller.add('식량작물');
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xffFFB973),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Colors.white),
                    ),
                    elevation: 0.0,
                  ),
                  child: const Text('식량작물'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.controller.add('채소류');
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xffFFB973),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Colors.white),
                    ),
                    elevation: 0.0,
                  ),
                  child: const Text('채소류'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.controller.add('특용작물');
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xffFFB973),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Colors.white),
                    ),
                    elevation: 0.0,
                  ),
                  child: const Text('특용작물'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.controller.add('과일류');
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xffFFB973),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Colors.white),
                    ),
                    elevation: 0.0,
                  ),
                  child: const Text('과일류'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.controller.add('수산물');
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xffFFB973),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(color: Colors.white),
                    ),
                    elevation: 0.0,
                  ),
                  child: const Text('수산물'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
