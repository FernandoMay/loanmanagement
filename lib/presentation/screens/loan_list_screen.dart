import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/loan_bloc.dart';
import '../widgets/loan_card.dart';

class LoanListScreen extends StatelessWidget {
  const LoanListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Préstamos'),
      ),
      body: BlocBuilder<LoanBloc, LoanState>(
        builder: (context, state) {
          if (state is LoanLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoanLoaded) {
            return ListView.builder(
              itemCount: state.loans.length,
              itemBuilder: (context, index) {
                final loan = state.loans[index];
                return LoanCard(
                  loan: loan,
                  onStatusChanged: (isPaid) {
                    context.read<LoanBloc>().add(
                          UpdateLoanStatusEvent(loan.id, isPaid),
                        );
                  },
                );
              },
            );
          } else if (state is LoanError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}