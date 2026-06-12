import { LightningElement } from 'lwc';
import getAllEmployees from '@salesforce/apex/shareEmployee.getAllEmployees';
import getAssetDetails from '@salesforce/apex/shareAsset.getAssetDetails';
export default class HelloWorld extends LightningElement {
    age=0;
    adult=false;
    

emps=[];
connectedCallback() {
    getAllEmployees().then(result =>{
    this.emps = result;
     console.log('All Employees',result)
    }).catch(err =>{
        console.log('Error in calling Employees', err);
    }); // You can perform initialization here if needed
}

asst=[];
connectedCallback() {
    getAssetDetails().then(result =>{
    this.asst = result;
     console.log('All Asset',result)
    }).catch(err =>{
        console.log('Error in calling Asset', err);
    }); // You can perform initialization here if needed
}
    enterAge=(e)=>{
        this.age=e.target.value;
        console.log(this.age);
    }

    checkAge=()=>{
        if(this.age>= 18){
            this.adult=true;
        } else{
            this.adult=false}                            
    }
Number1= 0;
Number2=0;
     enterNumber1=(e)=>{
        this.Number1=e.target.value;
        console.log(this.Number1);
     }

          enterNumber2=(e)=>{
        this.Number2=e.target.value;
        console.log(this.Number2);
     }
     addNumbers=()=>{
        let sum = Number(this.Number1)+Number(this.Number2);
        alert(sum);
     }

     names=['Spiderman','Ironman','Thor','Hulk','Captain America'];




}