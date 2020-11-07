import {Injectable} from "@angular/core";
import {HttpClient, HttpErrorResponse, HttpHeaders} from "@angular/common/http";
import {Router} from "@angular/router";
import {Observable, throwError} from "rxjs";
import {catchError, map} from "rxjs/operators";


@Injectable({
  providedIn:'root'
})

export class InstagramService{

  endpoint: string = 'http://lumen/api';
  headers = new HttpHeaders().set('Content-Type', 'application/json');

  constructor( private http: HttpClient,
               public router: Router) {
  }

/// getAccountByUsername
  getAccountByUsername(username): Observable<any> {
    let api = `${this.endpoint}/instagram/get-account-by-username`;
    return this.http.get(api, { headers: this.headers, params: { username: username } }).pipe(
      map((res: Response) => {
        return res || {};
      }),
      catchError(this.handleError)
    );
  }

  getAccountPostsByUsername(username, count): Observable<any> {
    let api = `${this.endpoint}/instagram/get-account-posts-by-username`;
    return this.http.get(api, { headers: this.headers, params: { username: username, count: count } }).pipe(
      map((res: Response) => {
        return res || {};
      }),
      catchError(this.handleError)
    );
  }

  // Error
  handleError(error: HttpErrorResponse) {
    let msg = '';
    if (error.error instanceof ErrorEvent) {
      // client-side error
      msg = error.error.message;
    } else {
      // server-side error
      msg = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }
    return throwError(msg);
  }

}
