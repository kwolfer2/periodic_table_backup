#!/bin/bash
if [[ -z $1 ]];
then
echo -e "Please provide an element as an argument."
exit
fi

INPUT=$1
# confirm input
# echo -e "\nYou have entered $INPUT"

#check if atomic number
if [[ $INPUT =~ ^[0-9]+$ ]]; then
QUERY_INPUT="e.atomic_number = $INPUT" 
#check if symbol
elif [[ $INPUT =~ ^[A-Za-z]{1,2}$ ]]; then
QUERY_INPUT="LOWER(e.symbol) = LOWER('$INPUT')"
#search by name
else QUERY_INPUT="LOWER(e.name) = LOWER('$INPUT')"
fi

#run psql query and insert all relevant variable into $ELEMENT_{}
RESULT=$(psql --username=freecodecamp --dbname=periodic_table --tuples-only --no-align -c "
SELECT e.atomic_number,
e.symbol,
e.name,
p.element_type,
p.atomic_mass,
p.melting_point_celsius,
p.boiling_point_celsius
FROM elements e JOIN properties p ON e.atomic_number = p.atomic_number
WHERE $QUERY_INPUT;"
)

if [[ -z $RESULT ]]; then
echo -e "I could not find that element in the database."
exit
fi

IFS="|" read -r ELEMENT_ATOMIC_NUM ELEMENT_SYMBOL ELEMENT_NAME ELEMENT_ELEMENT_TYPE ELEMENT_ATOMIC_MASS ELEMENT_MELT ELEMENT_BOIL <<< "$RESULT"
echo "The element with atomic number $ELEMENT_ATOMIC_NUM is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_ELEMENT_TYPE, with a mass of $ELEMENT_ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELT celsius and a boiling point of $ELEMENT_BOIL celsius."
