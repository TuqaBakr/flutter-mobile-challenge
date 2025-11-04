import 'package:json_annotation/json_annotation.dart';
import '../../typedefs.dart';
import 'models.dart';

part 'base_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, explicitToJson: true)
class BaseModel<T> {
  BaseModel({required this.model, this.meta, this.links, this.message = ''});
  final T? model;
  final MetaList? meta;
  final LinksList? links;
  final String message;
  factory BaseModel.fromJson(
      JSON json, T Function(dynamic itemJson) fromJsonT) {
    return _$BaseModelFromJson(json, fromJsonT);
  }
  JSON toJson(Object Function(T value) toJsonT) {
    final JSON json = _$BaseModelToJson(this, toJsonT);
    return json;
  }
}

class BaseModels {
  List list;

  factory BaseModels.fromJson(json, Function(dynamic itemJson) fromJsonT) {
    return _$BaseModelsFromJson(json, fromJsonT);
  }

  JSON toJson() => _$BaseModelsToJson(this);

  BaseModels({required this.list});
}

_$BaseModelsFromJson(json, fromJsonT) {
  return BaseModels(
    list: (json as List).map((e) {
      return fromJsonT(e as JSON);
    }).toList(),
  );
}

JSON _$BaseModelsToJson(BaseModels instance) => <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
    };
