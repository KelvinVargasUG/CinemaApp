import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String THE_MOVIEDB_KEY =
      dotenv.env['THE_MOVIEDB_KEY'] ?? 'No key found';
}
