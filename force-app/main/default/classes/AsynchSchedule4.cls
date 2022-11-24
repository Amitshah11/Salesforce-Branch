global class AsynchSchedule4 implements schedulable
{
    global void execute(SchedulableContext sc)
    {
    Asynch4 b = new Asynch4(); 
      database.executebatch(b);
    }
}

/* Same for both queueable and batch
String cron1='0 0 0,6,12,18 * * ?';
system.schedule('asynch4 schedule', cron1, new AsynchSchedule4());

*/