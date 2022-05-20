import 'package:cloud_firestore/cloud_firestore.dart';

class Quote{
  final String? id;
  final String quote;
  final Timestamp timestamp;

  Quote({this.id,required this.quote, required this.timestamp});

  
  factory Quote.fromDocumentSnapshot(DocumentSnapshot doc){
    final data = doc.data() as Map<String, dynamic>;
    return Quote(
      id: doc.id,
      quote: data['quote'],
      timestamp: data['timestamp'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'quote': quote,
      'timestamp': timestamp,
    };
  }

  
}