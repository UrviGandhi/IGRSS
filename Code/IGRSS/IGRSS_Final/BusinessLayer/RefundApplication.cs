using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using DataAccessLayer.RefundApplicationTableAdapters;


namespace BusinessLogicLayer
{
	class RefundApplication
	{
		private RefundApplicationDetailsTableAdapter PRefundAdapter;
		public RefundApplicationDetailsTableAdapter RefundAdapter
		{
			get{
				return PRefundAdapter;
		       }

		    set
			   {
				   value = RefundAdapter;

	          }

	     }

		public RefundApplication()
		{
			RefundAdapter = new RefundApplicationDetailsTableAdapter();

		}

		public DataTable GetRefundDetails(string exp,string SortExpression)
		{
         return RefundAdapter.GetData();
		}

public bool NewRefundApplication(int RegistrationId ,
	string ApplicantName,
	DateTime RegistrationDate,
	string SubRegistrarOfficeName,
	string TalukaCode,
	string DistrictCode,
	string StampsNo ,
	string VendorLicense ,
	DateTime StampsPurchasedDate ,
	string UnusedStampsNo ,
	decimal PaidStampDuty ,
	string FrankingMachineStampsNo ,
	string FrankingMachineAuthorityId ,
	Boolean RefundPayable,
	decimal RefundAmount ,
	DateTime CraetedBy ,
	string CreatedAt ,
	DateTime ModifiedBy ,
	string ModifiedAt,
	Boolean Deleted ,
    string RefundDetailsInfo )
		{
			RefundAdapter.InsertRefundApplication(RegistrationId ,
	 ApplicantName,
	 RegistrationDate,
	 SubRegistrarOfficeName,
	 TalukaCode,
	 DistrictCode,
	 StampsNo ,
	 VendorLicense ,
	 StampsPurchasedDate ,
	 UnusedStampsNo ,
	 PaidStampDuty ,
	 FrankingMachineStampsNo ,
	 FrankingMachineAuthorityId ,
	 RefundPayable,
	 RefundAmount ,
	 CraetedBy ,
	 CreatedAt ,
	 ModifiedBy ,
	 ModifiedAt,
	 Deleted ,
     RefundDetailsInfo);

			return true;
		}
public int UpdateRefundApplication(
	int RegistrationId ,
	string ApplicantName ,
	DateTime RegistrationDate ,
	string SubRegistrarOfficeName ,
	string TalukaCode,
	string DistrictCode ,
	string StampsNo ,
	string VendorLicense ,
	DateTime StampsPurchasedDate ,
	string UnusedStampsNo ,
	float PaidStampDuty ,
	string FrankingMachineStampsNo ,
	string FrankingMachineAuthorityId ,
	Boolean RefundPayable ,
	float RefundAmount ,
	DateTime CraetedBy ,
	string CreatedAt ,
	DateTime ModifiedBy ,
	string ModifiedAt ,
	Boolean Deleted ,
	string RefundDetailsInfo)
    {
		RefundAdapter.UpdateRefundApplication(RegistrationId,
		ApplicantName,
		RegistrationDate,
		SubRegistrarOfficeName,
		TalukaCode,
		DistrictCode,
		StampsNo,
		VendorLicense,
		StampsPurchasedDate,
		UnusedStampsNo,
		PaidStampDuty,
		FrankingMachineStampsNo,
		FrankingMachineAuthorityId,
		RefundPayable,
		RefundAmount,
		CraetedBy,
		CreatedAt,
		ModifiedBy,
		ModifiedAt,
		Deleted,
		RefundDetailsInfo);

 }

		public bool DeleteRefundApplication(long  RefundApplicationId)
		{
			RefundAdapter.DeleteRefundApplication(RefundApplicationId);
			return true;


		}



	










	   




	}
}
