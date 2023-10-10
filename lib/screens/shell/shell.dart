import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'status_bar.dart';
import 'bottom_navbar.dart';
import 'app_bar.dart' as app_bar;
import 'package:provider/provider.dart';
import 'package:luvit/conf.dart' as conf;
import 'package:luvit/screens/cards/no_card.dart';
import 'package:luvit/screens/cards/card.dart' as card;
import 'package:luvit/models/profile/m_profiles.dart' as m_profile;
import 'package:luvit/models/profile/data/d_profile.dart' as d_profile;

class Shell extends StatefulWidget {
	const Shell({Key? key}) : super(key: key);

	@override
	ShellState createState() => ShellState();
}

class ShellState extends State<Shell> {

	@override
	void initState(){
		super.initState();

		var ref = FirebaseDatabase.instance.ref('data');
		ref.onValue.listen((event) {
			var data = event.snapshot.value as Map;
			if(data.length > 1){
				var profiles = <String, d_profile.Profile>{};
				data.forEach((key, value) {
					var val = value.map<String, dynamic>((k,v) => MapEntry(k as String, v as dynamic));
					var profile = d_profile.Profile.fromMap(val);
					profiles[profile.name] = profile;
				});
				Provider.of<m_profile.Profiles>(context, listen: false).profiles = profiles;
			} else {
				var profile = d_profile.Profile.fromMap(data.values.first);
				Provider.of<m_profile.Profiles>(context, listen: false).update(profile);
			}
		});
	}

	@override
	Widget build(BuildContext context){
		return Material(
			color: Colors.black,
			child: Column(
				children: [
					const StatusBar(),
					const app_bar.AppBar(),
					Expanded(
						child: Row(
							children: [
								Expanded(
									child: LayoutBuilder(
										builder: (BuildContext context, BoxConstraints constraints){
											var width = constraints.maxWidth;
											var height =  constraints.maxHeight;
											return Consumer<m_profile.Profiles>(
												builder: (context, model, child){
													return model.profiles == null ? Center(
														child: SizedBox(
															width: 30.0,
															height: 30.0,
															child: CircularProgressIndicator(
																valueColor: AlwaysStoppedAnimation<Color>(conf.Colors.pink),
															),
														),
													) : model.profiles!.isEmpty ? const NoCard() : Stack(
														children: model.profiles!.values.map<Widget>((p){
															var c = SizedBox(
																height: height - 20,
																width: width - 20,
																child: card.Card(
																	profile: p,
																),
															);
															return Positioned(
																top: 10.0,
																left: 10.0,
																bottom: 10.0,
																right: 10.0,
																child: Draggable(
																	onDragEnd: (drag){
																		Provider.of<m_profile.Profiles>(context, listen: false).remove(p.name);
																	},
																	childWhenDragging: Container(),
																	feedback: c,
																	child: c 
																)
															);
														}).toList(),
													);
												},
											);
										},
									),
								)
							],
						),
					),
					const BottomNavBar()
				],
			),
		);
	}
}