using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace namesweb.Pages
{
  public class IndexModel : PageModel
  {
    public string Message { get; set; }
    public void OnGet()
    {
      Message = "Your application description page.";
    }
  }
}
