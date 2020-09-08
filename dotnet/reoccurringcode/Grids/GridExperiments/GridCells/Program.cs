using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading;

namespace GridCells
{
    public class Coord : IEquatable<Coord>
    {
        public int x { get; set; }
        public int y { get; set; }

        public Coord(int cx, int cy)
        {
            x = cx;
            y = cy;
        }

        public bool Equals(Coord other)
        {
            if (other == null)
            {
                return false;
            }
            return this.x == other.x && this.y == other.y;
        }
    }

    public class GridCell
    {
        public Coord Coord;
        public int Value { get; set; }

        public GridCell(int x, int y)
        {
            Coord = new Coord(x,y);
            
        }
    }
    public class Grid
    {
        public List<GridCell> Cells { get; set; }
        public int Width { get; set; }
        public int Height { get; set; }

        public Grid(int width, int height, int startvalue = 0)
        {
            Cells = new List<GridCell>();
            Width = width;
            Height = height;
            for (int y = 0; y < height; y++)
            {
                for (int x = 0; x < width; x++)
                {
                    GridCell c = new GridCell(x,y);
                    c.Value = startvalue;
                    Cells.Add(c);
                }
            }
        }

        public Grid RandomizeGrid()
        {
            foreach (var cell in Cells)
            {
                cell.Value = GetRandomNumber();
            }

            return this;
        }
        private static int GetRandomNumber()
        {
            var rnd = new Random();
            int number = rnd.Next(9);
            return number;
        }

        public GridCell Get(int x, int y)
        {
            int gridIndex = GetIndex(x,y);
            return Cells[gridIndex];
        }

        public int GetIndex(int x, int y)
        {
            return (y * Width) + x;
        }

        public int GetIndex(Coord coord)
        {
            return GetIndex(coord.x, coord.y);
        }

        public Coord GetFrom(int index)
        {
            var x = index % Height;
            var y = index / Height;
            return new Coord(x, y);
        }

        public override string ToString()
        {
            StringBuilder text = new StringBuilder();
            for (int y = 0; y < Height; y++)
            {
                for (int x = 0; x < Width; x++)
                {
                    GridCell cell = Cells[GetIndex(x, y)];
                    text.Append(cell.Value);
                    if (x != Width -1)
                    {
                        if (cell.Value < 10)
                        {
                            text.Append("  ");
                        } else if (cell.Value < 100)
                        {
                            text.Append(" ");
                        }
                    }
                }

                text.Append("\n");
            }
            return text.ToString();
        }
        public Grid CalcAverageGrid(int range)
        {
            var newGrid = new Grid(Width, Height);
            foreach (var cell in Cells)
            {
                List<int> usevalues = new List<int>();
                for (int dy = range * -1; dy < 1; dy++)
                {
                    for (int dx = range * -1; dx <= range; dx++)
                    {
                        if ((dx == 0 && dy == 0) == false)
                        {
                            if (
                                cell.Coord.x + dx >= 0
                                && cell.Coord.y + dy >= 0
                                && cell.Coord.x + dx < Width
                                && cell.Coord.y + dy < Height
                            )
                            {
                                Coord newcoord = new Coord(cell.Coord.x + dx, cell.Coord.y + dy);
                                GridCell foundCell = Cells.FirstOrDefault(c => c.Coord.Equals(newcoord));
                                if (foundCell != null)
                                {
                                    usevalues.Add(foundCell.Value);
                                }
                            }
                        }
                    }
                }

                int average = (int) Math.Round(usevalues.Average());
                GridCell found = newGrid.Cells.FirstOrDefault(c => c.Coord.Equals(cell.Coord));
                if (found != null)
                {
                    found.Value = average;
                }
            }

            return newGrid;
        }
    }
    
    
    class Program
    {
        static void Main(string[] args)
        {
            int wh = 5;
            var grid = new Grid(wh,wh);
            foreach (var cell in grid.Cells)
            {
                if (grid.GetIndex(cell.Coord) % 2 == 0)
                {
                    cell.Value = 1;
                }
            }
            Console.WriteLine(grid);
            int range = wh;
            var newGrid = grid.CalcAverageGrid(range);
            var newGrid2 = newGrid.CalcAverageGrid(range);
            var newGrid3 = newGrid2.CalcAverageGrid( range);
            var newGrid4 = newGrid3.CalcAverageGrid( range);

            Console.WriteLine(newGrid);
            Console.WriteLine(newGrid2);
            Console.WriteLine(newGrid3);
            Console.WriteLine(newGrid4);
        }

        
    }
}