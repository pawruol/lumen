import { Component } from '@angular/core';
import {ApiService} from './services/api.service';
import {Router} from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})

export class AppComponent {
  title = 'angular_old';
  userAccounts = [];
  userWorkers = [];
  selectedUserAccount = window.localStorage.getItem('selectedUserAccount');

  constructor(private router: Router, private apiService: ApiService) { }

  ngOnInit(): void {
    this.getUserAccounts();
    this.getUserWorkers();
  }

  public setUserAccount(userAccountId): any {
    window.localStorage.setItem('selectedUserAccount', userAccountId);
    window.location.reload();
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

  private getUserWorkers(): any {
    if (!window.localStorage.getItem('token')) {
      this.router.navigate(['login']);
      return;
    }
    this.apiService.getUserWorkers()
      .subscribe( data => {
        this.userWorkers = data.result;
      });
  }

}
