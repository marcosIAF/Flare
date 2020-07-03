class CreatorModel {
  int count;
  String next;
  String previous;
  List<Results> results;

  CreatorModel({this.count, this.next, this.previous, this.results});

  CreatorModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int id;
  String name;
  String slug;
  String image;
  String imageBackground;
  int gamesCount;
  List<Positions> positions;
  List<Games> games;

  Results(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.imageBackground,
      this.gamesCount,
      this.positions,
      this.games});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    imageBackground = json['image_background'];
    gamesCount = json['games_count'];
    if (json['positions'] != null) {
      positions = new List<Positions>();
      json['positions'].forEach((v) {
        positions.add(new Positions.fromJson(v));
      });
    }
    if (json['games'] != null) {
      games = new List<Games>();
      json['games'].forEach((v) {
        games.add(new Games.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['image_background'] = this.imageBackground;
    data['games_count'] = this.gamesCount;
    if (this.positions != null) {
      data['positions'] = this.positions.map((v) => v.toJson()).toList();
    }
    if (this.games != null) {
      data['games'] = this.games.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Positions {
  int id;
  String name;
  String slug;

  Positions({this.id, this.name, this.slug});

  Positions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class Games {
  int id;
  String slug;
  String name;
  int added;

  Games({this.id, this.slug, this.name, this.added});

  Games.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    added = json['added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['added'] = this.added;
    return data;
  }
}
