using System.Collections.Generic;

namespace pitter6.Data.Models
{
    public class Production
    {
        public int ProductionId { get; set; }
        public string Name { get; set; }
        public IEnumerable<Performance> Performances { get; set; }
    }
}