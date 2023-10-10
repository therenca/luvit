import 'package:flutter/material.dart';
import 'package:luvit/conf.dart' as conf;

class AppBar extends StatelessWidget {
	const AppBar({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context){
		return Padding(
			padding: const EdgeInsets.symmetric(horizontal: 10.0),
			child: Row(
				children: [
					Image.asset(conf.Assets.headerPin),
					const SizedBox(width: 5.0,),
					const Text(
						'목이길어슬픈기린님의 새로운 스팟',
						style: TextStyle(
							fontSize: 12.0,
							color: Colors.white,
						),
					),
					const Spacer(),
					Container(
						decoration: const ShapeDecoration(
							shape: StadiumBorder()
						),
						child: Row(
							children: [
								Image.asset(conf.Assets.headerStar),
								const SizedBox(width: 5.0,),
								const Text(
									'323,233',
									style: TextStyle(
										fontSize: 12.0,
										color: Colors.white,
									),
								),
							],
						),
					),
					const SizedBox(width: 5.0,),
					Image.asset(conf.Assets.notify)
				],
			),
		);
	}
}