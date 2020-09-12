package vn.myclass.core.data.daoimpl;

import org.apache.log4j.Logger;
import org.hibernate.*;
import vn.myclass.core.common.constant.CoreConstant;
import vn.myclass.core.common.utils.HibernateUtil;
import vn.myclass.core.data.dao.GenericDao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;

public class AbstractDao<ID extends Serializable, T> implements GenericDao<ID, T> {
    private final Logger log = Logger.getLogger(this.getClass());
    private Class<T> persistenceClass;

    public AbstractDao(){
        this.persistenceClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[1];
    }

    public String getPersistenceClassName() {
        return this.persistenceClass.getSimpleName();
    }

    public List<T> findAll() {
        List<T> list;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        try{
            StringBuilder sql = new StringBuilder("from ");
            sql.append(this.getPersistenceClassName());
            Query query = session.createQuery(sql.toString());
            list = query.list();
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
            log.error(e.getMessage(), e);
            throw e;
        } finally {
            session.close();
        }

        return list;
    }

    public T update(T entity) {
        T result = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        try{
            Object object = session.merge(entity);
            result = (T) object;
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
            log.error(e.getMessage(), e);
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    public T save(T entity) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        try{
            session.persist(entity);
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
            log.error(e.getMessage(), e);
            throw e;
        } finally {
            session.close();
        }
        return entity;
    }

    /*
    * @author: KyLC
    * @return: Entity
    * */
    public T findById(ID id) {
        T result;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        try{
            result = (T) session.get(this.persistenceClass, id);
            if (result == null) {
                throw new ObjectNotFoundException("not found " + id, null);
            }
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
            log.error(e.getMessage(), e);
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    public Object[] findByProperty(Map<String, Object> property, String sortExpression, String sortDirection, Integer offset, Integer limit, Integer id) {
        List<T> list;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Object totalItems = 0;
        String params[] = new String[property.size()];
        Object values[] = new Object[property.size()];
        int index = 0;
        for(Map.Entry item : property.entrySet()){
            params[index] = (String) item.getKey();
            values[index] = item.getValue();
            index++;
        }
        try{
            StringBuilder sql = new StringBuilder("from ");
            sql.append(this.getPersistenceClassName()).append(" where 1=1 ");

            if(property.size() > 0) {
                for (String param : params) {
                    sql.append(" and ").append("LOWER(" + param + ") LIKE '%' || :" + param + " || '%'");
                }
            }
            if(sortExpression != null && sortDirection != null) {
                sql.append(" order by ").append(sortExpression);
                sql.append(" ").append(sortDirection.equals(CoreConstant.SORT_ASC) ? "asc" : "desc");
            }
            Query query1 = session.createQuery(sql.toString());
            if(property.size() > 0) {
                for(int i = 0; i < params.length; i++){
                    query1.setParameter(params[i], values[i]);
                }
            }
            if(offset != null && offset >= 0){
                query1.setFirstResult(offset);
            }
            if(limit != null && limit > 0){
                query1.setMaxResults(limit);
            }
            list = query1.list();

            StringBuilder sql2 = new StringBuilder("select count(*) from ");
            sql2.append(this.getPersistenceClassName()).append(" where 1=1 ");
            if(property.size() > 0) {
                for (String param : params) {
                    sql2.append(" and ").append("LOWER(" + param + ") LIKE '%' || :" + param + " || '%'");
                }
            }

            Query query2 = session.createQuery(sql2.toString());
            if(property.size() > 0) {
                for(int i = 0; i < params.length; i++){
                    query2.setParameter(params[i], values[i]);
                }
            }
            totalItems = query2.list().get(0);
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
            log.error(e.getMessage(), e);
            throw e;
        } finally {
            session.close();
        }

        return new Object[]{totalItems, list};
    }

    public Integer delete(List<ID> ids) {
        Integer count = 0;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        try{
            for (ID id: ids){
                T t = (T) session.get(this.persistenceClass, id);
                session.delete(t);
                count++;
            }
            transaction.commit();
        } catch (HibernateException e) {
            transaction.rollback();
            log.error(e.getMessage(), e);
            throw e;
        } finally {
            session.close();
        }
        return count;
    }

    public T findEqualsUnique(String property, Object value) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        T result = null;
        try {
            String sql = " FROM " + this.getPersistenceClassName() + " model WHERE model." + property + "= :value";
            Query query = session.createQuery(sql);
            query.setParameter("value", value);
            result = (T) query.uniqueResult();
        } catch(HibernateException e){
            transaction.rollback();
            log.error(e.getMessage(), e);
            throw e;
        } finally {
            session.close();
        }
        return result;
    }
}
