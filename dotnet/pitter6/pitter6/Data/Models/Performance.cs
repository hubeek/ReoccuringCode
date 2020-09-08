using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace pitter6.Data.Models
{
    public class Performance
    {
        [Key] public int PerformanceId { get; set; }
        public DateTime Showtime { get; set; }
        public string Note { get; set; }
        
        [ForeignKey("PerformanceTypeId")] public int PerformanceTypeId { get; set; }
        public PerformanceType PerformanceType { get; set; } 
        
        [ForeignKey("ProductionId")] public int ProductionId { get; set; }
        public Production Production { get; set; }

        public bool IsOptional { get; set; } = false;
        public bool IsOptionalTime { get; set; } = false;
    }
}