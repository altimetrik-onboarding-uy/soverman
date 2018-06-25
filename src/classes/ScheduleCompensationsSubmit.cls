global class ScheduleCompensationsSubmit implements Schedulable {
	global void execute(SchedulableContext sc) {
		SubmitPendingCompensations scom = new SubmitPendingCompensations();
		database.executebatch(scom, 200);
	}
}