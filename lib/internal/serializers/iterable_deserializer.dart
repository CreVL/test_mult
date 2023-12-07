import 'deserializer.dart';

extension IterableDeserializer<K, V> on Deserializer<K, V> {
  Iterable<K> iterableFrom(Iterable schemes) sync* {
    for (final scheme in schemes) {
      yield call(scheme);
    }
  }
}
