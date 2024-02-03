import 'dart:io';
import 'dart:io';

class Product {
  String name;
  int price;
  int quantity;

  Product({required this.name, required this.price, required this.quantity});

  displayInfo() => 'name:$name,price:$price,quantity:$quantity';
}

class Mouse extends Product {
  Mouse(String name, int price, int quantity)
      : super(name: name, price: price, quantity: quantity);

  @override
  displayInfo() {
    print('name:$name,price:$price,quantity:$quantity');
    return super.displayInfo();
  }
}

class Keyboard extends Product {
  Keyboard(String name, int price, int quantity)
      : super(name: name, price: price, quantity: quantity);

  @override
  displayInfo() {
    print('name:$name,price:$price,quantity:$quantity');
    return super.displayInfo();
  }
}

class Mall {
  static List<Product> products = [];

  static void addProductMall(Product product) {
    products.add(product);
    print('sabt mahsol');
  }

  void displayInfoProduct() {
    for (int i = 0; i < products.length; i++) {
      print(
          'name${products[i].name},,,,,,price:${products[i].price},,,,quantity:${products[i].quantity}');
    }
  }

  void removeProductMall(int j) {
    if (j >= 0 && j < products.length - 1) {
      print('mahsol${products[j].name} removed ');
      products.removeAt(j);
    } else {
      print('input invalid');
    }
  }

  void editProduct(String newName, int newPrice, int newQuantity, int input) {
    if (input >= 0 && input < products.length) {
      products[input].name = newName;
      products[input].price = newPrice;
      products[input].quantity = newQuantity;
    } else {
      print('shomareh mahsol namotabar hast');
    }
  }

  void displayLowStockProduct() {
    for (int x = 0; x < products.length; x++) {
      if (products[x].quantity < 5) {
        print('${products[x].displayInfo()}');
      }
    }
  }
}

void main() {
  Mall mall = Mall();
  while (true) {
    print('''
    0-enseraf
    1-sabte mahsolat
    2_namayesh fehrest mahsolat
    3_hazfe mahsol
    4_virayesh mahsolat
    5_namayesh mahsolate ke robe etmam
    6_khroj''');

    print('please choice one number: ');
    String? choice = stdin.readLineSync();
    int? inputChoice = int.tryParse(choice!);
    if (inputChoice != null) {
      switch (inputChoice) {
        case 1:
          print('please choice type of product (1- Mouse, 2- Keyboard): ');
          String? productType = stdin.readLineSync();
          if (productType == '1') {
            print('name of Mouse');
            String mouseName = stdin.readLineSync() ?? "A4tech";
            print('enter price of mouse: ');
            int? mousePrice = int.tryParse(stdin.readLineSync() ?? '');
            print('enter quantity of mouse: ');
            int? mouseQuantity = int.tryParse(stdin.readLineSync() ?? '10');
            Mouse mouse =
            Mouse(mouseName, mousePrice ?? 10, mouseQuantity ?? 100);
            Mall.addProductMall(mouse);
            print('mahsol baovafaghiat sabt shod');
          }
          if (productType == '2') {
            print('name of keyboard');
            String? keyboardname = stdin.readLineSync();
            print('enter price of keyboard');
            int? keyboardprice = int.tryParse(stdin.readLineSync() ?? '');
            print('enter quanity of keyboard');
            int? keyboardquanity = int.tryParse(stdin.readLineSync() ?? '');
            Keyboard keyboard = Keyboard('asus', 300, 100);
            Mall.addProductMall(keyboard);
          }
          break;
        case 2:
          if (inputChoice == 2) {
            print('namayesh fehrest mahsolat');
            mall.displayInfoProduct();
          }
          break;
        case 3:
          print('vared kon index mahsolat ke hazfe shan:');
          if (inputChoice == 3) {
            print('mahsol hazfe shod');
            int? removerIndex = int.tryParse(stdin.readLineSync() ?? '');
            mall.removeProductMall(removerIndex ?? 0);
          }
          break;
        case 4:
          print('vared kon index mahsolat ke virayesh shan');
          if (inputChoice == 4) {
            print('mahsol virayesh shod');
            int? editIndex = int.tryParse(stdin.readLineSync() ?? '');
            print('enter new name');
            String? newName = stdin.readLineSync();
            print('enter new price');
            int? newPrice = int.tryParse(stdin.readLineSync() ?? '');
            print('enter new quantity');
            int? newQuantity = int.tryParse(stdin.readLineSync() ?? '');
            mall.editProduct('mouse', 500, 120, 10);
          }
          break;
        case 5:
          if (inputChoice == 5) {
            print('namayesh masolat kamtar as 5');
            mall.displayLowStockProduct();
          }
          break;
        case 6:
          if (inputChoice == 6) {
            print('exited');
            return;
          }
      }
    }
  }
}

