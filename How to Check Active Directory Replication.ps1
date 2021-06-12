# Repadmin: How to Check Active Directory Replication

#Export the replication partner as well as the replication status
repadmin /showrepl |out-file c:\temp\showrepl.txt

#Export replication summray
repadmin /replsummary |out-file c:\temp\showreplSummary.txt

#List the Topology information
repadmin /bridgeheads * /verbose

#Inter Site Topology Generator Report
repadmin /istg * /verbose

#Displays calls that have not yet been answered
repadmin /bridgeheads  |out-file c:\temp\bridgeheads_topology1.txt





