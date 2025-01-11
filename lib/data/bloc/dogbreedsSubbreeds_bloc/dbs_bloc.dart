

  import 'package:dogproject/data/repository/DogRepositroy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/list_breed_subbreed.dart';
part 'dbs_events.dart';
part 'dbs_states.dart';


class DbsBloc extends Bloc<DbsEvents,DbsStates>{
  final DogRepository dogRepository;
  DbsBloc({required this.dogRepository}):super(DbsInital()){
    on<GetList>(_getList);
  }


  void _getList(GetList event, Emitter<DbsStates> emit) async{

    emit(DbsLoading());

    try{
      final data =  await dogRepository.getListDogBreedSubBreed();


      ///This code is to convert the json message response to a list since the api just return it as normal object
      ///in order to show subreeds under breeds
      var list =[];
      list.add(data.message!.affenpinscher);
      list.add(data.message!.african);
      list.add(data.message!.airedale);
      list.add(data.message!.akita);
      list.add(data.message!.appenzeller);
      list.add(data.message!.australian);
      list.add(data.message!.bakharwal);
      list.add(data.message!.basenji);
      list.add(data.message!.beagle);
      list.add(data.message!.bluetick);
      list.add(data.message!.borzoi);
      list.add(data.message!.bouvier);
      list.add(data.message!.boxer);
      list.add(data.message!.brabancon);
      list.add(data.message!.briard);
      list.add(data.message!.buhund);
      list.add(data.message!.bulldog);
      list.add(data.message!.bullterrier);
      list.add(data.message!.cattledog);
      list.add(data.message!.cavapoo);
      list.add(data.message!.chihuahua);
      list.add(data.message!.chippiparai);
      list.add(data.message!.chow);
      list.add(data.message!.clumber);
      list.add(data.message!.cockapoo);
      list.add(data.message!.collie);
      list.add(data.message!.coonhound);
      list.add(data.message!.corgi);
      list.add(data.message!.cotondetulear);
      list.add(data.message!.dachshund);
      list.add(data.message!.dalmatian);
      list.add(data.message!.dane);
      list.add(data.message!.danish);
      list.add(data.message!.deerhound);
      list.add(data.message!.dhole);
      list.add(data.message!.dingo);
      list.add(data.message!.doberman);
      list.add(data.message!.elkhound);
      list.add(data.message!.entlebucher);
      list.add(data.message!.eskimo);
      list.add(data.message!.finnish);
      list.add(data.message!.frise);
      list.add(data.message!.gaddi);
      list.add(data.message!.germanshepherd);
      list.add(data.message!.greyhound);
      list.add(data.message!.groenendael);
      list.add(data.message!.havanese);
      list.add(data.message!.hound);
      list.add(data.message!.husky);
      list.add(data.message!.keeshond);
      list.add(data.message!.kelpie);
      list.add(data.message!.kombai);
      list.add(data.message!.komondor);
      list.add(data.message!.kuvasz);
      list.add(data.message!.labradoodle);
      list.add(data.message!.labrador);
      list.add(data.message!.leonberg);
      list.add(data.message!.lhasa);
      list.add(data.message!.malamute);
      list.add(data.message!.malinois);
      list.add(data.message!.maltese);
      list.add(data.message!.mastiff);
      list.add(data.message!.mexicanhairless);
      list.add(data.message!.mix);
      list.add(data.message!.mountain);
      list.add(data.message!.mudhol);
      list.add(data.message!.newfoundland);
      list.add(data.message!.otterhound);
      list.add(data.message!.ovcharka);
      list.add(data.message!.papillon);
      list.add(data.message!.pariah);
      list.add(data.message!.pekinese);
      list.add(data.message!.pembroke);
      list.add(data.message!.pinscher);
      list.add(data.message!.pitbull);
      list.add(data.message!.pointer);
      list.add(data.message!.pomeranian);
      list.add(data.message!.poodle);
      list.add(data.message!.pug);
      list.add(data.message!.puggle);
      list.add(data.message!.pyrenees);
      list.add(data.message!.rajapalayam);
      list.add(data.message!.redbone);
      list.add(data.message!.retriever);
      list.add(data.message!.ridgeback);
      list.add(data.message!.rottweiler);
      list.add(data.message!.saluki);
      list.add(data.message!.samoyed);
      list.add(data.message!.schipperke);
      list.add(data.message!.schnauzer);
      list.add(data.message!.segugio);
      list.add(data.message!.setter);
      list.add(data.message!.sharpei);
      list.add(data.message!.sheepdog);
      list.add(data.message!.shiba);
      list.add(data.message!.shihtzu);
      list.add(data.message!.spaniel);
      list.add(data.message!.spitz);
      list.add(data.message!.springer);
      list.add(data.message!.stbernard);
      list.add(data.message!.terrier);
      list.add(data.message!.tervuren);
      list.add(data.message!.vizsla);
      list.add(data.message!.waterdog);
      list.add(data.message!.weimaraner);
      list.add(data.message!.whippet);
      list.add(data.message!.wolfhound);




















      emit(DbsSuccess(data: data,subBreedList :list));


    }catch(e){
      emit(DbsFailure( error: e.toString()));
    }
  }

}