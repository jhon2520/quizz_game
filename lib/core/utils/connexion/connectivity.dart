import 'dart:io';

sealed class Connectivity{
  Future<bool> isConnected();
}

class ConnectivityImpl extends Connectivity{
  @override
  Future<bool> isConnected() async{
    final result = await InternetAddress.lookup("google.com");
    if((result.isNotEmpty && result[0].rawAddress.isNotEmpty)){
      return true;
    }
    else{
      return false;
    }
  }

}