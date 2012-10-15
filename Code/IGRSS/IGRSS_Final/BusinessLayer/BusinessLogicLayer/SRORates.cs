
using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using IGRSS.BusinessObjects;
using System.Threading;
using IGRSS.DataAccessLayer;
using SRORatesTable = IGRSS.DataAccessLayer.SRORates.SRORatesDataTable;
using System.ComponentModel;


namespace IGRSS.BusinessLogicLayer
{

    [DataObject]
	public class SRORates
	{
        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

        public SRORatesTable GetSRORates()
        {
           return IgrssAdapters.SroRateAdapter.GetSRORates();
        }



        [DataObjectMethodAttribute(DataObjectMethodType.Select, true)]

        public SRORatesTable GetSRORatesById(Guid RateId)
        {
            return IgrssAdapters.SroRateAdapter.GetSRoRateById(RateId);
        }


        [DataObjectMethodAttribute(DataObjectMethodType.Insert, true)]
        public bool AddNewSRORates(Guid RateId,string RateType,decimal Amount)
        {
            RateId = Guid.NewGuid();
            IgrssAdapters.SroRateAdapter.AddNewSRORate(RateId, RateType, Amount);
            return true;
        }

        [DataObjectMethodAttribute(DataObjectMethodType.Update, true)]

        public bool UpdateSRORate(Guid RateId, string RateType, decimal Amount)
        {
            
            IgrssAdapters.SroRateAdapter.UpdateSRORate(RateId, RateType, Amount);
            return true;
        }

          



	}
}
