<!DOCTYPE html>



<html>

<head>

    <title></title>

    <meta charset=utf-8"">

    <link rel="stylesheet" media="screen" href="styles/main.css">

    <link rel="shortcut icon" type="image/png" href="images/favicon.png">

    <script src="javascripts/jquery-1.6.min.js" type="text/javascript" charset=""></script>


    <link href='http://fonts.googleapis.com/css?family=Cuprum' rel='stylesheet' type='text/css'>

    <link href='http://fonts.googleapis.com/css?family=Copse' rel='stylesheet' type='text/css'>

    <link href='http://fonts.googleapis.com/css?family=Dancing+Script' rel='stylesheet' type='text/css'>

    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>

	<style type="text/css">
		p.ex
		{

		}
	</style>


</head>

<!-- Restore form state after page loaded -->
<body onload="init();">



<!--<div id="cloud">

    <div id="twitter-feed">We're first to officially announce open casting call for the highly anticipated new play by <a href="#">@VeronicaSmith</a>. Visit artist space <a href="#">@ArtistMagnet</a> for details.</div>

</div>-->

<div id="page-frame">

    <div id="page-header">

        <img class="root-buttons" src="images/button-artists.jpg" alt="artists"/>

        <img class="root-buttons" src="images/button-productions.jpg" alt="productions"/>

        <img class="root-buttons" src="images/button-venues.jpg" alt="venues"/>

    </div>

    <div id="page-content"     >

        <div class="membership-signup shadow" >

            <form id="user" class="membership-signup"  action="MyController" method="POST" onsubmit="return validateForm()"  enctype="application/x-www-form-urlencoded" accept-charset="utf-8"   >


		<input id="action" name="action" type="hidden" value="signup"/>
<table>
<tr>
	<td>
                <p id="companyName" style="display: none;">

                    <label for="company-name">Company Name *</label>

                    <input id="companyName" name="companyName" type="text" value=""/>

                </p>
	</td>
</tr>

