import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import {User} from '../models/user.model';
import {Observable} from 'rxjs/index';
import {ApiResponse} from '../models/api.response';

@Injectable()
export class ApiService {

  constructor(private http: HttpClient) { }
  baseUrl = 'http://lumen/';
  apiUrl = 'http://lumen/api/';

  login(loginPayload): Observable<ApiResponse> {
    return this.http.post<ApiResponse>(this.apiUrl + 'login', loginPayload);
  }

  createUser(user: User): Observable<ApiResponse> {
    return this.http.post<ApiResponse>(this.apiUrl + 'register', user);
  }

  startWorker(worker: string, userAccount): Observable<ApiResponse> {
      return this.http.post<ApiResponse>(this.apiUrl + 'instagram/' + worker, {username: 'instagram', userAccount: userAccount});
  }

  getUsers() : Observable<ApiResponse> {
    return this.http.get<ApiResponse>(this.apiUrl + 'users');
  }

  getUserAccountWorkers(userAccount) : Observable<ApiResponse> {
    return this.http.get<ApiResponse>(this.apiUrl + 'user/accounts/' + userAccount + '/workers');
  }

  getUserWorkers() : Observable<ApiResponse> {
    return this.http.get<ApiResponse>(this.apiUrl + 'user/workers');
  }

  getUserAccounts() : Observable<ApiResponse> {
    return this.http.get<ApiResponse>(this.apiUrl + 'user/accounts');
  }

  getUserById(id: number): Observable<ApiResponse> {
    return this.http.get<ApiResponse>(this.apiUrl + 'users/' + id);
  }

  updateUser(user: User): Observable<ApiResponse> {
    return this.http.put<ApiResponse>(this.baseUrl + user.id, user);
  }

  deleteUser(id: number): Observable<ApiResponse> {
    return this.http.delete<ApiResponse>(this.baseUrl + id);
  }
}
