import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerList(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(height: 150),
                Text(
                  'Weather',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  DateFormat('dd MMM yyyy').format(DateTime.now()),
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 20),
            Container(height: 100, width: 100, color: Colors.white),
            const SizedBox(height: 20),
            Container(height: 30, width: 140, color: Colors.white),
            const SizedBox(height: 20),
            Container(height: 30, width: 40, color: Colors.white),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                containerConstant(context),
                containerConstant(context),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                containerConstant(context),
                containerConstant(context),
              ],
            ),
            SizedBox(height: size.height * 0.2),
          ],
        ),
      ),
    ),
  );
}

Padding containerConstant(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 200,
      width: MediaQuery.of(context).size.width / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
    ),
  );
}
