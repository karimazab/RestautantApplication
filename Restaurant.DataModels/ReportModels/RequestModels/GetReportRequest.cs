﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DataModels.ReportModels.RequestModels
{
    public class GetReportRequest
    {
        public DateTime From { get; set; }
        public DateTime To { get; set; }
    }
}
