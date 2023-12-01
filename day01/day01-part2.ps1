[string[]]$arrayFromFile = Get-Content -Path 'input'
$ArrayToSum = New-Object System.Collections.Generic.List[System.Object]

for ($i=0; $i -lt $arrayFromFile.Length; $i++) {
  # Hacky solution to filter out the anomalies...
  $thisNumber = $arrayFromFile[$i] -replace 'one','on1e';
  $thisNumber = $thisNumber -replace 'two','tw2o';
  $thisNumber = $thisNumber -replace 'three','thr3ee';
  $thisNumber = $thisNumber -replace 'four','fo4ur';
  $thisNumber = $thisNumber -replace 'five','fi5ve';
  $thisNumber = $thisNumber -replace 'six','6six';
  $thisNumber = $thisNumber -replace 'seven','se7ven';
  $thisNumber = $thisNumber -replace 'eight','ei8ght';
  $thisNumber = $thisNumber -replace 'nine','ni9ne';
  
  $thisNumber = $thisNumber -replace '[a-zA-Z]','';
  if ($thisNumber.Length -lt 2) {
	  $ArrayToSum.Add("$thisNumber$thisNumber");	  
  } elseif ($thisNumber.Length -eq 2)  {
	  $ArrayToSum.Add($thisNumber);
  } else {
	  $ArrayToSum.Add([string]::Concat($thisNumber[0], $thisNumber[$thisNumber.Length-1]));
  }
}
echo "------------------------------------------"
echo $ArrayToSum | measure-object -sum

#lead ins -

#nine - eight
#eight - three, two
#seven - nine
#six
#five - eight
#four
#three - eight
#two - one
#one - eight

# possible anomalies in data set

#nineight
#eighthree
#eightwo
#sevenine
#fiveight
#threeight
#twone
#oneight
