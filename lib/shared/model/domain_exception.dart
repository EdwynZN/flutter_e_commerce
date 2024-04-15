abstract class DomainException implements Exception {
  final StackTrace stackTrace;

  const DomainException(this.stackTrace);
}