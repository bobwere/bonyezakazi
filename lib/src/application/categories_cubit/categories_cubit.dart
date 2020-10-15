import 'package:bonyeza_kazi/common/failures/categories_failure.dart';
import 'package:bonyeza_kazi/src/domain/categories/i_categories_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/casual_categories_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'categories_state.dart';
part 'categories_cubit.freezed.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._casualCategoriesFacade)
      : super(CategoriesState.initial());

  ICasualCategoriesFacade _casualCategoriesFacade;

  void getAllCategories() async {
    emit(CategoriesState.loading());
    final failureOrCategories =
        await _casualCategoriesFacade.getAllCategories();
    failureOrCategories.fold(
        (failure) => emit(CategoriesState.failure(failure)),
        (allCategories) => emit(CategoriesState.success(allCategories)));
  }
}
