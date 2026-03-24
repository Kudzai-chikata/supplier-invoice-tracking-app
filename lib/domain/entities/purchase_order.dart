class PurchaseOrder {
  final String poNumber;
  final String supplierName;
  final DateTime expectedDeliveryDate;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  PurchaseOrder({
    required this.poNumber,
    required this.supplierName,
    required this.expectedDeliveryDate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
}