Function Get-NetworkShares {
Param (
$server
)
	$result = net.exe view $server
	$shares = @()
	$result[7..($result.count-3)] | ForEach-Object {
		$path = "\\" + $server + "\" + $_.Split(" ")[0] + "\"
		$shares += @($path)
	}
	$shares
}