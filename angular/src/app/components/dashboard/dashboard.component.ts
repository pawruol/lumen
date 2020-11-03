import {Component, OnInit} from '@angular/core';

import {ActivatedRoute} from '@angular/router';
import {AuthService} from '../../services/auth.service';
import {User} from '../../models/user';
import {UserAccount} from "../../models/user-account";
import {UserService} from "../../services/user.service";
import {DialogAddUserAccountComponent} from "../dialogs/dialog-add-user-account/dialog-add-user-account.component";
import {MatDialog} from "@angular/material/dialog";

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
    private actRoute: ActivatedRoute,
    public dialog: MatDialog
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

  animal: string;
  name: string;

  openDialog(): void {
    const dialogRef = this.dialog.open(DialogAddUserAccountComponent, {
      minWidth: '750px',
      data: {name: this.name, animal: this.animal}
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
      this.animal = result;
    });
  }

}
