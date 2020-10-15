import 'package:freezed_annotation/freezed_annotation.dart';

part 'sp_details_failure.freezed.dart';

@freezed
abstract class SPDetailsFailure with _$SPDetailsFailure {
  const factory SPDetailsFailure.serverError() = ServerError;
  const factory SPDetailsFailure.noInternet() = NoInternet;
}
