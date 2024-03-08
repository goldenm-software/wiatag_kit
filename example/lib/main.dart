import 'package:flutter/material.dart';
import 'package:wiatag_kit/wiatag_kit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _plugin = WiatagKit();

  WiatagServer get server => const WiatagServer(
        host: "nl.gpsgsm.org",
        port: 20963,
        unitId: "wiatag_flutter",
        password: "",
      );

  WiatagMessage get message => const WiatagMessage(
        latitude: 10,
        longitude: 10,
      );

  @override
  void initState() {
    super.initState();

    _plugin.setServer(server);
    _plugin.addListener((command) {
      debugPrint("Command received: $command");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            const Text("Set WiatagServer"),
            ElevatedButton(
              onPressed: () async {
                await _plugin.setServer(server);
              },
              child: const Text("Set WiatagServer"),
            ),
            const SizedBox(height: 16),
            const Text("Get WiatagServer"),
            ElevatedButton(
              onPressed: () async {
                final result = await _plugin.getServer();
                debugPrint("WiatagServer: $result");
              },
              child: const Text("Get WiatagServer"),
            ),
            const SizedBox(height: 16),
            const Text("Send SOS"),
            ElevatedButton(
              onPressed: () async {
                await _plugin.senSos();
              },
              child: const Text("Send SOS"),
            ),
            const SizedBox(height: 16),
            const Text("Send SOS with info"),
            ElevatedButton(
              onPressed: () async {
                await _plugin.senSos(message.copyWith(
                  extra: {"last.will": "HELP ME!"},
                ));
              },
              child: const Text("Send SOS with info"),
            ),
            const SizedBox(height: 16),
            const Text("Send Text"),
            ElevatedButton(
              onPressed: () async {
                await _plugin.sendText("Hello, World!");
              },
              child: const Text("Send Text"),
            ),
            const SizedBox(height: 16),
            const Text("Send Text with info"),
            ElevatedButton(
              onPressed: () async {
                await _plugin.sendText("Hello, World!", message);
              },
              child: const Text("Send Text with info"),
            ),
            const SizedBox(height: 16),
            const Text("Send WiatagMessage"),
            ElevatedButton(
              onPressed: () async {
                await _plugin.sendMessage(message);
              },
              child: const Text("Send WiatagMessage"),
            ),
          ],
        ),
      ),
    );
  }
}
