// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubjectEntityAdapter extends TypeAdapter<SubjectEntity> {
  @override
  final int typeId = 1;

  @override
  SubjectEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
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

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubjectEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
