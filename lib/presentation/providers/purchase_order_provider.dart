import 'package:flutter_riverpod/flutter_riverpod.dart';

// Model for Purchase Order
class PurchaseOrder {
  final String id;
  final String description;
  final double amount;
  final bool isCompleted;

  PurchaseOrder({required this.id, required this.description, required this.amount, this.isCompleted = false});
}

// State for Purchase Orders
class PurchaseOrderState {
  final List<PurchaseOrder> orders;

  PurchaseOrderState({required this.orders});
  
  PurchaseOrderState copyWith({List<PurchaseOrder>? orders}) {
    return PurchaseOrderState(
      orders: orders ?? this.orders,
    );
  }
}

// Notifier for Purchase Orders
class PurchaseOrderNotifier extends StateNotifier<PurchaseOrderState> {
  PurchaseOrderNotifier() : super(PurchaseOrderState(orders: []));

  void addOrder(PurchaseOrder order) {
    state = state.copyWith(orders: [...state.orders, order]);
  }
  
  void completeOrder(String orderId) {
    state = PurchaseOrderState(
      orders: state.orders.map((order) {
        if (order.id == orderId) {
          return PurchaseOrder(
            id: order.id,
            description: order.description,
            amount: order.amount,
            isCompleted: true,
          );
        }
        return order;
      }).toList(),
    );
  }
}

// Provider for Purchase Orders
final purchaseOrderProvider = StateNotifierProvider<PurchaseOrderNotifier, PurchaseOrderState>((ref) {
  return PurchaseOrderNotifier();
});
