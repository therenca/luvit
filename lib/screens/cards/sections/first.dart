import 'package:flutter/material.dart';
import 'package:luvit/conf.dart' as conf;

class First extends StatelessWidget {

	const First({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context){
		return Material(
			color: Colors.transparent,
			child: Column(
				children: [
					Row(
						children: [
							Expanded(
								child: Container(
									padding: const EdgeInsets.all(10.0),
									decoration: BoxDecoration(
										color: Colors.black,
										borderRadius: BorderRadius.circular(20.0)
									),
									child: Row(
										children: [
											Image.asset(conf.Assets.darkStar),
											const SizedBox(width: 5.0,),
											const Text(
												'29,930',
												style: TextStyle(
													color: Colors.white,
													fontWeight: FontWeight.bold
												),
											),
										],
									),
								),
							),
							const Spacer(flex: 2,),
						],
					),
					const SizedBox(height: 3.0),
					const Row(
						children: [
							Text(
								'잭과분홍콩나물',
								style: TextStyle(
									color: Colors.white,
									fontWeight: FontWeight.bold
								),
							),
							SizedBox(width: 5.0,),
							Text(
								'25',
								style: TextStyle(
									color: Colors.white,
									fontWeight: FontWeight.bold
								),
							),
						],
					),
					Row(
						children: [
							const Text(
								'서울',
								style: TextStyle(
									color: Colors.grey
								),
							),
							const Text(
								'.',
								style: TextStyle(
									color: Colors.grey
								),
							),
							const Text(
								'2km 거리에 있음',
								style: TextStyle(
									color: Colors.grey
								),
							),
							const Spacer(),
							Image.asset(conf.Assets.love)
						],
					),
				],
			),
		);
	}

}