using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;

public partial class UserControls_StatusInformation : System.Web.UI.UserControl
{
    private MessageType m_Mode;
    /// <summary>
    /// The mode in which the control is to be displayed
    /// </summary>
    public MessageType Mode
    {
        get { return m_Mode; }
        set
        {
            m_Mode = value;
            switch (m_Mode)
            {
                case MessageType.Error:
                    this.ForeColor = Color.Red;
                    imgIcon.ImageUrl = "~/Images/Error.png";
                    break;
                case MessageType.Success:
                    this.ForeColor = Color.DarkGreen;
                    imgIcon.ImageUrl = "~/Images/Sucess.png";
                    break;
                case MessageType.Information:
                    this.ForeColor = Color.Blue;
                    imgIcon.ImageUrl = "~/Images/Information.png";
                    break;
            }
        }
    }

    private string m_Message;
    /// <summary>
    /// The message that has to be displayed
    /// </summary>
    public string Message
    {
        get { return m_Message; }
        set { m_Message = value; }
    }

    private Color m_ForeColor;
    /// <summary>
    /// The color that is used to show the message
    /// </summary>
    protected Color ForeColor
    {
        get { return m_ForeColor; }
        set { m_ForeColor = value; }
    }
    private string m_MessageDetails;
    /// <summary>
    /// Detailed descripcion about the message that is displayed
    /// </summary>
    public string MessageDetails
    {
        get { return m_MessageDetails; }
        set { m_MessageDetails = value; }
    }
	 
    private bool m_ShowDetails;
    /// <summary>
    /// Indicates if more information about the message has to be displayed on not
    /// </summary>
    public bool ShowDetails
    {
        get { return m_ShowDetails; }
        set { m_ShowDetails = value; }
    }

    public UserControls_StatusInformation()
    {
        this.Visible = false;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMessage.Attributes.Add("OnClick", "showDetails();");
    }

    public void ShowMessge()
    {
        lblMessage.ForeColor = this.ForeColor;
        lblMessage.Text = Message;
        lblMessageDetails.Text = MessageDetails;
        this.Visible = true;
    }

    public void HideMessge()
    {
        this.Visible = false;
    }


}
