using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Security.Principal;
using System.Threading;
using System.Collections;
using System.Configuration.Provider; 
using System.Data.Common;

using IGRSS.DataAccessLayer.MembershipsTableAdapters;
using IGRSS.Properties;

using MembershipsTable = IGRSS.DataAccessLayer.Memberships.MembershipsDataTable;
using MembershipsRow = IGRSS.DataAccessLayer.Memberships.MembershipsRow;

namespace IGRSS.Security
{
	/// <summary>
	/// Summary description for MyProvider
	/// </summary>
	public class IgrssMembershipProvider : MembershipProvider
	{
		private string m_ConnectionString;
		private string m_UserTable;
		private string m_ApplicationName;
		private bool m_EnablePasswordReset;
		private bool m_EnablePasswordRetrieval;
		private bool m_RequiresQuestionAndAnswer;
		private bool m_RequiresUniqueEmail;
		private int m_MaxInvalidPasswordAttempts;
		private int m_PasswordAttemptWindow;
		private int m_MinRequiredNonAlphanumericCharacters;
		private int m_MinRequiredPasswordLength;
		private string m_PasswordStrengthRegularExpression;
		private bool m_WriteExceptionsToEventLog;
		private MembershipPasswordFormat m_PasswordFormat;
		private int newPasswordLength = 8;

		public IgrssMembershipProvider()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
		{
			if (config == null)
			{
				throw new Exception("Config is null");
			}
			base.Initialize(name, config);

			m_ApplicationName = GetConfigValue(config["applicationName"],
									System.Web.Hosting.HostingEnvironment.ApplicationVirtualPath);
			m_MaxInvalidPasswordAttempts = Convert.ToInt32(GetConfigValue(config["maxInvalidPasswordAttempts"], "5"));
			m_PasswordAttemptWindow = Convert.ToInt32(GetConfigValue(config["passwordAttemptWindow"], "10"));
			m_MinRequiredNonAlphanumericCharacters = Convert.ToInt32(GetConfigValue(config["minRequiredNonAlphanumericCharacters"], "1"));
			m_MinRequiredPasswordLength = Convert.ToInt32(GetConfigValue(config["minRequiredPasswordLength"], "7"));
			m_PasswordStrengthRegularExpression = Convert.ToString(GetConfigValue(config["passwordStrengthRegularExpression"], ""));
			m_EnablePasswordReset = Convert.ToBoolean(GetConfigValue(config["enablePasswordReset"], "true"));
			m_EnablePasswordRetrieval = Convert.ToBoolean(GetConfigValue(config["enablePasswordRetrieval"], "true"));
			m_RequiresQuestionAndAnswer = Convert.ToBoolean(GetConfigValue(config["requiresQuestionAndAnswer"], "false"));
			m_RequiresUniqueEmail = Convert.ToBoolean(GetConfigValue(config["requiresUniqueEmail"], "true"));
			m_WriteExceptionsToEventLog = Convert.ToBoolean(GetConfigValue(config["writeExceptionsToEventLog"], "true"));

			// Set the adapters connection string to the string passed in config file.
			SecurityAdapters.MembershipAdapter.Connection.ConnectionString = Convert.ToString(GetConfigValue(config["connectionString"], ""));

			string temp_format = config["passwordFormat"];
			if (temp_format == null)
			{
				temp_format = "Hashed";
			}

			switch (temp_format)
			{
				case "Hashed":
					m_PasswordFormat = MembershipPasswordFormat.Hashed;
					break;
				case "Encrypted":
					m_PasswordFormat = MembershipPasswordFormat.Encrypted;
					break;
				case "Clear":
					m_PasswordFormat = MembershipPasswordFormat.Clear;
					break;
				default:
					throw new ProviderException("Password format not supported.");
			}

		}

		public override string ApplicationName
		{
			get
			{
				return m_ApplicationName;
			}
			set
			{
				m_ApplicationName = value;
			}
		}

