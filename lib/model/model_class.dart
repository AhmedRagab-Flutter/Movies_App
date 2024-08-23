class AppModel {
  int? id;
  String? name;
  String? type;
  String? date;
  String? review;
  String? poster;
  String? backdrop;
  String? overview;
  String? language;
  String? nameforPopulare;
  String? dateforPopulare;
  String? dateforToprated;

  AppModel({
    this.id,
    this.name,
    this.type,
    this.date,
    this.review,
    this.poster,
    this.backdrop,
    this.overview,
    this.language,
    this.nameforPopulare,
    this.dateforPopulare,
    this.dateforToprated,
  });

  AppModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['original_title'];
    type = json['media_type'];
    date = json['release_date'];
    review = json['vote_average'].toString();
    poster = json['poster_path'];
    backdrop = json['backdrop_path'];
    overview = json['overview'];
    language = json['original_language'];
    nameforPopulare = json['name'];
    dateforPopulare = json['first_air_date'];
    dateforToprated = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['original_title'] = this.name;
    data['media_type'] = this.type;
    data['release_date'] = this.date;
    data['vote_average'] = this.review;
    data['poster_path'] = this.poster;
    data['backdrop_path'] = this.backdrop;
    data['overview'] = this.overview;
    data['original_language'] = this.language;
    data['name'] = this.nameforPopulare;
    data['first_air_date'] = this.dateforPopulare;
    data['release_date'] = this.dateforToprated;
    return data;
  }
}
