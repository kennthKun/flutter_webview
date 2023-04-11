abstract class CommonPage<T> {
  List<T>? content;
  String? pageable;
  bool? last;
  int? totalPages;
  int? totalElements;
  int? numberOfElements;
  bool? first;
  int? size;
  int? number;
  bool? empty;

  CommonPage(
      {this.content,
      this.pageable,
      this.last,
      this.totalPages,
      this.totalElements,
      this.numberOfElements,
      this.first,
      this.size,
      this.number,
      this.empty});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = content;
    data['pageable'] = pageable;
    data['last'] = last;
    data['totalPages'] = totalPages;
    data['totalElements'] = totalElements;
    data['numberOfElements'] = numberOfElements;
    data['first'] = first;
    data['size'] = size;
    data['number'] = number;
    data['empty'] = empty;
    return data;
  }
}
