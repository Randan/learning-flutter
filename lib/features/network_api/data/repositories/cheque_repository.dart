import 'package:learning_flutter/features/network_api/data/data_source/cheque_remote_data_source.dart';
import 'package:learning_flutter/features/network_api/data/encode_decode/cheque_encoder.dart';
import 'package:learning_flutter/features/network_api/data/entity/cheque_entity.dart';

class ChequeRepository {
  ChequeRepository(this._remoteDataSource);

  final ChequeRemoteDataSource _remoteDataSource;

  Future<ChequeEntity> getCheque() async {
    try {
      final chequeDto = await _remoteDataSource.getCheque();
      return ChequeEncoder.dtoToEntity(chequeDto);
    } catch (e) {
      throw Exception('Error getting cheque: $e');
    }
  }
}
