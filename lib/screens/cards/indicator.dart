import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
	final Color color;
	const Indicator({
		Key? key,
		required this.color
	}) : super(key: key);

	@override
	Widget build(BuildContext context){
		return Container(
			height: 3,
			decoration: BoxDecoration(
				color: color,
				borderRadius: BorderRadius.circular(10.0)
			),
		);
	}
}