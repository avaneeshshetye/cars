class Sale {
  final String salename;
  final String model;
  final String price;
  final String image;

  Sale({
    required this.salename,
    required this.model,
    required this.price,
    required this.image,
  });
}

final List<Sale> carsForSale = [
  Sale(
      salename: 'Audi',
      model: 'R8',
      price: '14000',
      image: 'assets/images/Audi-R8-Coupe-facelift-2012.jpg'),
  Sale(
      salename: 'BMW',
      model: 'M3',
      price: '9000',
      image: 'assets/images/rkpqQdqO-kqjD7pGIUq-(edit)2-2-Cuc1QN21eG.jpg'),
  Sale(
      salename: 'Audi',
      model: 'RSQ8',
      price: '32000',
      image: 'assets/images/35bQA0MB-WTIvkUFQaE-(edit).jpg'),
  // Add more cars as needed
];
