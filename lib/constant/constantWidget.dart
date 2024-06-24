import 'package:flutter/material.dart';

Row rowWidget(String name,String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(name,
        style: const TextStyle(fontWeight:FontWeight.bold,
          fontSize: 16,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(value,
          style: const TextStyle(fontWeight:FontWeight.w400),
        ),
      ),
    ],
  );
}

Widget selectCloudIcon(String icon) {
  return Container(
    height: 100,width: 100,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage('https://openweathermap.org/img/w/${icon}.png'),
            fit: BoxFit.fill
        )
    ),
  );
  //return Image.asset(AppImages.clearSkyIcon);
}