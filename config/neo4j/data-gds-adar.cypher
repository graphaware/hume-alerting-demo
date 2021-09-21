CREATE
 (zhen:Person {name: 'Zhen'}),
 (praveena:Person {name: 'Praveena'}),
 (michael:Person {name: 'Michael'}),
 (arya:Person {name: 'Arya'}),
 (karin:Person {name: 'Karin'}),

 (zhen)-[:FRIENDS]->(arya),
 (zhen)-[:FRIENDS]->(praveena),
 (praveena)-[:WORKS_WITH]->(karin),
 (praveena)-[:FRIENDS]->(michael),
 (michael)-[:WORKS_WITH]->(karin),
 (arya)-[:FRIENDS]->(karin)