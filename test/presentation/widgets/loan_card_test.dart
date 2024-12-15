import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loan_management/domain/entities/loan.dart';
import 'package:loan_management/presentation/widgets/loan_card.dart';

void main() {
  testWidgets('LoanCard displays loan information correctly',
      (WidgetTester tester) async {
    final loan = Loan(
      id: '1',
      type: 'Personal',
      amount: 1000,
      weeklyAmount: 100,
      paymentDate: DateTime.now(),
    );

    bool? checkboxValue;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoanCard(
            loan: loan,
            onStatusChanged: (value) {
              checkboxValue = value;
            },
          ),
        ),
      ),
    );

    expect(find.text('Personal'), findsOneWidget);
    expect(find.text('Monto total: \$1000.00'), findsOneWidget);
    expect(find.text('Pago semanal: \$100.00'), findsOneWidget);
    expect(find.text('Fecha de pago: Hoy'), findsOneWidget);

    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    expect(checkboxValue, true);
  });
}