/**
*
*   @author https://github.com/robert-strunk
*   @description SimpleTriggerArchitecture Handler. Calls the main entry method which dispatches the correct class.
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

        // main entry point
        this.execute(contextMode);
    }
}
