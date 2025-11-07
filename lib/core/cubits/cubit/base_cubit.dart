import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/error_handler/network_exceptions.dart';

part 'base_state.dart';
part 'base_cubit.freezed.dart';

class BaseCubit<T> extends Cubit<BaseState<T>> {
  BaseCubit(T? initialValue) : super(BaseState.initial(data: initialValue));
  void changeValue(T value) {
    emit(BaseState.success(value));
  }
}
