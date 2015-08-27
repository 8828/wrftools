README
--------

A framework for running WRF simulations.

It is designed to be quickly hackable. There are some tools out there
which run WRF, but they are not easily modified. This is designed to provide 
a framework which is easily customised and modified. 

## Quick start

Suppose we want to run a simulation configuration called `myforecast`. Assume WRF is in `$HOME/WRF`, and WPS is in `$HOME/WPS`.

1. Clone wrftools repository and **switch to the async branch** :
    
    ```
     $>cd ~/code
     $>git clone https://github.com/samwisehawkins/wrftools.git
     $>git chekout async
    
    ```
    
2. Create a local base directory

    ```
    $>mkdir ~/myforecast
    ```

3. Copy namelist files so you have a `~/myforecast/namelist.wps` and `~/myforecast/namelist.input` files as templates
 
 
4. Copy the configuration file `~/code/wrftools/config/prepare.yaml` into the base directory
 
    ```
     $>cp ~/code/wrftools/config/prepare.yaml ~/myforecast
    ```
     
5. Edit the new `~/myforecast/forecast.yaml` file. In particular set:
 
    ```
    base_dir          : $(HOME)/forecasting/myforecast
    working_dir       : "%(base_dir)/%iY-%im-%id_%iH"
    namelist_wps      : "%(base_dir)/namelist.wps"                  # location of namelist.wps template to use
    namelist_input    : "%(base_dir)/namelist.input"                # location of namelist.input template to use
    wps_dir           : /prog/WPS/3.5                               # location of WPS code
    wrf_dir           : /prog/WRF/3.5        
    ```
    
8. Prepare the directories:
 
    ```
    $> cd ~/myforecast
    $> python ~/code/wrftools/prepare.py --config=prepare.yaml
    ```


## Configuration

For explanation of configuration options, see [config/prepare.yaml](config/prepare.yaml).

Some options in the configution. e.g. start time, maximum number of nests, 
** will override settings in the namelist.input and namelist.wps files **

Configuration is done via a config file, alhough some options can also be overridden 
at the command line. json and yaml formats are understood. 

Within a config file, environment variables can be specified accessed using `$(var)`.
Local variables defined elsewhere in tht config file can be specified  using `%(var)`.
If the variable in `${}` or `%()` is not defined within the current environments,
it will not be expanded. This is not part of standard yaml or json!

Times can be specified using the following syntax, %cX, where c can be:
  
    i -- initial time 
    v -- valid time 
    f -- forecast lead time (i.e. difference between valid and initial time)

And X follows a subset of python conventions for date and time formatting:

    %y -- 2-digit year
    %Y -- 4-digit year
    %m -- 2 digit month
    %d -- 2-digit day
    %H -- 2 digit hour
    %M -- 2-digit minute
    %S -- 2-digit second 


Example:

    base_dir    = $(HOME)/myforecast
    working_dir = "%(base_dir)/%iY-%im-%id_%iH"
    
becomes e.g. :
    base_dir = /home/dave/myforecast
    working_dir = /home/dave/myforecast/2010-01-01_00



 
----------
Author 
Sam Hawkins
samwisehawkins@gmail.com

---------
License
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>i
