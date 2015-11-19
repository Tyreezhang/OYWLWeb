using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Ultra.CoreCaller;
using Ultra.FASControls.Controllers;

namespace Ultra.FASControls.Caller
{
    public partial class SerNoCaller
    {
        static SerNoCaller()
        {
            Ultra.Surface.Lanuch.Lanucher.SetConnectionStrng(SQLCONN.Conn);
            var che = new Ultra.Cache.CacheBase();
            che.Put<bool>("Ultra.SYS.Core.BSMode", false);
            Ultra.Common.Util.SetCache(che);
        }


        //CtlMessageController
        protected static EFCaller<UltraDbEntity.T_ERP_Message> _Calr_Message = null;
        public static EFCaller<UltraDbEntity.T_ERP_Message> Calr_Message
        {
            get
            {
                return
                    _Calr_Message = _Calr_Message ??
                   new EFCaller<UltraDbEntity.T_ERP_Message>(new CtlMessageController());
            }
        }

        //CtlV_ERP_SalesDetalIMGController
        protected static EFCaller<UltraDbEntity.V_ERP_SalesDetalIMG> _Calr_V_ERP_SalesDetalIMG = null;
        public static EFCaller<UltraDbEntity.V_ERP_SalesDetalIMG> Calr_V_ERP_SalesDetalIMG
        {
            get
            {
                return
                    _Calr_V_ERP_SalesDetalIMG = _Calr_V_ERP_SalesDetalIMG ??
                   new EFCaller<UltraDbEntity.V_ERP_SalesDetalIMG>(new CtlV_ERP_SalesDetalIMGController());
            }
        }

        //CtlAftersalesController
        protected static EFCaller<UltraDbEntity.T_ERP_Aftersales> _Calr_Aftersales = null;
        public static EFCaller<UltraDbEntity.T_ERP_Aftersales> Calr_Aftersales
        {
            get
            {
                return
                    _Calr_Aftersales = _Calr_Aftersales ??
                   new EFCaller<UltraDbEntity.T_ERP_Aftersales>(new CtlAftersalesController());
            }
        }

        //CtlImageController
        protected static EFCaller<UltraDbEntity.T_ERP_Image> _Calr_Image = null;
        public static EFCaller<UltraDbEntity.T_ERP_Image> Calr_Image
        {
            get
            {
                return
                    _Calr_Image = _Calr_Image ??
                   new EFCaller<UltraDbEntity.T_ERP_Image>(new CtlImageController());
            }
        }
        //CtlV_ERP_ConsignmentController
        protected static EFCaller<UltraDbEntity.V_ERP_Consignment> _Calr_V_ERP_Consignment = null;
        public static EFCaller<UltraDbEntity.V_ERP_Consignment> Calr_V_ERP_Consignment
        {
            get
            {
                return
                    _Calr_V_ERP_Consignment = _Calr_V_ERP_Consignment ??
                   new EFCaller<UltraDbEntity.V_ERP_Consignment>(new CtlV_ERP_ConsignmentController());
            }
        }

        //CtlV_ERP_DistributorRebatesController
        protected static EFCaller<UltraDbEntity.V_ERP_DistributorRebates> _Calr_V_ERP_DistributorRebates = null;
        public static EFCaller<UltraDbEntity.V_ERP_DistributorRebates> Calr_V_ERP_DistributorRebates
        {
            get
            {
                return
                    _Calr_V_ERP_DistributorRebates = _Calr_V_ERP_DistributorRebates ??
                   new EFCaller<UltraDbEntity.V_ERP_DistributorRebates>(new CtlV_ERP_DistributorRebatesController());
            }
        }

        //CtlOYRebatesController
        protected static EFCaller<UltraDbEntity.T_ERP_OYRebates> _Calr_OYRebates = null;
        public static EFCaller<UltraDbEntity.T_ERP_OYRebates> Calr_OYRebates
        {
            get
            {
                return
                    _Calr_OYRebates = _Calr_OYRebates ??
                   new EFCaller<UltraDbEntity.T_ERP_OYRebates>(new CtlOYRebatesController());
            }
        }
        //CtlLogisBatchController
        protected static EFCaller<UltraDbEntity.T_ERP_LogisBatch> _Calr_LogisBatch = null;
        public static EFCaller<UltraDbEntity.T_ERP_LogisBatch> Calr_LogisBatch
        {
            get
            {
                return
                    _Calr_LogisBatch = _Calr_LogisBatch ??
                   new EFCaller<UltraDbEntity.T_ERP_LogisBatch>(new CtlLogisBatchController());
            }
        }

        //CtlV_ERP_LogisNoDoneController
        protected static EFCaller<UltraDbEntity.V_ERP_LogisNoDone> _Calr_V_ERP_LogisNoDone = null;
        public static EFCaller<UltraDbEntity.V_ERP_LogisNoDone> Calr_V_ERP_LogisNoDone
        {
            get
            {
                return
                    _Calr_V_ERP_LogisNoDone = _Calr_V_ERP_LogisNoDone ??
                   new EFCaller<UltraDbEntity.V_ERP_LogisNoDone>(new CtlV_ERP_LogisNoDoneController());
            }
        }

