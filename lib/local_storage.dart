import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends StatefulWidget {
  const LocalStorage({super.key});

  @override
  State<LocalStorage> createState() => _LocalStorageState();
}

class _LocalStorageState extends State<LocalStorage> {
  String localStorage = 'Flutter';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Shared Preferences'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$localStorage'),
            ElevatedButton(
                onPressed: () {
                  writeData();
                },
                child: const Text('Write Data')),
            ElevatedButton(
                onPressed: () {
                  readData();
                },
                child: const Text('Read Data')),
            ElevatedButton(
                onPressed: () {
                  updateData();
                },
                child: const Text('Update Data')),
            ElevatedButton(
                onPressed: () {
                  deleteData();
                },
                child: const Text('Delete Data'))
          ],
        ),
      ),
    );
  }

  void writeData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', 'Test Android');
  }

  void readData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('name');
    setState(() {
      localStorage = action!;
    });
  }

  void updateData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', 'Test 1');
  }

  void deleteData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
    setState(() {
      localStorage = "Flutter";
    });
  }
}
