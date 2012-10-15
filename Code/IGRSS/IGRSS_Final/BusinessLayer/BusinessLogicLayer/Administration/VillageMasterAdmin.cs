using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using VillageMasterTable= IGRSS.DataAccessLayer.VillageMasterAdministrator.villagemasterAdministratorDataTable;
using IGRSS.BusinessObjects;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;

namespace IGRSS.BusinessLogicLayer.Administration
{
    [DataObject]
	class VillageMasterAdmin
	{
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

        public VillageMasterTable GetVillages()
        {
            VillageMasterTable dt = new VillageMasterTable();
            try
            {
                dt = IgrssAdapters.VillageMasterAdmin.GetData();
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return dt;
        }

        public bool AddVillage(int vallid,int distid,int talid,string villageName,string villname_g,int global,int nrate,int gamtalrate_high,int gamtalrate_mid,int gamtalrate_low,int gamtalrate_prop,int taluka,int Office,int district)
        {
            try
            {
                IgrssAdapters.VillageMasterAdmin.AddnewVillage( vallid, distid, talid, villageName, villname_g, global, nrate, gamtalrate_high, gamtalrate_mid, gamtalrate_low, gamtalrate_prop, taluka, Office, district,false);
            }
            catch (Exception ex)
            {
                if (ExceptionPolicy.HandleException(ex, "DAL"))
                    throw;
            }
            return true;
        }
	}
}
