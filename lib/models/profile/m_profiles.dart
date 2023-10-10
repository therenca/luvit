import 'package:flutter/material.dart';
import 'data/d_profile.dart' as d_profile;

class Profiles extends ChangeNotifier {
	Map<String, d_profile.Profile>? _profiles;
	Map<String, d_profile.Profile>? get profiles => _profiles;

	set profiles(Map<String, d_profile.Profile>? value){
		_profiles?.updateAll((k, v) => value![k]!);
		_profiles ??= value;
		notifyListeners();
	}

	void update(d_profile.Profile value){
		_profiles?.update(value.name, (v) => value);
		notifyListeners();
	}
}