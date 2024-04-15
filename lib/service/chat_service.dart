import 'package:chatapp/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  // get instance of firestore
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _fireStore.collection('Users').snapshots().map((snapshort) {
      return snapshort.docs.map((doc) {
        // go through each individual user
        final user = doc.data();
        // return user
        return user;
      }).toList();
    });
  }

  // send message
  Future<void> sendMessage(String receiveID, message) async {
    // get current user info
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    // create a new message
    Message newMessage = Message(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      receiveID: receiveID,
      message: message,
      timestamp: timestamp,
    );

    // counstruct chat room ID for the two users (stored to essure uniquesness)
    List<String> ids = [currentUserID, receiveID];
    ids.sort();
    String chatRoomID = ids.join('_');
    
    // add new message to database
    await _fireStore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.tomap());
  }

  // get messages
  Stream<QuerySnapshot> getMessages(String userID, outherUserID) {
    // construct a chat room ID for the two users
    List<String> ids = [userID, outherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');

    return _fireStore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
