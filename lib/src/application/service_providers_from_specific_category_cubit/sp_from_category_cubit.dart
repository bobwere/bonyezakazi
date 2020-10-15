import 'package:bonyeza_kazi/common/failures/search_failure.dart';
import 'package:bonyeza_kazi/src/domain/categories/i_categories_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/categories/models/service_provider_search_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'sp_from_category_state.dart';
part 'sp_from_category_cubit.freezed.dart';

@injectable
class SPFromCategoryCubit extends Cubit<SPFromCategoryState> {
  SPFromCategoryCubit(this._casualCategoriesFacade)
      : super(SPFromCategoryState.initial());

  ICasualCategoriesFacade _casualCategoriesFacade;

  void searchForServiceProvidersByCategory({String skills}) async {
    emit(SPFromCategoryState.loading());
    final failureOrSearchResults =
        await _casualCategoriesFacade.searchForServiceProviders(skills: skills);
    failureOrSearchResults.fold(
        (failure) => emit(SPFromCategoryState.failure(failure)),
        (searchResults) => emit(SPFromCategoryState.success(searchResults)));
  }
}
