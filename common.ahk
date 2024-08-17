class Common
{
    Sleep1000(){
        Sleep, 300
    }
    MsgBoxMissingImage(){
        MsgBox, Image not found or too many found.
    }
    
    WaitForImage(x1, y1, x2, y2, imageFilePath, tolerance := "20")
    {
        this.ClickImage(x1, y1, x2, y2, imageFilePath, ObjBindMethod(this, "WaitForImage", x1, y1, x2, y2, imageFilePath, tolerance), ObjBindMethod(this, "MsgBoxMissingImage"), Func(""))
    }

    ClickImage(x1, y1, x2, y2, imageFilePath, imageNotFoundFunc, imageFileMissingFunc, imageFoundFunc, tolerance := "20")
    {
        ImageSearch, foundX, foundY, x1, y1, x2, y2, *%tolerance% %imageFilePath%
        if ErrorLevel = 1
        {
            imageNotFoundFunc.Call()
        }
        else if ErrorLevel = 2
        {
            imageFileMissingFunc.Call()
        }
        else
        {
            MouseClick, ,foundX, foundY
            imageFoundFunc.Call()
            return
        }
    }

    MouseShowCoords(x1, y1, x2, y2)
    {
        MouseMove, %x1%, %y1%
        Sleep, 500
        MouseMove, %x2%, %y2%
    }
}
