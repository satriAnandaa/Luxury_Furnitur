import 'package:flutter/material.dart';

import '../dto/news.dart';
import '../service/data_service.dart';

class UpdateApi extends StatefulWidget {
  final News post;

  const UpdateApi({required this.post});

  @override
  _UpdateApiState createState() => _UpdateApiState();
}

class _UpdateApiState extends State<UpdateApi> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.post.title;
    _bodyController.text = widget.post.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(labelText: 'Body'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await DataService.updateData(widget.post.id,
                    _titleController.text, _bodyController.text);
                Navigator.of(context).pop();
              },
              child: const Text('Update Data'),
            ),
          ],
        ),
      ),
    );
  }
}
