import { LightningElement } from 'lwc';
import getEmployee from '@salesforce/apex/checkEmployee.getEmployee';
import getEmployeeAsset from '@salesforce/apex/assignedAssets.getEmployeeAsset';
export default class CheckEmployee extends LightningElement {
    employeeName="";
    assets =[];

    writeName=(e)=>{
        this.employeeName = e.target.value;
    }

    getAssets =()=>{
        console.log("Check")
        getEmployeeAsset({empName:this.employeeName})
        .then(result =>{
            this.assets = result;
            console.log("Assets",result);
        })
    }
    CheckEmployeeExists=()=>{
        getEmployee({EmployeeName:this.employeeName}).then(result=>{
            if(result){
                this.exist = true;
            } else { 
                this.exist = false;
            }
        })
        }
    }