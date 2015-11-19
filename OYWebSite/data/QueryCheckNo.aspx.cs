using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ultra.FASControls.Caller;
using System.Web.Http;
using UltraDbEntity;
using Ultra.Common;
using Ultra.WindowsControl.Extend;
namespace OYWebSite.data
{
    public partial class QueryCheckNo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static List<QuertResult> Query(string checkNo)
        {
            List<QuertResult> errormsg = new List<QuertResult>();
            QuertResult ord = new QuertResult();
            ord.Reserved2 = "没有查询到相关记录";
            errormsg.Add(ord);
            if (string.IsNullOrEmpty(checkNo))
            {
                return errormsg;
            }
            var consigns = SerNoCaller.Calr_Consignment.Get("select * from T_ERP_Consignment where CheckNo=@0 and IsPrint=1 and IsDel=0", "TY" + checkNo);
            if (consigns == null || consigns.Count < 1) return errormsg;

            var ordlist = SerNoCaller.Calr_ConsignmentOrder.Get("select ItemName,ItemSkuName,Model,Packcount,Num,Volume from T_ERP_ConsignmentOrder where CheckNo=@0", "TY" + checkNo);
            var tracklist = Ultra.WindowsControl.Caller.SerNoCaller.Calr_FollowTrack.Get("select  CreateDate,TrackMessage  from T_ERP_FollowTrack where TradeNo=@0", "TY" + checkNo);
            if (ordlist == null || ordlist.Count < 1)
            {
                return errormsg;
            }
            //if (tracklist == null || tracklist.Count > 0)
            //{
            //    return errormsg;
            //}
            var list = ordlist.MapTo<List<T_ERP_ConsignmentOrder>, List<QuertResult>>();
            list.ForEach(j =>
            {
                j.Flag = true;
            });
            var t = tracklist.MapTo<List<T_ERP_FollowTrack>, List<QuertResult>>();
            t.ForEach(j=>{
                j.Flag = false;
                j.TrackTime = j.CreateDate.ToString("yyyy-MM-dd HH:mm:ss");
            });
            list.AddRange(t);
            return list;
        }

        public class QuertResult : T_ERP_ConsignmentOrder
        {
            public bool Flag { get; set; }
            public string TrackMessage { get; set; }
            public string TrackTime { get; set; }
        }
    }
}