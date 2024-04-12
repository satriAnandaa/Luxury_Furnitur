import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
        backgroundColor: const Color.fromARGB(255, 210, 137, 109),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/logofurn2.png',
              width: 300,
              height: 300,
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Luxury Furnitur',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Luxury Furnitur merupakan aplikasi yang memudahkan pengguna untuk '
                        'membeli barang furnitur berkualitas premium dengan harga yang terjangkau. Selain itu disini pengguna '
                        'juga dapat melakukan penjualan furnitur dengan mudah karena menjangkau pasar yang luas. ',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('08214776655')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
