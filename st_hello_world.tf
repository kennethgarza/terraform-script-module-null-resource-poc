data "local_file" "st_hello_world" {
    filename = "./scripts/hello_world.ps1"
}

resource "restapi_object" "st_hello_world" {
    provider = restapi
    path = "/api/actiontemplates"
    data = jsonencode({
        Name = "Hello World"
        Description = "this is a test step template"
        ActionType = "Octopus.Script"
        Properties = {
            "Octopus.Action.Script.Syntax" = "PowerShell"
            "Octopus.Action.Script.ScriptBody" = data.local_file.st_hello_world.content
        }
        Parameters = [
            {
                Name = "Step.World"
                Label = "What is the world name?"
                HelpText = "Enter what world you want to say hello to"
                DefaultValue = "World"
                DisplaySettings = {
                    "Octopus.ControlType" = "SingleLineText"
                }
            }
        ]
    })
    id_attribute = "Id"
}