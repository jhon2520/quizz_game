import 'package:trivia_app/data/models/domain/index.dart';
import 'package:trivia_app/data/models/presenters/index.dart';

abstract class ResponseQuizzRepository{

  Future<RemoteResultApi<ResponseQuizzModelDomain>> getQuestions();
}