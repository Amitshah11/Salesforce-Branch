global class AsynchSchedule7and8 implements schedulable
{
    global void execute(SchedulableContext sc)
    {
      database.executebatch(new Asynch7());
       
    }
}

/* Every five minutes
String cron1='0 5 * * * ?';
system.schedule('Asynch7 schedule', cron1, new AsynchSchedule7());
*/