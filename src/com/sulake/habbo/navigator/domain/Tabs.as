package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_396:int = 1;
      
      public static const const_280:int = 2;
      
      public static const const_341:int = 3;
      
      public static const const_430:int = 4;
      
      public static const const_254:int = 5;
      
      public static const const_428:int = 1;
      
      public static const const_719:int = 2;
      
      public static const const_949:int = 3;
      
      public static const const_834:int = 4;
      
      public static const const_256:int = 5;
      
      public static const const_678:int = 6;
      
      public static const const_872:int = 7;
      
      public static const const_227:int = 8;
      
      public static const const_423:int = 9;
      
      public static const const_1985:int = 10;
      
      public static const const_771:int = 11;
      
      public static const const_567:int = 12;
       
      
      private var var_427:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_427 = new Array();
         this.var_427.push(new Tab(this._navigator,const_396,const_567,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_455));
         this.var_427.push(new Tab(this._navigator,const_280,const_428,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_455));
         this.var_427.push(new Tab(this._navigator,const_430,const_771,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1197));
         this.var_427.push(new Tab(this._navigator,const_341,const_256,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_455));
         this.var_427.push(new Tab(this._navigator,const_254,const_227,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_767));
         this.setSelectedTab(const_396);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_430;
      }
      
      public function get tabs() : Array
      {
         return this.var_427;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_427)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_427)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_427)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
