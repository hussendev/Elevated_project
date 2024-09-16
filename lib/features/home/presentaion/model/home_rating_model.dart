class HomeRatingModel {
  dynamic? _rate;
  int? _count;

  HomeRatingModel({dynamic? rate, int? count}) {
    if (rate != null) {
      this._rate = rate;
    }
    if (count != null) {
      this._count = count;
    }
  }

  dynamic? get rate => _rate;
  set rate(dynamic? rate) => _rate = rate;
  int? get count => _count;
  set count(int? count) => _count = count;

}