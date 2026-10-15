
enum DeliveryMethod {
  delivery,
  pickup,
}

class Product {
  final String name;
  final double price;

  Product({
    required this.name,
    required this.price,
  }) {
    if (price < 0) {
      throw ArgumentError('Price cannot be negative');
    }
  }
}

class OrderItem {
  final Product product;
  final int quantity;

  OrderItem({
    required this.product,
    required this.quantity,
  }) {
    if (quantity <= 0) {
      throw ArgumentError('Quantity must be greater than zero');
    }
  }

  double getSubtotal() {
    return product.price * quantity;
  }
}

class Address {
  final String street;
  final String city;

  Address({
    required this.street,
    required this.city,
  });
}

class Order {
  final List<OrderItem> items;
  final DeliveryMethod deliveryMethod;
  final Address? address;

  Order({
    required List<OrderItem> items,
    required this.deliveryMethod,
    this.address,
  }) : items = List.unmodifiable(items) {
    if (items.isEmpty) {
      throw ArgumentError('An order must contain at least one item');
    }

    if (deliveryMethod == DeliveryMethod.delivery &&
        address == null) {
      throw ArgumentError(
        'Delivery requires an address',
      );
    }

    if (deliveryMethod == DeliveryMethod.pickup &&
        address != null) {
      throw ArgumentError(
        'Pickup does not require a delivery address',
      );
    }
  }

  double calculateTotal() {
    double total = 0;

    for (final item in items) {
      total += item.getSubtotal();
    }

    return total;
  }

  void printDetails() {
    print('Delivery method: ${deliveryMethod.name}');
    print('Order items:');

    for (final item in items) {
      print(
        '${item.product.name} x ${item.quantity} '
        '= \$${item.getSubtotal().toStringAsFixed(2)}',
      );
    }

    if (address != null) {
      print('Address: ${address!.street}, ${address!.city}');
    }

    print('Total: \$${calculateTotal().toStringAsFixed(2)}');
  }
}

void main() {
  final laptop = Product(
    name: 'Laptop',
    price: 800,
  );

  final mouse = Product(
    name: 'Mouse',
    price: 25,
  );

  final keyboard = Product(
    name: 'Keyboard',
    price: 45,
  );

  final deliveryAddress = Address(
    street: 'Street 23',
    city: 'Phnom Penh',
  );

  final deliveryOrder = Order(
    items: [
      OrderItem(product: laptop, quantity: 1),
      OrderItem(product: mouse, quantity: 2),
    ],
    deliveryMethod: DeliveryMethod.delivery,
    address: deliveryAddress,
  );

  print('=== Delivery Order ===');
  deliveryOrder.printDetails();

  print('');

  final pickupOrder = Order(
    items: [
      OrderItem(product: keyboard, quantity: 1),
      OrderItem(product: mouse, quantity: 1),
    ],
    deliveryMethod: DeliveryMethod.pickup,
  );

  print('=== Pickup Order ===');
  pickupOrder.printDetails();
}
