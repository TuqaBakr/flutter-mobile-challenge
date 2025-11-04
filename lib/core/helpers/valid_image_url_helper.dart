
import '../constants/app_constants.dart';

extension ImageUrlExtension on String? {
  String get toValidImageUrl {
    final baseUrl = AppConstants.baseUrl;
    if (this == null || this!.trim().isEmpty) {
      return '$baseUrl/storage/media/default_image.png';
    }
    return this!.startsWith(baseUrl) ? this! : '$baseUrl${this!}';
  }
}


