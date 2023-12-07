
import 'package:test_mult/internal/serializers/serializer.dart';

extension IterableSerializer<K, V> on Serializer<K, V> {
  Iterable<K> iterableTo(Iterable schemes) sync* {
    for (final scheme in schemes) {
      yield call(scheme);
    }
  }
}
