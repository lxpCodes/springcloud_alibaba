package com.lagou.warehouseservice.dubbo;

import com.lagou.warehouseservice.dto.Stock;

public interface WarehouseService {
    //查询库存
    public Stock getStock(Long skuId);
}
