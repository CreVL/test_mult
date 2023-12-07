import 'package:test_mult/domain/entities/info.dart';

import '../../../internal/serializers/json_deserializer.dart';

class InfoDeserializer implements JsonDeserializer<Info> {
  @override
  Info call(Map<String, dynamic> json) {
    return Info(
      count: json['count'],
      pages: json['pages'],
      next: json['next'],
      prev: json['prev'],
    );
  }
}
