using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FastFood.Models
{
    /// <summary>
    /// 主订单实体类
    /// </summary>
    public class OrderModel
    {
        public int ID { get; set; }                //订单号
        public int SideDishID { get; set; }         //配菜编号
        public DateTime CreateDate { get; set; }    //订单日期
        public int ClientID { get; set; }          //客户编号
        public int SubOrderCode { get; set; }      //分单码
        
    }

    /// <summary>
    /// 分单实体类
    /// </summary>
    public class SubOrder
    {
    }
}