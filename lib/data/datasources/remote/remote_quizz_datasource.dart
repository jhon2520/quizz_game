import 'package:trivia_app/data/models/domain/index.dart';
import 'package:trivia_app/data/models/presenters/index.dart';

import 'base/remote_api_base.dart';

abstract class RemoteQuizzDataSource{
  Future<RemoteResultApi<ResponseQuizzModelDomain>> getQuestions();
}

class RemoteQuizzDataSourceImpl extends RemoteApiBase implements RemoteQuizzDataSource{
  RemoteQuizzDataSourceImpl(super.client, super.connectivity);

  @override
  Future<RemoteResultApi<ResponseQuizzModelDomain>> getQuestions() {
    return getApi("opentdb.com", "/api.php", (value) {
      return ResponseQuizzModelDomain.fromRawJson(value);
    }, queryParameters: {
      "amount":"50",
      "category":"10"
    });
  }

}