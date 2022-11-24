global class IterableInBatch implements Iterator<Contact>{

  List<Contact> con {get;set;}
   Integer i {get;set;}
 
   global IterableInBatch(){
      con = [select Id,LastName From Contact LIMIT 5];
   i=0;
   }
     // This is Iterator interface hasNext() method, it will
  // return true if the list 'con' contains records else it
  // will return false;
 
   global boolean hasNext(){
      if(i>=con.size()){
     return false;
   }else{
     return true;
   }
   }
 
   // This is Iterator interface next() method, it will keep on
   // returning next element on the list until integer i reaches 5
   // and 5 in if loop is the size of the list returned by soql query
   // in above code
 
   global Contact next(){
     if(i==5){return null;}
  i++;
  return con[i-1];
   }
 
}