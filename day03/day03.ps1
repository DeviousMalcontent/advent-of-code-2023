[string[]]$arrayFromFile = Get-Content -Path 'input'

$ArrayOfNumbers = New-Object System.Collections.Generic.List[System.Object]
$partNumberValue = ([regex]'(\d+)').Matches($arrayFromFile).Value
$partNumberIndex = ([regex]'(\d+)').Matches($arrayFromFile).Index
$partNumberLength = ([regex]'(\d+)').Matches($arrayFromFile).Length

$ArrayOfSymbols = New-Object System.Collections.Generic.List[System.Object]
$symbolValue = ([regex]'([@*/&#%+=$-])').Matches($arrayFromFile).Value
$symbolIndex = ([regex]'([@*/&#%+=$-])').Matches($arrayFromFile).Index
$symbolLength = ([regex]'([@*/&#%+=$-])').Matches($arrayFromFile).Length

#echo $symbolIndex
#echo "------------------------------------------"

for ($i=0; $i -lt $arrayFromFile.Length; $i++) {
	$thisPartNumber = [PSCustomObject]@{
		rows = ($i-1)..($i+1);
		columns = ($partNumberIndex[$i].Index-1)..($partNumberIndex[$i].Index + $partNumberLength.Length);
		value = $partNumberValue[$i] -as [int];
	}
	$ArrayOfNumbers.Add($thisPartNumber);
}

for ($i=0; $i -lt $arrayFromFile.Length; $i++) {
	$thisSymbol = [PSCustomObject]@{
		row = $i -as [int];
		column = ($symbolIndex[$i]); #Distance from last new line!
		value = $symbolValue[$i];
	}
	$ArrayOfSymbols.Add($thisSymbol);
	
	#echo $symbolValue[$i],$symbolIndex[$i],$symbolLength[$i];
	#echo "------------------------------------------"
}

foreach($Symbol in $ArrayOfNumbers) {echo $Symbol.columns}


#	echo $ArrayOfNumbers.columns
#	#echo "-"
#	#echo $ArrayOfNumbers.rows, ",", $ArrayOfNumbers.columns;
#	echo "------------------------------------------"
#
#foreach($Symbol in $ArrayOfSymbols){
#	#echo $ArrayOfNumbers.columns
#	#echo "-"
#	#echo $Symbol.column
#	#echo "------------------------------------------"
#	if($Symbol.row -in $ArrayOfNumbers.rows -and $Symbol.column -in $ArrayOfNumbers.columns){
#		echo 1
#	}
#	#echo $ArrayOfNumbers.value
#}


#$thisPartNumber = New-Object -TypeName thisPartNumber
#$thisPartNumber | Add-Member -MemberType NoteProperty -Name rows -Value $partNumberLength[$i];
#$thisPartNumber | Add-Member -MemberType NoteProperty -Name columns -Value $partNumberIndex[$i];
#$thisPartNumber | Add-Member -MemberType NoteProperty -Name value -Value $partNumberValue[$i];

#echo $partNumberValue[$i],$partNumberIndex[$i],$partNumberLength[$i];
#echo "------------------------------------------"

#$thisPartNumber = New-Object -TypeName thisPartNumber
#$thisPartNumber | Add-Member -MemberType NoteProperty -Name rows -Value 3
#$thisPartNumber | Add-Member -MemberType NoteProperty -Name columns -Value 0
#$thisPartNumber | Add-Member -MemberType NoteProperty -Name value -Value 0
#
###$ArrayOfNumbers = New-Object System.Collections.Generic.List[System.Object]
###$ArrayOfSymbols = New-Object System.Collections.Generic.List[System.Object]
#
#for ($i=0; $i -lt $arrayFromFile.Length; $i++) {
#	$partsList = $arrayFromFile[$i];
#	#{$_ -eq "e" -or $_ -eq "p"}
#	
#	#look for numbers
#	if ($partsList -AllMatches '^(\d+)') {
#		echo $Matches
#		#for ($j=0; $j -lt $Matches.Length; $j++) {
#		#echo $Matches.$j;
#		#}
#	  #$thisNumber.row =
#	}
#	
#	#echo $partsList
#	
#	echo "------------------------------------------"
#	#if ($i -gt 0) {echo $arrayFromFile[$i-1]}
#	#echo $partsList
#	#if ($i -lt $arrayFromFile.Length) {echo $arrayFromFile[$i+1]}
#	#echo "------------------------------------------"
#	
#	
#	#$thisGame = $thisGame[1] -replace ';',',';
#	#$nodes = $thisGame.Split(",");
#	#[int]$blueCount, [int]$greenCount, [int]$redCount = 0;
#	#foreach ($node in $nodes) {
#	#	$thisNumber = 0;
#	#	switch ($node) {
#	#		{$node.contains("blue")} {$thisNumber = $node.Split(" "); if ([int]$thisNumber[1] -gt $blueCount){[int]$blueCount = [int]$thisNumber[1];}}
#	#		{$node.contains("green")} {$thisNumber = $node.Split(" "); if ([int]$thisNumber[1] -gt $greenCount){[int]$greenCount = [int]$thisNumber[1];}}
#	#		{$node.contains("red")} {$thisNumber = $node.Split(" "); if ([int]$thisNumber[1] -gt $redCount){[int]$redCount = [int]$thisNumber[1];}}
#	#		Default {echo "Unknown number!"}
#	#	}
#	#}
#	#if ($blueCount -lt 15 -And $greenCount -lt 14 -And $redCount -lt 13) {
#	# $ArrayOfGame.Add($gameNum);
#	#}
#}
#
##echo "------------------------------------------"
##echo $ArrayOfGame | measure-object -sum


