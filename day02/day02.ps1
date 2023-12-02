[string[]]$arrayFromFile = Get-Content -Path 'input'
$ArrayOfGame = New-Object System.Collections.Generic.List[System.Object]

for ($i=0; $i -lt $arrayFromFile.Length; $i++) {
	[int]$gameNum = $i +1;
	echo "game number is: $gameNum";
	
	$thisGame = $arrayFromFile[$i].Split(":");
	$thisGame = $thisGame[1] -replace ';',',';
	
	$nodes = $thisGame.Split(",");
	
	[int]$blueCount, [int]$greenCount, [int]$redCount = 0;
	foreach ($node in $nodes) {
		$thisNumber = 0;
		switch ($node) {
			{$node.contains("blue")} {$thisNumber = $node.Split(" "); [int]$blueCount = [int]$blueCount + [int]$thisNumber[1];}
			{$node.contains("green")} {$thisNumber = $node.Split(" "); [int]$greenCount = [int]$greenCount + [int]$thisNumber[1];}
			{$node.contains("red")} {$thisNumber = $node.Split(" "); [int]$redCount = [int]$redCount + [int]$thisNumber[1];}
			
			Default {echo "Unknown number!"}
		}
	}
	
	echo "blue total is: $blueCount"
	echo "green total is: $greenCount"
	echo "red total is: $redCount"
	echo "------------------------------------------"
	
	if ($blueCount -lt 14 -And $greenCount -lt 13 -And $redCount -lt 12) {
	 $ArrayOfGame.Add($gameNum);
	}
}
echo "------------------------------------------"
echo $ArrayOfGame
echo "------------------------------------------"
echo $ArrayOfGame | measure-object -sum
#$sets = $thisGame[1].Split(";");
#$set1 = $sets[0];
#$set2 = $sets[1];
#$set3 = $sets[2];
#echo "-----------------------------------------1"
#echo $set1
#echo "-----------------------------------------2"
#echo $set2
#echo "-----------------------------------------3"
#echo $set3
