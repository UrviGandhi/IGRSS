using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.Serialization;

namespace IGRSS.Exceptions
{

	[Serializable]
	public class OperationFailedException : ApplicationException
	{
		//
		// For guidelines regarding the creation of new exception types, see
		//    http://msdn.microsoft.com/library/default.asp?url=/library/en-us/cpgenref/html/cpconerrorraisinghandlingguidelines.asp
		// and
		//    http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dncscol/html/csharp07192001.asp
		//

		public OperationFailedException()
		{
		}

		public OperationFailedException(string message)
			: base(message)
		{
		}

		public OperationFailedException(string message, Exception inner)
			: base(message, inner)
		{
		}

		protected OperationFailedException(SerializationInfo info, StreamingContext context)
			: base(info, context)
		{
		}
	}
}
