// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentEntityAdapter extends TypeAdapter<StudentEntity> {
  @override
  final int typeId = 0;

  @override
  StudentEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentEntity(
      fullname: fields[0] as String,
      address: fields[1] as String,
      age: fields[3] as int,
      mobile: fields[2] as String,
      email: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StudentEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.fullname)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.mobile)
      ..writeByte(3)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
