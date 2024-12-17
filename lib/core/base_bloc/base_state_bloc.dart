import 'package:equatable/equatable.dart';

abstract class BaseBlocState extends Equatable {
  final bool hasLoading;
  final bool hasError;
  final String? errorMessage;

  bool get isError => hasError && errorMessage != null;

  bool get isLoading => hasLoading;

  String get errorMessageState => errorMessage ?? '';

  const BaseBlocState({
    required this.hasLoading,
    required this.hasError,
    required this.errorMessage,
  });

  List<Object?> get stateProps;

  @override
  List<Object?> get props => [
        ...stateProps,
        isLoading,
        isError,
        errorMessage,
      ];
}
