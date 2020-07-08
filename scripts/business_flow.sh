#!/bin/sh
cat <<EOF
Business Flow Builder

Define Class Name (IE: Family):
        **CamelCase**
EOF

read name

SNAKE_NAME=$(echo $name | sed 's/\([A-Z]\)/_\1/g;s/^_//' | tr '[:upper:]' '[:lower:]')

FILE="./domain/lib/"$SNAKE_NAME"_use_case.dart"

if [ -f "$FILE" ]; then
  clear
  cat <<EOF
  BUSINESS FLOW ALREADY EXISTS!!
    PATH: $FILE
EOF
else
  #DOMAIN
  echo "RUNNING DOMAIN..."
  USE_CASE_EXT="_use_case.dart"
  DOMAIN_DIR="./domain/lib/"
  DOMAIN_SNAKE_NAME=$SNAKE_NAME
  USE_CASE_FILE_NAME=$DOMAIN_SNAKE_NAME$USE_CASE_EXT
  DOMAIN_PATH=$DOMAIN_DIR$USE_CASE_FILE_NAME

  CLASS_REPOSITORY=$name"Repository"
  CLASS_USE_CASE=$name"UseCase"
  CLASS_USE_CASE_IMPL=$CLASS_USE_CASE"Impl"

  cat >$DOMAIN_PATH <<EOF
import 'package:models/result.dart';

abstract class $CLASS_REPOSITORY {
  //TODO: Add implementation
}

abstract class $CLASS_USE_CASE {
  //TODO: Add implementation
}

class $CLASS_USE_CASE_IMPL implements $CLASS_USE_CASE {
  final $CLASS_REPOSITORY _repository;

  $CLASS_USE_CASE_IMPL(this._repository);
}
EOF

  #DOMAIN_TEST
  echo "RUNNING DOMAIN TEST..."
  USE_CASE_TEST_EXT="_use_case_test.dart"
  DOMAIN_TEST_DIR="./domain/test/"
  DOMAIN_TEST_PATH=$DOMAIN_TEST_DIR$DOMAIN_SNAKE_NAME$USE_CASE_TEST_EXT
  MOCK_CLASS_REPOSITORY="Mock"$name"Repository"

  cat >$DOMAIN_TEST_PATH <<EOF
import 'dart:async';
import 'package:domain/$USE_CASE_FILE_NAME';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:models/result.dart';

class $MOCK_CLASS_REPOSITORY extends Mock implements $CLASS_REPOSITORY {}

void main() {
  $MOCK_CLASS_REPOSITORY _repository;
  $CLASS_USE_CASE_IMPL _useCase;

  setUp(() {
    _repository = $MOCK_CLASS_REPOSITORY();
    _useCase = $CLASS_USE_CASE_IMPL(_repository);
  });
}
EOF

  #DATA
  echo "RUNNING DATA..."
  REPOSITORY_EXT="_repository.dart"
  DATA_DIR="./data/lib/"
  DATA_SNAKE_NAME=$SNAKE_NAME
  REPOSITORY_FILE_NAME=$DATA_SNAKE_NAME$REPOSITORY_EXT
  DATA_PATH=$DATA_DIR$REPOSITORY_FILE_NAME

  CLASS_API_SOURCE=$name"ApiSource"
  CLASS_DB_SOURCE=$name"DbSource"
  CLASS_REPOSITORY_IMPL=$name"RepositoryImpl"
  cat >$DATA_PATH <<EOF
import 'dart:async';

import 'package:domain/$USE_CASE_FILE_NAME';
import 'package:models/result.dart';

abstract class $CLASS_API_SOURCE {
  //TODO
}

abstract class $CLASS_DB_SOURCE {
  //TODO
}

class $CLASS_REPOSITORY_IMPL implements $CLASS_REPOSITORY {
  final $CLASS_API_SOURCE _apiSource;
  final $CLASS_DB_SOURCE _dbSource;

  $CLASS_REPOSITORY_IMPL(this._apiSource, this._dbSource);

  //TODO
}

EOF

  #REPOSITORY_TEST
  echo "RUNNING DATA TEST..."
  REPOSITORY_TEST_EXT="_repository_test.dart"
  DATA_TEST_DIR="./data/test/"
  DATA_TEST_PATH=$DATA_TEST_DIR$DATA_SNAKE_NAME$REPOSITORY_TEST_EXT
  MOCK_CLASS_API_SOURCE="Mock"$name"ApiSource"
  MOCK_CLASS_DB_SOURCE="Mock"$name"DBSource"

  cat >$DATA_TEST_PATH <<EOF
