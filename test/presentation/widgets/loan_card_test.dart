import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:loan_management/domain/entities/loan.dart';
import 'package:loan_management/presentation/widgets/loan_card.dart';

void main() {
  late Loan testLoan;
  late DateTime now;

  setUp(() {
    now = DateTime.now();
    testLoan = Loan(
      id: '1',
      type: 'Personal',
      amount: 1000,
      weeklyAmount: 100,
      paymentDate: now,
      isPaid: false,
    );
  });

  testWidgets('LoanCard displays basic loan information correctly',
      (WidgetTester tester) async {
    bool? checkboxValue;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoanCard(
            loan: testLoan,
            onStatusChanged: (value) {
              checkboxValue = value;
            },
          ),
        ),
      ),
    );

    // Test loan type and icon
    expect(find.text('Personal'), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);

    // Test status chip
    expect(find.text('PENDIENTE'), findsOneWidget);

    // Test payment date chip
    expect(find.text('HOY'), findsOneWidget);

    // Test amount information
    final currencyFormat = NumberFormat.currency(symbol: '\$', decimalDigits: 2);
    expect(find.text(currencyFormat.format(1000)), findsOneWidget);
    expect(find.text(currencyFormat.format(100)), findsOneWidget);

    // Test date information
    expect(find.text(DateFormat('dd/MM/yyyy').format(now)), findsOneWidget);

    // Test checkbox interaction
    await tester.tap(find.byType(Checkbox));
    await tester.pump();
    expect(checkboxValue, true);
  });

  testWidgets('LoanCard displays correct status when loan is paid',
      (WidgetTester tester) async {
    final paidLoan = Loan(
      id: '1',
      type: 'Personal',
      amount: 1000,
      weeklyAmount: 100,
      paymentDate: now,
      isPaid: true,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoanCard(
            loan: paidLoan,
            onStatusChanged: (_) {},
          ),
        ),
      ),
    );

    expect(find.text('PAGADO'), findsOneWidget);
    final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
    expect(checkbox.value, true);
  });

  testWidgets('LoanCard displays correct payment date text for tomorrow',
      (WidgetTester tester) async {
    final tomorrowLoan = Loan(
      id: '1',
      type: 'Personal',
      amount: 1000,
      weeklyAmount: 100,
      paymentDate: now.add(const Duration(days: 1)),
      isPaid: false,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoanCard(
            loan: tomorrowLoan,
            onStatusChanged: (_) {},
          ),
        ),
      ),
    );

    expect(find.text('MAÑANA'), findsOneWidget);
  });

  testWidgets('LoanCard displays correct payment date text for future dates',
      (WidgetTester tester) async {
    final futureLoan = Loan(
      id: '1',
      type: 'Personal',
      amount: 1000,
      weeklyAmount: 100,
      paymentDate: now.add(const Duration(days: 2)),
      isPaid: false,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoanCard(
            loan: futureLoan,
            onStatusChanged: (_) {},
          ),
        ),
      ),
    );

    expect(find.text('PRÓXIMO'), findsOneWidget);
  });

  testWidgets('LoanCard displays business icon for business type loans',
      (WidgetTester tester) async {
    final businessLoan = Loan(
      id: '1',
      type: 'Business',
      amount: 1000,
      weeklyAmount: 100,
      paymentDate: now,
      isPaid: false,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoanCard(
            loan: businessLoan,
            onStatusChanged: (_) {},
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.business), findsOneWidget);
    expect(find.text('Business'), findsOneWidget);
  });
}