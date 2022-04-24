# This is the main function, it iterates over every group and every task and executes then, also calls the reboot and resumes where it left
function Start-Tasks {
    [CmdletBinding(DefaultParameterSetName = 'Ordered')]
    param(
        [Parameter(Mandatory = $True, Position = 0, ParameterSetName = 'Ordered')]
        [System.Collections.ArrayList]$List
    )

    # Cloning the List to avoid reference issues
    [System.Collections.ArrayList]$TempList = Copy-Object $List
    
    # Looping through the Environments
    for ($i = 0; $i -lt $List.Count; $i++) {
        # Accessing the hashtable
        foreach ($Environment in $list[$i].GetEnumerator()) {
            $Groups = $Environment.Value

            # Looping through the sections
            for ($j = 0; $j -lt $Groups.Count; $j++) {
                # Accessing the hashtable
                foreach ($Group in $Groups[$j].GetEnumerator()) {
                    $Tasks = $Group.Value

                    # And Looping through the Tasks, deleting them once they finish running
                    for ($k = ($Tasks.Count-1); $k -ge 0; $k--) {
                        $Task = $Tasks[$k]   

                        # Prompting the message
                        Write-Title "$($Environment.Name) | $($Group.Name) $($Task.Name)"   

                        # Running the Task
                        Invoke-Expression $Task.Run
                        Write-Host ""

                        # Removing the Task immediately after it runs
                        if ($TempList[$i][$Environment.Name][$j][$Group.Name][$k]) {                            
                            $TempList[$i][$Environment.Name][$j][$Group.Name].RemoveAt($k)
                        }

                        # Reboot the system and pass the $List status as argument to be stored and run where it left before
                        if ($Task.Restart) {                                            
                            # Tasks are always being updated in the temporary variable and are passed as an argument, preserving the state of the program, for the next post-reboot execution.
                            $Global:Status.TaskList = $TempList
                            Restart-And-Resume -Status $Global:Status
                            exit                   
                        }                
                    }
                }
                # Delete the section once it has finished executing its tasks     
                if ($TempList[$i][$Environment.Name][$j]) {
                    $TempList[$i][$Environment.Name].Remove($j)   
                }
            }
        }
        # Delete the Environment once has finished its tasks too
        if ($TempList[$i]) {            
            $TempList.Remove($i)
        }
    }
}