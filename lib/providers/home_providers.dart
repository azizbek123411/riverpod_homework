import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_homework/models/message_model.dart';
import 'package:riverpod_homework/services/api_service.dart';

final countProvider=StateProvider((ref) => 0);
final messageProvider=FutureProvider<List<MessageModel>>((ref) async{
  List <MessageModel> messages=await ApiServices.getAllMessages();
  return messages;
});