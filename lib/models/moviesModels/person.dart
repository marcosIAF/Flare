class Person {
  final int id;
  final double popularity;
  final String name;
  final String profilImg;
  final String known;

  Person(this.id, this.popularity, this.name, this.profilImg, this.known);
  Person.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        popularity = json['popularity'],
        name = json['name'],
        profilImg = json['profile_path'],
        known = json['knwon_for_department'];
}
