class GuardLog {
  final String actionType;
  final String guardId;
  final String guardName;
  final String recordId;
  final String recordType;
  final DateTime timestamp;

  GuardLog({
    required this.actionType,
    required this.guardId,
    required this.guardName,
    required this.recordId,
    required this.recordType,
    required this.timestamp,
  });
}