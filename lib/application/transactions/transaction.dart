abstract interface class Transaction<T, Req> {
  Future<T> call(Req request);
}