<tr>
	<td>
                <p id="foundedYear" style="display: none;">

                    <label for="founded-year">Year Company Founded</label>

                    <select id="foundedYear_year" name="foundedYear">

                        <option value="0" selected="selected">&nbsp;Year:</option>


                        <option value="2011">&nbsp;2011

                        </option>



                        <option value="2010">&nbsp;2010

                        </option>



                        <option value="2009">&nbsp;2009

                        </option>



                        <option value="2008">&nbsp;2008

                        </option>



                        <option value="2007">&nbsp;2007

                        </option>



                        <option value="2006">&nbsp;2006

                        </option>



                        <option value="2005">&nbsp;2005

                        </option>



                        <option value="2004">&nbsp;2004

                        </option>



                        <option value="2003">&nbsp;2003

                        </option>



                        <option value="2002">&nbsp;2002

                        </option>



                        <option value="2001">&nbsp;2001

                        </option>



                        <option value="2000">&nbsp;2000

                        </option>



                        <option value="1999">&nbsp;1999

                        </option>



                        <option value="1998">&nbsp;1998

                        </option>



                        <option value="1997">&nbsp;1997

                        </option>



                        <option value="1996">&nbsp;1996

                        </option>



                        <option value="1995">&nbsp;1995

                        </option>



                        <option value="1994">&nbsp;1994

                        </option>



                        <option value="1993">&nbsp;1993

                        </option>



                        <option value="1992">&nbsp;1992

                        </option>



                        <option value="1991">&nbsp;1991

                        </option>



                        <option value="1990">&nbsp;1990

                        </option>



                        <option value="1989">&nbsp;1989

                        </option>



                        <option value="1988">&nbsp;1988

                        </option>



                        <option value="1987">&nbsp;1987

                        </option>



                        <option value="1986">&nbsp;1986

                        </option>



                        <option value="1985">&nbsp;1985

                        </option>



                        <option value="1984">&nbsp;1984

                        </option>



                        <option value="1983">&nbsp;1983

                        </option>



                        <option value="1982">&nbsp;1982

                        </option>



                        <option value="1981">&nbsp;1981

                        </option>



                        <option value="1980">&nbsp;1980

                        </option>



                        <option value="1979">&nbsp;1979

                        </option>



                        <option value="1978">&nbsp;1978

                        </option>



                        <option value="1977">&nbsp;1977

                        </option>



                        <option value="1976">&nbsp;1976

                        </option>



                        <option value="1975">&nbsp;1975

                        </option>



                        <option value="1974">&nbsp;1974

                        </option>



                        <option value="1973">&nbsp;1973

                        </option>



                        <option value="1972">&nbsp;1972

                        </option>



                        <option value="1971">&nbsp;1971

                        </option>



                        <option value="1970">&nbsp;1970

                        </option>



                        <option value="1969">&nbsp;1969

                        </option>



                        <option value="1968">&nbsp;1968

                        </option>



                        <option value="1967">&nbsp;1967

                        </option>



                        <option value="1966">&nbsp;1966

                        </option>



                        <option value="1965">&nbsp;1965

                        </option>



                        <option value="1964">&nbsp;1964

                        </option>



                        <option value="1963">&nbsp;1963

                        </option>



                        <option value="1962">&nbsp;1962

                        </option>



                        <option value="1961">&nbsp;1961

                        </option>



                        <option value="1960">&nbsp;1960

                        </option>



                        <option value="1959">&nbsp;1959

                        </option>



                        <option value="1958">&nbsp;1958

                        </option>



                        <option value="1957">&nbsp;1957

                        </option>



                        <option value="1956">&nbsp;1956

                        </option>



                        <option value="1955">&nbsp;1955

                        </option>



                        <option value="1954">&nbsp;1954

                        </option>



                        <option value="1953">&nbsp;1953

                        </option>



                        <option value="1952">&nbsp;1952

                        </option>



                        <option value="1951">&nbsp;1951

                        </option>



                        <option value="1950">&nbsp;1950

                        </option>



                        <option value="1949">&nbsp;1949

                        </option>



                        <option value="1948">&nbsp;1948

                        </option>



                        <option value="1947">&nbsp;1947

                        </option>



                        <option value="1946">&nbsp;1946

                        </option>



                        <option value="1945">&nbsp;1945

                        </option>



                        <option value="1944">&nbsp;1944

                        </option>



                        <option value="1943">&nbsp;1943

                        </option>



                        <option value="1942">&nbsp;1942

                        </option>



                        <option value="1941">&nbsp;1941

                        </option>



                        <option value="1940">&nbsp;1940

                        </option>



                        <option value="1939">&nbsp;1939

                        </option>



                        <option value="1938">&nbsp;1938

                        </option>



                        <option value="1937">&nbsp;1937

                        </option>



                        <option value="1936">&nbsp;1936

                        </option>



                        <option value="1935">&nbsp;1935

                        </option>



                        <option value="1934">&nbsp;1934

                        </option>



                        <option value="1933">&nbsp;1933

                        </option>



                        <option value="1932">&nbsp;1932

                        </option>



                        <option value="1931">&nbsp;1931

                        </option>



                        <option value="1930">&nbsp;1930

                        </option>



                        <option value="1929">&nbsp;1929

                        </option>



                        <option value="1928">&nbsp;1928

                        </option>



                        <option value="1927">&nbsp;1927

                        </option>



                        <option value="1926">&nbsp;1926

                        </option>



                        <option value="1925">&nbsp;1925

                        </option>



                        <option value="1924">&nbsp;1924

                        </option>



                        <option value="1923">&nbsp;1923

                        </option>



                        <option value="1922">&nbsp;1922

                        </option>



                        <option value="1921">&nbsp;1921

                        </option>



                        <option value="1920">&nbsp;1920

                        </option>



                        <option value="1919">&nbsp;1919

                        </option>



                        <option value="1918">&nbsp;1918

                        </option>



                        <option value="1917">&nbsp;1917

                        </option>



                        <option value="1916">&nbsp;1916

                        </option>



                        <option value="1915">&nbsp;1915

                        </option>



                        <option value="1914">&nbsp;1914

                        </option>



                        <option value="1913">&nbsp;1913

                        </option>



                        <option value="1912">&nbsp;1912

                        </option>



                        <option value="1911">&nbsp;1911

                        </option>



                        <option value="1910">&nbsp;1910

                        </option>



                        <option value="1909">&nbsp;1909

                        </option>



                        <option value="1908">&nbsp;1908

                        </option>



                        <option value="1907">&nbsp;1907

                        </option>



                        <option value="1906">&nbsp;1906

                        </option>



                        <option value="1905">&nbsp;1905

                        </option>



                        <option value="1904">&nbsp;1904

                        </option>



                        <option value="1903">&nbsp;1903

                        </option>



                        <option value="1902">&nbsp;1902

                        </option>



                        <option value="1901">&nbsp;1901

                        </option>



                        <option value="1900">&nbsp;1900

                        </option>



                        <option value="1899">&nbsp;1899

                        </option>



                        <option value="1898">&nbsp;1898

                        </option>



                        <option value="1897">&nbsp;1897

                        </option>



                        <option value="1896">&nbsp;1896

                        </option>



                        <option value="1895">&nbsp;1895

                        </option>



                        <option value="1894">&nbsp;1894

                        </option>



                        <option value="1893">&nbsp;1893

                        </option>



                        <option value="1892">&nbsp;1892

                        </option>



                        <option value="1891">&nbsp;1891

                        </option>



                        <option value="1890">&nbsp;1890

                        </option>



                        <option value="1889">&nbsp;1889

                        </option>



                        <option value="1888">&nbsp;1888

                        </option>



                        <option value="1887">&nbsp;1887

                        </option>



                        <option value="1886">&nbsp;1886

                        </option>



                        <option value="1885">&nbsp;1885

                        </option>



                        <option value="1884">&nbsp;1884

                        </option>



                        <option value="1883">&nbsp;1883

                        </option>



                        <option value="1882">&nbsp;1882

                        </option>



                        <option value="1881">&nbsp;1881

                        </option>



                        <option value="1880">&nbsp;1880

                        </option>



                        <option value="1879">&nbsp;1879

                        </option>



                        <option value="1878">&nbsp;1878

                        </option>



                        <option value="1877">&nbsp;1877

                        </option>



                        <option value="1876">&nbsp;1876

                        </option>



                        <option value="1875">&nbsp;1875

                        </option>



                        <option value="1874">&nbsp;1874

                        </option>



                        <option value="1873">&nbsp;1873

                        </option>



                        <option value="1872">&nbsp;1872

                        </option>



                        <option value="1871">&nbsp;1871

                        </option>



                        <option value="1870">&nbsp;1870

                        </option>



                        <option value="1869">&nbsp;1869

                        </option>



                        <option value="1868">&nbsp;1868

                        </option>



                        <option value="1867">&nbsp;1867

                        </option>



                        <option value="1866">&nbsp;1866

                        </option>



                        <option value="1865">&nbsp;1865

                        </option>



                        <option value="1864">&nbsp;1864

                        </option>



                        <option value="1863">&nbsp;1863

                        </option>



                        <option value="1862">&nbsp;1862

                        </option>



                        <option value="1861">&nbsp;1861

                        </option>



                        <option value="1860">&nbsp;1860

                        </option>



                        <option value="1859">&nbsp;1859

                        </option>



                        <option value="1858">&nbsp;1858

                        </option>



                        <option value="1857">&nbsp;1857

                        </option>



                        <option value="1856">&nbsp;1856

                        </option>



                        <option value="1855">&nbsp;1855

                        </option>



                        <option value="1854">&nbsp;1854

                        </option>



                        <option value="1853">&nbsp;1853

                        </option>



                        <option value="1852">&nbsp;1852

                        </option>



                        <option value="1851">&nbsp;1851

                        </option>



                        <option value="1850">&nbsp;1850

                        </option>



                        <option value="1849">&nbsp;1849

                        </option>



                        <option value="1848">&nbsp;1848

                        </option>



                        <option value="1847">&nbsp;1847

                        </option>



                        <option value="1846">&nbsp;1846

                        </option>



                        <option value="1845">&nbsp;1845

                        </option>



                        <option value="1844">&nbsp;1844

                        </option>



                        <option value="1843">&nbsp;1843

                        </option>



                        <option value="1842">&nbsp;1842

                        </option>



                        <option value="1841">&nbsp;1841

                        </option>



                        <option value="1840">&nbsp;1840

                        </option>



                        <option value="1839">&nbsp;1839

                        </option>



                        <option value="1838">&nbsp;1838

                        </option>



                        <option value="1837">&nbsp;1837

                        </option>



                        <option value="1836">&nbsp;1836

                        </option>



                        <option value="1835">&nbsp;1835

                        </option>



                        <option value="1834">&nbsp;1834

                        </option>



                        <option value="1833">&nbsp;1833

                        </option>



                        <option value="1832">&nbsp;1832

                        </option>



                        <option value="1831">&nbsp;1831

                        </option>



                        <option value="1830">&nbsp;1830

                        </option>



                        <option value="1829">&nbsp;1829

                        </option>



                        <option value="1828">&nbsp;1828

                        </option>



                        <option value="1827">&nbsp;1827

                        </option>



                        <option value="1826">&nbsp;1826

                        </option>



                        <option value="1825">&nbsp;1825

                        </option>



                        <option value="1824">&nbsp;1824

                        </option>



                        <option value="1823">&nbsp;1823

                        </option>



                        <option value="1822">&nbsp;1822

                        </option>



                        <option value="1821">&nbsp;1821

                        </option>



                        <option value="1820">&nbsp;1820

                        </option>



                        <option value="1819">&nbsp;1819

                        </option>



                        <option value="1818">&nbsp;1818

                        </option>



                        <option value="1817">&nbsp;1817

                        </option>



                        <option value="1816">&nbsp;1816

                        </option>



                        <option value="1815">&nbsp;1815

                        </option>



                        <option value="1814">&nbsp;1814

                        </option>



                        <option value="1813">&nbsp;1813

                        </option>



                        <option value="1812">&nbsp;1812

                        </option>



                        <option value="1811">&nbsp;1811

                        </option>



                        <option value="1810">&nbsp;1810

                        </option>



                        <option value="1809">&nbsp;1809

                        </option>



                        <option value="1808">&nbsp;1808

                        </option>



                        <option value="1807">&nbsp;1807

                        </option>



                        <option value="1806">&nbsp;1806

                        </option>



                        <option value="1805">&nbsp;1805

                        </option>



                        <option value="1804">&nbsp;1804

                        </option>



                        <option value="1803">&nbsp;1803

                        </option>



                        <option value="1802">&nbsp;1802

                        </option>



                        <option value="1801">&nbsp;1801

                        </option>



                    </select>


                </p>

	</td>
