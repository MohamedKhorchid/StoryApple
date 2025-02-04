import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChaptersRecord extends FirestoreRecord {
  ChaptersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "time" field.
  int? _time;
  int get time => _time ?? 0;
  bool hasTime() => _time != null;

  // "totalPage" field.
  int? _totalPage;
  int get totalPage => _totalPage ?? 0;
  bool hasTotalPage() => _totalPage != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _time = castToType<int>(snapshotData['time']);
    _totalPage = castToType<int>(snapshotData['totalPage']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chapters')
          : FirebaseFirestore.instance.collectionGroup('chapters');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('chapters').doc(id);

  static Stream<ChaptersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChaptersRecord.fromSnapshot(s));

  static Future<ChaptersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChaptersRecord.fromSnapshot(s));

  static ChaptersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChaptersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChaptersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChaptersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChaptersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChaptersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChaptersRecordData({
  String? title,
  int? time,
  int? totalPage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'time': time,
      'totalPage': totalPage,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChaptersRecordDocumentEquality implements Equality<ChaptersRecord> {
  const ChaptersRecordDocumentEquality();

  @override
  bool equals(ChaptersRecord? e1, ChaptersRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.time == e2?.time &&
        e1?.totalPage == e2?.totalPage;
  }

  @override
  int hash(ChaptersRecord? e) =>
      const ListEquality().hash([e?.title, e?.time, e?.totalPage]);

  @override
  bool isValidKey(Object? o) => o is ChaptersRecord;
}
