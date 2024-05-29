import 'package:get_it/get_it.dart';
import 'package:trivia_app/core/utils/index.dart';
import 'package:trivia_app/data/datasources/remote/index.dart';
import 'package:trivia_app/data/repositories/index.dart';
import 'package:trivia_app/domain/usecases/index.dart';
import 'package:trivia_app/presentation/state/home_screen_bloc/home_screen_bloc.dart';
import 'package:http/http.dart' as http;


GetIt getIt = GetIt.instance;

void initServiceLocator(){


  final http.Client client = getIt.registerSingleton(http.Client());
  final ConnectivityImpl connectivity = getIt.registerSingleton(ConnectivityImpl());
  final ResponseQuizzUsecase responseQuizzUsecase = getIt.registerSingleton(
    ResponseQuizzUsecase(ResponseQuizzRepositoryImpl(RemoteQuizzDataSourceImpl(client, connectivity))) 
  );

  getIt.registerFactory(()=>HomeScreenBloc(responseQuizzUsecase));

}