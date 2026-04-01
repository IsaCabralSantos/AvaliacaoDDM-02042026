class OperationResult<T> {
  const OperationResult({
    required this.success,
    required this.message,
    this.data,
  });

  final bool success;
  final String message;
  final T? data;
}
