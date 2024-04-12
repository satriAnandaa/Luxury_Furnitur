import 'package:app_project2/model/furnitur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../komponen/cart_item.dart';
import '../model/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            //header
            const Text(
              'Keranjang',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),

            const SizedBox(
              height: 20,
            ),

            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  //get individual furnitur
                  Furnitur individualFurnitur = value.getUserCart()[index];

                  //return barang dari cart
                  return CartItem(
                    furnitur: individualFurnitur,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
