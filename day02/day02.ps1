[string[]]$arrayFromFile = Get-Content -Path 'input'
$ArrayOfGame = New-Object System.Collections.Generic.List[System.Object]

for ($i=0; $i -lt $arrayFromFile.Length; $i++) {
	$sgwaergaewrfgs = $i +1;
	echo "game number is: $sgwaergaewrfgs";
	
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
			
			#{$node.contains("blue")} {echo "is blue"}
			#{$node.contains("green")} {echo "is green"}
			#{$node.contains("red")} {echo "is red"}
			Default {echo "Unknown number!"}
		}
	#echo "-----------------------------------------+"
	#echo $node
	#echo "-----------------------------------------+"
	}
	
	echo "blue toal is: $blueCount"
	echo "green toal is: $greenCount"
	echo "red toal  is: $redCount"
	echo "------------------------------------------"
	
	
}
echo " "
echo "Done. "
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
