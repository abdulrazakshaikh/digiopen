class UserLocationAccess {
  String? subdomain;
  String? domain;
  String? userType;
  String? level;
  bool? reseller;

  UserLocationAccess(
      {this.subdomain, this.domain, this.userType, this.level, this.reseller});

  UserLocationAccess.fromJson(Map<String, dynamic> json) {
    subdomain = json['subdomain'];
    domain = json['domain'];
    userType = json['user_type'];
    level = json['level'];
    reseller = json['reseller'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subdomain'] = this.subdomain;
    data['domain'] = this.domain;
    data['user_type'] = this.userType;
    data['level'] = this.level;
    data['reseller'] = this.reseller;
    return data;
  }
}