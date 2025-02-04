import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StorieRecord extends FirestoreRecord {
  StorieRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "time" field.
  int? _time;
  int get time => _time ?? 0;
  bool hasTime() => _time != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "averageRating" field.
  int? _averageRating;
  int get averageRating => _averageRating ?? 0;
  bool hasAverageRating() => _averageRating != null;

  // "totalReviews" field.
  int? _totalReviews;
  int get totalReviews => _totalReviews ?? 0;
  bool hasTotalReviews() => _totalReviews != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _category = snapshotData['category'] as String?;
    _time = castToType<int>(snapshotData['time']);
    _id = snapshotData['id'] as String?;
    _averageRating = castToType<int>(snapshotData['averageRating']);
    _totalReviews = castToType<int>(snapshotData['totalReviews']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('storie');

  static Stream<StorieRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StorieRecord.fromSnapshot(s));

  static Future<StorieRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StorieRecord.fromSnapshot(s));

  static StorieRecord fromSnapshot(DocumentSnapshot snapshot) => StorieRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StorieRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StorieRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StorieRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StorieRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStorieRecordData({
  String? title,
  String? description,
  String? category,
  int? time,
  String? id,
  int? averageRating,
  int? totalReviews,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'category': category,
      'time': time,
      'id': id,
      'averageRating': averageRating,
      'totalReviews': totalReviews,
    }.withoutNulls,
  );

  return firestoreData;
}

class StorieRecordDocumentEquality implements Equality<StorieRecord> {
  const StorieRecordDocumentEquality();

  @override
  bool equals(StorieRecord? e1, StorieRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.category == e2?.category &&
        e1?.time == e2?.time &&
        e1?.id == e2?.id &&
        e1?.averageRating == e2?.averageRating &&
        e1?.totalReviews == e2?.totalReviews;
  }

  @override
  int hash(StorieRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.category,
        e?.time,
        e?.id,
        e?.averageRating,
        e?.totalReviews
      ]);

  @override
  bool isValidKey(Object? o) => o is StorieRecord;
}
