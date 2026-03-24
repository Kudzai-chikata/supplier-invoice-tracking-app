import 'package:flutter_riverpod/flutter_riverpod.dart';

// Invoice Model
class Invoice {
  final String id;
  final String description;
  final double amount;
  final DateTime createdAt;
  final bool isSynced;

  Invoice({
    required this.id,
    required this.description,
    required this.amount,
    required this.createdAt,
    this.isSynced = false,
  });
}

// State to manage invoices
class InvoicesState {
  final List<Invoice> invoices;
  final bool isSyncing;

  InvoicesState({this.invoices = const [], this.isSyncing = false});
}

// Notifier to handle invoices
class InvoicesNotifier extends StateNotifier<InvoicesState> {
  InvoicesNotifier() : super(InvoicesState());

  void addInvoice(Invoice invoice) {
    state = InvoicesState(invoices: [...state.invoices, invoice], isSyncing: state.isSyncing);
  }

  void syncInvoices() {
    state = InvoicesState(invoices: state.invoices, isSyncing: true);
    // Placeholder for sync logic
    // After sync
    state = InvoicesState(invoices: state.invoices, isSyncing: false);
  }
}

// Provider for the InvoicesNotifier
final invoicesProvider = StateNotifierProvider<InvoicesNotifier, InvoicesState>((ref) {
  return InvoicesNotifier();
});
