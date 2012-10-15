using System;
using System.Collections.Generic;
using System.Text;

namespace IGRSS.Exceptions
{

	[Serializable]
	public class DataLayerException : ApplicationException
	{
		//
		// For guidelines regarding the creation of new exception types, see
		//    http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpgenref/html/cpconerrorraisinghandlingguidelines.asp
		// and
		//    http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dncscol/html/csharp07192001.asp
		//

		public DataLayerException()
		{
		}
		public DataLayerException(string message)
			: base(message)
		{
		}
		public DataLayerException(string message, Exception inner)
			: base(message, inner)
		{
		}
		protected DataLayerException(
		  System.Runtime.Serialization.SerializationInfo info,
		  System.Runtime.Serialization.StreamingContext context)
			: base(info, context)
		{
		}
	}
}
