class ReceivedInvoice {
  String poNumber;
  String invoiceNumber;
  String driverName;
  String vehicleNumberPlate;
  DateTime receivedDate;
  String receivedTime;
  String guardId;

  ReceivedInvoice({
    required this.poNumber,
    required this.invoiceNumber,
    required this.driverName,
    required this.vehicleNumberPlate,
    required this.receivedDate,
    required this.receivedTime,
    required this.guardId,
  });
}