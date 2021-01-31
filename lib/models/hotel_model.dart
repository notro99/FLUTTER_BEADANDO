class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Hotel Cairo',
    address: 'Siófok',
    price: 12000,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Hotel Lux',
    address: 'Mórahalom',
    price: 10000,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel3.jpg',
    name: 'Anita Vendéglő',
    address: 'Mezőberény',
    price: 23000,
  ),
];
