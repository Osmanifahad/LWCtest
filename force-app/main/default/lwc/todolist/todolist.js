import { LightningElement } from 'lwc';
import getTodos from "@salesforce/apex/callfromjson.getTodos";

export default class Todolist extends LightningElement {

    todos=[];
    
    connectedCallback(){
        getTodos().then (result =>
        {this.todos=result;
            console.log(result);
            
        })
    }
}

