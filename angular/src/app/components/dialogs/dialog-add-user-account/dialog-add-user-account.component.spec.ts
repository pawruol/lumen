import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DialogAddUserAccountComponent } from './dialog-add-user-account.component';

describe('DialogAddUserAccountComponent', () => {
  let component: DialogAddUserAccountComponent;
  let fixture: ComponentFixture<DialogAddUserAccountComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DialogAddUserAccountComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DialogAddUserAccountComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
