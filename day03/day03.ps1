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
			isAdjacent = $false;
		}
		$ArrayOfNumbers.Add($thisPartNumber);
	}

    foreach ($symbol in ([regex]'([@*/&#%+=$-])').Matches($line)){
		$thisSymbol = [PSCustomObject]@{
			row = $lineNumber #-as [int];
			column = $symbol.Index; #Distance from last new line!
			value = $symbol.Value;
		}
		$ArrayOfSymbols.Add($thisSymbol);
	}

    $lineNumber++;
}

foreach ($Symbol in $ArrayOfSymbols) {
	foreach ($Number in $ArrayOfNumbers) {
		if ($Symbol.row -in $Number.rows -and $Symbol.column -in $Number.columns) {
		 $Number.isAdjacent = $true;
		 $ArrayToSum.Add($Number.value -as [int]);
		}
	}
}

$ArrayToSum | Measure-Object -Sum
