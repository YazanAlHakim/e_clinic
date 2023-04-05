abstract class Failure {}

class ServerFailure extends Failure{}
class Error extends Failure{}
class OfflineFailure extends Failure{}