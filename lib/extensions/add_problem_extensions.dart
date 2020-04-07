import 'package:crowdleague/models/actions/add_problem.dart';
import 'package:crowdleague/models/problem.dart';

extension AddProblemFuture on AddProblem {
  static Future<AddProblem> from(
      dynamic error, StackTrace trace, ProblemTypeEnum type) {
    return Future.value(AddProblem(
      (b) => b
        ..problem.replace(Problem((b) => b
          ..message = error.toString()
          ..trace = trace.toString()
          ..type = type)),
    ));
  }
}

extension AddProblemObject on AddProblem {
  static AddProblem from(
      dynamic error, StackTrace trace, ProblemTypeEnum type) {
    return AddProblem(
      (b) => b
        ..problem.replace(Problem((b) => b
          ..message = error.toString()
          ..trace = trace.toString()
          ..type = type)),
    );
  }
}
