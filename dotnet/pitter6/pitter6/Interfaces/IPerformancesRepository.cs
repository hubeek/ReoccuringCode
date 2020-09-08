using System.Collections.Generic;
using System.Threading.Tasks;
using pitter6.Data.Models;

namespace pitter6.Interfaces
{
    public interface IPerformancesRepository : IRepositaryBase<Performance>
    {
        Task<ICollection<Performance>> FindAllFromProduction(int id);
    }
}