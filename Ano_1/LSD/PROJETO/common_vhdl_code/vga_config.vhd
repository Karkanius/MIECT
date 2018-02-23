----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSD.TOS, March 2017 (DO NOT REMOVE THIS LINE)
--
-- VGA package (defines constants and data types related to the VGA display).
--
-- WARNING: all designs that generate a VGA image should use the VGA pixel clock as the main clock.
--
-- The VGA video mode is selected by the line
--   constant vga_mode : vga_mode_t := ...;.
-- Choose one of the video modes at your disposal
-- It is also possible to create a new video mode by using the GNU/Linux commands gtf or cvt (be sure to set the pll_ratio field properly).
--

--
-- package declaration
--

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;

package vga_config is
  --
  -- VGA mode data type (records all relevant information about a VGA video mode)
  --
  type vga_mode_t is record
    --
    -- Horizontal data
    --
    width            : integer range 320 to 4095;    -- number of horizontal pixels of the image
    hsync_init       : integer range 320 to 4095;    -- width + horizontal front porch width
    hsync_end        : integer range 320 to 4095;    -- hsync_init + horizontal sync pulse width
    h_period         : integer range 320 to 4095;    -- hsync_end + horizontal back porch width (number of horizontal pixels of the frame)
    hsync_polarity   : std_logic;                    -- hsync polarity ('1' means positive, '0' means negative)
    --
    -- Vertical data
    --
    height           : integer range 200 to 4095;    -- number of vertical pixels of the image
    vsync_init       : integer range 200 to 4095;    -- height + vertical front porch width
    vsync_end        : integer range 200 to 4095;    -- vsync_init + vertical sync pulse width
    v_period         : integer range 200 to 4095;    -- vsync_end + vertical back porch width (number of vertical pixels of the frame)
    vsync_polarity   : std_logic;                    -- vsync polarity ('1' means positive, '0' means negative)
    --
    -- Other data
    --
    refresh_rate     : real range 40.0 to 100.0;     -- refresh rate (number of frames per second)
    pixel_clock_freq : real range 25.0e6 to 150.0e6; -- frequency of the pixel clock (the video DAC od the DE2-115 should not go above 140MHz)
    pll_ratio        : real range 0.5 to 4.0;        -- PLL frequency ratio (used to determine the true pixel clock frequency)
  end record vga_mode_t;
  --
  -- Available VGA video modes
  --
  -- WARNING: some monitors do not support some of the video modes described below
  --
  -- For almost all modes the timing parameters were obtained either from
  --   the VGA Generalized Timing Formula (gtf program on GNU/Linux), or from
  --   the VGA Coordinated Video Timing modes (cvt program on GNU/Linux)
  -- The pll_ratio was determined by looking at the parameters of the PLL instantiated by the clock_generator entity
  --
  constant vga_mode_800_600_72       : vga_mode_t := ( 800, 856, 976,1040,'1', 600, 637, 643, 666,'1', 72.0, 50.00e6,  1.0/1.0 ); -- "800x600@72", old
  constant vga_mode_800_600_75_gtf   : vga_mode_t := ( 800, 840, 920,1040,'0', 600, 601, 604, 627,'1', 75.0, 48.91e6, 89.0/91.0); -- "800x600@75", gtf
  constant vga_mode_1024_768_60_gtf  : vga_mode_t := (1024,1080,1184,1344,'0', 768, 769, 772, 795,'1', 60.0, 64.11e6, 41.0/32.0); -- "1024x768@60", gtf
  constant vga_mode_1280_1024_60_gtf : vga_mode_t := (1280,1360,1496,1712,'0',1025,1026,1029,1061,'1', 60.0,108.99e6,109.0/50.0); -- "1280x1024@60", gtf
  constant vga_mode_1440_900_60_gtf  : vga_mode_t := (1440,1520,1672,1904,'0', 900, 901, 904, 932,'1', 60.0,106.47e6,115.0/54.0); -- "1440x800@60", gtf
  constant vga_mode_1600_1200_50_gtf : vga_mode_t := (1600,1704,1872,2144,'0',1200,1201,1204,1235,'1', 50.0,132.39e6, 53.0/20.0); -- "1600x1200@50", gtf
  constant vga_mode_1600_1200_50_cvt : vga_mode_t := (1600,1696,1864,2128,'0',1200,1203,1207,1238,'1', 50.0,131.50e6, 71.0/27.0); -- "1600x1200@50", cvt
  constant vga_mode_1920_1080_50_gtf : vga_mode_t := (1920,2032,2232,2544,'0',1080,1081,1084,1112,'1', 50.0,141.45e6, 99.0/35.0); -- "1920x1080@50", gtf
  ------------------------------------------
  ---- The video mode that will be used ----
  ------------------------------------------
  constant vga_mode : vga_mode_t := vga_mode_800_600_72;
  --
  -- Useful VGA data
  --
  -- The vga_frequency constant was writen in this way to facilitate the determination of the PLL ratio of a new video mode
  -- * use weights 0.0 and 1.0 to discover the PLL ratio (Compilation Report -> Fitter -> Resource Section -> PLL Summary/Usage)
  -- * use weights 1.0 and 0.0 in the final version (to use the true frequency instead of the desired one)
  --
  constant vga_frequency    : real    := 1.0*50.0e6*vga_mode.pll_ratio  -- true frequency (to be used when pll_ratio is known)
                                       + 0.0*vga_mode.pixel_clock_freq; -- desired frequency (to be used when pll_ratio is not known)
  constant vga_width        : integer := vga_mode.width;
  constant vga_total_width  : integer := vga_mode.h_period;
  constant vga_height       : integer := vga_mode.height;
  constant vga_total_height : integer := vga_mode.v_period;
  constant vga_refresh_rate : real    := vga_mode.refresh_rate;
  --
  -- VGA coordinates subtypes
  --
  subtype vga_x_t is integer range 0 to vga_mode.h_period-1;
  subtype vga_y_t is integer range 0 to vga_mode.v_period-1;
  --
  -- signals generated by the vga_controller entity
  --
  type vga_data_t is record
    --
    -- Signals required by the video DAC (Digital to Analog Converter)
    --
    h_sync       : std_logic; -- horizontal sync pulse
    v_sync       : std_logic; -- vertical sync pulse
    blank_n      : std_logic; -- blank signal ('1' when inside display area, '0' when outside display area)
    --
    -- Signals useful to the generation of the color of each pixel
    --
    x            : vga_x_t;   -- x coordinate of the video signal
    y            : vga_y_t;   -- y coordinate of the video signal
    end_of_line  : std_logic; -- end of line pulse (equal to x = vga_width and y < vga_height)
    end_of_frame : std_logic; -- end of video frame pulse (equal to x = vga_width and y = vga_height)
  end record vga_data_t;
  --
  -- Pixel color data (used by the vga_output entity)
  --
  type vga_rgb_t is record
    r : std_logic_vector(7 downto 0); -- red color component
    g : std_logic_vector(7 downto 0); -- green color component
    b : std_logic_vector(7 downto 0); -- blue color component
  end record vga_rgb_t;
  --
  -- Extended pixel color data (can be used to merge two or more image sources)
  --
  type vga_rgbv_t is record
    r : std_logic_vector(7 downto 0); -- red color component
    g : std_logic_vector(7 downto 0); -- green color component
    b : std_logic_vector(7 downto 0); -- blue color component
    v : std_logic;                    -- visibility flag
  end record vga_rgbv_t;
end package vga_config;
