import 'package:uuid/uuid.dart';

class Contact {
  final String name;
  final String id; // we use the uuid package to give a unique id for every contact we create

  Contact({
    required this.name,
  }) : id = const Uuid().v4(); // here we dont expose the id
}
