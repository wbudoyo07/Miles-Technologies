On your VM, perform the following:
 
 	1. Create the database we talked about in class - as a reminder, here is the description from the slides:
 	We would like a system to keep track of taverns.

Taverns needs a name, a location, and info about the

owner ( a user ). I would also like to have users of the

system (their name) and their roles (names) to start

and the role description. It should also keep track of

the number of floors it has and the names of rats that

live in the basement.
 
 	2. The system should also be able to track Supplies. Supplies should have a unit and a name for instance “ounce” and “strong ale” There should also be a way to track counts. That is to say- inventory. It should have a supply Id, tavern id, and the date it was updated as well as the current count for that supply. There also needs to be a way to show what the tavern received. This will include supply id, tavern id, cost, the amount received, and date.
(Note: Supplies table and tavern IDs must exist in their respective tables)

 
	3.Taverns should also provide services. Services should have a name (ie. Pool or Weapon sharpening). They should also have a status which should be a manageable list of values (stored in another table). For instance, ‘active’, ‘inactive’ but we may also want to add others down the line. Such as out of stock or discontinued. The database should also keep track of it with a sales table. This table will track service, guest, price, date purchased, amount purchased, and the tavern it belongs to


Seed all tables with at least 5-10 rows of data each. Add some repeated fields to show normalization