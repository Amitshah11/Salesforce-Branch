import { LightningElement, track, wire } from 'lwc';
import getBeer from '@salesforce/apex/BeerClass.getBeer';
import searchBeer from '@salesforce/apex/BeerClass.searchBeer';
import deleteBeer from '@salesforce/apex/BeerClass.deleteBeer';
import LightningConfirm from 'lightning/confirm';
import BeerImage from '@salesforce/resourceUrl/BeerPio';

import BeerName from '@salesforce/schema/Beer__c.Name'; 
import Price from '@salesforce/schema/Beer__c.Price__c';
import Alcohol from '@salesforce/schema/Beer__c.Alcohol__c';
import Company from '@salesforce/schema/Beer__c.Company_Name__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class BeerProject extends LightningElement {

    @track nameOfBeer = "";
    Beer = BeerImage;
    @track beerList = [];
    @track createNew = false;

    @wire(getBeer)
    getb({ data, error }) {
        if (data) {
            this.beerList = data;
        }
        else if (error) {
            console.log(error);
        }
    }

    Create() {
        this.createNew = true;
    }

    changeSearch(event) {
        this.nameOfBeer = event.target.value;

        searchBeer({ search: this.nameOfBeer }).then((result) => {
            this.beerList = result;
        });
    }

    fields = [BeerName, Price, Alcohol, Company];

    handleSubmit() {
        const event = new ShowToastEvent
            ({
                title: 'Beer Created/updated',
                message: 'Created',
                variant: 'Success'
            });
        this.dispatchEvent(event);

        setTimeout(() => {
            window.location.reload();
        }, 500);
    }

    Cancel() {
        this.createNew = false;
    }

   async  DeleteBook(event) {
        console.log('inisde in on click '+event.target.accessKey);
       let Bookid = event.target.accessKey;
        const result = await  LightningConfirm.open({ 
            message: 'Click OK to delete this Beer.',
            variant: 'header',
            label: 'Confirm your move...',
        }); 
        
            console.log(result+ ' insde in   111 -->  ' +typeof recordId+' --> '+Bookid);

            if(result===true){
            deleteBeer({lst:Bookid}).then(() => {
                if(result == true){
                     setTimeout(() => {
                    window.location.reload();
                }, 500);
                }
            }); 
            }       
    }
}