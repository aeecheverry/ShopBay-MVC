﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Intento.Models
{
    public class ProductsViewModel
    {
        Category category
        {
            get;set;
        }
        List<Products> products{
            get;set;
        }
    }
}