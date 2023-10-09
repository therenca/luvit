import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
	const StatusBar({Key? key}) : super(key: key);
	@override
	Widget build(BuildContext context){
		return SizedBox(
			height: MediaQuery.of(context).viewPadding.top,
		);
	}
}