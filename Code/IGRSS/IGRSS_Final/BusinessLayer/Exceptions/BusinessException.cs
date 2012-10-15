using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.Serialization;

namespace IGRSS.Exceptions
{

	[global::System.Serializable]
	public class CommunicatingOfficeNotFoundException : ApplicationException
	{
		//
		// For guidelines regarding the creation of new exception types, see
		//    http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpgenref/html/cpconerrorraisinghandlingguidelines.asp
		// and
		//    http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dncscol/html/csharp07192001.asp
		//

		public CommunicatingOfficeNotFoundException()
		{
		}
		public CommunicatingOfficeNotFoundException(string message)
			: base(message)
		{
		}
		public CommunicatingOfficeNotFoundException(string message, Exception inner)
			: base(message, inner)
		{
		}
		protected CommunicatingOfficeNotFoundException(SerializationInfo info, StreamingContext context)
			: base(info, context)
		{
		}
	}
}
