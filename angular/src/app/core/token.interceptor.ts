import {HttpEvent, HttpHandler, HttpInterceptor, HttpRequest} from '@angular/common/http';
import {Observable} from 'rxjs/internal/Observable';
import {Injectable} from '@angular/core';

@Injectable()
export class TokenInterceptor implements HttpInterceptor {

  intercept(request: HttpRequest<any>, next: HttpHandler): Observable<any> {
  const token = window.localStorage.getItem('token');
  const tokenType = window.localStorage.getItem('token_type');
  if (token) {
    request = request.clone({
      setHeaders: {
        Authorization: tokenType + ' ' + token
      }
    });
  }
  return next.handle(request);
}
}
