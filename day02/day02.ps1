[string[]]$arrayFromFile = Get-Content -Path 'input'
$ArrayOfGame = New-Object System.Collections.Generic.List[System.Object]
for ($i=0; $i -lt $arrayFromFile.Length; $i++) {
	[int]$gameNum = $i +1;
	$thisGame = $arrayFromFile[$i].Split(":");
	$thisGame = $thisGame[1] -replace ';',',';
	$nodes = $thisGame.Split(",");
	[int]$blueCount, [int]$greenCount, [int]$redCount = 0;
	foreach ($node in $nodes) {
		$thisNumber = 0;
		switch ($node) {
			{$node.contains("blue")} {$thisNumber = $node.Split(" "); if ([int]$thisNumber[1] -gt $blueCount){[int]$blueCount = [int]$thisNumber[1];}}
			{$node.contains("green")} {$thisNumber = $node.Split(" "); if ([int]$thisNumber[1] -gt $greenCount){[int]$greenCount = [int]$thisNumber[1];}}
			{$node.contains("red")} {$thisNumber = $node.Split(" "); if ([int]$thisNumber[1] -gt $redCount){[int]$redCount = [int]$thisNumber[1];}}
			Default {echo "Unknown number!"}
		}
	}
	if ($blueCount -lt 15 -And $greenCount -lt 14 -And $redCount -lt 13) {
	 $ArrayOfGame.Add($gameNum);
	}
}
echo "------------------------------------------"
echo $ArrayOfGame | measure-object -sum
