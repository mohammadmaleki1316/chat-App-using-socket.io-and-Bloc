part of 'messages_bloc.dart';

@immutable
 class MessagesState extends Equatable {
   bool editing;
   bool reply;
   List<Messages> payamha;

  MessagesState({required this.payamha,required this.editing,required this.reply});

  @override
  // TODO: implement props
  List<Object?> get props => [payamha,editing,reply];

   MessagesState copyWith({
     List<Messages>? payamha,
     bool? newEditing,
     bool? newReply
   }) {
     return MessagesState(
       payamha: payamha ?? List.from(this.payamha),
       editing: newEditing ?? this.editing,
       reply: newReply ?? this.reply
     );
   }
}
