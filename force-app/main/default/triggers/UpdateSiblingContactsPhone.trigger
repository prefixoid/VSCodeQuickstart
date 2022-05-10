trigger UpdateSiblingContactsPhone on Contact (after insert, after update) {
    public static Boolean var;
    //on Contact update and insert
    //update all Contacts of parent Account with phone
    if (!Handler.active) return;
    
    List<Contact> siblingContacts = [SELECT Phone FROM Contact WHERE AccountId = :Trigger.new[0].AccountId];
    System.debug(siblingContacts);
    for(Contact cnt : siblingContacts){
        //cnt.Phone = Datetime.now().format('hh:mm:ss');
        cnt.Phone = Datetime.now().format('23456');
    }
    
    Handler.active = false;
    update siblingContacts;
}