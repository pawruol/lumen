import {Component, OnInit} from '@angular/core';

import {ActivatedRoute} from '@angular/router';
import {AuthService} from '../../services/auth.service';
import {User} from '../../models/user';
import {UserAccount} from "../../models/user-account";
import {UserService} from "../../services/user.service";

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {

  currentUser: User;
  currentUserAccounts: UserAccount[];

  constructor(
    public authService: AuthService,
    public userService: UserService,
    private actRoute: ActivatedRoute
  ) {
    // let id = this.actRoute.snapshot.paramMap.get('id');
    this.authService.getUserProfile().subscribe(res => {
      this.currentUser = res.data;
    });

    this.userService.getUserAccounts().subscribe(res => {
      this.currentUserAccounts = res.data;
    });
  }

  ngOnInit(): void {
  }

}
