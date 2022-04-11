# Function to Clone Objects
function Copy-Object {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(
            Mandatory = $True,
            Position = 0
        )]
        $Object       
    )
    
    if ($Null -ne $Object) {
        # I Create a temporary variable to modify while the original is used as inmutable data to loop through
        # Serialize and Deserialize data using BinaryFormatter
        $ms = New-Object System.IO.MemoryStream
        $bf = New-Object System.Runtime.Serialization.Formatters.Binary.BinaryFormatter
        $bf.Serialize($ms, $Object)
        $ms.Position = 0
        #Deep copied data
        $Cloned = $bf.Deserialize($ms)
        $ms.Close()
        
        return $Cloned
    } else {
        return $Null
    }
}