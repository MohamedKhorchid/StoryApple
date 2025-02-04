import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PagesRecord extends FirestoreRecord {
  PagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "chapterID" field.
  String? _chapterID;
  String get chapterID => _chapterID ?? '';
  bool hasChapterID() => _chapterID != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "pageNumber" field.
  int? _pageNumber;
  int get pageNumber => _pageNumber ?? 0;
  bool hasPageNumber() => _pageNumber != null;

  void _initializeFields() {
    _chapterID = snapshotData['chapterID'] as String?;
    _content = snapshotData['content'] as String?;
    _pageNumber = castToType<int>(snapshotData['pageNumber']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pages');

  static Stream<PagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PagesRecord.fromSnapshot(s));

  static Future<PagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PagesRecord.fromSnapshot(s));

  static PagesRecord fromSnapshot(DocumentSnapshot snapshot) => PagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPagesRecordData({
  String? chapterID,
  String? content,
  int? pageNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chapterID': chapterID,
      'content': content,
      'pageNumber': pageNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class PagesRecordDocumentEquality implements Equality<PagesRecord> {
  const PagesRecordDocumentEquality();

  @override
  bool equals(PagesRecord? e1, PagesRecord? e2) {
    return e1?.chapterID == e2?.chapterID &&
        e1?.content == e2?.content &&
        e1?.pageNumber == e2?.pageNumber;
  }

  @override
  int hash(PagesRecord? e) =>
      const ListEquality().hash([e?.chapterID, e?.content, e?.pageNumber]);

  @override
  bool isValidKey(Object? o) => o is PagesRecord;
}
