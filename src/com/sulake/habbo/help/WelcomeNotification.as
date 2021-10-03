package com.sulake.habbo.help
{
   public class WelcomeNotification
   {
       
      
      private var var_2842:String;
      
      private var var_2843:String;
      
      private var var_2844:String;
      
      public function WelcomeNotification(param1:String, param2:String, param3:String)
      {
         super();
         this.var_2842 = param1;
         this.var_2843 = param2;
         this.var_2844 = param3;
      }
      
      public function get targetIconId() : String
      {
         return this.var_2842;
      }
      
      public function get titleLocalizationKey() : String
      {
         return this.var_2843;
      }
      
      public function get descriptionLocalizationKey() : String
      {
         return this.var_2844;
      }
   }
}
