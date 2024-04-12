import 'package:app_project2/model/furnitur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FurniturBox extends StatelessWidget {
  final Furnitur furnitur;
  final Function() onTap;
  FurniturBox({
    super.key,
    required this.furnitur,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 290,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //gambar furnitur
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(furnitur.imagePath)),

          //deskripsi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              furnitur.deskripsi,
              style: TextStyle(color: Colors.black),
            ),
          ),

          //harga
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //nama furnitur
                    Text(
                      furnitur.nama,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),

                    const SizedBox(height: 5),

                    //harga funritur
                    Text(
                      '\Rp ' + furnitur.price,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                //tombol tambah ke keranjang
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
