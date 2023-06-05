class Env {
  static final Map<String, String> env = <String, String>{};
  static Env? _instance;

  Env._();

  static Env get instance {
    _instance ??= Env._();
    return _instance!;
  }

  Future<void> load() {
    env.putIfAbsent(
      'backend_url',
      () => 'https://pdv.flexnote.com.br/api',
    );

    return Future(() => null);
  }

  String? operator [](String key) => env[key];
}
