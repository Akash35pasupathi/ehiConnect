import 'dart:convert';

import 'package:ehi_connect/core/utils/error_messages.dart';

String createErrorJsonString(int statusCode) {
  String errorResponse = json.encode({
    "success": true,
    "message": ErrorMessage().getErrorMessage(statusCode),
  });
  return errorResponse;
}
