/// الفئة الأساسية لجميع استثناءات البيانات
/// جميع الاستثناءات المخصصة يجب أن ترث من هذه الفئة
class AppException implements Exception {
  final String message;
  const AppException({this.message = 'An application error occurred.'});

  @override
  String toString() => 'AppException: $message';
}

// ----------------------------------------------------
// استثناءات الخادم والشبكة (Server and Network Exceptions)
// ----------------------------------------------------

/// استثناء يُرمى عند حدوث خطأ عام في الخادم/الاتصال
class ServerException extends AppException {
  const ServerException({super.message = 'An unexpected server error occurred.'});
}

/// استثناء يُرمى عند اكتشاف بريد إلكتروني مكرر
/// هذا الاستثناء خاص بأخطاء التحقق (Validation) من الخادم
class DuplicateEmailException extends AppException {
  const DuplicateEmailException({super.message = 'The email address is already taken.'});
}


// ----------------------------------------------------
// استثناءات التخزين المحلي (Local/Cache Exceptions)
// ----------------------------------------------------

/// استثناء يُرمى عند فشل في عمليات التخزين المحلي (مثل Hive أو SharedPreferences)
class CacheException extends AppException {
  const CacheException({super.message = 'Local cache operation failed.'});
}