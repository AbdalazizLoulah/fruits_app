// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 0;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      id: fields[0] as int,
      name: fields[1] as String,
      nameEn: fields[2] as String,
      vendorId: fields[3] as int,
      categoryId: fields[4] as int,
      quantity: fields[5] as int,
      price: fields[6] as double,
      priceAfterDiscount: fields[7] as double,
      discount: fields[8] as int,
      img: fields[9] as String,
      details: fields[10] as String,
      detailsEn: fields[11] as String,
      unit: fields[12] as String,
      unitEn: fields[13] as String,
      categoryName: fields[14] as String,
      categoryNameEn: fields[15] as String,
      isFavorite: fields[16] as int,
      attributes: (fields[17] as List).cast<dynamic>(),
      productAttributesValues: (fields[18] as List).cast<dynamic>(),
      subUnits: (fields[19] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.nameEn)
      ..writeByte(3)
      ..write(obj.vendorId)
      ..writeByte(4)
      ..write(obj.categoryId)
      ..writeByte(5)
      ..write(obj.quantity)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.priceAfterDiscount)
      ..writeByte(8)
      ..write(obj.discount)
      ..writeByte(9)
      ..write(obj.img)
      ..writeByte(10)
      ..write(obj.details)
      ..writeByte(11)
      ..write(obj.detailsEn)
      ..writeByte(12)
      ..write(obj.unit)
      ..writeByte(13)
      ..write(obj.unitEn)
      ..writeByte(14)
      ..write(obj.categoryName)
      ..writeByte(15)
      ..write(obj.categoryNameEn)
      ..writeByte(16)
      ..write(obj.isFavorite)
      ..writeByte(17)
      ..write(obj.attributes)
      ..writeByte(18)
      ..write(obj.productAttributesValues)
      ..writeByte(19)
      ..write(obj.subUnits);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
