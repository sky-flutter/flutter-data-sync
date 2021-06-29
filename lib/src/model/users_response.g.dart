// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsersResponseAdapter extends TypeAdapter<UsersResponse> {
  @override
  final int typeId = 1;

  @override
  UsersResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UsersResponse(
      id: fields[1] as int,
      email: fields[2] as String,
      firstName: fields[3] as String,
      lastName: fields[4] as String,
      avatar: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UsersResponse obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.firstName)
      ..writeByte(4)
      ..write(obj.lastName)
      ..writeByte(5)
      ..write(obj.avatar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsersResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
