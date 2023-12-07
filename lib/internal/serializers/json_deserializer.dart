import 'deserializer.dart';

abstract class JsonDeserializer<T>
    implements Deserializer<T, Map<String, dynamic>> {}
