import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trivia_app/data/models/index.dart';
import 'package:trivia_app/data/models/presenters/index.dart';
import 'package:trivia_app/domain/usecases/index.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {

  final ResponseQuizzUsecase _responseQuizzUsecase;

  HomeScreenBloc(this._responseQuizzUsecase) : super(HomeScreenInitialState()) {
    on<GetQuizzExampleEvent>((event, emit) async{
      emit(HomeScreenInitLoadingState());

      final RemoteResultApi<ResponseQuizzModelDomain>  response = await _responseQuizzUsecase.getQuestions();
      if(response is ErrorResultApi ){
        emit( HomeScreenErrorState(
          errorMessage: response.message
        ));
      }else{
        
      }
      
    });
  }
}
