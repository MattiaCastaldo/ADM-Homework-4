# 1) Which location has the maximum number of purchases been made?

cut -d',' -f 5 bank_transactions.csv | sort | uniq -c | sort -n | tail -n1

# 2) In the dataset provided, did females spend more than males, or vice versa?

cut -d',' -f 4,9 bank_transactions.csv | awk -F, '{arr[$4] += $9} END {if (arr["M"] > arr["F"]) {print("Males");} else{print("Females");}}' bank_transactions.csv

# 3) Report the customer with the highest average transaction amount in the dataset.

cut -d',' -f 2,9 bank_transactions.csv | awk -F, '{seen[$2]+=$9; n[$2]++} END{for (j in seen) printf "%8d %s\n", seen[j]/n[j], j}' bank_transactions.csv | sort -n | tail -n1
