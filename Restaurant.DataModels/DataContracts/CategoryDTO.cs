using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DataModels.DataContracts
{
    public class CategoryDTO
    {
        public long Id { get; set; }
        public string Name { get; set; }

        public List<MealDTO> Category_Meals { get; set; }
        public CategoryDTO()
        {
            Category_Meals = new List<MealDTO>();
        }
    }
}
