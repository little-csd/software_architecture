///
//  Generated code. Do not modify.
//  source: train.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const TrainReq$json = const {
  '1': 'TrainReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'fs', '3': 2, '4': 1, '5': 9, '10': 'fs'},
    const {'1': 'ts', '3': 3, '4': 1, '5': 9, '10': 'ts'},
    const {'1': 'day', '3': 4, '4': 1, '5': 9, '10': 'day'},
  ],
};

const TrainRsp$json = const {
  '1': 'TrainRsp',
  '2': const [
    const {'1': 'tickets', '3': 1, '4': 3, '5': 11, '6': '.Ticket', '10': 'tickets'},
  ],
};

const Ticket$json = const {
  '1': 'Ticket',
  '2': const [
    const {'1': 'kid', '3': 1, '4': 1, '5': 9, '10': 'kid'},
    const {'1': 'fStation', '3': 2, '4': 1, '5': 9, '10': 'fStation'},
    const {'1': 'tStation', '3': 3, '4': 1, '5': 9, '10': 'tStation'},
    const {'1': 'fTime', '3': 4, '4': 1, '5': 9, '10': 'fTime'},
    const {'1': 'tTime', '3': 5, '4': 1, '5': 9, '10': 'tTime'},
    const {'1': 'duration', '3': 6, '4': 1, '5': 9, '10': 'duration'},
    const {'1': 'tid', '3': 7, '4': 1, '5': 9, '10': 'tid'},
  ],
};

const PriceReq$json = const {
  '1': 'PriceReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'tid', '3': 2, '4': 1, '5': 9, '10': 'tid'},
  ],
};

const PriceRsp$json = const {
  '1': 'PriceRsp',
  '2': const [
    const {'1': 'prices', '3': 1, '4': 3, '5': 9, '10': 'prices'},
  ],
};

