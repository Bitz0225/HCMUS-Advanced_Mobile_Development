import 'package:equatable/equatable.dart';

abstract class BaseModel extends Equatable {
  const BaseModel();

  const BaseModel.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}