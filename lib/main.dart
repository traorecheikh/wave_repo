import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:wave_test/screens/dashboard_screen.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  await Jiffy.setLocale('fr_ca');

  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(WaveAppTest());
}

class WaveAppTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
    );
  }
}
