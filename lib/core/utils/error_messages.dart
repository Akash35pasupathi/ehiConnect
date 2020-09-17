class ErrorMessage{

  static const SOCKET_EXCEPTION = 1000;

  String getErrorMessage(int type){
    switch(type){
      case 200:
        return "Something went wrong!";
        break;
      case 404:
        return "Something went wrong!";
        break;
      case 1000:
        return "Please check your network connection!";
        break;
      default:
        return "Something went wrong!";
    }
  }

}