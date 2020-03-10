// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubjectEntityAdapter extends TypeAdapter<SubjectEntity> {
  @override
  final typeId = 1;

  @override
  SubjectEntity read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubjectEntity(
      name: fields[0] as String,
    )..students = (fields[1] as HiveList)?.castHiveList();
  }

  @override
  void write(BinaryWriter writer, SubjectEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.students);
  }
}
