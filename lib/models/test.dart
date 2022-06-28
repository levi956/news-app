enum Method { POST, GET, DELETE }

class HttpCliet {
  Method? method;

  void makeRequest(Method method) {
    if (method == Method.POST) {
      // do a post request sha
    } else if (method == Method.GET) {
      // make a get request
    } else if (method == Method.DELETE) {
      // make a delete request
    }
  }
}


// so basically enums are just like status objects