/**
*
*   @description Example trigger implementation for a custom object named Transaction__c
*
* */
trigger ExampleTrigger on Transaction__c (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    new SimpleTriggerDispatcher(Trigger.operationType);
}