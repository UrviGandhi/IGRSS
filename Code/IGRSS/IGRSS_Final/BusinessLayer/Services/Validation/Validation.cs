using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace IGRSS.Services.Validation
{
	class Validation
	{
		public static bool IsValidText(string text)
		{
			bool badChar1 = !(text.IndexOf("\"") > 0);
			bool badChar2 = !(text.IndexOf("'") > 0);

			return badChar1 && badChar2;
		}

		/// <remarks>
		/// Function to test whether the string is numeric or not
		/// </remarks>
		public static bool IsNumeric(string strNumber)
		{
			Regex objNumericPattern = new Regex(@"\d$");

			return !objNumericPattern.IsMatch(strNumber);
		}

		/// <remarks>
		/// Function to test whether the string is in Currency format or not.
		/// eg. 2500.00, 2500
		/// </remarks>
		public static bool IsCurrency(string strNumber)
		{
			Regex objCurrencyPattern = new Regex(@"^[-]?([1-9]{1}[0-9]{0,}(\.[0-9]{0,2})?|0(\.[0-9]{0,2})?|\.[0-9]{1,2})$");

			return !objCurrencyPattern.IsMatch(strNumber);
		}

		/// <remarks>
		/// Function to test for Decimal number with specified precession.
		/// </remarks>
		public static bool IsDecimal(string strNumber, int beforePoint, int afterPoint)
		{
			string maxBeforePoint = Convert.ToString(beforePoint);
			string maxAfterPoint = Convert.ToString(afterPoint);

			Regex objDecimalPattern = new Regex(@"(?!^0*$)(?!^0*\.0*$)^\d{1," + maxBeforePoint + @"}(\.\d{1," + maxAfterPoint + "})?$");

			return !objDecimalPattern.IsMatch(strNumber);
		}

		/// <remarks>
		/// Function to test for Positive Integers.
		/// </remarks>
		public static bool IsNaturalNumber(string strNumber)
		{
			Regex objNotNaturalPattern = new Regex("[^0-9]");
			Regex objNaturalPattern = new Regex("0*[1-9][0-9]*");

			return !objNotNaturalPattern.IsMatch(strNumber) &&
				objNaturalPattern.IsMatch(strNumber);
		}

		/// <remarks>
		/// Function to test for Positive Integers with zero inclusive
		/// </remarks>
		public static bool IsWholeNumber(string strNumber)
		{
			Regex objNotWholePattern = new Regex("[^0-9]");

			return !objNotWholePattern.IsMatch(strNumber);
		}

		/// <remarks>
		/// Function to Test for Integers both Positive and Negative
		/// </remarks>
		public static bool IsInteger(string strNumber)
		{
			Regex objNotIntPattern = new Regex("[^0-9-]");
			Regex objIntPattern = new Regex("^-[0-9]+$|^[0-9]+$");

			return !objNotIntPattern.IsMatch(strNumber) &&
				objIntPattern.IsMatch(strNumber);
		}

		/// <remarks>
		/// Function to Test for Positive Number both Integer and Real
		/// </remarks>
		public static bool IsPositiveNumber(string strNumber)
		{
			Regex objNotPositivePattern = new Regex("[^0-9.]");
			Regex objPositivePattern = new Regex("^[.][0-9]+$|[0-9]*[.]*[0-9]+$");
			Regex objTwoDotPattern = new Regex("[0-9]*[.][0-9]*[.][0-9]*");

			return !objNotPositivePattern.IsMatch(strNumber) &&
				objPositivePattern.IsMatch(strNumber) &&
				!objTwoDotPattern.IsMatch(strNumber);
		}

		/// <remarks>
		/// Function to test whether the string is valid number or not
		/// </remarks>
		public static bool IsNumber(string strNumber)
		{
			Regex objNotNumberPattern = new Regex("[^0-9.-]");
			Regex objTwoDotPattern = new Regex("[0-9]*[.][0-9]*[.][0-9]*");
			Regex objTwoMinusPattern = new Regex("[0-9]*[-][0-9]*[-][0-9]*");
			string strValidRealPattern = "^([-]|[.]|[-.]|[0-9])[0-9]*[.]*[0-9]+$";
			string strValidIntegerPattern = "^([-]|[0-9])[0-9]*$";
			Regex objNumberPattern = new Regex("(" + strValidRealPattern + ")|(" + strValidIntegerPattern + ")");

			return !objNotNumberPattern.IsMatch(strNumber) &&
				!objTwoDotPattern.IsMatch(strNumber) &&
				!objTwoMinusPattern.IsMatch(strNumber) &&
				objNumberPattern.IsMatch(strNumber);
		}

		/// <remarks>
		/// Function To test for Alphabets.
		/// </remarks>
		public static bool IsAlpha(string strToCheck)
		{
			Regex objAlphaPattern = new Regex("[^a-zA-Z]");

			return !objAlphaPattern.IsMatch(strToCheck);
		}

		/// <remarks>
		/// Function to Check for AlphaNumeric.
		/// </remarks>
		public static bool IsAlphaNumeric(string strToCheck)
		{
			Regex objAlphaNumericPattern = new Regex("[^a-zA-Z0-9]");

			return !objAlphaNumericPattern.IsMatch(strToCheck);
		}

	}
}
