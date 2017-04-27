<# 
Script: Count SQL license types for ARM vm's (BYOL vs PAYG)
Author: Mariusz Kolodziej - Microsoft 
Date: April 26, 2017
Version: 1.0
References:
    https://blogs.technet.microsoft.com/heyscriptingguy/2016/06/01/retrieve-azure-resource-manager-virtual-machine-properties-by-using-powershell-part-3/
    https://blogs.msdn.microsoft.com/azureedu/2016/04/13/how-can-i-use-the-hybrid-use-benefit-in-azure/

THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF
ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
PARTICULAR PURPOSE.

IN NO EVENT SHALL MICROSOFT AND/OR ITS RESPECTIVE SUPPLIERS BE
LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY
DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS
ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
OF THIS CODE OR INFORMATION.
#>

Param(
    [Parameter(Mandatory=$true, Position=0, HelpMessage="Azure subscription Id?")]
    [String]$subscriptionId
)

# Login and select the subscription
Login-AzureRmAccount
$subcriptionDetails = Select-AzureRmSubscription -SubscriptionId $subscriptionId
echo "Subscription `"$($subcriptionDetails.Subscription.SubscriptionName)`" ($($subcriptionDetails.Subscription.SubscriptionId)) selected."
echo "---------------------------------------------------------------------------"

# Get list of all ARM vm's in subscription
$vmRmList = Get-AzureRmVM -WarningAction SilentlyContinue | select Name, ResourceGroupName
echo "List of $($vmRmList.Count) vm's created."
echo "---------------------------------------------------------------------------"

# Iterate over the list of vm's and count number of BYOL, PAYG and OTHER licenses
$BYOLcount = 0
$PAYGcount = 0

foreach ($item in $vmRmList){
    $vm = get-azurermvm -Name $item.Name -ResourceGroupName $item.ResourceGroupName -WarningAction SilentlyContinue
    
    $offer = $vm.StorageProfile.ImageReference.Offer.ToLower()

    #$offer.Contains("visualstudio")

    if($offer.Contains("sql")){
        if($offer.Contains("byol")){
            $BYOLcount++
        }else{
            $PAYGcount++
        }
    }
}
echo "Count of vm's SQL license types completed."
echo "---------------------------------------------------------------------------"
echo "$BYOLcount SQL BYOL license(s) found."
echo "$PAYGcount SQL PAYG license(s) found."