import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/loan.dart';
import '../../domain/usecases/get_loans.dart';
import '../../domain/usecases/update_loan_status.dart';

// Events
abstract class LoanEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadLoans extends LoanEvent {}

class UpdateLoanStatusEvent extends LoanEvent {
  final String loanId;
  final bool isPaid;

  UpdateLoanStatusEvent(this.loanId, this.isPaid);

  @override
  List<Object> get props => [loanId, isPaid];
}

// States
abstract class LoanState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoanInitial extends LoanState {}

class LoanLoading extends LoanState {}

class LoanLoaded extends LoanState {
  final List<Loan> loans;

  LoanLoaded(this.loans);

  @override
  List<Object> get props => [loans];
}

class LoanError extends LoanState {
  final String message;

  LoanError(this.message);

  @override
  List<Object> get props => [message];
}

// Bloc
class LoanBloc extends Bloc<LoanEvent, LoanState> {
  final GetLoans getLoans;
  final UpdateLoanStatus updateLoanStatus;

  LoanBloc({
    required this.getLoans,
    required this.updateLoanStatus,
  }) : super(LoanInitial()) {
    on<LoadLoans>(_onLoadLoans);
    on<UpdateLoanStatusEvent>(_onUpdateLoanStatus);
  }

  Future<void> _onLoadLoans(LoadLoans event, Emitter<LoanState> emit) async {
    emit(LoanLoading());
    try {
      final loans = await getLoans.execute();
      emit(LoanLoaded(loans));
    } catch (e) {
      emit(LoanError(e.toString()));
    }
  }

  Future<void> _onUpdateLoanStatus(
    UpdateLoanStatusEvent event,
    Emitter<LoanState> emit,
  ) async {
    try {
      await updateLoanStatus.execute(event.loanId, event.isPaid);
      add(LoadLoans()); // Reload loans after updating status
    } catch (e) {
      emit(LoanError(e.toString()));
    }
  }
}