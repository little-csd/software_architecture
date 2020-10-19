///
//  Generated code. Do not modify.
//  source: passenger.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const Passenger$json = const {
  '1': 'Passenger',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'male', '3': 2, '4': 1, '5': 8, '10': 'male'},
    const {'1': 'idCard', '3': 3, '4': 1, '5': 9, '10': 'idCard'},
  ],
};

const PassengerAddReq$json = const {
  '1': 'PassengerAddReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'passengers', '3': 2, '4': 3, '5': 11, '6': '.Passenger', '10': 'passengers'},
  ],
};

const PassengerAddRsp$json = const {
  '1': 'PassengerAddRsp',
  '2': const [
    const {'1': 'errno', '3': 1, '4': 1, '5': 9, '10': 'errno'},
  ],
};

const PassengerGetReq$json = const {
  '1': 'PassengerGetReq',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const PassengerGetRsp$json = const {
  '1': 'PassengerGetRsp',
  '2': const [
    const {'1': 'passengers', '3': 1, '4': 3, '5': 11, '6': '.Passenger', '10': 'passengers'},
  ],
};

