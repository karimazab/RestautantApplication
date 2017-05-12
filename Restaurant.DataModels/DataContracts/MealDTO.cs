using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Restaurant.DataModels.DataContracts
{
    public class MealDTO
    {
        public long Id { get; set; }
        //[Required]
        public string Name { get; set; }
        public string PictureURL { get; set; }
        //[Required]
        public float Price { get; set; }
        public string Descripition { get; set; }

        public long Category_Id { get; set; }

        //public HttpPostedFileBase Attachment { get; set; }

    }
}
