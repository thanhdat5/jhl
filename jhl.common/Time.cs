using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace jhl.common
{
    public static class Time
    {
        public static string TimeAgo(this DateTime date)
        {
            TimeSpan timeSince = DateTime.Now.Subtract(date);
            if (timeSince.TotalMilliseconds < 1) return "not yet";
            if (timeSince.TotalMinutes < 1) return "vừa đây";
            if (timeSince.TotalMinutes < 2) return "1 phút trước";
            if (timeSince.TotalMinutes < 60) return string.Format("{0} phút trước", timeSince.Minutes);
            if (timeSince.TotalMinutes < 120) return "1 hour ago";
            if (timeSince.TotalHours < 24) return string.Format("{0} giờ trước", timeSince.Hours);
            if (timeSince.TotalDays < 2) return "hôm qua";
            if (timeSince.TotalDays < 7) return string.Format("{0} ngày trước", timeSince.Days);
            if (timeSince.TotalDays < 14) return "tuần trước";
            if (timeSince.TotalDays < 21) return "2 tuần trước";
            if (timeSince.TotalDays < 28) return "3 tuần trước";
            if (timeSince.TotalDays < 60) return "tháng trước";
            if (timeSince.TotalDays < 365) return string.Format("{0} tháng trước", Math.Round(timeSince.TotalDays / 30));
            if (timeSince.TotalDays < 730) return "năm trước"; //last but not least...
            return string.Format("{0} năm trước", Math.Round(timeSince.TotalDays / 365));
        }
    }
}