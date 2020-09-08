using System;
using System.Linq;
using GridCells;
using Xunit;

namespace TestGridCells
{
    public class UnitTest1
    {
        [Fact]
        public void GridSetupTest()
        {
            Grid grid = new Grid(6,6);
            Assert.Equal(36, grid.Cells.Count);
            Assert.Equal(35, grid.GetIndex(new Coord(5,5)));
            Assert.Equal(grid.Cells.Last(), grid.Cells[grid.GetIndex(new Coord(5,5))]);
            Assert.Equal(0, grid.Cells[0].Value);
            Assert.Equal(0, grid.Cells.Last().Value);
        }

        [Fact]
        public void GridAverageTest()
        {
            Grid grid = new Grid(6,6);
            grid.Cells[0].Value = 0;
            grid.Cells[1].Value = 3;
            grid.Cells[6].Value = 3;
            grid.Cells[7].Value = 3;
            Grid grid2 = grid.CalcAverageGrid(1);
            Assert.Equal(3, grid2.Cells[0].Value);
            grid.Cells[0].Value = 0;
            grid.Cells[1].Value = 1;
            grid.Cells[2].Value = 0;
            
            grid.Cells[6].Value = 1;
            grid.Cells[7].Value = 0;
            grid.Cells[8].Value = 1;
            
            grid.Cells[12].Value = 0;
            grid.Cells[13].Value = 1;
            grid.Cells[13].Value = 0;
            grid2 = grid.CalcAverageGrid(1);
            Assert.Equal(1, grid2.Cells[7].Value);
            Assert.Equal(1, grid2.Cells[0].Value);
        }
    }
}