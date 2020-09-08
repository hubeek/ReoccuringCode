using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using pitter6.Data;
using pitter6.Data.Models;
using pitter6.Interfaces;

namespace pitter6.Repositories
{
    public class ProductionRepository : IProductionInterfaceRepository
    {
        private readonly ApplicationDbContext _db;

        public ProductionRepository(ApplicationDbContext dbContext)
        {
            _db = dbContext;
        }

        public ICollection<Production> FindAll()
        {
            return _db.Productions.ToList();
        }

        public async Task<Production> FindById(int id)
        {
            return await _db.Productions.FindAsync(id);
        }

        public async Task<bool> Create(Production entity)
        {
            await _db.Productions.AddAsync(entity);
            return await Save();
        }

        public async Task<bool> Update(Production entity)
        {
            _db.Productions.Update(entity);
            return await Save();
        }

        public async Task<bool> Delete(Production entity)
        {
            _db.Productions.Remove(entity);
            return await Save();
        }

        public async Task<bool> Save()
        {
            var changes = await _db.SaveChangesAsync();
            return changes > 0;
        }
    }
}