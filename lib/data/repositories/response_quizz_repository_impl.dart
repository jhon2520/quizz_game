import 'package:trivia_app/data/datasources/remote/index.dart';
import 'package:trivia_app/data/models/domain/response_quizz_model_domain.dart';
import 'package:trivia_app/data/models/presenters/general_remote_result_presenter.dart';
import 'package:trivia_app/domain/repositories/index.dart';

class ResponseQuizzRepositoryImpl implements ResponseQuizzRepository{

  final RemoteQuizzDataSource _remoteQuizzDataSource;

  ResponseQuizzRepositoryImpl(this._remoteQuizzDataSource);

  @override
  Future<RemoteResultApi<ResponseQuizzModelDomain>> getQuestions() async{
    return _remoteQuizzDataSource.getQuestions();
  }



}