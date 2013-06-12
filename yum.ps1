# PowerShell script translates Linux like yum commands
# to NuGet commands for .Net Package Management
# 
# URL: https://github.com/extofer/nu-yum

$yumcmd= $args[0]
$arg= $args[1]

switch ($yumcmd)
{
	"install"{Install-Package $arg}
	"search"{Get-Package -Filter $arg -ListAvailable}
	"list"{if ($arg -eq "updates") {Get-Package -updates} else {Get-Package}}
	"remove"{Uninstall-Package $arg}
}

