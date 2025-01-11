


import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/DogRepositroy.dart';

part 'list_image_events.dart';
part 'list_image_states.dart';


class ListImageBloc extends Bloc<ListImageEvents,ListImageStates>{
  final DogRepository dogRepository;


  ListImageBloc({required this.dogRepository}):super(ListImageInitial()){
    on<FetchListImage>(_getListImages);

  }

  void _getListImages(FetchListImage event, Emitter<ListImageStates> emit) async{
    final path = event.path;
    emit(ListImageLoading());

    try{
      final data =  await dogRepository.getListDogImage(path: path);
      emit(ListImageSuccess(imageList : data.message!));


    }catch(e){
      emit(ListImageFailure(error: e.toString()));
    }
  }

}

