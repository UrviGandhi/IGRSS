using System;
using System.Collections.Generic;
using System.Text;

namespace IGRSS.BusinessObjects
{
	public class Remarks
	{
        private Guid m_FileId;
        /// <summary>
        /// This Is the file Id
        /// </summary>
        public Guid FileId
        {
            get { return m_FileId; }
            set { m_FileId = value; }
        }

        private string m_Subject;
        /// <summary>
        /// This Is the Subject
        /// </summary>
        public string Subject
        {
            get { return m_Subject; }
            set { m_Subject = value; }
        }

        private string m_Body;
        /// <summary>
        /// This is the body
        /// </summary>
        public string Body
        {
            get { return m_Body; }
            set { m_Body = value; }
        }
	}
}
