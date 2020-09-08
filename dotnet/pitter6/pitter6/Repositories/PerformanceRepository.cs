using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using pitter6.Data;
using pitter6.Data.Models;
using pitter6.Interfaces;

namespace pitter6.Repositories
{
    public class PerformanceRepository :  IPerformancesRepository
    {
        private readonly ApplicationDbContext _db;

        public PerformanceRepository(ApplicationDbContext dbContext)
        {
            _db = dbContext;
        }
        public  ICollection<Performance> FindAll()
        {
            return  _db.Performances.ToList();
        }

        public async Task<Performance> FindById(int id)
        {
            return await _db.Performances.FindAsync(id);
        }

        public async Task<bool> Create(Performance entity)
        {
            await _db.Performances.AddAsync(entity);
            return await Save();
        }

        public async Task<bool> Update(Performance entity)
        {
            _db.Performances.Update(entity);
            return await Save();
        }

        public async Task<bool> Delete(Performance entity)
        {
            _db.Performances.Remove(entity);
            return await Save();
        }

        public async Task<bool> Save()
        {
            var changes = await _db.SaveChangesAsync();
            return changes > 0;
        }

        public async Task<ICollection<Performance>> FindAllFromProduction(int id)
        {
            return await _db.Performances
                .Where(p=>p.ProductionId.Equals(id))
                .ToListAsync();
        }
    }
}