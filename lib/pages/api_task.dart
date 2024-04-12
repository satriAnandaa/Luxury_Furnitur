// Import package yang diperlukan
import 'package:app_project2/pages/post_api.dart';
import 'package:app_project2/pages/update_api.dart';
import 'package:flutter/material.dart';
import 'package:app_project2/service/data_service.dart';
import 'package:app_project2/dto/news.dart';

class ApiTask extends StatefulWidget {
  const ApiTask({Key? key}) : super(key: key);

  @override
  State<ApiTask> createState() => _ApiTaskState();
}

class _ApiTaskState extends State<ApiTask> {
  Future<List<News>> _news = DataService.fetchNews();

  void showDetail(News post) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Tutup'),
          ),
          TextButton(
            onPressed: () async {
              await DataService.deleteData(post.id);
              Navigator.of(context).pop();
              setState(() {
                _news = DataService.fetchNews();
              });
            },
            child: const Text('Hapus'),
          ),
          TextButton(
            onPressed: () {
              // Implementasi navigasi ke halaman update
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UpdateApi(post: post),
              ));
            },
            child: const Text('Update'),
          ),
        ],
        title: Text(post.title),
        contentPadding: const EdgeInsets.all(20),
        content: Container(
          height: 350,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  post.photo,
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 100,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(3)),
                        child: Text('Deskripsi : ${post.body}'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5)),
                        child:
                            Text('IdCategory : ${post.idCategory.toString()}'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text('ID : ${post.id}'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const PostApi(),
          ));
        },
      ),
      appBar: AppBar(
        title: const Text('Task'),
        backgroundColor: const Color.fromARGB(255, 210, 137, 109),
      ),
      body: Center(
        child: FutureBuilder<List<News>>(
          future: _news,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<News> news = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  childAspectRatio: 0.80,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: news
                      .map((news) => GestureDetector(
                            onTap: () {
                              showDetail(news);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                                color: Colors.transparent,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: Image.network(
                                      news.photo,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(news.title),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () async {
                                          await DataService.deleteData(news.id);
                                          setState(() {
                                            _news = DataService.fetchNews();
                                          });
                                        },
                                        child: const Text('Hapus'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                UpdateApi(post: news),
                                          ));
                                        },
                                        child: const Text('Update'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
