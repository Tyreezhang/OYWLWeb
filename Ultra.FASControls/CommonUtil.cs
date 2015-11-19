using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Ultra.FASControls
{
    public class CommonUtil
    {
        public static string ConnStr
        {
            get
            {
                _ConnStr = string.IsNullOrEmpty(_ConnStr) ? GetConn() : _ConnStr;
                return _ConnStr;
            }
        }
        public static string UltraServerImageStr
        {
            get
            {
                _UltraServerImageStr = string.IsNullOrEmpty(_UltraServerImageStr) ? GetImg() : _UltraServerImageStr;
                return _UltraServerImageStr;
            }
        }

        public static string ImageStr
        {
            get
            {
                _ImageStr = string.IsNullOrEmpty(_ImageStr) ? GetshowImg() : _ImageStr;
                return _ImageStr;
            }
        }

        private static string GetConn()
        {
            Ultra.Web.Core.Configuration.OptionConfig cfg = new Ultra.Web.Core.Configuration.OptionConfig(Ultra.Web.Core.Configuration.EnOptionConfigType.Web);
            string vlu = cfg.Get<string>("conn");
            if (string.IsNullOrEmpty(vlu))
                cfg.Set<string>("conn", string.Empty);
            return vlu;
        }

        private static string GetImg()
        {
            Ultra.Web.Core.Configuration.OptionConfig cfg = new Ultra.Web.Core.Configuration.OptionConfig(Ultra.Web.Core.Configuration.EnOptionConfigType.Web);
            string vlu = cfg.Get<string>("UltraServerImage");
            if (string.IsNullOrEmpty(vlu))
                cfg.Set<string>("UltraServerImage", string.Empty);
            return vlu;
        }

        private static string GetshowImg()
        {
            Ultra.Web.Core.Configuration.OptionConfig cfg = new Ultra.Web.Core.Configuration.OptionConfig(Ultra.Web.Core.Configuration.EnOptionConfigType.Web);
            string vlu = cfg.Get<string>("Image");
            if (string.IsNullOrEmpty(vlu))
                cfg.Set<string>("Image", string.Empty);
            return vlu;
        }

        private static string _ConnStr = string.Empty;

        private static string _UltraServerImageStr = string.Empty;

        private static string _ImageStr = string.Empty;

    }

    public class EasyGridData<T>
    {
        public string total { get; set; }

        public List<T> rows { get; set; }

        public EasyGridData<T> Init(PetaPoco.Page<T> pg)
        {
            this.total = pg.TotalItems.ToString();
            this.rows = pg.Items;
            return this;
        }
    }
}