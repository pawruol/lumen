import {Component, OnInit, Inject} from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import {FormBuilder, FormGroup} from "@angular/forms";
import {UserService} from "../../../services/user.service";

export interface DialogData {
  animal: string;
  name: string;
}

@Component({
  selector: 'app-dialog-add-user-account',
  templateUrl: './dialog-add-user-account.component.html',
  styleUrls: ['./dialog-add-user-account.component.scss']
})
export class DialogAddUserAccountComponent {

  hide = true;
  dialogForm: FormGroup;

  constructor(
    public dialogRef: MatDialogRef<DialogAddUserAccountComponent>,
    public userService: UserService,
    public fb: FormBuilder,
    @Inject(MAT_DIALOG_DATA) public data: DialogData) {
    this.dialogForm = this.fb.group({
      username: [''],
      password: [''],
    });
  }


  submitDialog() {
    console.log(this.dialogForm.value);
    this.userService.addUserAccount(this.dialogForm.value).subscribe((res) => {
      if (res.data) {
        console.log(res.data);
        this.dialogRef.close();
        this.dialogForm.reset();
      }
    });
  }

  onNoClick(): void {
    this.dialogRef.close();
  }


}



