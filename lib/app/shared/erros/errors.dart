abstract class Failure implements Exception {
  String? get message;
}

class DefaultFailure extends Failure {
  @override
  final String? message;

  DefaultFailure({
    this.message,
  });
}

class DatasourceError extends Failure {
  @override
  final String? message;

  DatasourceError({
    this.message,
  });
}

enum DomainError { httpServerError, unexpectedError }

class RepositoryFailure extends Failure {
  @override
  final String? message;

  RepositoryFailure({
    this.message,
  });
}
