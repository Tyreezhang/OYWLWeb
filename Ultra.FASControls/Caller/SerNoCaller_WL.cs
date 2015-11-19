using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Ultra.CoreCaller;
using Ultra.FASControls.Controllers;

namespace Ultra.FASControls
{
    public partial class SerNoCaller_WL
    {
        //CtlItemController
        protected static EFCaller<UltraDbEntity.T_ERP_Item> _Calr_Item = null;
        public static EFCaller<UltraDbEntity.T_ERP_Item> Calr_Item
        {
            get
            {
                return
                    _Calr_Item = _Calr_Item ??
                   new EFCaller<UltraDbEntity.T_ERP_Item>(new CtlItemController());
            }
        }

        //CtlItemComboController
        protected static EFCaller<UltraDbEntity.T_ERP_ItemCombo> _Calr_ItemCombo = null;
        public static EFCaller<UltraDbEntity.T_ERP_ItemCombo> Calr_ItemCombo
        {
            get
            {
                return
                    _Calr_ItemCombo = _Calr_ItemCombo ??
                   new EFCaller<UltraDbEntity.T_ERP_ItemCombo>(new CtlItemComboController());
            }
        }

        //CtlItemImports_FullBakController
        protected static EFCaller<UltraDbEntity.T_ERP_ItemImports_FullBak> _Calr_ItemImports_FullBak = null;
        public static EFCaller<UltraDbEntity.T_ERP_ItemImports_FullBak> Calr_ItemImports_FullBak
        {
            get
            {
                return
                    _Calr_ItemImports_FullBak = _Calr_ItemImports_FullBak ??
                   new EFCaller<UltraDbEntity.T_ERP_ItemImports_FullBak>(new CtlItemImports_FullBakController());
            }
        }

        //CtlItemPackSkuController
        protected static EFCaller<UltraDbEntity.T_ERP_ItemPackSku> _Calr_ItemPackSku = null;
        public static EFCaller<UltraDbEntity.T_ERP_ItemPackSku> Calr_ItemPackSku
        {
            get
            {
                return
                    _Calr_ItemPackSku = _Calr_ItemPackSku ??
                   new EFCaller<UltraDbEntity.T_ERP_ItemPackSku>(new CtlItemPackSkuController());
            }
        }

        //CtlItemStyleController
        protected static EFCaller<UltraDbEntity.T_ERP_ItemStyle> _Calr_ItemStyle = null;
        public static EFCaller<UltraDbEntity.T_ERP_ItemStyle> Calr_ItemStyle
        {
            get
            {
                return
                    _Calr_ItemStyle = _Calr_ItemStyle ??
                   new EFCaller<UltraDbEntity.T_ERP_ItemStyle>(new CtlItemStyleController());
            }
        }

        //CtlItemImportsController
        protected static EFCaller<UltraDbEntity.T_ERP_ItemImports> _Calr_ItemImports = null;
        public static EFCaller<UltraDbEntity.T_ERP_ItemImports> Calr_ItemImports
        {
            get
            {
                return
                    _Calr_ItemImports = _Calr_ItemImports ??
                   new EFCaller<UltraDbEntity.T_ERP_ItemImports>(new CtlItemImportsController());
            }
        }

        //CtlWareAreaController
        protected static EFCaller<UltraDbEntity.T_ERP_WareArea> _Calr_WareArea = null;
        public static EFCaller<UltraDbEntity.T_ERP_WareArea> Calr_WareArea
        {
            get
            {
                return
                    _Calr_WareArea = _Calr_WareArea ??
                   new EFCaller<UltraDbEntity.T_ERP_WareArea>(new CtlWareAreaController());
            }
        }

        //CtlV_ERP_InventCollectController
        protected static EFCaller<UltraDbEntity.V_ERP_InventCollect> _Calr_V_ERP_InventCollect = null;
        public static EFCaller<UltraDbEntity.V_ERP_InventCollect> Calr_V_ERP_InventCollect
        {
            get
            {
                return
                    _Calr_V_ERP_InventCollect = _Calr_V_ERP_InventCollect ??
                   new EFCaller<UltraDbEntity.V_ERP_InventCollect>(new CtlV_ERP_InventCollectController());
            }
        }

        //CtlWreckPriceController
        protected static EFCaller<UltraDbEntity.T_ERP_WreckPrice> _Calr_WreckPrice = null;
        public static EFCaller<UltraDbEntity.T_ERP_WreckPrice> Calr_WreckPrice
        {
            get
            {
                return
                    _Calr_WreckPrice = _Calr_WreckPrice ??
                   new EFCaller<UltraDbEntity.T_ERP_WreckPrice>(new CtlWreckPriceController());
            }
        }

        //CtlWreckTypeController
        protected static EFCaller<UltraDbEntity.T_ERP_WreckType> _Calr_WreckType = null;
        public static EFCaller<UltraDbEntity.T_ERP_WreckType> Calr_WreckType
        {
            get
            {
                return
                    _Calr_WreckType = _Calr_WreckType ??
                   new EFCaller<UltraDbEntity.T_ERP_WreckType>(new CtlWreckTypeController());
            }
        }

        //CtlWorkerController
        protected static EFCaller<UltraDbEntity.T_ERP_Worker> _Calr_Worker = null;
        public static EFCaller<UltraDbEntity.T_ERP_Worker> Calr_Worker
        {
            get
            {
                return
                    _Calr_Worker = _Calr_Worker ??
                   new EFCaller<UltraDbEntity.T_ERP_Worker>(new CtlWorkerController());
            }
        }
    }
}
