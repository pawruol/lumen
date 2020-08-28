import { Component } from '@angular/core';
import {ApiService} from './services/api.service';
import {Router} from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})

export class AppComponent {
  title = 'angular';
  userAccounts = [];

  constructor(private router: Router, private apiService: ApiService) { }

  ngOnInit(): void {
    this.getUserAccounts();
  }

  private getUserAccounts(): any {
    if (!window.localStorage.getItem('token')) {
      this.router.navigate(['login']);
      return;
    }
    this.apiService.getUserAccounts()
      .subscribe( data => {
        this.userAccounts = data.result;
      });
  }
}