</tr>


<tr>
<td>
                <p id="firstName"  >

                    <label id="firstnamelabel" for="first-name">First Name *</label>

                    <input id="firstName" name="firstName" type="text" value=""/>

                </p>

</td>
</tr>

<tr>
<td>
                <p id="lastName" >

                    <label id="lastnamelabel" for="last-name">Last Name *</label>

                    <input id="lastName" name="lastName" type="text" value=""/>

                </p>

</td>
</tr>

<tr>
<td>

                <p id="email">

                    <label id="emaillabel" for="email">Email *</label>

                    <input id="email" name="email" type="text" value=""/>

                </p>
</td>
</tr>

<tr>
<td>
                <p id="birthday">

                    <label id="birthdaylabel" for="date-fo-birth">Date of Birth *</label>

                    <select id="birthday_year" name="year" style="width:80px; float:left;" onchange="checkDate(this, 'birthday', 'year');">

                        <option value="0" selected="selected">Year:</option>

                        <option value="2000">2000

                        </option>

                        <option value="1999">1999

                        </option>



                        <option value="1998">1998

                        </option>



                        <option value="1997">1997

                        </option>



                        <option value="1996">1996

                        </option>



                        <option value="1995">1995

                        </option>



                        <option value="1994">1994

                        </option>



                        <option value="1993">1993

                        </option>



                        <option value="1992">1992

                        </option>



                        <option value="1991">1991

                        </option>



                        <option value="1990">1990

                        </option>



                        <option value="1989">1989

                        </option>



                        <option value="1988">1988

                        </option>



                        <option value="1987">1987

                        </option>



                        <option value="1986">1986

                        </option>



                        <option value="1985">1985

                        </option>



                        <option value="1984">1984

                        </option>



                        <option value="1983">1983

                        </option>



                        <option value="1982">1982

                        </option>



                        <option value="1981">1981

                        </option>



                        <option value="1980">1980

                        </option>



                        <option value="1979">1979

                        </option>



                        <option value="1978">1978

                        </option>



                        <option value="1977">1977

                        </option>



                        <option value="1976">1976

                        </option>



                        <option value="1975">1975

                        </option>



                        <option value="1974">1974

                        </option>



                        <option value="1973">1973

                        </option>



                        <option value="1972">1972

                        </option>



                        <option value="1971">1971

                        </option>



                        <option value="1970">1970

                        </option>



                        <option value="1969">1969

                        </option>



                        <option value="1968">1968

                        </option>



                        <option value="1967">1967

                        </option>



                        <option value="1966">1966

                        </option>



                        <option value="1965">1965

                        </option>



                        <option value="1964">1964

                        </option>



                        <option value="1963">1963

                        </option>



                        <option value="1962">1962

                        </option>



                        <option value="1961">1961

                        </option>



                        <option value="1960">1960

                        </option>



                        <option value="1959">1959

                        </option>



                        <option value="1958">1958

                        </option>



                        <option value="1957">1957

                        </option>



                        <option value="1956">1956

                        </option>



                        <option value="1955">1955

                        </option>



                        <option value="1954">1954

                        </option>



                        <option value="1953">1953

                        </option>



                        <option value="1952">1952

                        </option>



                        <option value="1951">1951

                        </option>



                        <option value="1950">1950

                        </option>



                        <option value="1949">1949

                        </option>



                        <option value="1948">1948

                        </option>



                        <option value="1947">1947

                        </option>



                        <option value="1946">1946

                        </option>



                        <option value="1945">1945

                        </option>



                        <option value="1944">1944

                        </option>



                        <option value="1943">1943

                        </option>



                        <option value="1942">1942

                        </option>



                        <option value="1941">1941

                        </option>



                        <option value="1940">1940

                        </option>



                        <option value="1939">1939

                        </option>



                        <option value="1938">1938

                        </option>



                        <option value="1937">1937

                        </option>



                        <option value="1936">1936

                        </option>



                        <option value="1935">1935

                        </option>



                        <option value="1934">1934

                        </option>



                        <option value="1933">1933

                        </option>



                        <option value="1932">1932

                        </option>



                        <option value="1931">1931

                        </option>



                        <option value="1930">1930

                        </option>



                        <option value="1929">1929

                        </option>



                        <option value="1928">1928

                        </option>



                        <option value="1927">1927

                        </option>



                        <option value="1926">1926

                        </option>



                        <option value="1925">1925

                        </option>



                        <option value="1924">1924

                        </option>



                        <option value="1923">1923

                        </option>



                        <option value="1922">1922

                        </option>



                        <option value="1921">1921

                        </option>



                        <option value="1920">1920

                        </option>



                        <option value="1919">1919

                        </option>



                        <option value="1918">1918

                        </option>



                        <option value="1917">1917

                        </option>



                        <option value="1916">1916

                        </option>



                        <option value="1915">1915

                        </option>



                        <option value="1914">1914

                        </option>



                        <option value="1913">1913

                        </option>



                        <option value="1912">1912

                        </option>



                        <option value="1911">1911

                        </option>



                        <option value="1910">1910

                        </option>



                        <option value="1909">1909

                        </option>



                        <option value="1908">1908

                        </option>



                        <option value="1907">1907

                        </option>



                        <option value="1906">1906

                        </option>



                        <option value="1905">1905

                        </option>



                        <option value="1904">1904

                        </option>



                        <option value="1903">1903

                        </option>



                        <option value="1902">1902

                        </option>



                        <option value="1901">1901

                        </option>



                    </select>



                    <select id="birthday_month" name="month" style="width: 110px; float: left; margin-left: 15px;margin-right: 15px;" onchange="checkDate(this, 'birthday', 'month');">

                        <option value="0" selected="selected">Month:</option>



                        <option value="1">January

                        </option>



                        <option value="2">February

                        </option>



                        <option value="3">March

                        </option>



                        <option value="4">April

                        </option>



                        <option value="5">May

                        </option>



                        <option value="6">June

                        </option>



                        <option value="7">July

                        </option>



                        <option value="8">August

                        </option>



                        <option value="9">September

                        </option>



                        <option value="10">October

                        </option>



                        <option value="11">November

                        </option>



                        <option value="12">December

                        </option>



                    </select>



                    <select id="birthday_day" name="day" style="width:70px;" onchange="checkDate(this, 'birthday', 'day');">

                        <option value="0" selected="selected">Day:</option>



                        <option value="1">1

                        </option>



                        <option value="2">2

                        </option>



                        <option value="3">3

                        </option>



                        <option value="4">4

                        </option>



                        <option value="5">5

                        </option>



                        <option value="6">6

                        </option>



                        <option value="7">7

                        </option>



                        <option value="8">8

                        </option>



                        <option value="9">9

                        </option>



                        <option value="10">10

                        </option>



                        <option value="11">11

                        </option>



                        <option value="12">12

                        </option>



                        <option value="13">13

                        </option>



                        <option value="14">14

                        </option>



                        <option value="15">15

                        </option>



                        <option value="16">16

                        </option>



                        <option value="17">17

                        </option>



                        <option value="18">18

                        </option>



                        <option value="19">19

                        </option>



                        <option value="20">20

                        </option>



                        <option value="21">21

                        </option>



                        <option value="22">22

                        </option>



                        <option value="23">23

                        </option>



                        <option value="24">24

                        </option>



                        <option value="25">25

                        </option>



                        <option value="26">26

                        </option>



                        <option value="27">27

                        </option>



                        <option value="28">28

                        </option>



                        <option value="29">29

                        </option>

                        <option value="30">30

                        </option>

                        <option value="31">31

                        </option>

                    </select>


                </p>

