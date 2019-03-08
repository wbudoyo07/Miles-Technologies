 
1. Alter a table in some way after creating it.
2. Make sure the top of your script contains DROP TABLE IF EXISTS <Tablename> for all databases in an order that allows you to drop all tables without error. (See session 1 slide 11 if you have questions)
 
3. There should be a way to track guests- their names, notes about them, birthdays, cakedays, and status - which can be any kind. Such as sick, fine, hangry, raging, placid. The guests should have classes and should have levels related to them. Ex. lvl 2 mage, lvl 3 fighter. ((linking table)). Also I no longer want to track rats.

 
4. After doing this, add Primary Keys and foreign key relationships to all tables. Make sure to use at least one alter statement to add foreign and primary keys after table creation, and at least one instance of creating the table with the foreign and primary keys.