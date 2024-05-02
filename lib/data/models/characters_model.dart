class Character {
  late final int id;
  late final String name;
  late final String username;
  late final String email;
  late final Map<String, String> address;
  late final String phone;
  late final String website;
  late final Map<String, String> company;

  Character.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    username = json["username"];
    email = json["email"];
    address = json["address"];
    phone = json["phone"];
    website = json["website"];
    company = json["company"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['address'] = address;
    data['phone'] = phone;
    data['website'] = website;
    data['company'] = company;

    return data;
  }
}
