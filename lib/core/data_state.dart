abstract class DataState<T> {
  T? data;
  String? error;

  DataState({
    this.data,
    this.error,
  });
}

class SuccessfulDataState<T> extends DataState<T> {
  SuccessfulDataState(T data) : super(data: data, error: null);
}

class FailureDataState<T> extends DataState<T> {
  FailureDataState(String error) : super(data: null, error: error);
}
