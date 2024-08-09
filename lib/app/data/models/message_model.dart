import 'package:feedbackstation/app/data/models/user_model.dart';

class MessageModel {
  final int senderId;
  final int receiverId;
  final User senderUser;
  final String message;

  MessageModel({
    required this.receiverId,
    required this.senderId,
    required this.senderUser,
    required this.message,
  });
}
