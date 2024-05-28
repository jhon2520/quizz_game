sealed class Result{}

class MethodResult<T> extends Result{
  final T? value;
  final String? message;

  MethodResult({this.value, this.message});

}

class SuccessResult<T> extends MethodResult<T>{
  final T? data;
  SuccessResult({this.data}):super(value: data);
}

class ErrorResult<T> extends MethodResult<T>{
  final String? errorMessage;
  ErrorResult({this.errorMessage}):super(message: errorMessage, value: null);
}
