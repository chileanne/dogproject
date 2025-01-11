
import 'package:dogproject/data/repository/DogRepositroy.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



part 'random_events.dart';
part 'random_states.dart';

class RandomBloc extends Bloc<RandomEvents,RandomStates>{
  final DogRepository dogRepository;


  RandomBloc({required this.dogRepository}):super(RandomInitial()){
    on<fetchImage>(_getRandomImages);

  }

  void _getRandomImages(fetchImage event, Emitter<RandomStates> emit) async{
      var path = event.path;
    emit(RandomLoading());

    try{
      final data =  await dogRepository.getRandomDogImage(path: path);


      emit(RandomSuccess(image : data.message!));


    }catch(e){
      emit(RandomFailure( error: e.toString()));
    }
  }

}

