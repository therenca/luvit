import 'package:flutter/material.dart';
import 'package:luvit/conf.dart' as conf;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:luvit/models/profile/data/d_profile.dart' as d_profile;

import 'indicator.dart';

class Card extends StatefulWidget {
	final d_profile.Profile profile;
	
	const Card({
		Key? key,
		required this.profile
	}) : super(key: key); 

	@override
	CardState createState() => CardState();
}

class CardState extends State<Card> {
	int selectedIndex = 0;
	Map<String, int> indexes = {};
	PageController controller = PageController();
	@override
	void initState(){
		super.initState();

		for(var index=0; index<widget.profile.images.length; index++){
			indexes[widget.profile.images[index]] = index;
		}
	}
	

	@override
	void dispose(){
		controller.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context ){
		return Stack(
			children: [
				PageView(
					controller: controller,
					children: widget.profile.images.map((url) => CachedNetworkImage(
						imageUrl: url,
						imageBuilder: (context, imageProvider){
						return Container(
							margin: const EdgeInsets.only(left: 10.0),
							decoration: BoxDecoration(
								border: Border.all(color: conf.Colors.imageBorderColor),
								borderRadius: BorderRadius.circular(25.0),
								image: DecorationImage(
									image: imageProvider,
									fit: BoxFit.cover
								)
							),
						);
					},
					useOldImageOnUrlChange: true,
					progressIndicatorBuilder: (context, url, downloadProgress) => 
						Container(
							color: Colors.black,
							alignment: Alignment.center,
							child: SizedBox(
								height: 30.0,
								width: 30.0,
								child: CircularProgressIndicator(
									value: downloadProgress.progress,
									valueColor: AlwaysStoppedAnimation<Color>(conf.Colors.pink),
								),
							),
						),
					errorWidget: (context, url, error) => Container(
						color: Colors.black,
						alignment: Alignment.center,
						child: const Icon(Icons.error, color: Colors.redAccent,),
					),
					fit: BoxFit.cover,
					)).toList(),
					onPageChanged: (int value){
						setState(() => selectedIndex = value);
					},
				),
				Positioned(
					top: 20.0,
					left: 20.0,
					right: 20.0,
					child: Row(
						children: widget.profile.images.map((url) => Expanded(
							child: Padding(
								padding: const EdgeInsets.only(right: 10.0),
								child: Indicator(
									color: indexes[url] == selectedIndex ? conf.Colors.pink : Colors.black,
								),
							),
						)).toList(),
					),
				),
				Positioned(
					top: 0,
					left: 0,
					child: GestureDetector(
						child: Container(
							width: 100,
							height: 200,
							color: Colors.transparent,
						),
						onTap: (){
							if(selectedIndex > -1 && selectedIndex != 0){
								--selectedIndex;
								controller.jumpToPage(selectedIndex);
							}
						},
					),
				),
				Positioned(
					top: 0,
					right: 0,
					child: GestureDetector(
						child: Container(
							width: 100,
							height: 200,
							color: Colors.transparent,
						),
						onTap: (){
							if(selectedIndex < widget.profile.images.length){
								++selectedIndex;
								controller.jumpToPage(selectedIndex);
							}
						},
					),
				),
			],
		);
	}
}