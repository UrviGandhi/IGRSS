using System;
using System.Configuration;
using System.Configuration.Install;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.DirectoryServices;

namespace IgrssInstallerActions
{
    [RunInstaller(true)]
    public class IgrssInstallerAction : Installer
    {
        public override void Install(System.Collections.IDictionary stateSaver)
        {
            base.Install(stateSaver);



            #region Commented Code
            //        // Retrieve configuration settings
            //string targetSite = Context.Parameters["targetsite"];
            //string targetVDir = Context.Parameters["targetvdir"];
            //string targetDirectory = Context.Parameters["targetdir"];

            //if (targetSite == null)
            //    throw new InstallException("IIS Site Name Not Specified!");

            //if (targetSite.StartsWith("/LM/"))
            //    targetSite = targetSite.Substring(4);

            //RegisterScriptMaps(targetSite, targetVDir);

            #endregion
        }

        #region Commented Methods
        //void RegisterScriptMaps(string targetSite, string targetVDir)
        //{
        //    // Calculate Windows path
        //    string sysRoot = System.Environment.GetEnvironmentVariable("SystemRoot");

        //    // Launch aspnet_regiis.exe utility to configure mappings
        //    ProcessStartInfo info = new ProcessStartInfo();
        //    info.FileName = Path.Combine(sysRoot, @"Microsoft.NET\Framework\v2.0.50727\aspnet_regiis.exe");
        //    info.Arguments = string.Format("-s {0}/ROOT/{1}", targetSite, targetVDir);
        //    info.CreateNoWindow = true;
        //    info.UseShellExecute = false;

        //    Process.Start(info);
        //}

        //void ConfigureDatabase(string targetSite, string targetVDir, string connectionString)
        //{
        //    // Retrieve "Friendly Site Name" from IIS for TargetSite
        //    DirectoryEntry entry = new DirectoryEntry("IIS://LocalHost/" + targetSite);
        //    string friendlySiteName = entry.Properties["ServerComment"].Value.ToString();

        //    // Open Application's Web.Config
        //    Configuration config = WebConfigurationManager.OpenWebConfiguration("/" + targetVDir, friendlySiteName);

        //    // Add new connection string setting for web.config
        //    ConnectionStringSettings appDatabase = new ConnectionStringSettings();
        //    appDatabase.Name = DATABASE_CONNECTION_KEY;
        //    appDatabase.ConnectionString = connectionString;

        //    config.ConnectionStrings.ConnectionStrings.Clear();
        //    config.ConnectionStrings.ConnectionStrings.Add(appDatabase);

        //    // Persist web.config settings
        //    config.Save();
        //} 


        #endregion
    }
}
