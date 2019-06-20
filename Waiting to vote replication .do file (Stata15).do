
delimit ///

 /*number in line */
 

 reg   numberinline arrivalscount checkintime pc_pollworkers  afternoon1 evening1 ///
 majority_minority   ,cluster(filename)
 
 reg   numberinline arrivalscount checkintime  pc_pollworkers  afternoon1 evening1 ///
  majority_minority   i.county_ID ,cluster(filename) 
 
 
/*check-in time */

reg checkintime   afternoon1 evening1   pc_pollworkers  majority_minority epollbook /// 
samedayreg strict_photo ///
 majority_minority##strict_photo    ,cluster(filename)
  
reg checkintime   afternoon1 evening1      majority_minority  ///
  pc_pollworkers      i.county_ID,cluster(filename)
  



/*time to vote */
reg  timetovote     afternoon1 evening1 over65pct choices STV DRE_Machine  ///
 ,cluster(filename)  
 
reg  timetovote     afternoon1 evening1 over65pct     choices ///
 i.county_ID,cluster(filename)  
 


/* reneging */
gen numberinline1=numberinline
replace numberinline1=1.1 if numberinline<=1
gen ln_numberinline1=log(numberinline1)

nbreg renegingcount numberinline      afternoon1 evening1 /// 
     ///
    ,exposure(ln_numberinline1) cluster(filename)
  
nbreg renegingcount numberinline      afternoon1 evening1   ///
    i.county_ID, exposure(ln_numberinline1)cluster(filename)
 
nbreg renegingcount numberinline1     ,exposure(numberinline1) cluster(filename)
   margins, at((mean)numberinline1=(1(10)420.))
marginsplot, xlabel(1(10)420.) recast(line)  

 















