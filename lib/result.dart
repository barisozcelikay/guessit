// ignore: must_be_immutable

class Result {
  List<String> input;
  String result;
  String stringList;

  Result(List<String> inp, String res) {
    input = inp;
    result = res;
    stringList = input.join("");
  }
  @override
  String toString() {
    return 'Guessed:\t$stringList - Result:\t$result';
  }
}
