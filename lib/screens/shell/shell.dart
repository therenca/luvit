import 'package:flutter/material.dart';
import 'package:luvit/conf.dart' as conf;

import 'status_bar.dart';
import 'bottom_navbar.dart';

class Shell extends StatefulWidget {
	const Shell({Key? key}) : super(key: key);

	@override
	ShellState createState() => ShellState();
}

class ShellState extends State<Shell> {
	@override
	Widget build(BuildContext context){
		return Material(
			color: Colors.black,
			child: Column(
				children: [
					const StatusBar(),
					
					Expanded(
						child: Container(
							// color: Colors.white
						),
					),
					const BottomNavBar()
				],
			),
		);
	}
}