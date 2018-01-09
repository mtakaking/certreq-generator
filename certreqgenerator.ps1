
# rewrite subject for cert request file
# Subject = "CN=www.example.com, OU=Organizational_Unit, O=Organization, L=City, S=State, C=Country"

$subjectToReplace = @()
#0
$subjectToReplace += 'www.example.com'
#1
$subjectToReplace += 'Organizational_Unit'
#2
$subjectToReplace += 'Organization'
#3
$subjectToReplace += 'City'
#4
$subjectToReplace += 'State'
#5
$subjectToReplace += "Country"

# $subjectToReplace[x] = $subjectToReplaceWith[x]
$subjectToReplaceWith = @()

param [
[string]$name
[string]$subjectToReplaceWith[0],
[string]$subjectToReplaceWith[1],
[string]$subjectToReplaceWith[2],
[string]$subjectToReplaceWith[3],
[string]$subjectToReplaceWith[4],
[string]$subjectToReplaceWith[5],
[string]$certReqTemplate

]

New-Item -Name $name -ItemType File
$templateContet = Get-Content -Path $certReqTemplate

$i=0

do {

    $replacedContent = $templateContet.replace($subjectToReplace[$i], $subjectToReplaceWith[$i])
    $i++
    if($i -eq $subjectToReplace.Length) {
        $replacedContent > $name
    }

} while($i -lt $subjectToReplace.Length)
