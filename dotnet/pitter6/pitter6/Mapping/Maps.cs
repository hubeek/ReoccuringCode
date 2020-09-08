using AutoMapper;
using pitter6.Data.Models;
using pitter6.Data.VM;

namespace pitter6.Mapping
{
    public class Maps : Profile
    {
        public Maps()
        {
            CreateMap<Production, ProductionVM>().ReverseMap();
            CreateMap<Performance, PerformanceVM>().ReverseMap();
        }
    }
}