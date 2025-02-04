import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RatingsRecord extends FirestoreRecord {
  RatingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  bool hasUserID() => _userID != null;

  // "storyID" field.
  String? _storyID;
  String get storyID => _storyID ?? '';
  bool hasStoryID() => _storyID != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  void _initializeFields() {
    _userID = snapshotData['userID'] as String?;
    _storyID = snapshotData['storyID'] as String?;
    _rating = castToType<int>(snapshotData['rating']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ratings');

  static Stream<RatingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RatingsRecord.fromSnapshot(s));

  static Future<RatingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RatingsRecord.fromSnapshot(s));

  static RatingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RatingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RatingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RatingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RatingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RatingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRatingsRecordData({
  String? userID,
  String? storyID,
  int? rating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userID': userID,
      'storyID': storyID,
      'rating': rating,
    }.withoutNulls,
  );

  return firestoreData;
}

class RatingsRecordDocumentEquality implements Equality<RatingsRecord> {
  const RatingsRecordDocumentEquality();

  @override
  bool equals(RatingsRecord? e1, RatingsRecord? e2) {
    return e1?.userID == e2?.userID &&
        e1?.storyID == e2?.storyID &&
        e1?.rating == e2?.rating;
  }

  @override
  int hash(RatingsRecord? e) =>
      const ListEquality().hash([e?.userID, e?.storyID, e?.rating]);

  @override
  bool isValidKey(Object? o) => o is RatingsRecord;
}
