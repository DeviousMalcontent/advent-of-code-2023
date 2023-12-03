[string[]]$arrayFromFile = Get-Content -Path 'input'
$ArrayOfGame = New-Object System.Collections.Generic.List[System.Object]

for ($i=0; $i -lt $arrayFromFile.Length; $i++) {
	$partsList = $arrayFromFile[$i];

	echo "------------------------------------------"
	if ($i -gt 0) {echo $arrayFromFile[$i-1]}
	echo $partsList
	if ($i -lt $arrayFromFile.Length) {echo $arrayFromFile[$i+1]}
	echo "------------------------------------------"
	
	
	#$thisGame = $thisGame[1] -replace ';',',';
	#$nodes = $thisGame.Split(",");
	#[int]$blueCount, [int]$greenCount, [int]$redCount = 0;
	#foreach ($node in $nodes) {
	#	$thisNumber = 0;
	#	switch ($node) {
	#		{$node.contains("blue")} {$thisNumber = $node.Split(" "); if ([int]$thisNumber[1] -gt $blueCount){[int]$blueCount = [int]$thisNumber[1];}}
	#		{$node.contains("green")} {$thisNumber = $node.Split(" "); if ([int]$thisNumber[1] -gt $greenCount){[int]$greenCount = [int]$thisNumber[1];}}
	#		{$node.contains("red")} {$thisNumber = $node.Split(" "); if ([int]$thisNumber[1] -gt $redCount){[int]$redCount = [int]$thisNumber[1];}}
	#		Default {echo "Unknown number!"}
	#	}
	#}
	#if ($blueCount -lt 15 -And $greenCount -lt 14 -And $redCount -lt 13) {
	# $ArrayOfGame.Add($gameNum);
	#}
}

#echo "------------------------------------------"
#echo $ArrayOfGame | measure-object -sum
