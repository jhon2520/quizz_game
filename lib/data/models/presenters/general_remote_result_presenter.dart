import 'package:trivia_app/core/utils/index.dart';

sealed class RemoteResult {}

class RemoteResultApi<T> extends RemoteResult {
  final T? value;
  final HttpStatusEnum? httpStatusEnum;
  final String? statusCode;
  final String? message;

  RemoteResultApi(
      {this.value, this.httpStatusEnum, this.statusCode, this.message});
}

class SuccesResultApi<T> extends RemoteResultApi<T> {
  final T? data;

  SuccesResultApi({this.data}): super(
    value: data, 
    httpStatusEnum: HttpStatusEnum.success,
    statusCode: "200",
    message: null
  );
}

class ErrorResultApi<T> extends RemoteResultApi<T>{
  final String? errorMessage;
  final String? statusCodeError;
  ErrorResultApi({this.errorMessage, this.statusCodeError}):super(
    message: errorMessage,
    httpStatusEnum: HttpStatusEnum.error,
    statusCode: statusCodeError,
    value: null
  );
}




// class GeneralRemoteResult<T> extends Equatable implements RemoteResult {
//   final T? value;
//   final HttpStatusEnum? httpStatusEnum;
//   final String? statusCode;
//   final String? message;

//   const GeneralRemoteResult(
//       {this.value, this.httpStatusEnum, this.statusCode, this.message});

//   factory GeneralRemoteResult.success(T value, String? statusCode) {
//     return GeneralRemoteResult<T>(
//         value: value,
//         httpStatusEnum: HttpStatusEnum.success,
//         statusCode: statusCode,
//         message: null);
//   }

//   factory GeneralRemoteResult.error(String message) {
//     return GeneralRemoteResult<T>(
//       value: null,
//       httpStatusEnum: HttpStatusEnum.error,
//       statusCode: null,
//       message: message,
//     );
//   }

//   factory GeneralRemoteResult.unAuthorized(String message) {
//     return GeneralRemoteResult<T>(
//         value: null,
//         httpStatusEnum: HttpStatusEnum.unauthorized,
//         statusCode: null,
//         message: message);
//   }
//   @override
//   List<Object?> get props => [value, httpStatusEnum, statusCode, message];
// }
