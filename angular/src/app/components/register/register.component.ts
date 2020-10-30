import { Component, OnInit } from '@angular/core';
import { FormControl, FormBuilder, FormGroup, Validators } from "@angular/forms";
import { AuthService } from '../../services/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {

  hide = true;
  email = new FormControl('', [Validators.required, Validators.email]);
  Roles: any = ['Admin', 'Author', 'Reader'];
  signupForm: FormGroup;

  constructor(
    public fb: FormBuilder,
    public authService: AuthService,
    public router: Router
  ) {
    this.signupForm = this.fb.group({
      name: [''],
      email: [''],
      password: [''],
      password_confirmation: ['']
    });
  }

  ngOnInit(): void {
  }

  registerUser() {
    this.authService.signUp(this.signupForm.value).subscribe((res) => {
      if (res.data) {
        this.signupForm.reset();
        this.router.navigate(['login']);
      }
    });
  }

  getErrorMessage() {
    if (this.email.hasError('required')) {
      return 'You must enter a correct email';
    }

    return this.email.hasError('email') ? 'Not a valid email' : '';
  }

}
