/**
*
*   @description An example of a Before Insert implementation for a custom object named Transaction__c
*
* */
public with sharing class Transactionc_BI implements SimpleTriggerArchitecture.Executable {

    public void execute(SimpleTriggerArchitecture.TriggerContext context){

        List<Transaction__c> newList = (List<Transaction__c>)context.getNewList();
    }
}