import 'package:data/$REPOSITORY_FILE_NAME';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:models/result.dart';

class $MOCK_CLASS_API_SOURCE extends Mock implements $CLASS_API_SOURCE {}

class $MOCK_CLASS_DB_SOURCE extends Mock implements $CLASS_DB_SOURCE {}

void main() {
  $MOCK_CLASS_API_SOURCE _apiSource;
  $MOCK_CLASS_DB_SOURCE _dbSource;
  $CLASS_REPOSITORY_IMPL _repository;

  setUp(() {
    _apiSource = $MOCK_CLASS_API_SOURCE();
    _dbSource = $MOCK_CLASS_DB_SOURCE();
    _repository = $CLASS_REPOSITORY_IMPL(_apiSource, _dbSource);
  });
}

EOF

  #LIB/DATA_SOURCE
  echo "RUNNING DATA_SOURCE API..."
  CLASS_API_SOURCE_IMP=$CLASS_API_SOURCE"Impl"
  DATA_SOURCE_API_DIR="./lib/data_source/api/"
  API_SOURCE_EXT="_api_source.dart"
  API_SOURCE_PATH=$DATA_SOURCE_API_DIR$SNAKE_NAME$API_SOURCE_EXT

  cat >$API_SOURCE_PATH <<EOF
import 'package:data/$REPOSITORY_FILE_NAME';
import 'package:http/http.dart' as http;
import 'package:models/result.dart';
import 'package:plataforma_compensar_flutter/data_source/api/api_base_source.dart';
import 'package:plataforma_compensar_flutter/utils/connectivity/my_connectivity.dart';

class $CLASS_API_SOURCE_IMP extends ApiBaseSource implements $CLASS_API_SOURCE {
  $CLASS_API_SOURCE_IMP(
    String baseUrl,
    MyConnectivity connectivity, {
    http.Client client,
    String token,
  }) : super(baseUrl, client ?? http.Client(), connectivity, token);
}
EOF
  echo "RUNNING DATA_SOURCE DB..."
  CLASS_DB_SOURCE_IMPL=$name"DBSourceImpl"
  DATA_SOURCE_DB_DIR="./lib/data_source/data_base/"
  DB_SOURCE_EXT="_db_source.dart"
  DB_SOURCE_FILE=$SNAKE_NAME$DB_SOURCE_EXT
  DB_SOURCE_PATH=$DATA_SOURCE_DB_DIR$DB_SOURCE_FILE

  cat >$DB_SOURCE_PATH <<EOF
import 'package:data/$REPOSITORY_FILE_NAME';
import 'package:plataforma_compensar_flutter/data_source/data_base/app_database.dart';
import 'package:sembast/sembast.dart';

class $CLASS_DB_SOURCE_IMPL implements $CLASS_DB_SOURCE {
  Future<Database> get _db async => await AppDatabase().database;

  static const String EXAMPLE_NAME = 'EXAMPLE';
  final _exampleStore = intMapStoreFactory.store(EXAMPLE_NAME);
}

EOF

  #TEST DATA_SOURCE/API
  echo "RUNNING DATA_SOURCE API TEST..."
  API_SOURCE_TEST_EXT="_api_source_test.dart"
  TEST_DATA_SOURCE_API_DIR="./test/data_source/api/"
  TEST_API_SOURCE_FILE=$SNAKE_NAME$API_SOURCE_TEST_EXT
  TEST_DATA_SOURCE_API_PATH=$TEST_DATA_SOURCE_API_DIR$TEST_API_SOURCE_FILE

  cat >$TEST_DATA_SOURCE_API_PATH <<EOF
import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:plataforma_compensar_flutter/utils/connectivity/my_connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:plataforma_compensar_flutter/data_source/api/$SNAKE_NAME$API_SOURCE_EXT';

class MockClient extends Mock implements http.Client {}

class MockMyConnectivity extends Mock implements MyConnectivity {}

main() {
  MockClient _mockClient;
  MockMyConnectivity _myConnectivity;
  $CLASS_API_SOURCE_IMP _apiSource;

  var baseUrl = 'http://url';

  setUp(() {
    _mockClient = MockClient();
    _myConnectivity = MockMyConnectivity();
    _apiSource = $CLASS_API_SOURCE_IMP(
      baseUrl,
      _myConnectivity,
      client: _mockClient,
    );
    when(_myConnectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.mobile);
    SharedPreferences.setMockInitialValues({});
  });
}
EOF
fi
