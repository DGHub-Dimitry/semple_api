import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Empty extends StatelessWidget {
  final double width;
  final double height;
  const Empty({this.width = 200, this.height = 200, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/lotties/empty.json',
              fit: BoxFit.fill, repeat: true, width: width, height: height),
          const Text(
            'No data found',
            style: TextStyle(fontSize: 15),
          ),
          const Text(
            'This data is empty',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
