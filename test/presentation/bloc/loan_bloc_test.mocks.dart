// Mocks generated by Mockito 5.4.4 from annotations
// in loan_management/test/presentation/bloc/loan_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:loan_management/domain/entities/loan.dart' as _i5;
import 'package:loan_management/domain/repositories/loan_repository.dart'
    as _i2;
import 'package:loan_management/domain/usecases/get_loans.dart' as _i3;
import 'package:loan_management/domain/usecases/update_loan_status.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeLoanRepository_0 extends _i1.SmartFake
    implements _i2.LoanRepository {
  _FakeLoanRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetLoans].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetLoans extends _i1.Mock implements _i3.GetLoans {
  @override
  _i2.LoanRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeLoanRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeLoanRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.LoanRepository);

  @override
  _i4.Future<List<_i5.Loan>> execute() => (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i4.Future<List<_i5.Loan>>.value(<_i5.Loan>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i5.Loan>>.value(<_i5.Loan>[]),
      ) as _i4.Future<List<_i5.Loan>>);
}

/// A class which mocks [UpdateLoanStatus].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateLoanStatus extends _i1.Mock implements _i6.UpdateLoanStatus {
  @override
  _i2.LoanRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeLoanRepository_0(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeLoanRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.LoanRepository);

  @override
  _i4.Future<void> execute(
    String? loanId,
    bool? isPaid,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [
            loanId,
            isPaid,
          ],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
