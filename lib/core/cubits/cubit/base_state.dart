part of 'base_cubit.dart';

@freezed
class BaseState<T> with _$BaseState<T> {
  factory BaseState.initial({T? data}) = _Initial;
  factory BaseState.success(T data) = _Success;
  factory BaseState.loading() = _Loading;
  factory BaseState.error(NetworkExceptions error) = _Error;
}
