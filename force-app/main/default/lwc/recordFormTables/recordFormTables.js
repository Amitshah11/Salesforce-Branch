import { LightningElement,track,wire } from 'lwc';
        import { ShowToastEvent } from 'lightning/platformShowToastEvent';
        import contactTable from '@salesforce/apex/DataTableEdit.contactTable';
        import updateContact from '@salesforce/apex/DataTableEdit.updateContact';
        
        export default class RecordFormTables extends LightningElement {

// For Record Edit Form
        conId;
        handleSuccess(event) {
                this.conId = event.detail.Id;
            }

        update(){    
                const event = new ShowToastEvent
                    ({
                        title: 'Contact Created/updated',
                        message:'Updated',
                        variant: 'Success'
                    });
                this.dispatchEvent(event);
            }

// For Record Form

        fields=['FirstName','LastName','Email','AccountId'];
        handleSubmit(){
                window.alert('Contact created');
            }


// For Editable Datatable

    @track columns=[
        {label:'ID', fieldName:'Id', editable:true},
        {label:'First Name', fieldName:'FirstName', editable:true},
        {label:'Last Name', fieldName:'LastName', editable:true}
        ];

        @track saveDraft=[];
        @track  data=[];        


        @wire(contactTable)
        printAccdata({data,error}){
        if(data){
        this.data=data;
        }
        else if(error){
            window.alert("Error");
        }
        }

        submit(event){
            
            const updatedFields = event.detail.draftValues;
            updateContact({conid:updatedFields}).then(results=>{
            this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Contact updated',
                        variant: 'success'
                })
                );  
        });
        }
        
    fstname;
    lstname;
        
   fname(event){
     this.fstname=event.target.value;
   }
 lname(event){
    this.lstname=event.target.value;
 }

 @track itemList = [{}];     


 addmore(){
    var newItem = [{ FirstName: this.fstname,LastName:this.lstname }];
        this.itemList = this.itemList.concat(newItem);
 }
      
        submitall(){
            var newItem1 = [{ FirstName: this.fstname,LastName:this.lstname }];
        this.itemList = this.itemList.concat(newItem1);
            var isVal = true;
            this.template.querySelectorAll('lightning-input-field').forEach(element => {
                isVal = isVal && element.reportValidity();
            });
            if (isVal) {
                this.template.querySelectorAll('lightning-record-form').forEach(element => {
                    element.submit();           
                });
            }
            window.alert("contact submitted");

        }
}