import { Component, OnInit } from '@angular/core';

import { ActivatedRoute } from '@angular/router';
import { AuthService } from '../../services/auth.service';
import { User } from '../../models/user';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {

  currentUser: User;

  constructor(
    public authService: AuthService,
    private actRoute: ActivatedRoute
  ) {
    // let id = this.actRoute.snapshot.paramMap.get('id');
    this.authService.getUserProfile().subscribe(res => {
      this.currentUser = res.data;
    });
  }

  ngOnInit(): void {
  }

}
