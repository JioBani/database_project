import 'package:logger/logger.dart';

class Music {
  final String id;
  final String name;
  final String composer;

  Music({
    required this.id,
    required this.name,
    required this.composer,
  });

  // JSON 데이터를 Music 객체로 변환하는 팩토리 메서드
  factory Music.fromJson(Map<String, dynamic> json) {
    Logger().i(json);
    return Music(
      id: json['id'] as String,
      name: json['name'] as String,
      composer: json['composer'] as String,
    );
  }
}
