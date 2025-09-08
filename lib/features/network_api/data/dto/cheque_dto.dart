class ChequeDTO {
  ChequeDTO({
    required this.chPrediction,
    required this.chequeActions,
    required this.chequeHeader,
    required this.chequeLines,
    required this.chequeMagicName,
    required this.feedbackRates,
    required this.sumCashback,
    required this.sumDiscount,
  });

  factory ChequeDTO.fromJSON(Map<String, dynamic> json) => ChequeDTO(
    chPrediction: json['chPrediction'] as String,
    chequeActions: List<ChequeAction>.from(
      (json['chequeActions'] as List).map(
        (x) => ChequeAction.fromJSON(x as Map<String, dynamic>),
      ),
    ),
    chequeHeader: ChequeHeader.fromJSON(
      json['chequeHeader'] as Map<String, dynamic>,
    ),
    chequeLines: List<ChequeLine>.from(
      (json['chequeLines'] as List).map(
        (x) => ChequeLine.fromJSON(x as Map<String, dynamic>),
      ),
    ),
    chequeMagicName: json['chequeMagicName'] as String,
    feedbackRates: List<dynamic>.from(
      (json['feedbackRates'] as List).map((x) => x),
    ),
    sumCashback: json['sumCashback'] as int,
    sumDiscount: (json['sumDiscount'] as num).toDouble(),
  );

  final String chPrediction;
  final List<ChequeAction> chequeActions;
  final ChequeHeader chequeHeader;
  final List<ChequeLine> chequeLines;
  final String chequeMagicName;
  final List<dynamic> feedbackRates;
  final int sumCashback;
  final double sumDiscount;

  ChequeDTO copyWith({
    String? chPrediction,
    List<ChequeAction>? chequeActions,
    ChequeHeader? chequeHeader,
    List<ChequeLine>? chequeLines,
    String? chequeMagicName,
    List<dynamic>? feedbackRates,
    int? sumCashback,
    double? sumDiscount,
  }) => ChequeDTO(
    chPrediction: chPrediction ?? this.chPrediction,
    chequeActions: chequeActions ?? this.chequeActions,
    chequeHeader: chequeHeader ?? this.chequeHeader,
    chequeLines: chequeLines ?? this.chequeLines,
    chequeMagicName: chequeMagicName ?? this.chequeMagicName,
    feedbackRates: feedbackRates ?? this.feedbackRates,
    sumCashback: sumCashback ?? this.sumCashback,
    sumDiscount: sumDiscount ?? this.sumDiscount,
  );

  Map<String, dynamic> toJSON() => {
    'chPrediction': chPrediction,
    'chequeActions': List<dynamic>.from(chequeActions.map((x) => x.toJSON())),
    'chequeHeader': chequeHeader.toJSON(),
    'chequeLines': List<dynamic>.from(chequeLines.map((x) => x.toJSON())),
    'chequeMagicName': chequeMagicName,
    'feedbackRates': List<dynamic>.from(feedbackRates.map((x) => x)),
    'sumCashback': sumCashback,
    'sumDiscount': sumDiscount,
  };
}

class ChequeHeader {
  ChequeHeader({
    required this.businessCardID,
    required this.chequeID,
    required this.cityName,
    required this.created,
    required this.filID,
    required this.filialName,
    required this.fiscalNumber,
    required this.frChequeID,
    required this.frID,
    required this.loyaltyFactID,
    required this.payType,
    required this.payTypeArray,
    required this.sumBalance,
    required this.sumReg,
    required this.zID,
    this.externalOperationID,
  });

  factory ChequeHeader.fromJSON(Map<String, dynamic> json) => ChequeHeader(
    businessCardID: json['businessCardId'] as int,
    chequeID: json['chequeId'] as int,
    cityName: json['cityName'] as String,
    created: json['created'] as String,
    externalOperationID: json['externalOperationId'],
    filID: json['filId'] as int,
    filialName: json['filialName'] as String,
    fiscalNumber: json['fiscalNumber'] as String,
    frChequeID: json['frChequeId'] as int,
    frID: json['frId'] as int,
    loyaltyFactID: json['loyaltyFactId'] as int,
    payType: json['payType'] as int,
    payTypeArray: List<dynamic>.from(
      (json['payTypeArray'] as List).map((x) => x),
    ),
    sumBalance: (json['sumBalance'] as num).toDouble(),
    sumReg: (json['sumReg'] as num).toDouble(),
    zID: json['zId'] as int,
  );

  final int businessCardID;
  final int chequeID;
  final String cityName;
  final String created;
  final dynamic externalOperationID;
  final int filID;
  final String filialName;
  final String fiscalNumber;
  final int frChequeID;
  final int frID;
  final int loyaltyFactID;
  final int payType;
  final List<dynamic> payTypeArray;
  final double sumBalance;
  final double sumReg;
  final int zID;

