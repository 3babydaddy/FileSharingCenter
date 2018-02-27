package com.tf.commons.utils;

import java.util.Comparator;

import com.tf.model.MyFile;

/**
 * file按权限排序
 * @author 
 */
public class MyFileComparator implements Comparator<Object>{
	
	@Override
	public int compare(Object o1, Object o2) {
		MyFile t1=(MyFile) o1;
		MyFile t2=(MyFile) o2;
        
        return "01".equals(t1.getAttribute()) && "02".equals(t2.getAttribute()) ? -1 : "02".equals(t1.getAttribute()) && "01".equals(t2.getAttribute()) ? 1 : 0;
    }
}
