import 'dart:async';

class Person {
  final String name;

  Person(this.name);

  @override
  String toString() {
    return 'Person{name: $name}';
  }
}

class Api {
  static Future<String> getUser(String from) =>
      Future.value("{\"name\":\"Julia ..via $from\"}");
}
