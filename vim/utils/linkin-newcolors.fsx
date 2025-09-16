#r "System"

let NewColorsDir = "../MoreColors2021"
let colorSchemes = [
    "molokai.vim"
    "holokai.vim"
    "molokai_dark.vim"
    "solarized8_dark_high.vim"
    "gotham.vim"
    "navajo-night.vim"
]

let createSymlink linkName target =
    let fullTargetPath = System.IO.Path.Combine(NewColorsDir, target)
    try
        if System.IO.File.Exists(linkName) then System.IO.File.Delete(linkName)
        System.IO.File.CreateSymbolicLink(linkName, fullTargetPath) |> ignore
        printfn $"Created symbolic link: {linkName} -> {fullTargetPath}"

        if System.Runtime.InteropServices.RuntimeInformation.IsOSPlatform(System.Runtime.InteropServices.OSPlatform.Linux) ||
           System.Runtime.InteropServices.RuntimeInformation.IsOSPlatform(System.Runtime.InteropServices.OSPlatform.OSX) then
            let fileInfo = new System.IO.FileInfo(fullTargetPath)
            fileInfo.Attributes <- fileInfo.Attributes ||| System.IO.FileAttributes.Readable
            printfn $"Set read permissions for: {fullTargetPath}"

    with ex ->
        printfn $"Error creating/deleting symbolic link: {ex.Message}"


colorSchemes |> List.iter (fun scheme -> createSymlink scheme scheme)

