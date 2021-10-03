package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1821:int = 0;
      
      public static const const_1707:int = 1;
      
      public static const const_1559:int = 2;
      
      public static const const_1951:int = 3;
      
      public static const const_1846:int = 4;
      
      public static const const_1899:int = 5;
      
      public static const const_1460:int = 10;
      
      public static const const_1982:int = 11;
      
      public static const const_1897:int = 12;
      
      public static const const_1960:int = 13;
      
      public static const const_1881:int = 16;
      
      public static const const_1867:int = 17;
      
      public static const const_1894:int = 18;
      
      public static const const_1850:int = 19;
      
      public static const const_1880:int = 20;
      
      public static const const_1811:int = 22;
      
      public static const const_1969:int = 23;
      
      public static const const_2014:int = 24;
      
      public static const const_1875:int = 25;
      
      public static const const_1908:int = 26;
      
      public static const const_2001:int = 27;
      
      public static const const_1958:int = 28;
      
      public static const const_1909:int = 29;
      
      public static const const_1888:int = 100;
      
      public static const const_2016:int = 101;
      
      public static const const_1856:int = 102;
      
      public static const const_1872:int = 103;
      
      public static const const_1838:int = 104;
      
      public static const const_1891:int = 105;
      
      public static const const_1893:int = 106;
      
      public static const const_1925:int = 107;
      
      public static const const_1978:int = 108;
      
      public static const const_2008:int = 109;
      
      public static const const_1849:int = 110;
      
      public static const const_1823:int = 111;
      
      public static const const_1987:int = 112;
      
      public static const const_2018:int = 113;
      
      public static const const_1912:int = 114;
      
      public static const const_1968:int = 115;
      
      public static const const_1974:int = 116;
      
      public static const const_1884:int = 117;
      
      public static const const_1947:int = 118;
      
      public static const const_1933:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1707:
            case const_1460:
               return "banned";
            case const_1559:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
