package timing_sales.model;

import java.util.List;

public interface Timing_Sales_interface {
    public void insert(Timing_Sales timing_salesBean);
    public void update(Timing_Sales timing_salesBean);
    public void delete(Integer ts_id);
    public Timing_Sales findByPrimaryKey(Integer ts_id);
    public List<Timing_Sales> getAll();
}
