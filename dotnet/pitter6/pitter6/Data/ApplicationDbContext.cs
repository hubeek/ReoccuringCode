using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using pitter6.Data.Models;

namespace pitter6.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            builder.Entity<Production>()
                .HasMany<Performance>(p => p.Performances)
                .WithOne(pr => pr.Production);
            builder.Entity<PerformanceType>()
                .HasData(
                    new PerformanceType
                    {
                        PerformanceTypeId = 1,
                        Name = "Show",
                    },
                    new PerformanceType
                    {
                        PerformanceTypeId = 2,
                        Name = "Rehearsal",
                    },
                    new PerformanceType
                    {
                        PerformanceTypeId = 3,
                        Name = "Run-through",
                    },
                    new PerformanceType
                    {
                        PerformanceTypeId = 4,
                        Name = "SoundCheck",
                    },
                    new PerformanceType
                    {
                        PerformanceTypeId = 5,
                        Name = "Press-presentation",
                    }
                    
                );
        }
        

        public DbSet<Production> Productions { get; set; }
        public DbSet<Performance> Performances { get; set; }

        public DbSet<PerformanceType> PerformanceTypes { get; set; }
    }
}