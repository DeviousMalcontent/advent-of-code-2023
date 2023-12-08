[string[]]$arrayFromFile = Get-Content -Path 'input'
$ArrayOfSymbols = New-Object System.Collections.Generic.List[System.Object]
$ArrayOfNumbers = New-Object System.Collections.Generic.List[System.Object]
$ArrayToSum = New-Object System.Collections.Generic.List[System.Object]

$lineNumber = 0;
foreach ($line in $arrayFromFile)
{
    foreach ($number in ([regex]'(\d+)').Matches($line)) {
		$thisPartNumber = [PSCustomObject]@{
			rows = ($lineNumber-1)..($lineNumber+1);
			columns = ($number.Index-1)..($number.Index + $number.Length);
			value = $number.Value -as [int];
		}
		$ArrayOfNumbers.Add($thisPartNumber);
	}

    #foreach ($symbol in ([regex]'([@*/&#%+=$-])').Matches($line)){
	foreach ($symbol in ([regex]'([@*])').Matches($line)){
		$thisSymbol = [PSCustomObject]@{
			row = $lineNumber #-as [int];
			column = $symbol.Index; #Distance from last new line!
			value = $symbol.Value;
		}
		$ArrayOfSymbols.Add($thisSymbol);
	}

    $lineNumber++;
}

foreach($line in $arrayFromFile) {$lineLength = $line.Length+1}
#echo $lineLength

foreach ($Symbol in $ArrayOfSymbols) {
	$CountBetweenGears = 0;
	foreach ($Number in $ArrayOfNumbers) {
		$Gear = $Number.value | Where-Object { $Symbol.row -in $Number.rows -and $Symbol.column -in $Number.columns }
		#echo $Gear
		if($CountBetweenGears -ge 3) {
			$CountBetweenGears = 0;
		} else {
			$ArrayToSum.Add($Gear -as [int]);
			$CountBetweenGears++;
		}

		
		#if($Number.Count -eq 2){
		#$ArrayToSum.Add($Number.value -as [int]);
		
		echo $Gear[1]
		echo "c:  $CountBetweenGears;"
		#echo "----"
		#if ($Symbol.row -in $Number.rows -and $Symbol.column -in $Number.columns) = $ture {
		#	echo $Number.value
		#	echo "----"		    
		#	#echo $Number.value -as [int]
		#	if($Number.Count -eq 2){
		#		echo $Number1.value * $Number2.value;
		#	}
		# 
		 #$ArrayToSum.Add($Number.value -as [int]);
		#}
	}
}

echo "tes2"	
#$ArrayToSum
#$ArrayToSum | Measure-Object -Sum
