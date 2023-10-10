import 'package:flutter/material.dart';
import 'package:luvit/conf.dart' as conf;

class Second extends StatelessWidget {

	const Second({Key? key}) : super(key: key);

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
							SizedBox(width: 2.0,),
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
							const Expanded(
								flex: 5,
								child: Text(
									'서로 아껴주고 힘이 되어줄 사람 찾아요 선릉으로 직장 다니고 있고 여행 좋아해요 이상한 이야기하시는 분 바로 차단입니다',
									style: TextStyle(
										color: Colors.grey
									),
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