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

  num extraPriceforProducts(String productId) {
    num prezzo = 0;
    for (var e in state!.rows) {
      for (var i = 0; i < Utils.products.length; i++) {
        if (e.productId == Utils.products[i].productId) {
          if (e.extras?.isNotEmpty == true) {
            for (var extra in e.extras!) {
              for (var j = 0; j < Utils.products[i].extras!.length; j++) {
                if (extra.extraId == Utils.products[i].extras![j].extraId) {
                  prezzo += Utils.extras[j].price!;
                }
              }
            }
          }
        }
      }
    }
    return prezzo;
  }

  num getTotalPrice() {
    num prezzo = 0;
    for (var e in state!.rows) {
      for (var i = 0; i < Utils.products.length; i++) {
        if (e.productId == Utils.products[i].productId) {
          prezzo += Utils.products[i].price * e.qty;
          if (e.extras?.isNotEmpty == true) {
            for (var extra in e.extras!) {
              for (var j = 0; j < Utils.products[i].extras!.length; j++) {
                if (extra.extraId == Utils.products[i].extras![j].extraId) {
                  prezzo += Utils.extras[j].price!;
                }
              }
            }
          }
        }
      }
    }
    return prezzo;
  }

  void removeRow(String rowId) {
    var tempOrder = state?.clone();
    var elementToRemove = tempOrder?.rows.lastWhere((e) => e.rowId == rowId);
    tempOrder?.rows.remove(elementToRemove);

    state = tempOrder;
  }

  void addExtra(OrderItem tempOrder) {
    OrderItem tempOrder2 = state!.clone();

    for (int i = 0; i < tempOrder2.rows.length; i++) {
      for (final newRow in tempOrder.rows) {
        if (tempOrder2.rows[i].rowId == newRow.rowId) {
          tempOrder2.rows[i].extras = newRow.extras;
        }
      }

      state = tempOrder2;
    }
  }
}

final orderProvider = StateNotifierProvider<OrderProvider, OrderItem?>((ref) {
  return OrderProvider();
});
