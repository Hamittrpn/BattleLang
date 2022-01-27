class AppUser {
  String id;
  final String name;
  final String surname;
  final DateTime birthday;

  AppUser(
      {this.id = '',
      required this.name,
      required this.surname,
      required this.birthday});

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'surname': surname, 'birthday': birthday};
}