		public override bool ChangePassword(string username, string oldPassword, string newPassword)
		{
			// Check if the credentials provided are valid
			if (!ValidateUser(username, oldPassword))
			{
				return false;
			}
			// Validate the new password
			ValidatePasswordEventArgs args = new ValidatePasswordEventArgs(username, newPassword, true);
			OnValidatingPassword(args);
			if (args.Cancel)
			{
				// Validation was canceled
				if (args.FailureInformation != null)
				{
					// Validation Failed
					throw args.FailureInformation;
				}
				else
				{
					// Other Exception
					throw new MembershipPasswordException("Change password canceled due to new password validation failure.");
				}
			}

			Guid UserId = SecurityAdapters.MembershipAdapter.GetUserId(username).GetValueOrDefault(Guid.Empty);

			if (SecurityAdapters.MembershipAdapter.UpdatePassword(newPassword, UserId) > 0)
			{
				return true;
			}
			return false;
		}

		public override bool ChangePasswordQuestionAndAnswer(string username, string password, string newPasswordQuestion, string newPasswordAnswer)
		{
			if (!ValidateUser(username, password))
				return false;
			Guid UserId = SecurityAdapters.MembershipAdapter.GetUserId(username).GetValueOrDefault(Guid.Empty);
			if (SecurityAdapters.MembershipAdapter.UpdatePasswordQnA(newPasswordQuestion, newPasswordAnswer, UserId) > 0)
			{
				return true;
			}
			return false;

		}

		public override MembershipUser CreateUser(string username, string password, string email, string passwordQuestion, string passwordAnswer, bool isApproved, object providerUserKey, out MembershipCreateStatus status)
		{
			ValidatePasswordEventArgs args =
			  new ValidatePasswordEventArgs(username, password, true);

			OnValidatingPassword(args);
			if (args.Cancel)
			{
				status = MembershipCreateStatus.InvalidPassword;
				return null;
			}
			if (RequiresUniqueEmail && GetUserNameByEmail(email) != "")
			{
				status = MembershipCreateStatus.DuplicateEmail;
				return null;
			}
			MembershipUser u = GetUser(username, false);
			if (u == null)
			{
				int creationStatus;		// Stores the status returned from the DAL (no of rows affected)
				DateTime createDate = DateTime.Now;
				string comment = "";

				if (providerUserKey == null)
				{
					providerUserKey = Guid.NewGuid();
				}
				else
				{
					if (!(providerUserKey is Guid))
					{
						status = MembershipCreateStatus.InvalidProviderUserKey;
						return null;
					}
				}
				IIdentity id = Thread.CurrentPrincipal.Identity;
				creationStatus = SecurityAdapters.MembershipAdapter.Insert((Guid) providerUserKey,	// User Id
													username,			// Username
													password,			// Password
													email,				// Email
													isApproved,			// IsApproved
													comment,			// Comments
													passwordQuestion,	// passwordQuestion
													passwordAnswer,		// passwordAnswer
													createDate,			// Last Activity
													null,				// Last Login
													createDate,			// Last Password change date
													createDate,			// Account Creation Date
													false,				// Is online
													false,				// Is Locked out
													null,				// Last Lockedout date
													0,					// Failed password count
													null,				// Failed password Window start 
													0,					// Failed password answer attempt count
													null,				// Failed password answer window start
													true,				// Is Active
													null,				// Profile Id
													id.Name,			// Created By
													DateTime.Now,		// Created At
													null,				// Modified By
													null,				// Modified At
													null,				// Deleted By
													null);				// Deleted At
				if (creationStatus > 0)
				{
					status = MembershipCreateStatus.Success;
				}
				else
				{
					status = MembershipCreateStatus.UserRejected;
				}
			}
			else
			{
				status = MembershipCreateStatus.DuplicateUserName;
			}
			return null;

		}

		public bool CreateUser(string username, string password, string email, bool isApproved, string Comment)
		{
			MembershipCreateStatus status;
			CreateUser(username, password, email, "", "", isApproved, Guid.NewGuid(), out status);
			switch (status)
			{
				case MembershipCreateStatus.DuplicateEmail:
					break;
				case MembershipCreateStatus.DuplicateProviderUserKey:
					break;
				case MembershipCreateStatus.DuplicateUserName:
					break;
				case MembershipCreateStatus.InvalidAnswer:
					break;
				case MembershipCreateStatus.InvalidEmail:
					break;
				case MembershipCreateStatus.InvalidPassword:
					break;
				case MembershipCreateStatus.InvalidProviderUserKey:
					break;
				case MembershipCreateStatus.InvalidQuestion:
					break;
				case MembershipCreateStatus.InvalidUserName:
					break;
				case MembershipCreateStatus.ProviderError:
					break;
				case MembershipCreateStatus.Success:
					return true;
				case MembershipCreateStatus.UserRejected:
					break;
				default:
					break;
			}
			return false;
		}

