const state304 = 'Not Modified';
const state403 = 'Forbidden';
const state404 = 'Resource not found';
const state422 = 'Validation failed, or the endpoint has been spammed.';
const state503 = 'Service unavailable';

abstract class ApiStatusException implements Exception {
  final String message;

  ApiStatusException(this.message);

  @override
  String toString() {
    return message;
  }
}

class NotModifiedException extends ApiStatusException {
  NotModifiedException() : super(state304);
}

class ForbiddenException extends ApiStatusException {
  ForbiddenException() : super(state403);
}

class NotFoundException extends ApiStatusException {
  NotFoundException() : super(state404);
}

class ValidationFailedException extends ApiStatusException {
  ValidationFailedException() : super(state422);
}

class UnavailableException extends ApiStatusException {
  UnavailableException() : super(state503);
}