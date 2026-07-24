abstract class Failure {
 final String error;
 final int? statusCode;
  Failure(this.error,{this.statusCode});
}

class NetworkFailure extends Failure{
  NetworkFailure(super.error,{super.statusCode});

}
class ServerFailure extends Failure{
  ServerFailure(super.error,{super.statusCode});
}