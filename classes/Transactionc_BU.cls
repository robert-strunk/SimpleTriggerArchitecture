/**
*
*   @description An example of an Before Update implementation for a custom object named Transaction__c
*
* */
public with sharing class Transactionc_BU extends SimpleTriggerArchitecture {

    public override void execute(SimpleTriggerArchitecture.TriggerContext context){

        Map<Id, Transaction__c> newMap = (Map<Id, Transaction__c>)context.getNewMap();
    }
}