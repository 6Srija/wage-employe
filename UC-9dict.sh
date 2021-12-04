#!/bin/bash -x

isPartTime=1
isFullTime=2
maxRateInMonth=100
empRatePerHr=20
numOfWorkingDays=20
totalEmpHr=0
totalWorkingDays=0

declare -A dailyWages
function getWorkingHrs()
{
            case $1 in
                                $isFullTime)
                                      empHrs=8
                                      ;;
                                $isPartTime)
                                      empHrs=4
                                      ;;
                                      *)
                                      empHrs=0
                                      ;;
esac
}

function getEmpWages()
{
                     echo $(($1*$empRatePerHr))
}

while [[ $totalEmpHr -lt $maxRateInMonth
&& $totalWorkingDays -lt $numOfWorkingDays ]]
do
                     ((totalWorkingDays++))
                     empCheck=$((RANDOM%3))
                      getWorkingHrs $empCheck
                      totalEmpHr=$(($totalEmpHr+$empHrs))
                     dailyWages["$totalWorkingDays"]=$(($empHrs+$empRatePerHr))
done

totalSalary="$( getEmpWages $totalEmpHr )"
echo ${dailyWages[@]} #using array

echo ${!dailyWages[@]} #using dictionary
