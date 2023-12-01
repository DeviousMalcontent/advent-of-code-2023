[string[]]$arrayFromFile = Get-Content -Path 'input'
$ArrayToSum = New-Object System.Collections.Generic.List[System.Object]
for ($i=0; $i -lt $arrayFromFile.Length; $i++) {
  $thisNumber = $arrayFromFile[$i] -replace '[a-zA-Z]','';
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
