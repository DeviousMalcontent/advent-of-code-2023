[string[]]$arrayFromFile = Get-Content -Path 'input'
$ArrayOfSymbols = New-Object System.Collections.Generic.List[System.Object]
$ArrayOfNumbers = New-Object System.Collections.Generic.List[System.Object]

$lineNumber = 0;
foreach ($line in $arrayFromFile)
{
    foreach ($number in ([regex]'(\d+)').Matches($line)) {
		$thisPartNumber = [PSCustomObject]@{
			#PSTypeName = "Number"
			rows = ($lineNumber-1)..($lineNumber+1);
			columns = ($number.Index-1)..($number.Index + $number.Length);
			value = $number.Value -as [int];
		}
		$ArrayOfNumbers.Add($thisPartNumber);
	}

    foreach ($symbol in ([regex]'([@*/&#%+=$-])').Matches($line)){
		$thisSymbol = [PSCustomObject]@{
			#PSTypeName = "Symbol"
			row = $lineNumber -as [int];
			column = $symbol.Index; #Distance from last new line!
			value = $symbol.Value;
		}
		$ArrayOfSymbols.Add($thisSymbol);
	}

    $lineNumber++;
}

foreach ($Number in $ArrayOfNumbers) {
	#echo $Number.Value;
	
	if(($ArrayOfSymbols.row | Where-Object {$_ -contains $Number.rows}) -and ($ArrayOfSymbols.column | Where-Object {$_ -contains $Number.columns})) {
	#if(($Number.rows -contains $ArrayOfSymbols.row) -and ($Number.columns -contains $ArrayOfSymbols.column)) {
		echo $Number.Value;
	#	echo "------------------------------------------"
	}
}


#for ($i=0; $i -lt $ArrayOfNumbers.Length; $i++) {
#	echo $ArrayOfNumbers.Value;
#	#if(($ArrayOfNumber.rows -in $ArrayOfSymbols.row) -and ($ArrayOfNumbers.columns -in $ArrayOfSymbols.column)) {
#	#		echo $ArrayOfNumbers.Value;
#	#		echo "------------------------------------------"
#	#}
#}


#foreach($Number in $ArrayOfNumbers) {
#	if($ArrayOfSymbols.Where({ (($ArrayOfSymbols.row -in $Number.rows) -and ($ArrayOfSymbols.column -in $Number.columns)) }, 'First')){
#		echo $Number.Value
#		echo "------------------------------------------"
#	} else {
#		echo 0;
#	}
#}

#foreach($Symbol in $ArrayOfSymbols) {
#	if($ArrayOfNumbers.Where({ (($Symbol.row -in $ArrayOfNumbers.rows) -and ($Symbol.column -in $ArrayOfNumbers.columns)) }, 'First')){
#        echo 1;
#		$Symbol.Value
#		echo "------------------------------------------"
#	} else {
#		echo 0;
#	}
#}

#foreach($Symbol in $ArrayOfSymbols) {
#	if ($ArrayOfNumbers.Where( { (($Symbol.row -in $ArrayOfNumbers.rows) -and ($Symbol.column -in $ArrayOfNumbers.columns)) } ))  {
#        echo $Symbol.Value;
#		echo "------------------------------------------"
#    }
#}

#foreach($Number in $ArrayOfNumbers) {
#	if ($ArrayOfSymbols.Where( { (($Number.rows -in $ArrayOfSymbols.row) -and ($Number.columns -in $ArrayOfSymbols.column)) } ))  {
#        echo $Number;
#		echo "------------------------------------------"
#    }
#}


#foreach($Symbol in $ArrayOfSymbols) {echo $Symbol.row}

#foreach($Number in $ArrayOfNumbers) {echo $Number.rows}
#foreach($Number in $ArrayOfNumbers) {echo $Number.columns}

#foreach($ArrayOfNumbers in $ArrayOfSymbols) {echo $Symbol.column}

#$ArrayOfNumbers = New-Object System.Collections.Generic.List[System.Object]
#$partNumberValue = ([regex]'(\d+)').Matches($arrayFromFile).Value
#$partNumberIndex = ([regex]'(\d+)').Matches($arrayFromFile).Index
#$partNumberLength = ([regex]'(\d+)').Matches($arrayFromFile).Length
#
#$ArrayOfSymbols = New-Object System.Collections.Generic.List[System.Object]
#$symbolValue = ([regex]'([@*/&#%+=$-])').Matches($arrayFromFile).Value
#$symbolIndex = ([regex]'([@\n})').Matches($arrayFromFile)
#$symbolLength = ([regex]'([@*/&#%+=$-])').Matches($arrayFromFile).Length
#
##echo $symbolIndex
##echo "------------------------------------------"
#
#for ($i=0; $i -lt $arrayFromFile.Length; $i++) {
#	$thisPartNumber = [PSCustomObject]@{
#		rows = ($i-1)..($i+1);
#		columns = ($partNumberIndex[$i].Index-1)..($partNumberIndex[$i].Index + $partNumberLength.Length);
#		value = $partNumberValue[$i] -as [int];
#	}
#	$ArrayOfNumbers.Add($thisPartNumber);
#}
#
##foreach($line in $arrayFromFile) {$lineLength = $line.Length+1}
##echo $lineLength
#
#for ($i=0; $i -lt $arrayFromFile.Length; $i++) {
#	$thisSymbol = [PSCustomObject]@{
#		row = $i -as [int];
#		column = ($symbolIndex[$i]); #Distance from last new line!
#		value = $symbolValue[$i];
#	}
#	$ArrayOfSymbols.Add($thisSymbol);
#	
#	#echo $symbolValue[$i],$symbolIndex[$i],$symbolLength[$i];
#	#echo "------------------------------------------"
#}
#
#foreach($Symbol in $ArrayOfSymbols) {echo $Symbol.column}


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


