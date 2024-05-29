import 'package:trivia_app/data/models/domain/index.dart';
import 'package:trivia_app/data/models/presenters/index.dart';
import 'package:trivia_app/domain/repositories/index.dart';

class ResponseQuizzUsecase{

  final ResponseQuizzRepository _quizzRepository;

  ResponseQuizzUsecase(this._quizzRepository);

  Future<RemoteResultApi<ResponseQuizzModelDomain>> getQuestions(){ 
    return _quizzRepository.getQuestions();
  }


}   