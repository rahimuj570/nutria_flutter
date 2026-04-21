import 'package:connectivity_plus/connectivity_plus.dart';

class NetCheckerService {
  NetCheckerService._();

  static final NetCheckerService _instance = NetCheckerService._();
  factory NetCheckerService() {
    return _instance;
  }

  Future<bool> isConnectedWithInternet() async {
    bool ok = false;

    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      ok = true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      ok = true;
    }
    return ok;
  }
}
