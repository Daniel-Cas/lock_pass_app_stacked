class Password {
  late String title;
  late String password;
  late String subtitle;

  Password(this.title, this.password, this.subtitle);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password'] = password;
    data['title'] = title;
    data['subtitle'] = subtitle;

    return data;
  }
}