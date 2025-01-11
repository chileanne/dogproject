
import 'package:dogproject/data/bloc/dogbreedsSubbreeds_bloc/dbs_bloc.dart';
import 'package:dogproject/data/bloc/favourtie_bloc/favourite_bloc.dart';
import 'package:dogproject/data/bloc/list_image_bloc/list_image_bloc.dart';
import 'package:dogproject/data/bloc/random_image_bloc/random_bloc.dart';
import 'package:dogproject/data/repository/DogRepositroy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/nav_route/route.dart';
import 'data/bloc/bloc_observer/bloc_observer.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<DogRepository>(
          create: (context) => DogRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RandomBloc>(
            create: (BuildContext context) => RandomBloc(dogRepository: context.read<DogRepository>()),
          ),
          BlocProvider<ListImageBloc>(
            create: (BuildContext context) => ListImageBloc(dogRepository: context.read<DogRepository>()),
          ),
          BlocProvider<FavourtiesBloc>(
            create: (BuildContext context) => FavourtiesBloc(dogRepository: context.read<DogRepository>()),
          ),

          BlocProvider<DbsBloc>(
            create: (BuildContext context) => DbsBloc(dogRepository: context.read<DogRepository>()),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),
    );
  }
}


