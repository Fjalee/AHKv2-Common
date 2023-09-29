class Common
{
    WaitForImage(x1, y1, x2, y2, imageFilePath, tolerance := "20")
    {
        Loop
        {
            ImageSearch, foundX, foundY, %x1%, %y1%, %x2%, %y2%, *%tolerance% %imageFilePath%

            if ErrorLevel = 1
            {
                ImageSearch, foundX, foundY, %x1%, %y1%, %x2%, %y2%, *%tolerance% %imageFilePath%
                Sleep, 1000
            }
            else if ErrorLevel = 2
            {
                MsgBox, Image not found or too many found.
                return
            }
            else
            {
                return
            }
        }
    }

    MouseShowCoords(x1, y1, x2, y2)
    {
        MouseMove, %x1%, %y1%
        Sleep, 500
        MouseMove, %x2%, %y2%
    }
}