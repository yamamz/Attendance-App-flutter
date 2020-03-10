// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentEntityAdapter extends TypeAdapter<StudentEntity> {
  @override
  final typeId = 0;

  @override
  StudentEntity read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
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
}
