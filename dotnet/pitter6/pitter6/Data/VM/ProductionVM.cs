using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using pitter6.Data.Models;

namespace pitter6.Data.VM
{
    public class ProductionVM
    {
        public int ProductionId { get; set; }
        [Required]
        [Display(Name = "Productie")]
        [MinLength(3)]
        public string Name { get; set; }
    }

    public class CreateProductionVM
    {
        public string Name { get; set; }
    }
}