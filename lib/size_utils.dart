import 'package:flutter/material.dart';

class SizeUtils {

	static late MediaQueryData _mediaQueryData;
	static late double screenWidth;
	static late double screenHeight;
	static late double w;
	static late double h;


	void init(BuildContext context) {
		_mediaQueryData = MediaQuery.of(context);
		screenWidth = _mediaQueryData.size.width;
		screenHeight = _mediaQueryData.size.height;
		w = screenWidth / 100;
		h = screenHeight / 100;
	}
}