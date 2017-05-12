using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DataModels
{
    public class BaseResponse
    {
        public long errorCode { get; set; }
        public string errorMessage { get; set; }
        public bool? isSuccess { get; set; }

        public BaseResponse()
        {

        }
        public BaseResponse(bool success, long errorCode, string messageKey)
        {
            this.isSuccess = success;
            this.errorMessage = messageKey;
            this.errorCode = errorCode;
        }
        public void SetBaseResponse(bool success, long errorCode, string messageKey)
        {
            this.isSuccess = success;
            this.errorMessage = messageKey;
            this.errorCode = errorCode;
        }
    }
}
