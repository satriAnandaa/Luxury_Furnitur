import 'package:flutter/material.dart';

import 'furnitur.dart';

class Cart extends ChangeNotifier {
  //daftar furnitur yang dijual
  List<Furnitur> furniturShop = [
    Furnitur(
        nama: 'meja jati',
        price: '1 jt',
        imagePath: 'assets/images/meja2.jpg',
        deskripsi: 'meja kuat tahan lama'),
    Furnitur(
        nama: 'lampu spider',
        price: '200 k',
        imagePath: 'assets/images/lampu.jpg',
        deskripsi: 'lampu premium'),
    Furnitur(
        nama: 'Selma Gressa',
        price: '3,5 jt',
        imagePath: 'assets/images/sofa3.jpg',
        deskripsi: 'Sofa Premium'),
    Furnitur(
        nama: 'Lemari jati',
        price: '2 jt',
        imagePath: 'assets/images/lemari.png',
        deskripsi: 'lemari tahan rayap'),
  ];
  // daftar furnitur di keranjang user
  List<Furnitur> userCart = [];

  //mendapatkan daftar list dari furnitur yang dijual
  List<Furnitur> getFurniturList() {
    return furniturShop;
  }

  //keranjang
  List<Furnitur> getUserCart() {
    return userCart;
  }

  //menambah barang furnitur ke keranjang
  void addItemToCart(Furnitur furnitur) {
    userCart.add(furnitur);
    notifyListeners();
  }

  //menghapus barang furnitur dari cart
  void removeItemFromCart(Furnitur furnitur) {
    userCart.remove(furnitur);
    notifyListeners();
  }
}
