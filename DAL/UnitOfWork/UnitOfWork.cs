using DAL.Repository;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DataModel;
namespace DAL.UnitOfWork
{
    public class UnitOfWork : IDisposable, IUnitOfWork
    {
        private readonly DbContext _context = new RestaurantEntities1();
        //public UnitOfWork(DbContext context)
        //{
        //    _context = context;
        //}
        public GenericRepository<T> RepositoryFactory<T>() where T : class, new()
        {
            return new GenericRepository<T>(_context);
        }
        public void Save()
        {
            try
            {
                _context.SaveChanges();
            }
            catch (DbEntityValidationException ex)
            {
                throw ex;
            }
        }

        private bool _disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!_disposed)
                if (disposing)
                {
                    _context.Dispose();
                }
            _disposed = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

    }
}
