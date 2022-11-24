import { LightningElement,wire,track } from 'lwc';
import ObjectApiNames from '@salesforce/apex/Lwc4Class.ObjectApiNames';
import AllNameList from '@salesforce/apex/Lwc4Class.AllNameList';
import AllNameType from '@salesforce/apex/Lwc4Class.AllNameType';



export default class LwcSheet4 extends LightningElement {

    @track objList=[];
    @track fieldList=[];
    @track objN;
@track fieldName;
@track fieldType;

@wire(ObjectApiNames)
showObjects({data,error}){
    if(data){
this.objList=data;
}
if(error){
    window.alert('Error');
}
}

ShowFields(event){
this.objN=event.target.value;
    AllNameList({ObjName:this.objN})
    .then((result)=>{
        this.fieldList=result;
    });
}

ShowFieldType(event){
    this.fieldName=event.target.value;
    AllNameType({objtype:this.fieldName})
    .then((result)=>{
        this.fieldType=result;
        console.log(this.fieldType);
    });
}
}