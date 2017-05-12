using Restaurant.DataModels.DataContracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DataModels.CategoryModels.ResponseModels
{
    public class GetAllCategoriesResponse : BaseResponse
    {
        public List<CategoryDTO> Categories { get; set; }
        public GetAllCategoriesResponse()
        {
            Categories = new List<CategoryDTO>();
        }
    }
}
