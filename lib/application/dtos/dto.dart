abstract base class Dto {
  Map<String, dynamic> toJson();
}

base class NoDto extends Dto {
  @override
  Map<String, dynamic> toJson() => {};
}
