public class Wrapper{
          public List<Employee> emlist= new List<Employee>();

    public void addEmp(String Ename, integer sal){
        
        Employee em= new Employee(Ename,sal);    
        
        emlist.add(em);  
    }
    public class Employee{
        integer salary;
        String name;
        Employee(String name,integer salary){
            this.salary=salary;
            this.name=name;
        } 
    }
    public void print()
    {
        for(Employee e:emlist)
        {
            system.debug(e);
        }
    }     
}