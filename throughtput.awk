BEGIN {
  recvdSize = 0
  startTime = 0
  stopTime = 0
  throughtput = 0
  Dt = 0
  bool = 0 
}
{
event = $1
time = $2
packetSize = $6
if (event =="r"){
   recvdSize += packetSize
   if (0==bool) {
   	startTime = time
   	bool = 1
   }
   stopTime = time
}
}
END {
	Dt = stopTime-startTime
	throughtput = (recvdSize*8)/Dt
	printf("Debit moyen[kbps] = %.2f\t\t  StartTime=%.2f\tStopTime=%.2f\n", throughtput, startTime,stopTime)
}
