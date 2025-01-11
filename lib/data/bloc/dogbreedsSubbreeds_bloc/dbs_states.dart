
  part of "dbs_bloc.dart";

   sealed class DbsStates{}

   final class DbsInital extends DbsStates{}

  final class DbsLoading extends DbsStates{}

  final class DbsSuccess extends DbsStates{
   ListBreedSubbreedModel data;
   final List<dynamic> subBreedList;

    DbsSuccess({required this.data,required this.subBreedList});
  }

  final class DbsFailure extends DbsStates{
    final String error;

    DbsFailure({required this.error});
  }
