//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Intento.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ProductsSold
    {
        public int BuyerID { get; set; }
        public int SellerID { get; set; }
        public int ProductID { get; set; }
        public Nullable<System.DateTime> BuyDate { get; set; }
        public Nullable<int> Price { get; set; }
        public Nullable<int> Quantity { get; set; }
        public int ShippingID { get; set; }
    
        public virtual Products Products { get; set; }
        public virtual ShippingOptions ShippingOptions { get; set; }
        public virtual Users Users { get; set; }
        public virtual Users Users1 { get; set; }
    }
}
