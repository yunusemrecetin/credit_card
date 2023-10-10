import 'package:base_project/so_like_app.dart';

class AppService {
  static Future<void> initAsync() async {
    await dotenv.load(fileName: F.getEnv());
  }
}
