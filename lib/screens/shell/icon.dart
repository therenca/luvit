import 'package:flutter/material.dart';

class Icon extends StatelessWidget {
	final String image;
	final String? text;
	final Color? color;
	final double? width;
	final double? height;
	final double? fontSize;
	final bool? offset;
	const Icon({
		Key? key,
		required this.image,
		this.text,
		this.color,
		this.width=64,
		this.height=48,
		this.fontSize=9,
		this.offset
	}) : super(key: key);

	@override
	Widget build(BuildContext context){
		return Column(
			children: [
				SizedBox(height: offset ?? false ? 20.0 : 0,),
				Image.asset(image),
				const SizedBox(height: 3.0,),
				text != null ? Text(
					text!,
					style: TextStyle(
						fontSize: fontSize,
						color: Colors.white,
						fontWeight: FontWeight.bold,
					),
				) : Container()
			],
		);
	}
}