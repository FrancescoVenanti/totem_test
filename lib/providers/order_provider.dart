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
    state?.rows.add(OrderRowItem(
        rowId: Utils.getUUID(), qty: 1, productId: productId, extras: []));
  }

  String? getItemCount(String productId) {
    return state?.rows
        .where((element) => element.productId == productId)
        .length
        .toString();
  }
}

final orderProvider = StateNotifierProvider<OrderProvider, OrderItem?>((ref) {
  return OrderProvider();
});
