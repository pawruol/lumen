import { Component, OnInit } from '@angular/core';
import {ActivatedRoute, Router} from "@angular/router";
import { InstagramService } from '../../services/instagram.service';

import {Observable} from "rxjs";
import {InstagramAccount} from "../../models/instagram-account";

@Component({
  selector: 'app-account',
  templateUrl: './account.component.html',
  styleUrls: ['./account.component.scss']
})
export class AccountComponent implements OnInit {

  currentUserInstagram: InstagramAccount;
  accountUsername = "initial value";


  constructor(private route: ActivatedRoute,
              private router: Router,
              private instagramService: InstagramService) {
    this.route.paramMap.subscribe(params => {
      this.accountUsername = params.get("username");
    });

    this.instagramService.getAccountByUsername(this.accountUsername).subscribe(res => {
      this.currentUserInstagram = res.data;
    });
  }

  ngOnInit(): void {

  }

}
