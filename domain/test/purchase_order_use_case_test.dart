import 'package:domain/purchase_order_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPurchaseOrderRepository extends Mock implements PurchaseOrderRepository {}

void main() {
  MockPurchaseOrderRepository _repository;
  PurchaseOrderUseCaseImpl _useCase;

  setUp(() {
    _repository = MockPurchaseOrderRepository();
    _useCase = PurchaseOrderUseCaseImpl(_repository);
  });
}
