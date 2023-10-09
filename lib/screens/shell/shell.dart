import 'package:flutter/material.dart';
import 'package:luvit/conf.dart' as conf;
import 'package:luvit/screens/shell/bottom_navbar.dart';

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