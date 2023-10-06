import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String errorMessage;
  const Failure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class ServerFailure extends Failure {
  const ServerFailure({required this.errorMessage})
      : super(errorMessage: errorMessage);
  @override
  final String errorMessage;
  @override
  List<Object> get props => [errorMessage];
}
