package view.assets
{
  import data.Data;
  
  import flash.text.*;
  
  
  public class TextFieldLech extends TextField
  {
    private static const fontName:String = "Arial";
//    private static const fontName:String = "Sans";
    private var _fontSize:int;
    private var _defaultFontSize:int;
    private var _format:TextFormat;
    public function TextFieldLech(fontSize:int=15,fontColor:uint=0x0, bold:Boolean = false)
    {
      super();
      _defaultFontSize = fontSize;
      this.embedFonts = true;
      this.selectable = false;
//      this.multiline = true;
//	  this.wordWrap =  true;
	  this.autoSize =  TextFieldAutoSize.RIGHT;
	  this.width = Data.instance().stage_width-5;
      this._fontSize = fontSize;
      createTextFormat(fontSize,fontColor, bold);
      defaultTextFormat=_format;
	  var embeddedFonts:Array = Font.enumerateFonts(false);
    }

    private function createTextFormat(fontSize:int=15,fontColor:uint=0x0,bold:Boolean = false):void{
      _format = new TextFormat();
      _format.font = fontName;
      _format.bold = true;
      _format.color = fontColor;
      _format.size = fontSize;
      _format.align = TextFormatAlign.LEFT;
    }
    public function updateTextFormat():void
    {
      if(_format)
      {
        _format.size = _defaultFontSize;
        _fontSize = _defaultFontSize;
        setTextFormat(_format)
      }
    }
    public function fitToWidth(space:Number):void
    {
      while(this.textWidth>space-20) {
        _fontSize--;
        _format.size = _fontSize;
        this.setTextFormat(_format);
      }
    }
    public function changeFontSize(callback:Function = null, callbackParams:* = null):void{
      _fontSize--;
      _format.size = _fontSize;
      this.setTextFormat(_format);
      if(callback!=null)
        callback(callbackParams);
    }
    public function device():void{
      this.text = replace(" ","\n",this.text);
    }
    private function replace(searchStr:String,replaceStr :String,origStr:String):String
    {
      if (origStr.indexOf(searchStr) != -1)
        origStr = origStr.replace(searchStr,replaceStr);
      return origStr;
    }
    public function get fontSize():int
    {
      return _fontSize;
    }
	public function position(x:Number,y:Number):void{
		this.x = x;
		this.y = y;
	}

  }
}