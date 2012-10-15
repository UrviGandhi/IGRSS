using System;
using System.Collections;
using System.ComponentModel;
using System.Configuration.Install;
using System.Collections.Specialized;
using System.Configuration;
using System.Diagnostics;
using System.Reflection;
using System.IO;

using IgrssInstallerActions.ReportingService2005;
using System.Web.Services.Protocols;

namespace IgrssInstallerActions
{
    public class ReportInstaller : System.Configuration.Install.Installer
    {
        #region Properties

        /// <summary>
        /// Required designer variable.
        /// </summary>
        private Container components = null;

        /// <summary>
        /// Variable to hold the database provider type.
        /// </summary>
        private string m_extension = string.Empty;

        protected string Extension
        {
            get { return m_extension; }
            set { m_extension = value; }
        }

        /// <summary>
        /// Variable to hold the Servername to fetch the data for the report.
        /// </summary>
        private string m_serverName = string.Empty;

        protected string ServerName
        {
            get { return m_serverName; }
            set { m_serverName = value; }
        }

        /// <summary>
        /// Variable to hold the DataSourceLocation in the report server for
        /// the deployed report.
        /// </summary>
        private string m_datasourceLocation = string.Empty;

        protected string DatasourceLocation
        {
            get { return m_datasourceLocation; }
            set { m_datasourceLocation = value; }
        }

        /// <summary>
        /// Variable to hold the parent folder name in the report server to 
        /// deploy the report.
        /// </summary>
        private string m_parent = string.Empty;

        protected string Parent
        {
            get { return m_parent; }
            set { m_parent = value; }
        }

        /// <summary>
        /// Variable to hold the folder name in the report server to deploy the 
        /// report.
        /// </summary>
        private string m_folder = string.Empty;

        protected string Folder
        {
            get { return m_folder; }
            set { m_folder = value; }
        }

        /// <summary>
        /// Variable to hold the ConnectionString for each report.
        /// </summary>
        private string m_connectString = string.Empty;

        protected string ConnectString
        {
            get { return m_connectString; }
            set { m_connectString = value; }
        }

        /// <summary>
        /// Variable to hold the webservice client to access the reporting server.
        /// </summary>
        private ReportingService2005.ReportingService2005 m_reportingService
            = new ReportingService2005.ReportingService2005();

        protected ReportingService2005.ReportingService2005 ReportingService
        {
            get { return m_reportingService; }
            set { m_reportingService = value; }
        }

        /// <summary>
        /// Variable to hold the database name to fetch the data for the report.
        /// </summary>
        private string m_databaseName = string.Empty;

        protected string DatabaseName
        {
            get { return m_databaseName; }
            set { m_databaseName = value; }
        }

        /// <summary>
        /// Variable to hold the datasource name used by the report.
        /// </summary>
        private string m_dataSource = string.Empty;

        protected string DataSource
        {
            get { return m_dataSource; }
            set { m_dataSource = value; }
        }

        /// <summary>
        /// Variable to hold the full path of the report to be deployed.
        /// </summary>
        private string m_reportPath = string.Empty;

        protected string ReportPath
        {
            get { return m_reportPath; }
            set { m_reportPath = value; }
        }

        /// <summary>
        /// Variable to hold the properties of finditems.
        /// </summary>
        private CatalogItem[] m_returnedItems;

        protected CatalogItem[] ReturnedItems
        {
            get { return m_returnedItems; }
            set { m_returnedItems = value; }
        }

        /// <summary>
        /// Collection to hold the reports to deploy.
        /// </summary>
        private ArrayList m_connectionStrings = new ArrayList();

        protected ArrayList ConnectionStrings
        {
            get { return m_connectionStrings; }
            set { m_connectionStrings = value; }
        }

        #endregion Properties

        #region Constructors
        /// <summary>
        /// Default Constructor.
        /// </summary>
        public ReportInstaller()
        {
            // This call is required by the Designer.
            InitializeComponent();

            InitializeDeploy();
        }

