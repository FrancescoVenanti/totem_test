import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:totem_test/models/order_item.dart';
import 'package:totem_test/services/utlis.dart';

class OrderProvider extends StateNotifier<OrderItem?> {
  OrderProvider() : super(null);

  void setOrder(OrderItem order) {
    state = order;
  }

  void init() {
    state = OrderItem(rows: []);
  }

  void addItem(String productId) {
    var tempOrder = state?.clone() ?? OrderItem(rows: []);
    tempOrder.rows.add(OrderRowItem(
        rowId: Utils.getUUID(), qty: 1, productId: productId, extras: []));
    state = tempOrder;
  }

  void removeItem(String productId) {
    var tempOrder = state?.clone();
    var elementToRemove =
        tempOrder?.rows.lastWhere((e) => e.productId == productId);
    tempOrder?.rows.remove(elementToRemove);

    state = tempOrder;
  }

  int? getItemCount(String productId) {
    return state?.rows
        .where((element) => element.productId == productId)
        .length;
  }

  String? totalCartItems() {
    return state?.rows.length.toString();
  }

  num getTotalPrice() {
    num prezzo = 0;
    for (var e in state!.rows) {
      for (var i = 0; i < Utils.products.length; i++) {
        if (e.productId == Utils.products[i].productId) {
          prezzo += Utils.products[i].price * e.qty;
        }
      }
    }
    return prezzo;
  }
}

final orderProvider = StateNotifierProvider<OrderProvider, OrderItem?>((ref) {
  return OrderProvider();
});
