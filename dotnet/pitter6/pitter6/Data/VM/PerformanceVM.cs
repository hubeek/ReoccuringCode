using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using pitter6.Data.Models;

namespace pitter6.Data.VM
{
    public class PerformanceVM
    {
        [Key] public int PerformanceId { get; set; }
        [Required]public DateTime Showtime { get; set; }
        public string Note { get; set; }
        
        [ForeignKey("PerformanceTypeId")] public int PerformanceTypeId { get; set; }
        public PerformanceType PerformanceType { get; set; } 
        
        [ForeignKey("ProductionId")] public int ProductionId { get; set; }
        public Production Production { get; set; }
        
        public bool IsOptional { get; set; } = false;
        public bool IsOptionalTime { get; set; } = false;
    }

    public class CreatePerformanceVM
    {
        public string Note { get; set; }

        public DateTime Showtime { get; set; }
        
        public bool IsOptional { get; set; } = false;
        public bool IsOptionalTime { get; set; } = false;

        [Required]
        [ForeignKey("PerformanceTypeId")]
        public int PerformanceTypeId { get; set; }

        public ICollection<PerformanceType> PerformanceTypes { get; set; }

        [Required]
        [ForeignKey("ProductionId")]
        public int ProductionId { get; set; }

        public Production Production { get; set; }
    }
}