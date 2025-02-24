import 'package:localizer/utils/error_handler/error_enums.dart';


sealed class ErrorState<T> {
  final Exception? clientError;
  final Exception? parseError;
  final AppHttpException? httpError;
  final AppNetworkException? networkError;

  ErrorState({
    this.clientError,
    this.parseError,
    this.httpError,
    this.networkError,
  });
}

class DataClientError<T> extends ErrorState<T> {
  DataClientError(Exception error) : super(clientError: error);
}
class DataParseError<T> extends ErrorState<T> {
  DataParseError(Exception error) : super(parseError: error);
}
class DataHttpError<T> extends ErrorState<T> {
  DataHttpError(AppHttpException error) : super(httpError: error);
}
class DataNetworkError<T> extends ErrorState<T> {
  DataNetworkError(AppNetworkException error) : super(networkError: error);
}
