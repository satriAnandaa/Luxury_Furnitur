import 'package:app_project2/service/data_service.dart';
import 'package:flutter/material.dart';
import 'api_task.dart';

class PostApi extends StatefulWidget {
  const PostApi({Key? key}) : super(key: key);

  @override
  State<PostApi> createState() => _PostApiState();
}

class _PostApiState extends State<PostApi> {
  final _simpanDataTitle = TextEditingController();
  final _simpanDataBody = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        backgroundColor: const Color.fromARGB(255, 210, 137, 109),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            TextField(
              controller: _simpanDataTitle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan Title',
                hintText: 'Title',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _simpanDataBody,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan Body',
                hintText: 'Body',
              ),
              maxLines: null, // Allow multiline input
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  DataService.sendData(
                    _simpanDataTitle.text,
                    _simpanDataBody.text,
                  );
                  Navigator.of(context).pop();
                });
              },
              child: const Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
