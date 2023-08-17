class Message {
  final String? message;
  final String? sender;
  final int? time;

  Message({
      this.message,
      this.sender,
      this.time,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
      message: json["message"],
      sender: json["sender"],
      time: json["time"],
  );

  Map<String, dynamic> toJson() => {
      "message": message,
      "sender": sender,
      "time": time,
  };
}