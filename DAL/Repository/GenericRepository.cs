﻿using DAL.DataModel;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Repository
{
    public class GenericRepository<TEntity> where TEntity : class
    {
        internal DbContext Context;
        internal DbSet<TEntity> DbSet;

        public GenericRepository(DbContext context)
        {
            Context = context;
            DbSet = context.Set<TEntity>();

        }

        public virtual IEnumerable<TEntity> Get()
        {
            IQueryable<TEntity> query = DbSet;
            return query.ToList();
        }

        public virtual DbSet<TEntity> GetDbSet()
        {
            return DbSet;

        }

        public virtual TEntity GetById(object id)
        {

            return DbSet.Find(id);


        }
        public IEnumerable<T> SelectManyFromTable<T>(Func<TEntity, T> predicate)
        {
            return DbSet.Select(predicate);
        }

        public virtual TEntity Insert(TEntity entity)
        {

            return DbSet.Add(entity);
        }

        public virtual void Delete(object id)
        {
            TEntity entityToDelete = DbSet.Find(id);
            Delete(entityToDelete);
        }
        public virtual void Delete(TEntity entityToDelete)
        {
            if (Context.Entry(entityToDelete).State == EntityState.Detached)
            {
                DbSet.Attach(entityToDelete);
            }
            DbSet.Remove(entityToDelete);

        }
        public virtual void Update(TEntity entityToUpdate)
        {

            DbSet.Attach(entityToUpdate);
            Context.Entry(entityToUpdate).State = EntityState.Modified;
        }
        public virtual IEnumerable<TEntity> GetMany(Func<TEntity, bool> where)
        {

            return DbSet.Where(where).ToList();
        }

        public virtual IQueryable<TEntity> GetManyQueryable(Func<TEntity, bool> where)
        {
            return DbSet.Where(where).AsQueryable();
        }


        public TEntity Get(Func<TEntity, bool> where)
        {
            return DbSet.Where(where).FirstOrDefault();
        }
        public void Delete(Func<TEntity, bool> where)
        {
            IQueryable<TEntity> objects = DbSet.Where(where).AsQueryable();
            foreach (TEntity obj in objects)
                DbSet.Remove(obj);
        }
        public virtual IEnumerable<TEntity> GetAll()
        {
            return DbSet;
        }
        public IQueryable<TEntity> GetWithInclude(Expression<Func<TEntity, bool>> predicate, params string[] include)
        {
            IQueryable<TEntity> query = DbSet;
            query = include.Aggregate(query, (current, inc) => current.Include(inc));
            return query.Where(predicate);
        }
        public bool Exists(object primaryKey)
        {
            return DbSet.Find(primaryKey) != null;
        }

        public bool Exists(Func<TEntity, bool> where)
        {
            return DbSet.Where(where).FirstOrDefault() != null;
        }
        public TEntity GetSingle(Expression<Func<TEntity, bool>> predicate)
        {

            return DbSet.Single(predicate);
        }
        public TEntity GetFirst(Expression<Func<TEntity, bool>> predicate)
        {
            return DbSet.First(predicate);
        }

        public IQueryable<TEntity> GetTableAsQueryable()
        {
            return DbSet.AsQueryable();
        }
    }
}
