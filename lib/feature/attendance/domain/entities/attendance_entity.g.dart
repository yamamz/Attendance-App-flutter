// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttendanceEntityAdapter extends TypeAdapter<AttendanceEntity> {
  @override
  final typeId = 2;

  @override
  AttendanceEntity read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttendanceEntity(
      date: fields[0] as String,
      subjectEntity: fields[1] as SubjectEntity,
      attendanceEntries: (fields[2] as List)
          ?.map((dynamic e) => (e as Map)?.cast<dynamic, dynamic>())
          ?.toList(),
    );
  }

  @override
  void write(BinaryWriter writer, AttendanceEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.subjectEntity)
      ..writeByte(2)
      ..write(obj.attendanceEntries);
  }
}