        private void InitializeDeploy()
        {
            this.Extension = this.GetValueFromConfig("appSettings", "Extension");
            this.ServerName = this.GetValueFromConfig("appSettings", "ServerName");
            this.DatasourceLocation = this.GetValueFromConfig("appSettings",
                           "DataSourceLocation");
            this.Parent = this.GetValueFromConfig("appSettings", "Parent");
            this.Folder = this.GetValueFromConfig("appSettings", "Folder");

            // Set security credentials for web service client authorization.
            ReportingService.Credentials = System.Net.CredentialCache.DefaultCredentials;

            // Create report folder to drop report in.
            if (this.Folder.Length > 0 && this.Parent.Length > 0)
            {
                // Create folder if not exists.
                if (this.CheckExist(ItemTypeEnum.Folder,
                    this.Parent, this.Folder) == false)
                {
                    ReportingService.CreateFolder(this.Folder, this.Parent, null);
                }
            }
            else
            {
                // Log the error.				
            }

            this.GetReportsToDeploy("ReportDetails");
            this.Deploy();
        }

        #endregion Constructors

        #region Designer Generated Code
        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            components = new System.ComponentModel.Container();
        }
        #endregion Designer Generated Code

        /// <summary>
        /// This function reads a setting from the config file.Empty string 
        /// returned if no setting was found. Raise error if config can not be 
        /// read
        /// </summary>
        /// <param name="sectionName">This is the section name in the config 
        /// file</param>
        /// <param name="keyName">This is the name of the key in the specfied 
        /// section in the config file</param>
        /// <returns>string</returns>
        private string GetValueFromConfig(string sectionName, string keyName)
        {
            string value = string.Empty;
            try
            {
                // Read the configuration settings from the configuration file
                NameValueCollection ConfigSection = (NameValueCollection)
                    ConfigurationSettings.GetConfig(sectionName);

                // If there is a key return , else return empty string
                if (ConfigSection != null && ConfigSection[keyName] != null)
                {
                    value = ConfigSection[keyName];
                }
            }
            catch (Exception ex)
            {
                // Consume the error, so that the service keeps running,
                // but log the error.
                EventLog.WriteEntry(Assembly.GetExecutingAssembly().FullName,
                    ex.Message, EventLogEntryType.Error);
            }
            return value;
        }

        /// <summary>
        /// Checks if the folder exists or not.
        /// </summary>		
        /// <param name="path">Parent folder path</param>
        /// <param name="folderName">Name of the folder to search</param>
        /// <returns>True if found, else false.</returns>
        private bool CheckExist(ItemTypeEnum type, string path, string folderName)
        {
            string fullPath = path + folderName;

            // Condition criteria.
            SearchCondition[] conditions;

            // Condition criteria.			
            SearchCondition condition = new SearchCondition();
            condition.Condition = ConditionEnum.Contains;
            condition.ConditionSpecified = true;
            condition.Name = "Name";
            switch (type)
            {
                case ItemTypeEnum.Unknown:
                    break;
                case ItemTypeEnum.Folder:
                    condition.Value = folderName;
                    break;
                case ItemTypeEnum.Report:
                    break;
                case ItemTypeEnum.Resource:
                    break;
                case ItemTypeEnum.LinkedReport:
                    break;
                case ItemTypeEnum.DataSource:
                    path += folderName.Substring(0, folderName.LastIndexOf('/'));
                    condition.Value = folderName.Substring(folderName.LastIndexOf('/') + 1);
                    break;
                case ItemTypeEnum.Model:
                    break;
                default:
                    break;
            }
            conditions = new SearchCondition[1];
            conditions[0] = condition;

            this.ReturnedItems = ReportingService.FindItems(path, BooleanOperatorEnum.Or,
                conditions);

            // Iterate thro' each report properties to get the path.
            foreach (CatalogItem item in ReturnedItems)
            {
                if (item.Type == type)
                {
                    if (item.Path == fullPath)
                        return true;
                }
            }
            return false;
        }

