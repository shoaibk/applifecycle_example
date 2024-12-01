import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppLifecycleListener _listener;
  Color bg = Colors.amber;

  @override
  void initState() {
    super.initState();

    // Initialize the AppLifecycleListener class and pass callbacks
    _listener = AppLifecycleListener(
      onStateChange: _onStateChanged,
    );
  }

  @override
  void dispose() {
    // Do not forget to dispose the listener
    _listener.dispose();

    super.dispose();
  }

  // Listen to the app lifecycle state changes
  void _onStateChanged(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        if (kDebugMode) {
          print('detached');
        }
        setState(() {
          bg = Colors.blue;
        });
        break;
      case AppLifecycleState.resumed:
        if (kDebugMode) {
          print('resumed');
        }
        setState(() {
          bg = Colors.green;
        });
        break;
      case AppLifecycleState.inactive:
        if (kDebugMode) {
          print('inactive');
        }
        setState(() {
          bg = Colors.pink;
        });
        break;
      case AppLifecycleState.hidden:
        if (kDebugMode) {
          print('hidden');
        }
        setState(() {
          bg = Colors.yellow;
        });
        break;
      case AppLifecycleState.paused:
        if (kDebugMode) {
          print('paused');
        }
        setState(() {
          bg = Colors.purple;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: bg,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Text('BG: $bg \n\n Flutter version: ${Platform.version}',
                  style: Theme.of(context).textTheme.displaySmall),
            ),
          ),
        ),
      ),
    );
  }
}
