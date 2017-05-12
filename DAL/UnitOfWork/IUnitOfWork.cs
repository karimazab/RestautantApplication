using DAL.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.UnitOfWork
{
    public interface IUnitOfWork
    {
        GenericRepository<T> RepositoryFactory<T>() where T : class, new();
        void Save();
    }
}
