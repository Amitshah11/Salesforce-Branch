public class Asynchabort {

    public static void main(){
    List<CronTrigger> JOBIDLIST = [select id from CronTrigger];

for(CronTrigger job:JOBIDLIST )
{
   System.abortJob(job.id);
}
    }
}

/* for one job
CronTrigger JOBIDLIST = [select id from CronTrigger where CronJobDetail.Name='Batch schedule1'];

   System.abortJob(JOBIDLIST.id);
*/