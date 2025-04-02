#!/bin/bash
if [[ -z $1 ]]
then
echo -e "\nPlease provide an element as an argument."
else
# confirm input
echo -e "You have entered $1"
# check input for entry in sql
#check if atomic number

#run psql query and insert all relevant variable into $ELEMENT_{}
#check if symbol
#run psql query and insert all relevant variable into $ELEMENT_{}

#check if name
#run psql query and insert all relevant variable into $ELEMENT_{}

echo "The element with atomic number $ELEMENT_ATOMIC_NUM is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELT celsius and a boiling point of $ELEMENT_BOIL celsius."
fi