  ChequeHeader copyWith({
    int? businessCardID,
    int? chequeID,
    String? cityName,
    String? created,
    dynamic externalOperationID,
    int? filID,
    String? filialName,
    String? fiscalNumber,
    int? frChequeID,
    int? frID,
    int? loyaltyFactID,
    int? payType,
    List<dynamic>? payTypeArray,
    double? sumBalance,
    double? sumReg,
    int? zID,
  }) => ChequeHeader(
    businessCardID: businessCardID ?? this.businessCardID,
    chequeID: chequeID ?? this.chequeID,
    cityName: cityName ?? this.cityName,
    created: created ?? this.created,
    externalOperationID: externalOperationID ?? this.externalOperationID,
    filID: filID ?? this.filID,
    filialName: filialName ?? this.filialName,
    fiscalNumber: fiscalNumber ?? this.fiscalNumber,
    frChequeID: frChequeID ?? this.frChequeID,
    frID: frID ?? this.frID,
    loyaltyFactID: loyaltyFactID ?? this.loyaltyFactID,
    payType: payType ?? this.payType,
    payTypeArray: payTypeArray ?? this.payTypeArray,
    sumBalance: sumBalance ?? this.sumBalance,
    sumReg: sumReg ?? this.sumReg,
    zID: zID ?? this.zID,
  );

  Map<String, dynamic> toJSON() => {
    'businessCardId': businessCardID,
    'chequeId': chequeID,
    'cityName': cityName,
    'created': created,
    'externalOperationId': externalOperationID,
    'filId': filID,
    'filialName': filialName,
    'fiscalNumber': fiscalNumber,
    'frChequeId': frChequeID,
    'frId': frID,
    'loyaltyFactId': loyaltyFactID,
    'payType': payType,
    'payTypeArray': List<dynamic>.from(payTypeArray.map((x) => x)),
    'sumBalance': sumBalance,
    'sumReg': sumReg,
    'zId': zID,
  };
}

class ChequeLine {
  ChequeLine({
    required this.additionalData,
    required this.chequeLineID,
    required this.fileName,
    required this.kolvo,
    required this.lagerID,
    required this.lagerNameUA,
    required this.lagerUnit,
    required this.like,
    required this.priceOut,
    required this.sumCashbackLine,
    required this.unitText,
  });

  factory ChequeLine.fromJSON(Map<String, dynamic> json) => ChequeLine(
    additionalData: AdditionalData.fromJSON(
      json['additionalData'] as Map<String, dynamic>,
    ),
    chequeLineID: json['chequeLineId'] as int,
    fileName: json['fileName'] as String,
    kolvo: (json['kolvo'] as num).toDouble(),
    lagerID: json['lagerId'] as int,
    lagerNameUA: json['lagerNameUA'] as String,
    lagerUnit: json['lagerUnit'] as String,
    like: Like.fromJSON(json['like'] as Map<String, dynamic>),
    priceOut: (json['priceOut'] as num).toDouble(),
    sumCashbackLine: json['sumCashbackLine'] as int,
    unitText: json['unitText'] as String,
  );

  final AdditionalData additionalData;
  final int chequeLineID;
  final String fileName;
  final double kolvo;
  final int lagerID;
  final String lagerNameUA;
  final String lagerUnit;
  final Like like;
  final double priceOut;
  final int sumCashbackLine;
  final String unitText;

  ChequeLine copyWith({
    AdditionalData? additionalData,
    int? chequeLineID,
    String? fileName,
    double? kolvo,
    int? lagerID,
    String? lagerNameUA,
    String? lagerUnit,
    Like? like,
    double? priceOut,
    int? sumCashbackLine,
    String? unitText,
  }) => ChequeLine(
    additionalData: additionalData ?? this.additionalData,
    chequeLineID: chequeLineID ?? this.chequeLineID,
    fileName: fileName ?? this.fileName,
    kolvo: kolvo ?? this.kolvo,
    lagerID: lagerID ?? this.lagerID,
    lagerNameUA: lagerNameUA ?? this.lagerNameUA,
    lagerUnit: lagerUnit ?? this.lagerUnit,
    like: like ?? this.like,
    priceOut: priceOut ?? this.priceOut,
    sumCashbackLine: sumCashbackLine ?? this.sumCashbackLine,
    unitText: unitText ?? this.unitText,
  );

  Map<String, dynamic> toJSON() => {
    'additionalData': additionalData.toJSON(),
    'chequeLineId': chequeLineID,
    'fileName': fileName,
    'kolvo': kolvo,
    'lagerId': lagerID,
    'lagerNameUA': lagerNameUA,
    'lagerUnit': lagerUnit,
    'like': like.toJSON(),
    'priceOut': priceOut,
    'sumCashbackLine': sumCashbackLine,
    'unitText': unitText,
  };
}

class AdditionalData {
  AdditionalData({
    required this.barcodes,
    required this.classifierSapID,
    required this.companyID,
    required this.departmentName,
    required this.externalProductID,
    required this.icon,
    required this.id,
    required this.ratio,
    required this.scanExcise,
    required this.sectionSlug,
    required this.slug,
    required this.title,
    required this.weight,
    required this.weighted,
    this.brandID,
    this.brandTitle,
  });

