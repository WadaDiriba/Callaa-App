class ApiExceptions implements Exception{
  final String message;
  final int? statusCode;
  ApiExceptions(
    this.message,
  {
    this.statusCode,
    });

  @override
  String toString()=> 'ApiExceptions: $message';
  }

  class BadRequestException extends ApiExceptions{
    BadRequestException(String message):super(message, statusCode:400);
  }
  class UnauthorizedException extends ApiExceptions{

    UnauthorizedException(String message):super(message,
     statusCode:401);
  }
  class ForbiddenException extends ApiExceptions{

    ForbiddenException(String message):super(message, statusCode:403);
   }
   
   class NotFoundException extends ApiExceptions{
    NotFoundException(String message):super(message, statusCode:404);
   }
   class ServerException extends ApiExceptions{

    ServerException(String message):super(message, statusCode:500);

    }

    class NetwrokException extends ApiExceptions{
      
      NetwrokException(String message):super(message);
}