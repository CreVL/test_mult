
import 'package:test_mult/internal/serializers/serializer.dart';

abstract class JsonSerializer<T>
    implements Serializer<Map<String, dynamic>, T> {}
