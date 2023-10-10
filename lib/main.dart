import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:luvit/firebase_options.dart';
import 'package:luvit/screens/shell/shell.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:luvit/models/profile/m_profiles.dart' as m_profile;

Future<void> main() async {
	WidgetsFlutterBinding.ensureInitialized();
	await Firebase.initializeApp(
		options: DefaultFirebaseOptions.currentPlatform
	);
  runApp(const Luvit());
}

class Luvit extends StatelessWidget {
  const Luvit({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
			providers: [
				ChangeNotifierProvider<m_profile.Profiles>(create: (_) => m_profile.Profiles(),)
			],
			child: MaterialApp(
				debugShowCheckedModeBanner: false,
				title: 'Luvit',
				theme: ThemeData(
					colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
					useMaterial3: true,
				),
				home: const Shell(),
			),
		);
  }
}


