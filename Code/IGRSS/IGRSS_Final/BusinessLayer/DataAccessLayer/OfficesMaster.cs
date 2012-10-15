using System.Data.SqlClient;
namespace IGRSS.DataAccessLayer.OfficesMasterTableAdapters
{
	internal partial class OfficeMasterTableAdapter : System.ComponentModel.Component
	{
		private SqlTransaction m_Transaction;

		public SqlTransaction Transaction
		{
			get
			{
				return m_Transaction;
			}
			set
			{
				m_Transaction = value;
				_connection = m_Transaction.Connection;
				if (_adapter == null)
					this.InitAdapter();
				foreach (SqlCommand command in this.CommandCollection)
				{
					command.Transaction = m_Transaction;
				}
				this.Adapter.InsertCommand.Transaction = m_Transaction;
				this.Adapter.UpdateCommand.Transaction = m_Transaction;
				this.Adapter.DeleteCommand.Transaction = m_Transaction;
			}
		}

		public void SetCommandTimeout(int timeout)
		{
			foreach (System.Data.IDbCommand command in CommandCollection)
				command.CommandTimeout = timeout;
		} 
	}
}
namespace IGRSS.DataAccessLayer {
    
    
    public partial class OfficesMaster {
        partial class OfficeTypes_LKPDataTable
        {
        }
    }
}
