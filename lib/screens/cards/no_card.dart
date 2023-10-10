import 'package:flutter/material.dart';

class NoCard extends StatelessWidget {
	const NoCard({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context ){
		return const Column(
			children: [
				Expanded(
					child: Row(
						children: [
							Expanded(
								child: Center(
									child: Column(
										mainAxisSize: MainAxisSize.min,
										mainAxisAlignment: MainAxisAlignment.center,
										children: [
											Text(
												'추천 드릴 친구들을 준비 중이에요',
												style: TextStyle(
													color: Colors.white,
													fontWeight: FontWeight.bold 
												),
											),
											SizedBox(height: 2.0,),
											Text(
												'매일 새로운 친구들을 소개시켜드려요',
												style: TextStyle(
													fontSize: 10.0,
													color: Colors.grey
												),
											),
										],
									),
								),
							)
						],
					),
				)
			],
		);
	}
}