import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tugas_mobile_3/pages/instruction_page_widget.dart';
import 'package:tugas_mobile_3/pages/mainmenu_page_widget.dart';
import 'package:tugas_mobile_3/pages/stopwatch_page_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  await Supabase.initialize(
    url: dotenv.env["BACKEND_URL"] ?? '',
    publishableKey: dotenv.env["BACKEND_PUBLISHABLE_KEY"],
  );

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            StopwatchPageWidget(),
            MainmenuPageWidget(),
            InstructionPageWidget(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.timer), label: "timer"),
            NavigationDestination(icon: Icon(Icons.home), label: "home"),
            NavigationDestination(
              icon: Icon(Icons.auto_stories),
              label: "instruction",
            ),
          ],
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
