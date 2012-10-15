using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace IGRSS.BusinessLogicLayer.Adjudication
{
	class AdjudicationAlerts
	{
		private AdjudicationAlerts PAdapter;
		public AdjudicationAlerts Adapter
		{
			get
			{
				return PAdapter;
			}
			set
			{
				PAdapter = value;

			}
		}

			public DataTable GetData()
			{
				return Adapter.GetData();

			}
		}

	}



