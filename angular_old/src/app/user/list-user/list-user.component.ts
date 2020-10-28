import {Component, OnInit, Inject, ViewChild} from '@angular/core';
import {Router} from "@angular/router";
import {User} from "../../models/user.model";
import {ApiService} from "../../services/api.service";
import { moveItemInArray } from '@angular/cdk/drag-drop';

import { MatTableDataSource } from '@angular/material/table';
import { MatPaginator } from '@angular/material/paginator';

@Component({
  selector: 'app-list-user',
  templateUrl: './list-user.component.html',
  styleUrls: ['./list-user.component.scss']
})
export class ListUserComponent implements OnInit {

  data = [];
  displayColumns: string[] = ['id', 'job', 'progress', 'status', 'result', 'created_at', 'updated_at'];
  dataSource = new MatTableDataSource<any>();


  selectedUserAccount = window.localStorage.getItem('selectedUserAccount');

  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;

  constructor(private router: Router, private apiService: ApiService) { }

  ngOnInit(): void {
    this.getData();

    this.dataSource.paginator = this.paginator;

    console.log(this.data);
    console.log(this.dataSource.data );
  }

  private getData(): any {
    if (!window.localStorage.getItem('token')) {
      this.router.navigate(['login']);
      return;
    }
    this.apiService.getUserAccountWorkers(this.selectedUserAccount)
      .subscribe( data => {
        this.data = data.result;
        this.dataSource.data = data.result;
      });
  }

  sortData($event) {
    const sortId = $event.active;
    const sortDirection = $event.direction;
    if ('asc' == sortDirection) {
      this.dataSource.data = this.data.slice().sort(
        (a, b) => a[sortId] > b[sortId] ? -1 : a[sortId] < b[sortId] ? 1 : 0
      );
    } else {
      this.dataSource.data = this.data.slice().sort(
        (a, b) => a[sortId] < b[sortId] ? -1 : a[sortId] > b[sortId] ? 1 : 0
      );
    }
  }

  startWorker(worker: string) {
    this.apiService.startWorker(worker, this.selectedUserAccount)
      .subscribe( data => {
        this.data = data.result;
        this.dataSource.data = data.result;
      });
  }

  openFilter(col: string) {
    document.getElementById(col + '-filter').removeAttribute('hidden');
  }

  closeFilter(col: string) {
    document.getElementById(col + '-filter').setAttribute('hidden', 'true');
  }

  filterData(col: string, filtertext: string) {
    if (filtertext.trim() != '') {
      this.dataSource.data = this.data.slice().filter(
        (element) => JSON.stringify(element[col]).indexOf(filtertext) > -1
      );
    }
  }

  reorderColumns($event) {
    const fromIndex:number = this.displayColumns.indexOf($event.previousContainer.id);
    const toIndex:number = this.displayColumns.indexOf($event.container.id);
    moveItemInArray(this.displayColumns, fromIndex, toIndex);
  }








  deleteUser(user: User): void {
    this.apiService.deleteUser(user.id)
      .subscribe( data => {
        this.data = this.data.filter(u => u !== user);
      })
  };

  editUser(user: User): void {
    window.localStorage.removeItem("editUserId");
    window.localStorage.setItem("editUserId", user.id.toString());
    this.router.navigate(['edit-user']);
  };

  addUser(): void {
    this.router.navigate(['add-user']);
  };
}
