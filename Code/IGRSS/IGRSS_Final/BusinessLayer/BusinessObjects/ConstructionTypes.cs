using System;
using System.CodeDom.Compiler;
using System.Xml.Serialization;

namespace IGRSS.BusinessObjects
{
	[Serializable]
	[GeneratedCode("System.Xml", "2.0.50727.42")]
	[XmlType(Namespace = "http://IGRSS.org/ConstructionTypes")]
	public enum ConstructionTypes
	{
		Residential = 0,
		Commercial = 1,
		Industrial = 2,
	}
}
