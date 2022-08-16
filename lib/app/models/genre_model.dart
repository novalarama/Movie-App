class Genre {
  List<AllGenres>? genres;

  Genre({this.genres});

  Genre.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = <AllGenres>[];
      json['genres'].forEach((v) {
        genres?.add(AllGenres.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (genres != null) {
      data['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllGenres {
  int? id;
  String? name;

  AllGenres({this.id, this.name});

  AllGenres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
