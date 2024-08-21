using { ust.prasanna.ananthu.db.masters } from '../db/employeeDataModel';

service employService @(path:'EmployeeService'){
    entity EmployeeSet as projection on masters.employee;
}