using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using pitter6.Data;
using pitter6.Data.Models;
using pitter6.Interfaces;

namespace pitter6.Repositories
{
    public class PerformanceTypeRepository : IPerformanceTypeRepository
    {
        private readonly ApplicationDbContext _db;

        public PerformanceTypeRepository(ApplicationDbContext dbContext)
        {
            _db = dbContext;
        }
        public  ICollection<PerformanceType> FindAll()
        {
            return  _db.PerformanceTypes.ToList();
        }

        public async Task<PerformanceType> FindById(int id)
        {
            return await _db.PerformanceTypes.FindAsync(id);
        }

        public async Task<bool> Create(PerformanceType entity)
        {
            await _db.PerformanceTypes.AddAsync(entity);
            return await Save();
        }

        public async Task<bool> Update(PerformanceType entity)
        {
            _db.PerformanceTypes.Update(entity);
            return await Save();
        }

        public async Task<bool> Delete(PerformanceType entity)
        {
            _db.PerformanceTypes.Remove(entity);
            return await Save();
        }

        public async Task<bool> Save()
        {
            var changes = await _db.SaveChangesAsync();
            return changes > 0;
        }
    }
}