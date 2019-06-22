/**
*
*   @author https://github.com/robert-strunk
*   @description Serves as the dispatcher for all triggers that utilize this architecture.
*   @date 2019-06-22
*
* */
public with sharing class SimpleTriggerDispatcher extends SimpleTriggerArchitecture {

    /**
    *
    *   @description Constructor with trigger context input that gets routed to the appropriate class
    *   @param contextMode The Trigger operation for the executing trigger
    *
    * */
    public SimpleTriggerDispatcher(System.TriggerOperation contextMode) {

        // main entry point execution (non-virtual execute)
        this.execute(contextMode);
    }
}