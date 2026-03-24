// lib/utils/validators.dart

/// Validates an invoice number
bool validateInvoiceNumber(String invoiceNumber) {
  // Example: Invoice number must be alphanumeric and 10-15 characters long
  final regex = RegExp(r'^[a-zA-Z0-9]{10,15}$');
  return regex.hasMatch(invoiceNumber);
}

/// Validates a purchase order number
bool validatePONumber(String poNumber) {
  // Example: PO number must be numeric and 8-12 digits long
  final regex = RegExp(r'^\d{8,12}$');
  return regex.hasMatch(poNumber);
}

/// Validates a driver's name
bool validateDriverName(String driverName) {
  // Example: Driver name must contain only letters and spaces, 1-50 characters long
  final regex = RegExp(r'^[a-zA-Z\s]{1,50}$');
  return regex.hasMatch(driverName);
}

/// Validates a vehicle's plate number
bool validateVehiclePlate(String plate) {
  // Example: Plate number format (e.g., ABC-1234)
  final regex = RegExp(r'^[A-Z]{3}-\d{4}$');
  return regex.hasMatch(plate);
}

/// Validates a general form field
bool validateFormField(String input, int minLength, int maxLength) {
  return input.length >= minLength && input.length <= maxLength;
}