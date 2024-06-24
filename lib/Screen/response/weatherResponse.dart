//
// class WeatherResponse {
//   Coord? coord;
//   List<Weather>? weather;
//   String? base;
//   Main? main;
//   int? visibility;
//   Wind? wind;
//   Clouds? clouds;
//   int? dt;
//   Sys? sys;
//   int? timezone;
//   int? id;
//   String? name;
//   int? cod;
//
//   WeatherResponse(
//       {this.coord,
//         this.weather,
//         this.base,
//         this.main,
//         this.visibility,
//         this.wind,
//         this.clouds,
//         this.dt,
//         this.sys,
//         this.timezone,
//         this.id,
//         this.name,
//         this.cod});
//
//   WeatherResponse.fromJson(Map<String, dynamic> json) {
//     coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
//     if (json['weather'] != null) {
//       weather = <Weather>[];
//       json['weather'].forEach((v) {
//         weather!.add(Weather.fromJson(v));
//       });
//     }
//     base = json['base'];
//     main = json['main'] != null ? Main.fromJson(json['main']) : null;
//     visibility = json['visibility'];
//     wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
//     clouds =
//     json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
//     dt = json['dt'];
//     sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
//     timezone = json['timezone'];
//     id = json['id'];
//     name = json['name'];
//     cod = json['cod'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (coord != null) {
//       data['coord'] = coord!.toJson();
//     }
//     if (weather != null) {
//       data['weather'] = weather!.map((v) => v.toJson()).toList();
//     }
//     data['base'] = base;
//     if (main != null) {
//       data['main'] = main!.toJson();
//     }
//     data['visibility'] = visibility;
//     if (wind != null) {
//       data['wind'] = wind!.toJson();
//     }
//     if (clouds != null) {
//       data['clouds'] = clouds!.toJson();
//     }
//     data['dt'] = dt;
//     if (sys != null) {
//       data['sys'] = sys!.toJson();
//     }
//     data['timezone'] = timezone;
//     data['id'] = id;
//     data['name'] = name;
//     data['cod'] = cod;
//     return data;
//   }
// }
//
// class Coord {
//   double? lon;
//   double? lat;
//
//   Coord({this.lon, this.lat});
//
//   Coord.fromJson(Map<String, dynamic> json) {
//     lon = json['lon'];
//     lat = json['lat'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['lon'] = lon;
//     data['lat'] = lat;
//     return data;
//   }
// }
//
// class Weather {
//   int? id;
//   String? main;
//   String? description;
//   String? icon;
//
//   Weather({this.id, this.main, this.description, this.icon});
//
//   Weather.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     main = json['main'];
//     description = json['description'];
//     icon = json['icon'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['main'] = main;
//     data['description'] = description;
//     data['icon'] = icon;
//     return data;
//   }
// }
//
// class Main {
//   double? temp;
//   double? feelsLike;
//   double? tempMin;
//   double? tempMax;
//   int? pressure;
//   int? humidity;
//   int? seaLevel;
//   int? grndLevel;
//
//   Main(
//       {this.temp,
//         this.feelsLike,
//         this.tempMin,
//         this.tempMax,
//         this.pressure,
//         this.humidity,
//         this.seaLevel,
//         this.grndLevel});
//
//   Main.fromJson(Map<String, dynamic> json) {
//     temp = json['temp'];
//     feelsLike = json['feels_like'];
//     tempMin = json['temp_min'];
//     tempMax = json['temp_max'];
//     pressure = json['pressure'];
//     humidity = json['humidity'];
//     seaLevel = json['sea_level'];
//     grndLevel = json['grnd_level'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['temp'] = temp;
//     data['feels_like'] = feelsLike;
//     data['temp_min'] = tempMin;
//     data['temp_max'] = tempMax;
//     data['pressure'] = pressure;
//     data['humidity'] = humidity;
//     data['sea_level'] = seaLevel;
//     data['grnd_level'] = grndLevel;
//     return data;
//   }
// }
//
// class Wind {
//   double? speed;
//   int? deg;
//   double? gust;
//
//   Wind({this.speed, this.deg, this.gust});
//
//   Wind.fromJson(Map<String, dynamic> json) {
//     speed = json['speed'];
//     deg = json['deg'];
//     gust = json['gust'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['speed'] = speed;
//     data['deg'] = deg;
//     data['gust'] = gust;
//     return data;
//   }
// }
//
// class Clouds {
//   int? all;
//
//   Clouds({this.all});
//
//   Clouds.fromJson(Map<String, dynamic> json) {
//     all = json['all'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['all'] = all;
//     return data;
//   }
// }
//
// class Sys {
//   int? type;
//   int? id;
//   String? country;
//   int? sunrise;
//   int? sunset;
//
//   Sys({this.type, this.id, this.country, this.sunrise, this.sunset});
//
//   Sys.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     id = json['id'];
//     country = json['country'];
//     sunrise = json['sunrise'];
//     sunset = json['sunset'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['type'] = type;
//     data['id'] = id;
//     data['country'] = country;
//     data['sunrise'] = sunrise;
//     data['sunset'] = sunset;
//     return data;
//   }
// }

class WeatherResponse {
  String? cod;
  num? message;
  num? cnt;
  List<WeatherData>? list;
  City? city;

  WeatherResponse({this.cod, this.message, this.cnt, this.list, this.city});

  WeatherResponse.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <WeatherData>[];
      json['list'].forEach((v) {
        list!.add(WeatherData.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }
}

class WeatherData {
  num? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  num? visibility;
  num? pop;
  Sys? sys;
  String? dtTxt;

  WeatherData(
      {this.dt,
        this.main,
        this.weather,
        this.clouds,
        this.wind,
        this.visibility,
        this.pop,
        this.sys,
        this.dtTxt});

  WeatherData.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = Main.fromJson(json['main']);
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    clouds = Clouds.fromJson(json['clouds']);
    wind = Wind.fromJson(json['wind']);
    visibility = json['visibility'];
    pop = json['pop'];
    sys = Sys.fromJson(json['sys']);
    dtTxt = json['dt_txt'];
  }
}

class Main {
  num? temp;
  num? feelsLike;
  num? tempMin;
  num? tempMax;
  num? pressure;
  num? seaLevel;
  num? grndLevel;
  num? humidity;
  num? tempKf;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
    humidity = json['humidity'];
    tempKf = json['temp_kf'];
  }
}


class Weather {
  num? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class Clouds {
  num? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }
}

class Wind {
  num? speed;
  num? deg;
  num? gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg']; // Cast to int
    gust = json['gust'];
  }
}

class Sys {
  String? pod;

  Sys({this.pod});

  Sys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }
}

class City {
  num? id;
  String? name;
  Coord? coord;
  String? country;
  num? population;
  num? timezone;
  num? sunrise;
  num? sunset;

  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = Coord.fromJson(json['coord']);
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}

class Coord {
  num? lat;
  num? lon;

  Coord({this.lat, this.lon});

  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }
}