</td>
</tr>

<tr>
		<td>
                <p id="gender">

                    <label id="genderlabel" >Gender *</label>

                    <select id="genders" name="genders" >

                        <option value="1" selected="selected" >Male

                        </option>

                        <option value="2">Female

                        </option>

		</select>

                </p>
</td>
</tr>


<tr>
<td>
                <p id="password">

                    <label for="password">Password *</label>

                    <input id="password" name="password" type="password" value=""/>


                </p>
</td>
</tr>

<tr>
<td>

                <p id="conformPassword">

                    <label for="password">Confirm Password *</label>

                    <input id="conformPassword" name="conformPassword" type="password" value=""/>

                </p>

</td>
</tr>

<tr>
<td>
                <p>

                    <script type="text/javascript" src="http://api.recaptcha.net/challenge?k=6LdJMMcSAAAAABiVgfWMCVG0NGjDrk_gyFBPgiB-"></script>

                </p>

</td>


</tr>
<tr>
<td>
                <p id="accountType1">

                    <label>Account Type *</label>

                    <select id="accounts" name="accounts" onchange="selectchange()">

                        <option value="1" selected="selected" >Artist
                        </option>
                        <option value="2">Production/Management
                        </option>
                        <option value="3">Representative
                        </option>
                        <option value="4">Fan
                        </option>
                        <option value="5">Company
                        </option>
					</select>

					<a  style="text-align: left;"  href="accounttypeinfo.htm"  alt="dunno which account to choose"><font size="2"><u>Don't know which account type to choose?</u></font></a>

                </p>