		public override bool DeleteUser(string username, bool deleteAllRelatedData)
		{
			Guid UserId = SecurityAdapters.MembershipAdapter.GetUserId(username).GetValueOrDefault(Guid.Empty);

			if (SecurityAdapters.MembershipAdapter.DeleteUser(UserId) > 0)
			{
				return true;
			}
			return false;

		}

		public override bool EnablePasswordReset
		{
			get
			{
				return m_EnablePasswordReset;
			}
		}

		public override bool EnablePasswordRetrieval
		{
			get
			{
				return m_EnablePasswordRetrieval;
			}
		}

		public override MembershipUserCollection FindUsersByEmail(string emailToMatch, int pageIndex, int pageSize, out int totalRecords)
		{
			MembershipUserCollection UsersMatchingEmail = new MembershipUserCollection();

			DataTable dtUsers = SecurityAdapters.MembershipAdapter.GetUsersByEmail(emailToMatch);

			totalRecords = dtUsers.Rows.Count;

			if (totalRecords > 0)
			{
				for (int i = 0; i < dtUsers.Rows.Count; i++)
				{
					UsersMatchingEmail.Add(GetUserInfo(dtUsers.Rows[i]));
				}
			}
			return UsersMatchingEmail;

		}

		public override MembershipUserCollection FindUsersByName(string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
		{
			MembershipUserCollection UsersMatchingUsername = new MembershipUserCollection();

			DataTable dtUsers = SecurityAdapters.MembershipAdapter.GetUsersByUsername(usernameToMatch);

			totalRecords = dtUsers.Rows.Count;

			if (totalRecords > 0)
			{
				for (int i = 0; i < dtUsers.Rows.Count; i++)
				{
					UsersMatchingUsername.Add(GetUserInfo(dtUsers.Rows[i]));
				}
			}
			return UsersMatchingUsername;
		}

		public override MembershipUserCollection GetAllUsers(int pageIndex, int pageSize, out int totalRecords)
		{
			MembershipUserCollection AllUsers = new MembershipUserCollection();

			DataTable dtUsers = SecurityAdapters.MembershipAdapter.GetAllUsers();

			totalRecords = dtUsers.Rows.Count;

			if (totalRecords > 0)
			{
				for (int i = 0; i < dtUsers.Rows.Count; i++)
				{
					AllUsers.Add(GetUserInfo(dtUsers.Rows[i]));
				}
			}
			return AllUsers;
		}

		public MembershipsTable GetAllUsers()
		{
			return SecurityAdapters.MembershipAdapter.GetAllUsers();
		}

		public override int GetNumberOfUsersOnline()
		{
			return (int) SecurityAdapters.MembershipAdapter.GetUserCount();
		}

		public override string GetPassword(string username, string answer)
		{
			Guid UserId = SecurityAdapters.MembershipAdapter.GetUserId(username).GetValueOrDefault(Guid.Empty);

			if (!EnablePasswordRetrieval)
			{
				throw new ProviderException("Password Retrieval Not Enabled.");
			}

			if (PasswordFormat == MembershipPasswordFormat.Hashed)
			{
				throw new ProviderException("Cannot retrieve Hashed passwords.");
			}

			DataTable dt = SecurityAdapters.MembershipAdapter.GetPasswordById(UserId);

			string password = "";
			string passwordAnswer = "";

			if (dt.Rows.Count > 0)
			{
				if (true == Convert.ToBoolean(dt.Rows[0]["IsLockedOut"]))
				{
					throw new MembershipPasswordException("The supplied user is locked out.");
				}
				password = Convert.ToString(dt.Rows[0]["Password"]);
				passwordAnswer = Convert.ToString(dt.Rows[0]["PasswordAnswer"]);
			}
			else
			{
				throw new MembershipPasswordException("The supplied user name is not found.");
			}

			if (RequiresQuestionAndAnswer && !ValidatePassword(answer, passwordAnswer))
			{
				UpdateFailureCount(UserId, FailureType.PasswordAnswer);
				throw new MembershipPasswordException("Incorrect password answer.");
			}

			if (PasswordFormat == MembershipPasswordFormat.Encrypted)
			{
				password = UnEncodePassword(password);
			}

			return password;

		}

		public override MembershipUser GetUser(string username, bool userIsOnline)
		{
			// Membership User Object
			MembershipUser u = null;
			Guid UserId = (Guid) SecurityAdapters.MembershipAdapter.GetUserId(username).GetValueOrDefault(Guid.Empty);
			if (Guid.Empty != UserId)
			{
				DataTable dt = SecurityAdapters.MembershipAdapter.GetUserById(UserId);

				// Check if match was found
				if (dt.Rows.Count > 0)
				{	// User information was found 
					u = GetUserInfo(dt.Rows[0]);
					if (userIsOnline)
					{
						// Update the UserTable
						if (SecurityAdapters.MembershipAdapter.UpdateLastActivityDate(DateTime.Now, UserId) < 0)
						{	// Update has failed
							throw new ProviderException("Unable to update LastActivityDate");
						}
					}
				}
			}
			return u;
		}

		public override MembershipUser GetUser(object providerUserKey, bool userIsOnline)
		{
			Guid UserId = (Guid) providerUserKey;
			DataTable dt = SecurityAdapters.MembershipAdapter.GetUserById(UserId);

			// Membership User Object
			MembershipUser u = null;
			// Check if match was found
			if (dt.Rows.Count > 0)
			{	// User information was found 
				u = GetUserInfo(dt.Rows[0]);
				if (userIsOnline)
				{
					// Update the UserTable
					if (SecurityAdapters.MembershipAdapter.UpdateLastActivityDate(DateTime.Now, UserId) < 0)
					{	// Update has failed
						throw new ProviderException("Unable to update LastActivityDate");
					}
				}
			}
			return u;
		}

		public override string GetUserNameByEmail(string email)
		{
			return Convert.ToString(SecurityAdapters.MembershipAdapter.GetUsernameByEmail(email));
		}

		public override int MaxInvalidPasswordAttempts
		{
			get
			{
				return m_MaxInvalidPasswordAttempts;
			}
		}

		public override int MinRequiredNonAlphanumericCharacters
		{
			get
			{
				return m_MinRequiredNonAlphanumericCharacters;
			}
		}

		public override int MinRequiredPasswordLength
		{
			get
			{
				return m_MinRequiredPasswordLength;
			}
		}

		public override int PasswordAttemptWindow
		{
			get
			{
				return m_PasswordAttemptWindow;
			}
		}

		public override MembershipPasswordFormat PasswordFormat
		{
			get
			{
				return m_PasswordFormat;
			}
		}

		public override string PasswordStrengthRegularExpression
		{
			get
			{
				return m_PasswordStrengthRegularExpression;
			}
		}

		public override bool RequiresQuestionAndAnswer
		{
			get
			{
				return m_RequiresQuestionAndAnswer;
			}
		}

		public override bool RequiresUniqueEmail
		{
			get
			{
				return m_RequiresUniqueEmail;
			}
		}

		public override string ResetPassword(string username, string answer)
		{
			Guid UserId = SecurityAdapters.MembershipAdapter.GetUserId(username).GetValueOrDefault(Guid.Empty);

			if (!EnablePasswordReset)
			{
				throw new NotSupportedException("Password reset is not enabled.");
			}

			if (answer == null && RequiresQuestionAndAnswer)
			{
				UpdateFailureCount(UserId, FailureType.PasswordAnswer);

				throw new ProviderException("Password answer required for password reset.");
			}
			string newPassword = EncodePassword(Membership.GeneratePassword(newPasswordLength, MinRequiredNonAlphanumericCharacters));

			ValidatePasswordEventArgs args = new ValidatePasswordEventArgs(username, newPassword, true);

			OnValidatingPassword(args);

			if (args.Cancel)
			{
				if (args.FailureInformation != null)
				{
					throw args.FailureInformation;
				}
				else
				{
					throw new MembershipPasswordException("Reset password canceled due to password validation failure.");
				}
			}

			DataTable dt = SecurityAdapters.MembershipAdapter.GetPasswordResetInfo(UserId);

			int rowsCount = dt.Rows.Count;
			string passwordAnswer = "";

			if (rowsCount > 0)
			{
				if (Convert.ToBoolean(dt.Rows[0]["IsLockedOut"]))
				{
					throw new MembershipPasswordException("The supplied user is locked out.");
				}
				passwordAnswer = Convert.ToString(dt.Rows[0]["PasswordAnswer"]);
			}
			else
			{
				throw new MembershipPasswordException("The supplied user name is not found.");
			}
			if (RequiresQuestionAndAnswer && !ValidatePassword(answer, passwordAnswer))
			{
				UpdateFailureCount(UserId, FailureType.PasswordAnswer);
				throw new MembershipPasswordException("Incorrect password answer.");
			}

			if (SecurityAdapters.MembershipAdapter.ResetPassword(newPassword, DateTime.Now, UserId) < 0)
			{	// Update has failed
				throw new ProviderException("User not found or the Account is Locked Out. Password not Reset.");
			}
			return newPassword;
		}

		public override bool UnlockUser(string username)
		{
			Guid UserId = SecurityAdapters.MembershipAdapter.GetUserId(username).GetValueOrDefault(Guid.Empty);
			if (SecurityAdapters.MembershipAdapter.UnlockUserById(DateTime.Now, UserId) < 0)
			{	// Update has failed
				//TODO: Utils.LogError("No Rows were updated!");
				return false;
			}
			return true;
		}

		public override void UpdateUser(MembershipUser user)
		{
			long rowsUpdated = SecurityAdapters.MembershipAdapter.UpdateUserDetails(user.Email, user.Comment, (Guid) user.ProviderUserKey);
			// Execute the Update Query
			if (rowsUpdated < 0)
			{	// Update has failed
				//TODO: Utils.LogError("No Rows were updated!");
				throw new ProviderException("Unable to update " + UserTable + ": User Details not Updated");
			}
		}

		public override bool ValidateUser(string username, string password)
		{
			Guid UserId = SecurityAdapters.MembershipAdapter.GetUserId(username).GetValueOrDefault(Guid.Empty);

			bool isValid = false;

			// Check if the Username was found
			if (Guid.Empty != UserId)
			{
				// Username exists and UserId got
				MembershipsRow UserCredentials = (MembershipsRow) SecurityAdapters.MembershipAdapter.GetUserCredentials(UserId).Rows[0];
				if (UserCredentials.IsLockedOut)
					return false;
				if (ValidatePassword(password, UserCredentials.Password))
				{
					if (UserCredentials.IsApproved)
					{
						isValid = true;
					}
				}
				else
				{
					UpdateFailureCount(UserId, FailureType.Password);
				}
			}
			return isValid;
		}

		private string ConnectionString
		{
			get
			{
				return m_ConnectionString;
			}
			set
			{
				m_ConnectionString = value;
			}
		}

		private string UserTable
		{
			get
			{
				return m_UserTable;
			}
			set
			{
				m_UserTable = value;
			}
		}

		//
		// A helper function to retrieve config values from the configuration file.
		//
		private string GetConfigValue(string configValue, string defaultValue)
		{
			if (String.IsNullOrEmpty(configValue))
				return defaultValue;

			return configValue;
		}

		private MembershipUser GetUserInfo(DataRow dr)
		{
			return new MembershipUser("IgrssMembershipProvider",
				Convert.ToString(dr["Username"]),
				Convert.ToString(dr["UserId"]),
				Convert.ToString(dr["Email"]),
				Convert.ToString(dr["PasswordQuestion"]),
				"", //Convert.ToString(dr["Comment"]),
				true, //Convert.ToBoolean(dr["IsApproved"]),
				false, //Convert.ToBoolean(dr["IsLockedOut"]),
				DateTime.Now, //Convert.ToDateTime(dr["CreationDate"]),
				DateTime.Now, //Convert.ToDateTime(dr["LastLoginDate"]),
				DateTime.Now, //Convert.ToDateTime(dr["LastActivityDate"]),
				DateTime.Now, //Convert.ToDateTime(dr["LastPasswordChangedDate"]),
				DateTime.Now); //Convert.ToDateTime(dr["LastLockedOutDate"]));
		}

		private void UpdateFailureCount(Guid UserId, FailureType failureType)
		{
			DataTable dt = SecurityAdapters.MembershipAdapter.GetFailureInfo(UserId);

			// Variables to store failure information
			int failureCount = 0;	// Maintain the count of failure
			DateTime windowStart = DateTime.Now;	// Maintains the last failure Start

			// Initilize the values if information found
			if (dt.Rows.Count > 0)
			{
				// Incase of Pasword mismatch
				if (failureType == FailureType.Password)
				{
					if (DBNull.Value != dt.Rows[0]["FailedPasswordAttemptCount"])
						failureCount = Convert.ToInt32(dt.Rows[0]["FailedPasswordAttemptCount"]);
					if (DBNull.Value != dt.Rows[0]["FailedPasswordAttemptWindowStart"])
						windowStart = Convert.ToDateTime(dt.Rows[0]["FailedPasswordAttemptWindowStart"]);
				}
				// Incase of Password Answer mismatch
				if (failureType == FailureType.PasswordAnswer)
				{
					if (DBNull.Value != dt.Rows[0]["FailedPasswordAnswerAttemptCount"])
						failureCount = Convert.ToInt32(dt.Rows[0]["FailedPasswordAnswerAttemptCount"]);
					if (DBNull.Value != dt.Rows[0]["FailedPasswordAnswerAttemptWindowStart"])
						windowStart = Convert.ToDateTime(dt.Rows[0]["FailedPasswordAnswerAttemptWindowStart"]);
				}
			}

			// Get interval PasswordAttemptWindow close
			DateTime windowEnd = windowStart.AddMinutes(PasswordAttemptWindow);

			// Check if this is the first failure or outside of PasswordAttemptWindow. 
			if (failureCount == 0 || DateTime.Now > windowEnd)
			{	// This is either the first failure or outside of PasswordAttemptWindow.

				int rowsAffected = 0;
				// Incase of Pasword mismatch
				if (failureType == FailureType.Password)
				{
					rowsAffected = SecurityAdapters.MembershipAdapter.UpdateFailedPassword(1, windowStart, UserId);
				}
				// Incase of Password Answer mismatch
				if (failureType == FailureType.PasswordAnswer)
				{
					rowsAffected = SecurityAdapters.MembershipAdapter.UpdateFailedPasswordAsnwer(1, windowStart, UserId);
				}

				if (rowsAffected < 0)
				{	// Update has failed
					throw new ProviderException("Unable to update failure count and window start.");
				}
			}
			else
			{	// This is not the first failure
				// Check if the attempt exeeds the max attempt threshold
				if (failureCount++ >= MaxInvalidPasswordAttempts)
				{	// Password attempts have exceeded the failure threshold.
					if (SecurityAdapters.MembershipAdapter.LockoutUser(UserId) < 0)
					{	// Update has failed
						throw new ProviderException("Unable to lock out user.");
					}
				}
				else
				{	// Password attempts have not exceeded the failure threshold. 
					int rowsAffected = 0;
					// Incase of Pasword mismatch
					if (failureType == FailureType.Password)
					{
						rowsAffected = SecurityAdapters.MembershipAdapter.UpdateFailedPassword(failureCount, windowStart, UserId);
					}
					// Incase of Password Answer mismatch
					if (failureType == FailureType.PasswordAnswer)
					{
						rowsAffected = SecurityAdapters.MembershipAdapter.UpdateFailedPasswordAsnwer(failureCount, windowStart, UserId);
					}
					if (rowsAffected < 0)
					{	// Update has failed
						throw new ProviderException("Unable to update failure count.");
					}
				}
			}
		}

		private bool ValidatePassword(string password, string dbpassword)
		{
			string pass1 = password;
			string pass2 = dbpassword;

			switch (PasswordFormat)
			{
				case MembershipPasswordFormat.Encrypted:
					pass2 = UnEncodePassword(dbpassword);
					break;
				case MembershipPasswordFormat.Hashed:
					pass1 = EncodePassword(password);
					break;
				default:
					break;
			}

			if (pass1 == pass2)
			{
				return true;
			}

			return false;
		}

		private string UnEncodePassword(string password)
		{
			return password;
		}

		private string EncodePassword(string password)
		{
			return password;
		}
		enum FailureType
		{
			Password,
			PasswordAnswer
		}
	}
}
