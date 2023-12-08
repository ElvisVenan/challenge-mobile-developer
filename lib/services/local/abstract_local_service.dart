abstract class ILocalService {

  Future<dynamic> get(String key);

  Future<void> delete(String key);

  Future<void> save(String key, dynamic value);

}
