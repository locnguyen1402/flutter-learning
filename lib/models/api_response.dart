class SuccessResponse<T> {
  T data;

  SuccessResponse({required this.data});
}

class PaginationSuccessResponse<T> {
  List<T> data;
  int totalItem;

  PaginationSuccessResponse({required this.data, required this.totalItem});
}
