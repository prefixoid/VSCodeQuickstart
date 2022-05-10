@IsTest
public class TestUpdateSiblingContactsPhone {
	@isTest
    public static void TestAllSiblingsPhoneUpdated(){
        //Change Title for Konev Contact to 'Zver'
        //Expected:
        //--Phone for 3 Contacts {asdfq, Konev, Kathy Smith} is changed to '23456'
        
        //Prepare data
        //--Create Account
        //--Create several Contacts connected with this Account
        //Create Account
        Account acc1 = new Account(Name='Test Account');
        insert acc1;
        //Create several Contacts connected with this Account
        List<Contact> newSiblings =new List<Contact> {
            new Contact(LastName='Contact 1', AccountId=acc1.Id),
            new Contact(LastName='Contact 2', AccountId=acc1.Id),
            new Contact(LastName='Contact 3', AccountId=acc1.Id)
        };
        insert newSiblings;
        
        //Change Title for {Contact 1} to 'Zver'
        Contact con1 = [SELECT LastName, AccountId FROM Contact WHERE LastName='Contact 1' LIMIT 1];
        con1.Title = 'Zver'; //Works even without quering for Title
        update con1;
        
        //Phone for 3 Contacts is changed to '23456'
        List<Contact> siblings = [SELECT Name, Phone FROM Contact WHERE AccountId=:con1.AccountId];
        for(Contact contI : siblings){
        	System.assertEquals('23456', contI.Phone);
        }
    }
}