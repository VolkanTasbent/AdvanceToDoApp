 import 'package:uuid/uuid.dart';

String generateUniqueId() {
    var uuid = Uuid(); // uuid örneği oluşturulur.
    return uuid.v4(); // UUID versiyon 4 (Rastgele UUID)
  }