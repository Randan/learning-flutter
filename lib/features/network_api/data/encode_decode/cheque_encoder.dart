import 'package:learning_flutter/features/network_api/data/dto/cheque_dto.dart';
import 'package:learning_flutter/features/network_api/data/entity/cheque_entity.dart';

class ChequeEncoder {
  static ChequeEntity dtoToEntity(ChequeDTO dto) {
    return ChequeEntity(
      chequeId: dto.chequeHeader.chequeID,
      totalAmount: dto.chequeHeader.sumReg,
      items: dto.chequeLines.map((line) => line.lagerNameUA).toList(),
      prediction: dto.chPrediction,
    );
  }
}
