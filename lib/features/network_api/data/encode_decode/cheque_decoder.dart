import 'dart:convert';
import 'package:learning_flutter/features/network_api/data/dto/cheque_dto.dart';

class ChequeDecoder {
  static ChequeDTO fromJsonString(String jsonString) {
    try {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return ChequeDTO.fromJSON(json);
    } catch (e) {
      throw FormatException('JSON decoding error: $e');
    }
  }

  static bool isValidJson(String jsonString) {
    try {
      jsonDecode(jsonString);
      return true;
    } catch (e) {
      return false;
    }
  }

  static String? getDecodingError(String jsonString) {
    try {
      jsonDecode(jsonString);
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
