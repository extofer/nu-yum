# PowerShell script translates Linux like yum commands
# to NuGet commands for .Net Package Management
# 
# URL: https://github.com/extofer/nu-yum

$yumcmd= $args[0]
$arg= $args[1]

function yumHelp()
{
echo "Usage: yum COMMAND [argument]"
echo " "
echo "List of Commands:"
echo "install"
echo "search"
echo "list"
echo "remove"
echo "help"

}

switch ($yumcmd)
{
	{($_ -eq "install") -or ($_ -eq "i")}{Install-Package $arg}
	{($_ -eq "search") -or ($_ -eq "s")}{Get-Package -Filter $arg -ListAvailable}
	{($_ -eq "list") -or ($_ -eq "1")}{if ($arg -eq "updates") {Get-Package -updates} else {Get-Package}}
	{($_ -eq "remove") -or ($_ -eq "r")}{Uninstall-Package $arg}
	"help"{yumHelp}
	default {yumHelp} 
}


#
