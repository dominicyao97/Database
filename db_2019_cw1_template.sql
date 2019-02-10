ssh zy4417@shell1.doc.ic.ac.uk
psql -h db.doc.ic.ac.uk -d family_history -U lab -W
lab

-- Q1 returns (name,dod)
SELECT person.name, Mom.dod
FROM person  JOIN person AS Mom ON person.mother=Mom.name
WHERE (Mom.dod) IS NOT NULL
;
           name            |    dod     
---------------------------+------------
 Charles II                | 1669-09-10
 James II                  | 1669-09-10
 Mary (Princess Royal)     | 1669-09-10
 Mary II                   | 1671-04-10
 William III               | 1660-12-24
 Anne                      | 1671-04-10
 Palatine Sophia           | 1662-02-13
 George I                  | 1714-06-08
 George III                | 1772-02-08
 George IV                 | 1818-11-17
 Frederick (Prince)        | 1818-11-17
 William IV                | 1818-11-17
 Edward (Prince)           | 1818-11-17
 Victoria (Princess Royal) | 1901-01-22
 Edward VII                | 1901-01-22
 Alice (Princess)          | 1901-01-22
 Alfred                    | 1901-01-22
 Albert Victor             | 1925-11-20
 George V                  | 1925-11-20
 Alice (Princess Royal)    | 1925-11-20
 George VI                 | 1953-03-24
 Edward VIII               | 1953-03-24
 Elizabeth II              | 2002-03-30
 Margaret                  | 2002-03-30
 Philip                    | 1969-12-05
 Diana                     | 2004-06-03
 Henry                     | 1997-08-31
 William                   | 1997-08-31
(28 rows)


-- Q2 returns (name)
SELECT name
FROM person
WHERE gender='M'
EXCEPT
SELECT name
FROM person 
WHERE name IN (SELECT person.name FROM person JOIN person AS son ON person.name = son.father)
ORDER BY name
;

 Albert Victor
 Alec Douglas-Home
 Alfred
 Andrew
 Andrew Bonar Law
 Anthony Eden
 Arthur Balfour
 Benjamin Disraeli
 Charles II
 Clement Attlee
 Constantine I of Greece
 David Cameron
 David Lloyd George
 Earl of Rosebery
 Edward
 Edward Heath
 Edward VIII
 Frederick (Prince)
 George IV
 Gordon Brown
 Harold Macmillan
 Harold Wilson
 Henry
 Henry Campbell-Bannerman
 Herbert Henry Asquith
 James Callaghan
 John Major
 Lord Salisbury
 Neville Chamberlain
 Ramsay MacDonald
 Richard Cromwell
 Stanley Baldwin
 Tony Blair
 William
 William Ewart Gladstone
 William III
 William IV
 Winston Churchill
(38 rows)


-- Q3 returns (name)
SELECT name 
FROM person AS mother
WHERE NOT EXISTS (SELECT gender FROM person EXCEPT SELECT gender FROM person WHERE mother.name=person.mother)
ORDER BY name
;

       name        
-------------------
 Alexandra (Queen)
 Elizabeth II
 Henrietta Maria
 Victoria
(4 rows)


-- Q4 returns (name,father,mother)
SELECT name,father,mother
FROM person 
WHERE name IN (SELECT person.name FROM person AS sibling WHERE person.mother =sibling.mother AND person.father = sibling.father)
ORDER BY father


;

-- Q5 returns (name,popularity)

;

-- Q6 returns (name,forties,fifties,sixties)

;


-- Q7 returns (father,mother,child,born)

;

-- Q8 returns (father,mother,male)

;

