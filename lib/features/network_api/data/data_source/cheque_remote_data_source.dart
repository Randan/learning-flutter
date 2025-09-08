import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:learning_flutter/features/network_api/data/dto/cheque_dto.dart';
import 'package:learning_flutter/features/network_api/data/encode_decode/cheque_decoder.dart';

class ChequeRemoteDataSource {
  static const String _baseUrl =
      'https://randan.github.io/learning-flutter-test-json-plasement';
  static const String _chequeEndpoint = '/cheque_example.json';

  Future<ChequeDTO> getCheque() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl$_chequeEndpoint'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        if (!ChequeDecoder.isValidJson(response.body)) {
          final error = ChequeDecoder.getDecodingError(response.body);
          throw HttpException('Invalid JSON: $error');
        }

        return ChequeDecoder.fromJsonString(response.body);
      } else {
        throw HttpException('Loading error: ${response.statusCode}');
      }
    } on SocketException {
      throw const SocketException('No internet connection');
    } on HttpException catch (e) {
      throw HttpException('HTTP error: ${e.message}');
    } on FormatException catch (e) {
      throw FormatException('JSON format error: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
