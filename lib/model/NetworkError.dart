import 'package:json_annotation/json_annotation.dart';

part 'NetworkError.g.dart';

@JsonSerializable()
class NetworkError {
  final bool error;
  final String reason;

  NetworkError({this.error, this.reason});

  factory NetworkError.fromJson(Map<String, dynamic> json) =>
      _$NetworkErrorFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkErrorToJson(this);

  String toString() {
    return "NetworkError: " + reason;
  }
}
