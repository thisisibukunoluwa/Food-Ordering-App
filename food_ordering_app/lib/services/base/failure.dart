class Failure {
  Failure(this.message);

  final String message;

  factory Failure.fromHttpErrorMap(Map<String, dynamic> json) =>
      Failure(json["error"]["message"]);

  @override
  String toString() => 'Failure(message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Failure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
