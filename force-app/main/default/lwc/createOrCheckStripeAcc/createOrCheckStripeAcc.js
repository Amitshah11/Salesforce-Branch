        import { LightningElement,api,wire,track} from 'lwc';
        import DisplayStripe from '@salesforce/apex/StripeAccountCeration.DisplayStripe';
        import checkstripe from '@salesforce/apex/StripeAccountCeration.checkstripe';
        import createStripeAcc from '@salesforce/apex/StripeAccountCeration.createStripeAcc';


        export default class CreateOrCheckStripeAcc extends LightningElement {
        @api recordId;
        @track stripename;
        @track stripeid;
        @track stripefound=true;


        @wire(checkstripe,{acid:'$recordId'})
        checkstripeaccount({data,error}){
        if(data==false){
        this.stripefound=false;
        }
        else if(data==true){
        this.stripefound=true;
        DisplayStripe({acid:this.recordId}).then((res)=>{
        console.log('name >'+res[1]);
        if(res[1]==undefined){
        this.stripefound=false;
        }
        else{
        this.stripeid=res[0];
        this.stripename=res[1];
        }
        });
        }     
        } 

        createstrip(){
        try{
        this.stripefound=false;
        createStripeAcc({acid:this.recordId}).then((res)=>{
        this.stripeid=res[0];
        this.stripename=res[1];

        }).then(()=>{
        this.stripefound=true;

        }).then(()=>{
        setTimeout(() => {
        eval("$A.get('e.force:refreshView').fire()");
        //window.location.reload();
        }, 1000);

        });
        }
        catch(error){
        console.log('Error in create stripe'+error);
        }  }
        }
