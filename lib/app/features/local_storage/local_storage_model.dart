enum LocalStorageKeys {
  currentUser('current_user');

  final String key;
  const LocalStorageKeys(this.key);
}

mixin LocalStorageModel {
  Map<String, dynamic> toJson();
}
