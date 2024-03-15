class ItemModel{
  String? id ;
  String? name;
  String? dis;
  String? image;
  

  ItemModel({
    this.id,
    this.name,
    this.image,
    this.dis,
  });
  
  
   Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'dis': dis,
    };
  }

  factory ItemModel.fromJson(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] ?? '',
      name: map['name'] ??'',
      image:map['image'] ??'',
      dis:map['dis'] ??'',
    );
  }
  }

 
  


