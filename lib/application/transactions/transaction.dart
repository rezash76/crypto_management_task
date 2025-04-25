/// Abstract interface for application use cases (a.k.a. Transactions) in Clean Architecture.
///
/// Represents a single unit of business logic. This interface is commonly known as
/// a Usecase, Interactor, or even Service in other words. Each implementation
/// encapsulates a specific business action and can be invoked with a request object.
abstract interface class Transaction<T, Req> {
  Future<T> call(Req request);
}
