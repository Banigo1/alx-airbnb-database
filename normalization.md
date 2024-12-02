## Normalization

Normalization is the process of organizing data to reduce redundancy and improve data integrity. It involves breaking down large tables into smaller, more focused tables and establishing relationships between them. This process helps to eliminate inconsistencies and anomalies that can arise when data is not organized properly. Normalization reduces data redundancy, prevents anomalies, and ensures data consistency. It simplifies data maintenance and improves database performance.

## Normalization Forms:

Normalization is typically achieved through a series of normal forms, each building upon the previous one:   

### First Normal Form (1NF):

Each cell in a table should contain only one value.   
No repeating groups of data within a table. 
  
### Second Normal Form (2NF):

The table must be in 1NF.
All non-prime attributes must be fully dependent on the primary key.
  
### Third Normal Form (3NF):

The table must be in 2NF.
No transitive dependencies; non-prime attributes must depend directly on the primary key, not on other non-prime attributes.
   
### Additional Normal Forms:

Boyce-Codd Normal Form (BCNF): A stricter version of 3NF, ensuring that every determinant is a candidate key.   
Fourth Normal Form (4NF): Addresses multivalued dependencies, where multiple independent multivalued attributes are associated with a single primary key.

### Fifth Normal Form (5NF): 

Addresses join dependencies, where a table can be decomposed into smaller tables without losing information.