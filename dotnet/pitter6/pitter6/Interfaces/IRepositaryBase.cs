using System.Collections.Generic;
using System.Threading.Tasks;
using pitter6.Data.Models;

namespace pitter6.Interfaces
{
    public interface IRepositaryBase<T> where T: class
    {
        ICollection<T> FindAll();
        Task<T> FindById(int id);
        Task<bool> Create(T entity);
        Task<bool> Update(T entity);
        Task<bool> Delete(T entity);
        Task<bool> Save();
    }
}