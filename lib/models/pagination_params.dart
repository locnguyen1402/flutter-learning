class PaginationParams {
  int? pageSize;

  int pageNum;
  set page(int val) {
    pageNum = val;
  }

  PaginationParams({required this.pageNum, this.pageSize = 10});
}
