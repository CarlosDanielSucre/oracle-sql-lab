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
