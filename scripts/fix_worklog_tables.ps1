$base = Join-Path $PSScriptRoot "..\content\1-Worklog" | Resolve-Path
$ref = "<https://cloudjourney.awsstudygroup.com/>"

$colgroup = @"
<colgroup>
  <col class="col-day" style="width:5%">
  <col class="col-task" style="width:42%">
  <col class="col-start" style="width:13%">
  <col class="col-end" style="width:13%">
  <col class="col-ref" style="width:27%">
</colgroup>
"@

function Build-HtmlTable {
    param($Headers, $Rows)
    $sb = New-Object System.Text.StringBuilder
    [void]$sb.AppendLine('<table class="worklog-table">')
    [void]$sb.AppendLine($colgroup)
    [void]$sb.AppendLine('  <thead>')
    [void]$sb.AppendLine('    <tr>')
    foreach ($h in $Headers) { [void]$sb.AppendLine("      <th>$h</th>") }
    [void]$sb.AppendLine('    </tr>')
    [void]$sb.AppendLine('  </thead>')
    [void]$sb.AppendLine('  <tbody>')
    for ($i = 0; $i -lt $Rows.Count; $i++) {
        $row = $Rows[$i]
        $dayNum = $i + 1
        $source = if ($row[3]) { $row[3].Trim() } else { $ref }
        [void]$sb.AppendLine('    <tr>')
        [void]$sb.AppendLine("      <td class=`"col-day`">$dayNum</td>")
        [void]$sb.AppendLine("      <td class=`"col-task`">$($row[0].Trim())</td>")
        [void]$sb.AppendLine("      <td class=`"col-date`">$($row[1].Trim())</td>")
        [void]$sb.AppendLine("      <td class=`"col-date`">$($row[2].Trim())</td>")
        [void]$sb.AppendLine("      <td class=`"col-ref`">$source</td>")
        [void]$sb.AppendLine('    </tr>')
    }
    [void]$sb.AppendLine('  </tbody>')
    [void]$sb.AppendLine('</table>')
    return $sb.ToString().TrimEnd()
}

function Parse-MarkdownRows {
    param($Block)
    $rows = @()
    foreach ($line in ($Block -split "`r?`n")) {
        $line = $line.Trim()
        if (-not $line.StartsWith('|')) { continue }
        $parts = ($line.Trim('|') -split '\|') | ForEach-Object { $_.Trim() }
        if ($parts.Count -lt 5) { continue }
        if ($parts[0] -match '^[- ]+$') { continue }
        if ($parts[2] -notmatch '\d{2}/\d{2}/2026') { continue }
        $rows += ,@($parts[1], $parts[2], $parts[3], $parts[4])
    }
    return $rows
}

function Transform-File {
    param($Path, [bool]$IsVi)
    $content = [System.IO.File]::ReadAllText($Path, [System.Text.Encoding]::UTF8)

    if ($IsVi) {
        $headers = @([char]0x0054 + 'h' + [char]0x1EE9, 'C' + [char]0x00F4 + 'ng vi' + [char]0x1EC7 + 'c', 'Ng' + [char]0x00E0 + 'y b' + [char]0x1EAF + 't ' + [char]0x0111 + [char]0x1EA7 + 'u', 'Ng' + [char]0x00E0 + 'y ho' + [char]0x00E0 + 'n th' + [char]0x00E0 + 'nh', 'Ngu' + [char]0x1ED3 + 'n t' + [char]0x00E0 + 'i li' + [char]0x1EC7 + 'u')
        $marker = 'tu' + [char]0x1EA7 + 'n n' + [char]0x00E0 + 'y:'
    } else {
        $headers = @('Day','Task','Start Date','Completion Date','Reference Material')
        $marker = 'carried out this week:'
    }

    $markerIndex = $content.IndexOf($marker)
    if ($markerIndex -lt 0) { Write-Host "SKIP marker: $Path"; return }
    $sectionStart = $content.LastIndexOf('###', $markerIndex)
    $sectionEndMatch = [regex]::Match($content.Substring($sectionStart), "`r?`n`r?`n### ")
    if (-not $sectionEndMatch.Success) { Write-Host "SKIP end: $Path"; return }
    $tableStart = $content.IndexOf("`n", $markerIndex) + 1
    $tableEnd = $sectionStart + $sectionEndMatch.Index
    $block = $content.Substring($tableStart, $tableEnd - $tableStart)

    $rows = Parse-MarkdownRows $block
    if ($rows.Count -eq 0) { Write-Host "SKIP rows: $Path"; return }

    $html = Build-HtmlTable $headers $rows
    $newContent = $content.Substring(0, $tableStart) + $html + "`n" + $content.Substring($tableEnd)
    [System.IO.File]::WriteAllText($Path, $newContent.TrimEnd() + "`n", [System.Text.UTF8Encoding]::new($false))
    Write-Host "OK: $(Split-Path $Path -Leaf) ($($rows.Count) rows)"
}

Get-ChildItem -Path $base -Directory -Filter "1.*-Week*" | Sort-Object Name | ForEach-Object {
    $vi = Join-Path $_.FullName "_index.vi.md"
    $en = Join-Path $_.FullName "_index.md"
    if (Test-Path $vi) { Transform-File $vi $true }
    if (Test-Path $en) { Transform-File $en $false }
}

Write-Host "Done"