</td>
</tr>
<tr>
<td>
                <p>

                    <input type="submit"  class="signup_button"  style="float: right;" value="Next" onclick="validate_submit()';" />

					<br>

                    <font size=2 align="right" >
                    	By clicking this button I agree to Artist Magnet's <a  style="text-align: left;"  href="termsandconds.htm"  alt="terms and conditions"><u>Terms and conditions</u></a>
                    </font>
                </p>
</td>
</tr>
</table>

            </form>
           <iframe src="https://www.facebook.com/plugins/registration.php?client_id=102540469215&redirect_uri=http://artistmagnet.com/invite_friend.jsp&fields=name,birthday,gender,location,email" scrolling="auto" frameborder="no" style="border:none" allowTransparency="true" width="100%" height="330" id="fbreg"></iframe> 
        </div>
    </div>

</div>

<div id="page-frame-baseline"></div>

<div id="navigation-background"></div>

<div id="navigation-ribbon">

    <a href="/" alt="Artist Magnet home"><img id="logo" src="images/logo.png" alt="Artist Magnet"/></a>

</div>

</body>



<script type="text/javascript">

 
    var forCompany = new Array("companyName", "foundedYear");

    var forArtist = new Array("firstName", "lastName", "birthday");



    function accountTypeChecker(checkerValue) {

        hideDynamicFields();

        if (checkerValue == 5) {

            for (x in forCompany) {

                document.getElementById(forCompany[x]).style.display = "block";

            }

        } else {

            for (x in forArtist) {

                document.getElementById(forArtist[x]).style.display = "block";

            }

        }

    }



    function hideDynamicFields() {

        var dynamicFields = new Array("firstName", "lastName", "companyName", "birthday", "foundedYear");

        for (x in dynamicFields) {

            document.getElementById(dynamicFields[x]).style.display = "none";

        }

    }





    function checkDate(that, path, name) {

        var year = document.getElementById(path + "_" + "year").selectedIndex;

        var month = document.getElementById(path + "_" + "month").selectedIndex;

        var day = document.getElementById(path + "_" + "day").selectedIndex;

        if (year != 0) {

            year += 3;

        }

        if (!correctDate(year, month, day)) {

            if (name == "month") {

                document.getElementById(path + "_" + "day").selectedIndex = 0;

            } else if (name == "day" || name == "year") {

                document.getElementById(path + "_" + "month").selectedIndex = 0;

            }

        }

    }



    function correctDate(year, month, day) {

        var monthList = new Array(31, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

        if (month < 12) 
        {

            if (monthList[month] < day) {

                if (month == 2) {

                    if (year % 4 == 0) {

                        if (day > 29) {

                            return false;

                        }

                    }

                    else if (day > 28) {

                        return false;

                    }

                } else {

                    return false;

                }

            }

        }

        return true;

    }




    $(document).ready(function() {

        hideDynamicFields();

        for (x in forArtist) {

            document.getElementById(forArtist[x]).style.display = "block";

        }

        showAccountTypes();

        accountTypeChecker(document.getElementById("accountTypeId").value);

        if (document.getElementById("accountTypeName").value != "" && document.getElementById("accountTypeId").value > 0

                && document.getElementById("accountTypeId").value <= 5) {

            document.getElementById("accountTypeNameSpan").innerHTML = "  " + document.getElementById("accountTypeName").value;

        } else {

            document.getElementById("accountTypeId").value = 0;

        }



    });



    function showAccountTypes() {



        var myMenu = {"options": [

            {"name": "Artist", "customOptions": "Actors, Directors, Designers, etc."},

            {"name": "Production/Management", "customOptions": "Producers, Stage Managers, Technical Directors, etc."},

            {"name": "Representative", "customOptions": "Agents, Managers, Publicists, etc."},

            {"name": "Fan", "customOptions": "Fans and patrons of the arts, artists, etc."},

            {"name": "Company", "customOptions": "Production Companies, Arts Related Businesses, Affiliate Organizations, etc."}

        ]

        };



        var options = document.createElement("div");

        options.className = "accountTypesOptions";

        options.id = "accountTypesOptions";



        for (x in myMenu.options) {

            var option = document.createElement("div");

            option.innerHTML = "  " + myMenu.options[x].name;

            option.customOptions = createCustomOptions(myMenu.options[x].customOptions);

            option.rollId = ++x;



            option.onmouseover = function() {

                this.style.background = "#3c7dd0";

                this.style.color = "white";

                this.customOptions.style.display = "block";

            }



            option.onmouseout = function() {

                this.style.background = "white";

                this.style.color = "black";

                this.customOptions.style.display = "none";

            }



            option.onclick = function() {

                submitAccountType(this.rollId, this.innerHTML);

            }



            options.appendChild(option);



        }



        document.getElementById("accountTypes").appendChild(options);

    }



    function createCustomOptions(customRoles) {

        var customOptions = document.createElement("div");

        customOptions.className = "customOptions";

        customOptions.innerHTML = customRoles;

        customOptions.style.display = "none";

        document.getElementById("accountTypes").appendChild(customOptions);

        return customOptions;

    }





    function submitAccountType(rollId, rollName) {

        document.getElementById("accountTypeId").value = rollId;

        document.getElementById("accountTypeNameSpan").innerHTML = rollName;

        document.getElementById("accountTypeName").value = rollName.substring(2);



        accountTypeChecker(rollId);



    }



    var accountTypeClick = false;

    var accountDisplay = false;



    $('#accountTypes').click(function() {

        accountTypeClick = true;

        if (document.getElementById("accountTypesOptions").style.display == "block") {

            document.getElementById("accountTypesOptions").style.display = "none";

            accountDisplay = false;

        } else {

            document.getElementById("accountTypesOptions").style.display = "block";

            accountDisplay = true;

        }

    });



    $('body').click(function() {

        if (accountTypeClick == true) {

            accountTypeClick = false;

        } else {

            if (accountDisplay == true) {

                document.getElementById("accountTypesOptions").style.display = "none";

            }



        }



    });



function selectchange()
{

    var forCompany = new Array("companyName", "foundedYear");

    var forArtist = new Array("firstName", "lastName", "birthday");

	var selectObj = document.getElementById("accounts");

	for ( var i = 0 ; i < selectObj.options.length ; i++ )
	{

		if ( selectObj.options[i].selected )
		{
			var sel = selectObj.options[i].value;

			if (sel == 5) {

				for (x in forCompany) {
					document.getElementById(forCompany[x]).style.display = "block";
				}
				document.getElementById("firstnamelabel").innerHTML = "Primary Contact First Name *";
				document.getElementById("lastnamelabel").innerHTML = "Primary Contact Last Name *";
				document.getElementById("emaillabel").innerHTML = "Primary Contact Email *";
				document.getElementById("genderlabel").innerHTML = "Primary Contact Gender *";
				document.getElementById("birthdaylabel").innerHTML = "Primary Contact Date of Birth *";

			} else {

				for (x in forArtist) {
					document.getElementById(forArtist[x]).style.display = "block";
				}
				for (x in forCompany) {
					document.getElementById(forCompany[x]).style.display = "none";
				}
				document.getElementById("firstnamelabel").innerHTML = "First Name *";
				document.getElementById("lastnamelabel").innerHTML = "Last Name *";
				document.getElementById("emaillabel").innerHTML = "Email *";
				document.getElementById("genderlabel").innerHTML = "Gender *";
				document.getElementById("birthdaylabel").innerHTML = "Date of Birth *";
			}
		}
	}

    /*

    function accountTypeChecker(checkerValue) {

        hideDynamicFields();

        if (checkerValue == 5) {

            for (x in forCompany) {

                document.getElementById(forCompany[x]).style.display = "block";

            }

        } else {

            for (x in forArtist) {

                document.getElementById(forArtist[x]).style.display = "block";

            }

        }

    }



    function hideDynamicFields() {

        var dynamicFields = new Array("firstName", "lastName", "companyName", "birthday", "foundedYear");

        for (x in dynamicFields) {

            document.getElementById(dynamicFields[x]).style.display = "none";

        }

    }
    */
}

	function open_win()
	{
		window.open("http://www.w3schools.com");
	}


function validateForm()
{

	var x=document.forms["user"]["firstName"].value;
	if (x==null || x=="")
	{
	  alert("First name must be filled out");
	  return false;
	}	

	var x=document.forms["user"]["lastName"].value;
	if (x==null || x=="")
	{
	  alert("Last name must be filled out");
	  return false;
	}
	
	var x=document.forms["user"]["email"].value;
	if (x==null || x=="")
	{
	  alert("E-mail must be filled out");
	  return false;
	}
	var atpos=x.indexOf("@");
	var dotpos=x.lastIndexOf(".");
	if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
	{
	  alert("Not a valid e-mail address");
	  return false;
	}	
		
	
	var x=document.forms["user"]["password"].value;
	if (x==null || x=="")
	{
	  alert("Password must be filled out");
	  return false;
	}
	
	var y=document.forms["user"]["conformPassword"].value;
	if (y==null || y=="")
	{
	  alert("Confirm Password must be filled out");
	  return false;
	}
	
	if ( x != y )
	{
		alert("Password and Confirm Password must be same.");
		return false;
	}
		

	return true;

	
};
/*
 * Init page to restore form state on account type
 */
function init () {
   selectchange();
};
</script>

</html>

