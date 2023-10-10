import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luvit/conf.dart' as conf;
import 'package:firebase_database/firebase_database.dart';

import 'status_bar.dart';
import 'bottom_navbar.dart';
import 'app_bar.dart' as app_bar;
import 'package:provider/provider.dart';
import 'package:luvit/screens/cards/no_card.dart';
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
					Provider.of<m_profile.Profiles>(context, listen: false).profiles = profiles;
				});
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
						child: Consumer<m_profile.Profiles>(
							builder: (context, model, child){
								return model.profiles == null ? const Center(
									child: SizedBox(
										width: 30.0,
										height: 30.0,
										child: CircularProgressIndicator(
											valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
										),
									),
								) : model.profiles!.isEmpty ? const NoCard() : const Center(
									child: Text(
										'Not Empty',
										style: TextStyle(
											fontSize: 14.0,
											color: Colors.white,
										),
									),
								);
							},
						)
					),
					const BottomNavBar()
				],
			),
		);
	}
}