        /// <summary>
        /// Gets all the tags under the section.
        /// </summary>
        private void GetReportsToDeploy(string sectionName)
        {
            try
            {
                // Read the configuration settings from the configuration file
                NameValueCollection ConfigSection = (NameValueCollection)
                    ConfigurationSettings.GetConfig(sectionName);
                this.ConnectionStrings.Clear();

                if (ConfigSection != null && ConfigSection.HasKeys() == true)
                {
                    for (int count = 0; count < ConfigSection.Keys.Count; count++)
                    {
                        this.ConnectionStrings.Add(ConfigSection[ConfigSection.Keys[count]]);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Deploys the report to the reporting server.
        /// </summary>
        private void Deploy()
        {
            foreach (object report in this.ConnectionStrings)
            {
                // Get the connection string for the report to deploy.
                //this.connectString = this.GetValueFromConfig( "ReportDetails", 
                //	"Report1");
                this.ConnectString = report.ToString();

                // Continue deploying report if report details provided.
                if (this.ConnectString.Length > 0)
                {
                    // Set report details.
                    this.SetReportInfo();

                    // Open the report (rdl) file and read the data into the stream.
                    byte[] reportDefinition;
                    Warning[] Warnings;
                    FileStream Stream = File.OpenRead(this.ReportPath);
                    reportDefinition = new Byte[Stream.Length];
                    Stream.Read(reportDefinition, 0, (int)Stream.Length);
                    Stream.Close();

                    // Create the report into the server.
                    string reportName = this.ReportPath.Substring(
                        this.ReportPath.LastIndexOf("\\") + 1);
                    Warnings = (Warning[]) ReportingService.CreateReport(reportName.Remove
                        (reportName.Length - 4, 4), this.Parent + this.Folder, true,
                        reportDefinition, null);

                    // Create datasource for the report.
                    DataSource dSource = new DataSource();
                    DataSourceDefinition dDefinition = new DataSourceDefinition();
                    dSource.Item = dDefinition;
                    dDefinition.Extension = this.Extension;
                    dDefinition.ConnectString = @"Data Source=" + this.ServerName
                        + @";Initial Catalog=" + this.DatabaseName;
                    //dDefinition.ImpersonateUserSpecified = true;
                    //dDefinition.Prompt = null;
                    dDefinition.WindowsCredentials = false;
                    dDefinition.CredentialRetrieval = CredentialRetrievalEnum.Integrated;
                    dSource.Name = this.DataSource;

                    try
                    {
                        if (this.CheckExist(ItemTypeEnum.DataSource, this.Parent,
                            this.DatasourceLocation + "/" + this.DataSource) == false)
                        {
                            ReportingService.CreateDataSource(this.DataSource, @"/" +
                                this.DatasourceLocation, false, dDefinition, null);
                        }
                    }
                    catch (SoapException ex)
                    {
                        throw ex;
                    }

                    // Report and Datasource created, now fix up datasource reference to
                    // make sure report points at correct dataset.
                    try
                    {
                        DataSourceReference reference = new DataSourceReference();
                        DataSource ds = new DataSource();
                        reference.Reference = @"/" + this.DatasourceLocation + @"/"
                            + this.DataSource;
                        DataSource[] dsarray = ReportingService.GetItemDataSources(this.Parent +
                            this.Folder + "/" + reportName.Remove
                            (reportName.Length - 4, 4));
                        ds = dsarray[0];
                        ds.Item = (DataSourceReference)reference;
                        ReportingService.SetItemDataSources(this.Parent +
                            this.Folder + "/" + reportName.Remove
                            (reportName.Length - 4, 4), dsarray);
                    }
                    catch (Exception e)
                    {
                        throw (e);
                    }
                }
            }
        }

        /// <summary>
        /// Sets report definition such as databasename to connect, datasource 
        /// of the report and path for the report.
        /// </summary>
        private void SetReportInfo()
        {
            string[] temp = this.ConnectString.Split(";".ToCharArray());
            string[] properties = new string[temp.Length];

            for (int count = 0; count < temp.Length; count++)
            {
                properties[count] = temp[count].Split("=".ToCharArray())[1];
            }

            // Get the deployment info for the report.
            if (properties.Length == 3)
            {
                this.DatabaseName = properties[0];
                this.DataSource = properties[1];
                this.ReportPath = properties[2];
            }
        }

    }
}