  factory AdditionalData.fromJSON(Map<String, dynamic> json) => AdditionalData(
    barcodes: List<String>.from(
      (json['barcodes'] as List).map((x) => x as String),
    ),
    brandID: json['brandId'] as String?,
    brandTitle: json['brandTitle'] as String?,
    classifierSapID: json['classifierSapId'] as String,
    companyID: json['companyId'] as String,
    departmentName: json['departmentName'] as String,
    externalProductID: json['externalProductId'] as String,
    icon: json['icon'] as String,
    id: json['id'] as String,
    ratio: json['ratio'] as String,
    scanExcise: json['scanExcise'] as bool,
    sectionSlug: json['sectionSlug'] as String,
    slug: json['slug'] as String,
    title: json['title'] as String,
    weight: (json['weight'] as num).toDouble(),
    weighted: json['weighted'] as bool,
  );

  final List<String> barcodes;
  final String? brandID;
  final String? brandTitle;
  final String classifierSapID;
  final String companyID;
  final String departmentName;
  final String externalProductID;
  final String icon;
  final String id;
  final String ratio;
  final bool scanExcise;
  final String sectionSlug;
  final String slug;
  final String title;
  final double weight;
  final bool weighted;

  AdditionalData copyWith({
    List<String>? barcodes,
    String? brandID,
    String? brandTitle,
    String? classifierSapID,
    String? companyID,
    String? departmentName,
    String? externalProductID,
    String? icon,
    String? id,
    String? ratio,
    bool? scanExcise,
    String? sectionSlug,
    String? slug,
    String? title,
    double? weight,
    bool? weighted,
  }) => AdditionalData(
    barcodes: barcodes ?? this.barcodes,
    brandID: brandID ?? this.brandID,
    brandTitle: brandTitle ?? this.brandTitle,
    classifierSapID: classifierSapID ?? this.classifierSapID,
    companyID: companyID ?? this.companyID,
    departmentName: departmentName ?? this.departmentName,
    externalProductID: externalProductID ?? this.externalProductID,
    icon: icon ?? this.icon,
    id: id ?? this.id,
    ratio: ratio ?? this.ratio,
    scanExcise: scanExcise ?? this.scanExcise,
    sectionSlug: sectionSlug ?? this.sectionSlug,
    slug: slug ?? this.slug,
    title: title ?? this.title,
    weight: weight ?? this.weight,
    weighted: weighted ?? this.weighted,
  );

  Map<String, dynamic> toJSON() => {
    'barcodes': List<dynamic>.from(barcodes.map((x) => x)),
    'brandId': brandID,
    'brandTitle': brandTitle,
    'classifierSapId': classifierSapID,
    'companyId': companyID,
    'departmentName': departmentName,
    'externalProductId': externalProductID,
    'icon': icon,
    'id': id,
    'ratio': ratio,
    'scanExcise': scanExcise,
    'sectionSlug': sectionSlug,
    'slug': slug,
    'title': title,
    'weight': weight,
    'weighted': weighted,
  };
}

class Like {
  Like({required this.contains});

  factory Like.fromJSON(Map<String, dynamic> json) =>
      Like(contains: json['contains'] as bool);
  final bool contains;

  Like copyWith({bool? contains}) => Like(contains: contains ?? this.contains);

  Map<String, dynamic> toJSON() => {'contains': contains};
}

class ChequeAction {
  ChequeAction({
    required this.actionID,
    required this.actionType,
    required this.discount,
    required this.discpercent,
    this.actionTypeCodeName,
    this.varcharData,
  });

  factory ChequeAction.fromJSON(Map<String, dynamic> json) => ChequeAction(
    actionID: json['actionId'] as int,
    actionType: json['actionType'] as int,
    actionTypeCodeName: json['actionTypeCodeName'] as String?,
    discount: (json['discount'] as num).toDouble(),
    discpercent: json['discpercent'] as int,
    varcharData: json['varcharData'] as String?,
  );

  final int actionID;
  final int actionType;
  final String? actionTypeCodeName;
  final double discount;
  final int discpercent;
  final String? varcharData;

  ChequeAction copyWith({
    int? actionID,
    int? actionType,
    String? actionTypeCodeName,
    double? discount,
    int? discpercent,
    String? varcharData,
  }) => ChequeAction(
    actionID: actionID ?? this.actionID,
    actionType: actionType ?? this.actionType,
    actionTypeCodeName: actionTypeCodeName ?? this.actionTypeCodeName,
    discount: discount ?? this.discount,
    discpercent: discpercent ?? this.discpercent,
    varcharData: varcharData ?? this.varcharData,
  );

  Map<String, dynamic> toJSON() => {
    'actionId': actionID,
    'actionType': actionType,
    'actionTypeCodeName': actionTypeCodeName,
    'discount': discount,
    'discpercent': discpercent,
    'varcharData': varcharData,
  };
}
