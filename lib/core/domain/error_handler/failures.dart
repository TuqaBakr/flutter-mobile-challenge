import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// 1. الفشل في الاتصال بالسيرفر
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

// 2. الفشل في تخزين البيانات محلياً
class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

// 3. فشل التحقق من البيانات
class ValidationFailure extends Failure {
  const ValidationFailure(String message) : super(message);
}
