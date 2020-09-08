using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity.UI.V3.Pages.Internal.Account;
using Microsoft.AspNetCore.Mvc;
using pitter6.Data.Models;
using pitter6.Interfaces;
using AutoMapper;
using pitter6.Data.VM;

namespace pitter6.Controllers
{
    public class ProductionsController : Controller
    {
        private readonly IPerformancesRepository _performancesRepositoty;
        private readonly IPerformanceTypeRepository _performanceTypeRepository;
        private readonly IProductionInterfaceRepository _productionInterfaceRepository;

        private readonly IMapper _mapper;

        public ProductionsController(IPerformancesRepository performancesRepositoty,
            IPerformanceTypeRepository performanceTypeRepository,
            IProductionInterfaceRepository productionInterfaceRepository,
            IMapper mapper)
        {
            _performancesRepositoty = performancesRepositoty;
            _performanceTypeRepository = performanceTypeRepository;
            _productionInterfaceRepository = productionInterfaceRepository;

            _mapper = mapper;
        }
        
        public  IActionResult Index()
        {
            ICollection<Production> productions = _productionInterfaceRepository.FindAll();
            
            var model = _mapper.Map<List<Production>>(productions);
            
            return View(model);
        }

        public IActionResult Create()
        {
            return View();
        }
    }
}