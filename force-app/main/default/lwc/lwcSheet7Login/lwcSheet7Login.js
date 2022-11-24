import { LightningElement,track,wire} from 'lwc';
import findcontact from "@salesforce/apex/Lwc7Class.findcontact";

export default class LwcSheet7Login extends LightningElement {
 user;
 pass;
 num;



enteruser(event){
    this.user=event.target.value;
}
enterpass(event){
    this.pass=event.target.value;
}

enter(){
    findcontact({username:this.user,password:this.pass})
    .then((result)=>{
       this.num=result;
       if(this.num===1){
        window.alert('Sign in success');
        }
        else if(this.num===0){
            window.alert('Sign in Failed');
        }
    });  
    }
}