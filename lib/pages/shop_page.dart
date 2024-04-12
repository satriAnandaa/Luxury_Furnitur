import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../komponen/furnitur_box.dart';
import '../model/cart.dart';
import '../model/furnitur.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add furnitur ke cart
  void addFurniturToCart(Furnitur furnitur) {
    Provider.of<Cart>(context, listen: false).addItemToCart(furnitur);

    //notifikasi ke user, barang furnitur berhasiol ditambah
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Berhasil ditambahkan!'),
        content: Text('Cek keranjangmu'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          //pencarian
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(Icons.search),
              ],
            ),
          ),

          //pesan
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'Ayo beli furnitur berkualitas premium sekarang juga',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),

          //rekomendasi
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Terlaris',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          //list furnitur yang dijual
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                //get furnitur dari shop list
                Furnitur furnitur = value.getFurniturList()[index];

                //return furnitur
                return FurniturBox(
                  furnitur: furnitur,
                  onTap: () => addFurniturToCart(furnitur),
                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Divider(
              color: Color.fromARGB(255, 210, 137, 109),
            ),
          )
        ],
      ),
    );
  }
}
