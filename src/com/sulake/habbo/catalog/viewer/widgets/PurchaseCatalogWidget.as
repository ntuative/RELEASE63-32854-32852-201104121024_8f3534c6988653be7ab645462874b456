package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetInitPurchaseEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2294:XML;
      
      private var var_2296:XML;
      
      private var var_2295:XML;
      
      private var var_916:IWindowContainer;
      
      private var var_600:IButtonWindow;
      
      private var var_2945:IButtonWindow;
      
      private var var_1694:ITextWindow;
      
      private var var_1691:ITextWindow;
      
      private var var_1692:ITextWindow;
      
      private var var_2904:ITextWindow;
      
      private var var_93:Offer;
      
      private var var_1693:String = "";
      
      private var var_1389:Function;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         events.removeEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.removeEventListener(WidgetEvent.const_818,this.onSetParameter);
         events.removeEventListener(WidgetEvent.CWE_PURCHASE_OVERRIDE,this.onPurchaseOverride);
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            this.var_2294 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            this.var_2296 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            this.var_2295 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.addEventListener(WidgetEvent.const_818,this.onSetParameter);
         events.addEventListener(WidgetEvent.CWE_PURCHASE_OVERRIDE,this.onPurchaseOverride);
         events.addEventListener(WidgetEvent.CWE_INIT_PURCHASE,this.initPurchase);
         return true;
      }
      
      private function onPurchaseOverride(param1:CatalogWidgetPurchaseOverrideEvent) : void
      {
         this.var_1389 = param1.callback;
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_870:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2294) as IWindowContainer;
               break;
            case Offer.const_1182:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2296) as IWindowContainer;
               break;
            case Offer.const_1232:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2295) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach..." + this.var_93.priceType);
         }
         if(_loc2_ != null)
         {
            if(this.var_916 != null)
            {
               _window.removeChild(this.var_916);
               this.var_916.dispose();
            }
            this.var_916 = _loc2_;
            _window.addChild(_loc2_);
            this.var_916.x = 0;
            this.var_916.y = 0;
         }
         this.var_1694 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         this.var_1691 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         this.var_1692 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         this.var_2904 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         this.var_600 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(this.var_600 != null)
         {
            if(this.var_1389 != null)
            {
               this.var_600.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1389);
            }
            else
            {
               this.var_600.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1389);
               this.var_600.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPurchase);
            }
            this.var_600.disable();
         }
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         this.var_93 = param1.offer;
         this.attachStub(this.var_93.priceType);
         if(this.var_1694 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(this.var_93.priceInCredits));
            this.var_1694.caption = "${catalog.purchase.price.credits}";
         }
         var _loc3_:String = this.var_93.activityPointType == Purse.const_206 ? "pixels" : "activitypoints";
         if(this.var_1691 != null)
         {
            _loc4_ = "catalog.purchase.price.activitypoints." + this.var_93.activityPointType;
            _loc2_.registerParameter(_loc4_,_loc3_,this.var_93.priceInActivityPoints.toString());
            this.var_1691.caption = _loc2_.getKey(_loc4_);
         }
         if(this.var_1692 != null)
         {
            _loc4_ = "catalog.purchase.price.credits+activitypoints." + this.var_93.activityPointType;
            _loc2_.registerParameter(_loc4_,"credits",String(this.var_93.priceInCredits));
            _loc2_.registerParameter(_loc4_,_loc3_,String(this.var_93.priceInActivityPoints));
            this.var_1692.caption = _loc2_.getKey(_loc4_);
         }
         var _loc5_:IWindow = _window.findChildByName("activity_points_bg");
         if(_loc5_ != null)
         {
            _loc5_.color = this.var_93.activityPointType == 0 ? 6737151 : uint(13421772);
         }
         if(this.var_600 != null)
         {
            this.var_600.enable();
         }
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         this.var_1693 = param1.parameter;
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(this.var_93 != null)
         {
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this.var_93,page.pageId,this.var_1693);
         }
      }
      
      private function initPurchase(param1:CatalogWidgetInitPurchaseEvent) : void
      {
         if(this.var_93 != null)
         {
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this.var_93,page.pageId,this.var_1693,param1.enableBuyAsGift);
         }
      }
   }
}
