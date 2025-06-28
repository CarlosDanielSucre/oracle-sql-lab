## Relational model: tables, columns, keys.

**What is a relational database?**  

A **relational database** is a type of database that organizes data into rows and columns, which collectively form a table where  
the data points are related to each other.

**Data** is typically structured across multiple **tables**, which can be joined together via a primary key or a foreign key.  
These unique identifiers demonstrate the different relationships which exist between tables, and these relationships are usually   
illustrated through different types of data models. Analysts use SQL queries to combine different data points and summarize   
business performance, allowing organizations to gain insights, optimize workflows, and identify new opportunities.

For example, imagine your company maintains a database table with customer information, which contains company data at the account  
level. There may also be a different table, which describes all the individual transactions that align to that account. Together,   
these tables can provide information about the different industries that purchase a specific software product.

The columns (or fields) for the customer table might be Customer ID, Company Name, Company Address, Industry etc.; the columns for   
a transaction table might be Transaction Date, Customer ID, Transaction Amount, Payment Method, etc. The tables can be joined toge-  
ther with the common Customer ID field. You can, therefore, query the table to produce valuable reports, such as a sales reports by  
industry or company, which can inform messaging to prospective clients.

Relational databases are also typically associated with transactional databases, which execute commands, or transactions, collectively.
A popular example that is used to illustrate this is a bank transfer. A defined amount is withdrawn from one account, and then it is 
deposited within another. The total amount of money is withdrawn and deposited, and this transaction cannot occur in any kind of 
partial sense. 

**Transactions have specific properties. Represented by the acronym, ACID, ACID properties are defined as:**

- **Atomicity**: All changes to data are performed as if they are a single operation. That is, all the changes are performed, or none of  
them are.
- **Consistency**: Data remains in a consistent state from state to finish, reinforcing data integrity.
- **Isolation**: The intermediate state of a transaction is not visible to other transactions, and as a result, transactions that run
concurrently appear to be serialized.
- **Durability**: After the successful completion of a transaction, changes to data persist and are not undone, even in the event of a
system failure.

These properties enable reliable transaction processing.

##### Reference: [IBM: Relational database](https://www.ibm.com/think/topics/relational-databases)

**What is tables**

**Tables** are database objects that contain all the data in a database. In tables, data is logically organized in a row-and-column   
format similar to a spreadsheet. Each row represents a unique record, and each column represents a field in the record. For example,  
a table that contains employee data for a company might contain a row for each employee and columns representing employee information   
such as employee number, name, address, job title, and home telephone number.

##### Reference: [Learn (Microsoft).](https://learn.microsoft.com/en-us/sql/relational-databases/tables/tables?view=sql-server-ver17)

**What is columns**

In a relational database, a column is a set of data values of a particular type, one value for each row of a table. A column may contain  
text values, numbers, or even pointers to files in the operating system. Columns typically contain simple types, DC some relational  
database systems allow columns to contain more complex data types, such as whole documents, images, or even video clips. A column can also  
be called an attribute.

Each row would provide a data value for each column and would then be understood as a single structured data value. For example, a database  
that represents company contact information might have the following columns: ID, Company Name, Address Line 1, Address Line 2, City, and   
Postal Code. More formally, a row is a tuple containing a specific value for each column, for example: (1234, 'Big Company Inc.', '123 East Example Street', '456 West Example Drive', 'Big City', 98765).

**What is keys**

A **key** serves as a unique identifier for each entity instance. Most entities in EF have a single key, which maps to the concept of a  
primary key in relational databases. Entities can have additional keys beyond the primary key.

##### Reference: [Learn (Microsoft).](https://learn.microsoft.com/en-us/ef/core/modeling/keys?tabs=data-annotations)