        //CtlV_ERP_LogisBatchController
        protected static EFCaller<UltraDbEntity.V_ERP_LogisBatch> _Calr_V_ERP_LogisBatch = null;
        public static EFCaller<UltraDbEntity.V_ERP_LogisBatch> Calr_V_ERP_LogisBatch
        {
            get
            {
                return
                    _Calr_V_ERP_LogisBatch = _Calr_V_ERP_LogisBatch ??
                   new EFCaller<UltraDbEntity.V_ERP_LogisBatch>(new CtlV_ERP_LogisBatchController());
            }
        }

        //CtlV_ERP_InventoryController
        protected static EFCaller<UltraDbEntity.V_ERP_Inventory> _Calr_V_ERP_Inventory = null;
        public static EFCaller<UltraDbEntity.V_ERP_Inventory> Calr_V_ERP_Inventory
        {
            get
            {
                return
                    _Calr_V_ERP_Inventory = _Calr_V_ERP_Inventory ??
                   new EFCaller<UltraDbEntity.V_ERP_Inventory>(new CtlV_ERP_InventoryController());
            }
        }
        //CtlV_ERP_DistributorController
        protected static EFCaller<UltraDbEntity.V_ERP_Distributor> _Calr_V_ERP_Distributor = null;
        public static EFCaller<UltraDbEntity.V_ERP_Distributor> Calr_V_ERP_Distributor
        {
            get
            {
                return
                    _Calr_V_ERP_Distributor = _Calr_V_ERP_Distributor ??
                   new EFCaller<UltraDbEntity.V_ERP_Distributor>(new CtlV_ERP_DistributorController());
            }
        }

        //CtlInventoryController
        protected static EFCaller<UltraDbEntity.T_ERP_Inventory> _Calr_Inventory = null;
        public static EFCaller<UltraDbEntity.T_ERP_Inventory> Calr_Inventory
        {
            get
            {
                return
                    _Calr_Inventory = _Calr_Inventory ??
                   new EFCaller<UltraDbEntity.T_ERP_Inventory>(new CtlInventoryController());
            }
        }

        //CtlConsignmentController
        protected static EFCaller<UltraDbEntity.T_ERP_Consignment> _Calr_Consignment = null;
        public static EFCaller<UltraDbEntity.T_ERP_Consignment> Calr_Consignment
        {
            get
            {
                return
                    _Calr_Consignment = _Calr_Consignment ??
                   new EFCaller<UltraDbEntity.T_ERP_Consignment>(new CtlConsignmentController());
            }
        }

        //CtlConsignmentOrderController
        protected static EFCaller<UltraDbEntity.T_ERP_ConsignmentOrder> _Calr_ConsignmentOrder = null;
        public static EFCaller<UltraDbEntity.T_ERP_ConsignmentOrder> Calr_ConsignmentOrder
        {
            get
            {
                return
                    _Calr_ConsignmentOrder = _Calr_ConsignmentOrder ??
                   new EFCaller<UltraDbEntity.T_ERP_ConsignmentOrder>(new CtlConsignmentOrderController());
            }
        }

        ////CtlImageController
        //protected static EFCaller<UltraDbEntity.T_ERP_Image> _Calr_Image = null;
        //public static EFCaller<UltraDbEntity.T_ERP_Image> Calr_Image
        //{
        //    get
        //    {
        //        return
        //            _Calr_Image = _Calr_Image ??
        //           new EFCaller<UltraDbEntity.T_ERP_Image>(new CtlImageController());
        //    }
        //}


        protected static EFCaller<UltraDbEntity.T_ERP_SerNo> _ins = null;
        public static EFCaller<UltraDbEntity.T_ERP_SerNo> Instance
        {
            get
            {
                return _ins = (_ins == null) ? new EFCaller<UltraDbEntity.T_ERP_SerNo>(
                    new CtlSerNoController()) : _ins;
            }
        }

        public static UltraDbEntity.T_ERP_SerNo GetSerNo(string dep)
        {
            var et = Instance.GetByProc("exec P_ERP_GetSerialNo @0", dep)
                .FirstOrDefault();
            return et;
        }

  
     
        //CtlSuppliersController
        protected static EFCaller<UltraDbEntity.T_ERP_Suppliers> _Calr_Suppliers = null;
        public static EFCaller<UltraDbEntity.T_ERP_Suppliers> Calr_Suppliers
        {
            get
            {
                return
                    _Calr_Suppliers = _Calr_Suppliers ??
                   new EFCaller<UltraDbEntity.T_ERP_Suppliers>(new CtlSuppliersController());
            }
        }
        
        //CtlRoleUserController
        protected static EFCaller<UltraDbEntity.T_ERP_RoleUser> _Calr_RoleUser = null;
        public static EFCaller<UltraDbEntity.T_ERP_RoleUser> Calr_RoleUser
        {
            get
            {
                return
                    _Calr_RoleUser = _Calr_RoleUser ??
                   new EFCaller<UltraDbEntity.T_ERP_RoleUser>(new CtlRoleUserController());
            }
        }
        //CtlUserController
        protected static EFCaller<UltraDbEntity.T_ERP_User> _Calr_User = null;
        public static EFCaller<UltraDbEntity.T_ERP_User> Calr_User
        {
            get
            {
                return
                    _Calr_User = _Calr_User ??
                   new EFCaller<UltraDbEntity.T_ERP_User>(new CtlUserController());
            }
        }
    }
}
