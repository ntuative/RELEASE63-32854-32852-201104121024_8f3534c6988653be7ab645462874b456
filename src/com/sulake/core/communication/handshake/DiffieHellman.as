package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_879:BigInteger;
      
      private var var_2205:BigInteger;
      
      private var var_1645:BigInteger;
      
      private var var_2206:BigInteger;
      
      private var var_1360:BigInteger;
      
      private var var_1646:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1360 = param1;
         this.var_1646 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1360.toString() + ",generator: " + this.var_1646.toString() + ",secret: " + param1);
         this.var_879 = new BigInteger();
         this.var_879.fromRadix(param1,param2);
         this.var_2205 = this.var_1646.modPow(this.var_879,this.var_1360);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1645 = new BigInteger();
         this.var_1645.fromRadix(param1,param2);
         this.var_2206 = this.var_1645.modPow(this.var_879,this.var_1360);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2205.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2206.toRadix(param1);
      }
   }
}
