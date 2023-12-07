import '../../../domain/entities/origin.dart';
import '../../../internal/serializers/json_deserializer.dart';

class OriginDeserializer implements JsonDeserializer<Origin> {
  @override
  Origin call(Map<String, dynamic> json) {
    return Origin(
      name: json['name'],
      url: json['url'],
    );
  }
}
