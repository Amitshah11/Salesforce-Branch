trigger OpLineItemTr on Opportunity (after insert) {

    for(Opportunity op:trigger.new){
    OpportunityLineItem oli= new OpportunityLineItem();
    oli.opportunityid=op.id;
      oli.pricebookentryid=[select id from pricebookentry where product2.name='product1' ][0].id;
    oli.quantity=5;
        oli.totalprice=50000;
        insert oli;
        }
}