import { LightningElement,track } from 'lwc';

export default class FirstCompOfProject extends LightningElement {

@track time="8:15 AM";
@track Greeting="Good Morning";
@track date="11/10/2022";

connectedCallback(){
 this.getTime();   
 setInterval(() => {
    this.getTime(); 
    console.log("Set interval call");
}, 1000);
}

getTime(){

const date=new Date();
const hours=date.getHours();
const minutes=date.getMinutes();

this.time=this.getHours(hours)+':'+this.getMinutes(minutes)+' '+this.getMidday(hours);
this.setGreeting(hours);

this.date=date.toDateString();

}
getHours(hours){
return hours===0 ? 12 : hours > 12 ? (hours-12) : hours;
}
getMidday(hours){
return hours >= 12 ? "PM" :"AM";
}
getMinutes(digit){
return digit < 10 ? "0" +digit : digit;
}
setGreeting(hours){
if(hours<12){
    this.Greeting= "Good Morning";
}
else if(hours>=12 && hours<17){
    this.Greeting="Good Afternoon";
}
else if(hours>17 && hours<24){
    this.Greeting="Good Evening";
}
}

}