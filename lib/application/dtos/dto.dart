/// Base class for Data Transfer Objects (DTOs) used for API communication.
///
/// All DTOs should implement [toJson] to provide a serializable map representation.
abstract base class Dto {
  Map<String, dynamic> toJson();
}

/// A DTO representing an empty payload for API endpoints that require no data.
///
/// Useful for requests (Transaction inputs) where no parameters are needed but a DTO type is expected.
base class NoDto extends Dto {
  @override
  Map<String, dynamic> toJson() => {};
}
