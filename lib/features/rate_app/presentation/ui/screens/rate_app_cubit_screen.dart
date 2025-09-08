import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_flutter/features/rate_app/presentation/bloc/constants.dart';
import 'package:learning_flutter/features/rate_app/presentation/bloc/rate_app_cubit.dart';
import 'package:learning_flutter/features/rate_app/presentation/bloc/rate_app_state.dart';
import 'package:learning_flutter/shared/widgets/custom_snackbar.dart';

class RateAppCubitScreen extends StatelessWidget {
  const RateAppCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rateAppCubit = context.read<RateAppCubit>();

    return BlocListener<RateAppCubit, RateAppState>(
      listener: (context, state) {
        if (state.status == RateAppStateStatus.success) {
          CustomSnackBar.show(
            context: context,
            message: 'Дякуємо за оцінку! Ваша оцінка: ${state.rate}/$maxRate',
            type: SnackBarType.success,
          );
          context.pop();
          rateAppCubit.resetStatus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rate App Cubit Screen'),
          backgroundColor: Colors.amber.shade100,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.amber.shade50, Colors.white],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Оцінити  застосунок',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 24),
                      BlocSelector<RateAppCubit, RateAppState, int>(
                        selector: (state) => state.rate,
                        builder: (context, rate) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(maxRate, (index) {
                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    rateAppCubit.rateApp(index + 1);
                                  },
                                  iconSize: 48,
                                  icon: Icon(
                                    rate > index
                                        ? Icons.star
                                        : Icons.star_border_outlined,
                                    color: Colors.amber.shade600,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                BlocSelector<RateAppCubit, RateAppState, bool>(
                  selector: (state) => state.isDirtyState,
                  builder: (context, isDirty) => Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: isDirty
                            ? [Colors.amber.shade400, Colors.amber.shade600]
                            : [Colors.grey.shade300, Colors.grey.shade400],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: isDirty
                              ? Colors.amber.shade200
                              : Colors.grey.shade200,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: isDirty ? rateAppCubit.sendRate : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Відправити оцінку',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton.icon(
                  onPressed: rateAppCubit.reset,
                  icon: const Icon(Icons.refresh, size: 20),
                  label: const Text(
                    'Скинути оцінку',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: BlocSelector<RateAppCubit, RateAppState, int>(
                    selector: (state) => state.rate,
                    builder: (context, value) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8,
                      children: [
                        value == 0
                            ? Icon(
                                Icons.info_outline,
                                color: Colors.grey.shade600,
                                size: 20,
                              )
                            : const SizedBox.shrink(),
                        Text(
                          value > 0
                              ? 'Ви оцінили нашу програму на $value/$maxRate'
                              : 'Тут буде Ваша оцінка',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
