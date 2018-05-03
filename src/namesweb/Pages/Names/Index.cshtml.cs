using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using namesweb.Models;

namespace namesweb.Pages.Names
{
  public class IndexModel : PageModel
  {
    private readonly namesweb.Models.NamesContext _context;

    public IndexModel(namesweb.Models.NamesContext context)
    {
      _context = context;
    }

    public IList<Name> Names;

    public async Task OnGetAsync()
    {
      var items = from n in _context.Names
                  orderby n.LastName
                  select n;

      Names = await items.ToListAsync();
    }
  }
}