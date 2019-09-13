/**
*
*   @author https://github.com/robert-strunk
*   @description Base class for SimpleTriggerArchitecture
*   @date 2019-06-22
*
* */
public virtual with sharing class SimpleTriggerArchitecture {

    protected TriggerContext context;

    // mappings of classname suffix to trigger execution context
    protected final Map<System.TriggerOperation, String> classSuffixesByTriggerContext = new Map<System.TriggerOperation, String>{
        System.TriggerOperation.BEFORE_INSERT   => '_BI',
        System.TriggerOperation.BEFORE_UPDATE   => '_BU',
        System.TriggerOperation.BEFORE_DELETE   => '_BD',
        System.TriggerOperation.AFTER_INSERT    => '_AI',
        System.TriggerOperation.AFTER_UPDATE    => '_AU',
        System.TriggerOperation.AFTER_DELETE    => '_AD',
        System.TriggerOperation.AFTER_UNDELETE  => '_AUD'
    };

    /**
    *
    *   @description Main execution / entry point for SimpleTriggerArchitecture. Dispatcher
    *   @param contextMode System.TriggerOperation from the executing trigger
    *
    * */
    protected void execute(System.TriggerOperation operation){

        // determine what SObject trigger is executing
        SObjectType sObjType = trigger.new != null ? trigger.new.getSObjectType() : trigger.old.getSObjectType();

        // encapsulate the trigger operation
        context = new TriggerContext(operation, sObjType);

        // generates the name of the Apex class that should be invoked for the given trigger execution context
        String className = buildClassName(sObjType, context);

        // instantiate the class
        SimpleTriggerArchitecture.Executable instance = (SimpleTriggerArchitecture.Executable)(Type.forName(className)).newInstance();

        // invoke the logic
        instance.execute(context);
    }

    /**
    *
    *   @description Determines the correct apex class that holds the logic specific to the execution context
    *   @param sObjType SObjectType of the trigger execution context
    *   @param context The encapsulated System.TriggerOperation
    *
    * */
    private String buildClassName(SObjectType sObjType, TriggerContext context){
        return String.valueOf(sObjType).replace('__','') + classSuffixesByTriggerContext.get(context.mode);
    }

    /**
    *
    *   @description Encapsulates the System.TriggerOperation enumeration and binds the
    *   SObjectType and trigger data for reference by subclasses
    *
    * */
    public class TriggerContext {

        System.TriggerOperation mode;
        SObjectType sObjType;
        List<SObject> newList;
        List<SObject> oldList;
        Map<Id, SObject> newMap;
        Map<Id, SObject> oldMap;

        public TriggerContext(System.TriggerOperation modeParam, SObjectType sObjType){

            this.mode = modeParam;
            this.sObjType = sObjType;
            this.newList = Trigger.new;
            this.oldList = Trigger.old;
            this.newMap = Trigger.newMap;
            this.oldMap = Trigger.oldMap;
        }

        public Map<Id, SObject> getNewMap(){
            System.debug('getNewMap invoked');
            return this.newMap;
        }

        public Map<Id, SObject> getOldMap(){
            System.debug('getOldMap invoked');
            return this.oldMap;
        }

        public List<SObject> getNewList(){
            System.debug('getNewList invoked');
            return this.newList;
        }

        public List<SObject> getOldList(){
            System.debug('getOldList invoked');
            return this.oldList;
        }
    }

    /**
    *
    *   @description Behavioral Hook/plugin for SimpleTriggerArchitecture
    *
    * */
    public interface Executable {

        /**
        *
        *   @description Executes the contextual logic.
        *   @param context The encapsulated trigger context
        *
        * */
        void execute(TriggerContext context);
    }

    // throw as desired
    public class TRIGGER_EXCEPTION extends System.Exception {}
}
