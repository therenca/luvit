import 'package:flutter/material.dart';
import 'package:luvit/conf.dart' as conf;
import 'icon.dart' as icon;

class BottomNavBar extends StatefulWidget {
	const BottomNavBar({Key? key}) : super(key: key);
	@override
	BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
	@override
	Widget build(BuildContext context){
		return Stack(
			children: [
				Row(
					children: [
						Expanded(
							child: Image.asset(conf.Assets.union, fit: BoxFit.cover,),
						)
					],
				),
				const Row(
					mainAxisAlignment: MainAxisAlignment.spaceAround,
					children: [
						icon.Icon(
							offset: true,
							text: '홈', image: conf.Assets.home,),
						icon.Icon(
							offset: true,
							text: '스팟', image: conf.Assets.location),
						icon.Icon(
							image: conf.Assets.star, height: 50, width: 50,),
						icon.Icon(
							offset: true,
							text: '채팅', image: conf.Assets.chat),
						icon.Icon(
							offset: true,
							text: '마이', image: conf.Assets.profile),
					],
				)
			],
		);
	}
}