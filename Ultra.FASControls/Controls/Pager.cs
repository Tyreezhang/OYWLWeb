using DevExpress.XtraEditors.Controls;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Ultra.Surface.Common;

namespace Ultra.FASControls.Controls
{
    //public class ItemPricePager : EFPgr<UltraDbEntity.T_ERP_ItemPrice> { }
    public partial class Pager : EFPager
    {
        public Pager()
        {
            InitializeComponent();
        }
    }
    public class IvtChkMasterPager : EFPgr<UltraDbEntity.T_ERP_IvtCheckMaster> { }
    public class ItemPager : EFPgr<UltraDbEntity.T_ERP_Item> { }
    public class InStockPager : EFPgr<UltraDbEntity.T_ERP_InStock> { }
    public class IvtAdjPager : EFPgr<UltraDbEntity.T_ERP_IvtAdj> { }
    public class IvtCollectPager : EFPgr<UltraDbEntity.V_ERP_InventCollect> { }
    public class FinPager : EFPgr<UltraDbEntity.T_ERP_FinRec> { }
    public class ConsignPager : EFPgr<UltraDbEntity.T_ERP_Consignment> { }
    public class NConsignPager : EFPgr<UltraDbEntity.V_ERP_Consignment> { }
    public class DistributorPager : EFPgr<UltraDbEntity.V_ERP_Distributor> { }
    public class LogisBatchPager : EFPgr<UltraDbEntity.V_ERP_LogisBatch> { }
    public class LogisNoDonePager : EFPgr<UltraDbEntity.V_ERP_LogisNoDone> { }
    public class InventoryPager : EFPgr<UltraDbEntity.V_ERP_Inventory> { }

    public class RebatesPager : EFPgr<UltraDbEntity.V_ERP_DistributorRebates> { }
}
