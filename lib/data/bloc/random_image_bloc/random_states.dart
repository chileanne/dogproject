
part of 'random_bloc.dart';


  sealed class RandomStates{}

  final class RandomInitial extends RandomStates{}

   final class RandomLoading extends RandomStates{}


  final class RandomSuccess extends RandomStates with EquatableMixin{
  final String image;


  RandomSuccess({required this.image});


  @override
  // TODO: implement props
  List<Object?> get props => [image];

  }


  final class RandomFailure extends RandomStates{
    final String error;

    RandomFailure({required this.error});
  }