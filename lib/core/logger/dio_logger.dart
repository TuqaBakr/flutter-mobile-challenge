import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import 'logger.dart';

TalkerDioLogger get dioLogger => TalkerDioLogger(
  talker: talker,
  settings: TalkerDioLoggerSettings(
    printRequestHeaders: true,
    printResponseHeaders: true,
    printResponseMessage: true,
    printRequestData: true,
    printResponseTime: true,
    // All http request without "/secure" in path will be printed in console
    requestFilter: (RequestOptions options) =>
        !options.path.contains('/secure'),
    // All http responses with status codes different than 301 will be printed in console
    responseFilter: (response) => response.statusCode != 301,
  ),
);
