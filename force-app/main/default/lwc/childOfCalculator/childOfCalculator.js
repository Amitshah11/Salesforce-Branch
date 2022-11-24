import { LightningElement,api } from 'lwc';
export default class ChildOfCalculator extends LightningElement {

@api output;

handleAdd(){
this.dispatchEvent(new CustomEvent("add"));
}
handleSub(){
    this.dispatchEvent(new CustomEvent("sub"));

}

}