import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _isNotificationEnabled = true;
  bool _isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Setting',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 107, 175, 232),
            ),
            child: const Icon(
              Icons.notifications,
              color: Colors.blue,
            ),
          ),
          title: const Text(
            'Notifikasi',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: Switch(
            value: _isNotificationEnabled,
            onChanged: (value) {
              setState(() {
                _isNotificationEnabled = value;
              });
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _isDarkModeEnabled
                  ? const Color.fromARGB(255, 33, 33, 33)
                  : const Color.fromARGB(255, 255, 255, 255),
            ),
            child: const Icon(
              Icons.lightbulb,
              color: Colors.amber,
            ),
          ),
          title: Text(
            _isDarkModeEnabled ? 'Dark Mode' : 'Light Mode',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: Switch(
            value: _isDarkModeEnabled,
            onChanged: (value) {
              setState(() {
                _isDarkModeEnabled = value;
              });
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 188, 235, 190),
            ),
            child: const Icon(
              Icons.help,
              color: Colors.green,
            ),
          ),
          title: const Text(
            'Helpdesk',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(Icons.chevron_right_sharp),
          onTap: () {
            // Implement your action when Helpdesk is tapped
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Setting Page')),
      body: SettingPage(),
    ),
  ));
}
