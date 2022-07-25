abstract class IRepository<T> {
  Stream<List<T>> getAllOnStream();
  Future<T> getById(String id);
  Future<bool> post(T entity);
  Future<bool> put(T entity);
  Future<bool> delet(String id);
}