import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:wiatag_kit/wiatag_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _plugin = WiatagKit();

  @override
  void initState() {
    super.initState();
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
            const Text("Set Server"),
            ElevatedButton(
              onPressed: () async {
                await _plugin.setServer(const Server(
                  host: "50189.flespi.gw",
                  port: 26460,
                  unitId: "test_wiatag_kit_flutter",
                  password: "",
                ));
              },
              child: const Text("Set Server"),
            ),
            const SizedBox(height: 16),
            const Text("Get Server"),
            ElevatedButton(
              onPressed: () async {
                final server = await _plugin.getServer();
                debugPrint("Server: $server");
              },
              child: const Text("Get Server"),
            ),
            const SizedBox(height: 16),
            const Text("Send SOS"),
            ElevatedButton(
              onPressed: () async {
                await _plugin.senSos();
              },
              child: const Text("Send SOS"),
            ),
          ],
        ),
      ),
    );
  }
}
