USE Northwind
--DQL(DATA QUERY LANGUAGE)
--Ders1
SELECT * FROM Personeller  -- Tabel-da olan datalari cagirmaq
SELECT Adi,SoyAdi FROM Personeller -- Tabelda olan Ad ve Soyad Column-u cagirmaq
SELECT 'Senan' Adi,'Mem' Soyad -- Ozumuzden cagiranda gorsedilen Adi columunun Senan datasi Soyad-i columunun gorseddiyi Mem datasi
SELECT Adi Isimler,Soyadi Soyisimler from Personeller -- Tabel-dan Ad ve Soyadi datalarin cagiranda bize gorsenmesin isdediyimiz column-larin adin deyisib gorsedir

--region Soz brlesmesin isdifade etmey isdiyende [ ] bu simvollarin icine yaziriq
SELECT 1453 [Istanbulu Fethi]
SELECT * FROM [Satis Detaylari]
-- endregion

SELECT Adi +' ' + SoyAdi [Personel Bilgileri] FROM Personeller--Tabel-da birdan cox eyni tip column eyni columnda caqirmaq isdesey

--region Tabel-da birdan cox ferqli tip column eyni columnda caqirmaq isdesey etmeli olduqumuz tip cevirmelerinin 2 yolu
SELECT Adi + ' ' + CONVERT(nvarchar, IseBaslamaTarihi) [Ad ve Tarixi] FROM Personeller 
SELECT Adi + ' ' + CAST(IseBaslamaTarihi as nvarchar) [Ad ve Tarixi] FROM Personeller 
-- endregion
--End Ders1

--Ders2
SELECT * FROM Personeller WHERE Sehir='London'
SELECT Adi FROM Personeller WHERE Sehir='London'
SELECT * FROM Personeller WHERE BagliCalistigiKisi<5
SELECT * FROM Personeller WHERE Sehir='London' AND Ulke = 'UK'
SELECT * FROM Personeller WHERE UnvanEki='Mr.' OR Sehir = 'Seattle'
SELECT * FROM Personeller WHERE Adi='Robert' AND SoyAdi = 'King'
SELECT * FROM Personeller WHERE PersonelID=5
SELECT * FROM Personeller WHERE PersonelID!=5
SELECT * FROM Personeller WHERE PersonelID<>5
SELECT * FROM Personeller WHERE PersonelID>=5

SELECT * FROM Personeller WHERE YEAR(IseBaslamaTarihi)=1993
SELECT * FROM Personeller WHERE YEAR(IseBaslamaTarihi)>1993
SELECT * FROM Personeller WHERE DAY(DogumTarihi)<>29
SELECT * FROM Personeller WHERE YEAR(DogumTarihi)>1950 AND YEAR(DogumTarihi)<1965
SELECT Adi,SoyAdi FROM Personeller WHERE Sehir='London' or Sehir='Tacoma' or Sehir = 'Kirkland'
SELECT Adi+' '+SoyAdi [Full Name] FROM Personeller WHERE Sehir='London' or Sehir='Tacoma' or Sehir = 'Kirkland'
--End Ders2

--Ders3
SELECT * FROM Personeller WHERE YEAR(DogumTarihi)>=1950 AND YEAR(DogumTarihi)<=1965
--Yuxarida ki ile eyni isi gorur
SELECT * FROM Personeller WHERE YEAR(DogumTarihi) BETWEEN 1950 AND 1960
--End Ders3

--Ders4 
SELECT Adi,SoyAdi FROM Personeller WHERE Sehir='London' or Sehir='Tacoma' or Sehir = 'Kirkland'
--Yuxarida ki ile eyni isi gorur
SELECT Adi,SoyAdi FROM Personeller WHERE Sehir IN ('London','Tacoma','Kirkland')
--End Ders4

--Ders5
-- region % Operatoru
SELECT Adi,Soyadi FROM Personeller WHERE Adi Like 'j%' -- Bas herfi J olan butun adlari cixardir
SELECT Adi,Soyadi FROM Personeller WHERE Adi Like '%y' -- Son herfi y olan butun adlari cixardir
SELECT Adi,Soyadi FROM Personeller WHERE Adi Like '%ert' -- Son 3 herfi ert olan butun adlari cixardir
SELECT Adi,Soyadi FROM Personeller WHERE Adi Like 'r%t' -- Bas herfi R Son herfi t olan butun adlari cixardir
SELECT Adi,Soyadi FROM Personeller WHERE Adi Like 'r%' and Adi Like '%t' -- yuxridaki ile eyni seydi menasiz uzatmaqdi bu hall
SELECT Adi,Soyadi FROM Personeller WHERE Adi Like '%an%' -- Icinde herfi an olan butun adlari cixardir
SELECT * FROM Personeller WHERE Adi Like 'n%an%' -- Bas herfi N ve icinde an herifleri olan butun adlari cixardir
SELECT * FROM Personeller WHERE Adi Like 'n%' and Adi Like '%an%' -- yuxridaki ile eyni seydi menasiz uzatmaqdi bu hall
-- endregion
-- region _ Operatoru
SELECT * FROM Personeller WHERE Adi Like 'a_d%' -- Bas herfi a 2ci herifinin ferqi yox 3cu herfi d  olan butun adlari cixardir
SELECT * FROM Personeller WHERE Adi Like 'm___a%' -- Bas herfi m 2ci,3cu,4cu herifinin ferqi yox 5ci herfi a olan butun adlari cixardir
-- endregion

-- region [] Operatoru
SELECT * FROM Personeller WHERE Adi Like '[nmr]%' -- Bas herfi n yad m yada r olan butun adlari cixardir
SELECT * FROM Personeller WHERE Adi Like '%[ai]%' -- Icinde herfi a yada i yad a i olan butun adlari cixardir
-- endregion

-- region [*-*] Operatoru
SELECT * FROM Personeller WHERE Adi Like '[a-k]%' -- Bas herfi elifba sirasina gore a-dan k-can olan butun heriflernen basdiyan adlari cixardir
-- endregion

-- region [^*] Operatoru
SELECT * FROM Personeller WHERE Adi Like '[^a]%' -- Bas herfi a olmuyanlarin hamisin cixardir
SELECT * FROM Personeller WHERE Adi Like '[^an]%' -- Bas herfi a ya da n olmuyanlarin hamisin cixardir
-- endregion
--End Ders5

--Ders6
SELECT Adi,Soyadi FROM Personeller WHERE Adi Like '_%' -- Bas herfi '_' simvol kimi gormur ona gore  butun adlari cixardir

SELECT Adi,Soyadi FROM Personeller WHERE Adi Like '[_]%' -- Bas herfi '_' simvol olan butun adlari cixardir

SELECT Adi,Soyadi FROM Personeller WHERE Adi Like 'u_%' Escape 'u' -- burda u herfini Escape ile lazimsiz onan sonra kilari vacib bildirmisiy diye netice bas herfi '_' simvol olan butun adlari cixardir
--Qey yuxaria ki setirde u-nun yerine isdediyimiz simvolu qoya bileriy ve Escape-de onu bildire bleriy
--End Ders6

--Ders7
--region AGGREGATE FUNKSIYASIS
--AVG : ORTA QIYMET ALMA
SELECT AVG(PersonelID) FROM Personeller
--MAX : EN BOYUYU ALMA
SELECT MAX(PersonelID) FROM Personeller
--MIN : EN KICIYI ALMA
SELECT MIN(PersonelID) FROM Personeller
--COUNT : UMUMI SAYI ALMA
SELECT COUNT(PersonelID) FROM Personeller
--SUM : CEMINI ALMA
SELECT SUM(PersonelID) FROM Personeller
-- endregion
--End Ders7

--Ders8 
--region STRING FUNKSIYASIS
SELECT LEFT(Adi,2) FROM Personeller -- Tabel-daki butun adlarin soldan ilk 2 herifin cap edir yeni ilk iki herifin
SELECT RIGHT(Adi,2) FROM Personeller -- Tabel-daki butun adlarin sagdan ilk 2 herifin cap edir yeni sondan iki herifin
SELECT UPPER(Adi) FROM Personeller -- Tabel-daki butun adlarin her birinin butun heriflerin boyuk herife cevirib bize qaytaracaq 
SELECT LOWER(Adi) FROM Personeller -- Tabel-daki butun adlarin her birinin butun heriflerin kicik herife cevirib bize qaytaracaq
SELECT SUBSTRING(SoyAdi,3,2) FROM Personeller -- Tabel-daki butun soyadlarin her birinin 3-cu indexden basliyaraq 2 herifin bize qaytaracaq 

--LTRIM Soldan bosluqlari kesir(2 setride cap et ferqi gor)
SELECT '      Senan'
SELECT LTRIM('      Senan')
--RTRIM Sagdaki bosluqlari kesir(2 setride cap et ferqi gor)
SELECT 'Senan      ' + ' Mem'
SELECT RTRIM('Senan      ')+ ' Mem'

SELECT REVERSE(Adi) FROM Personeller -- Tabel-daki butun adlarin her birinin butun heriflerin TERSINE cevirib bize qaytaracaq
SELECT REPLACE('Samir Mem','Samir','Senan')-- Samir sozun ceviri Senan sozune
SELECT CHARINDEX('r',Adi) FROM Personeller -- Tabel-da  adlarindan tapdiqi ilk r herfilerinin sirasin qaytarir indexi-in yox tapmasada 0 qaytarir
SELECT MusteriAdi, CHARINDEX(' ',MusteriAdi) FROM Musteriler -- Tabel-da  adlarindan tapdiqi ilk ' ' bosluqun sirasin qaytarir indexi-in yox tapmasada 0 qaytarir(Musterinin adinida qaytarma sebebi basda musteri adinda cap qaytarmasin emir etmisik
--Numune
SELECT MusteriAdi FROM Musteriler
SELECT SUBSTRING(MusteriAdi,0, CHARINDEX(' ',MusteriAdi)) FROM Musteriler -- Tabel-da MusteriAdi-nda musterinin tam adi var ve biz isdiyirik ki ancaq adin cixardaq ona gore 0-ci indeksden basdadib bosluq olan sirayacan cap edir(bosluq daxil deyill)
SELECT SUBSTRING(MusteriAdi,(CHARINDEX(' ',MusteriAdi)+1),LEN(MusteriAdi)-CHARINDEX(' ',MusteriAdi)) FROM Musteriler -- Tabel-daki butun soyadlari cixardmaq(LEN MusteriAdi-nin uzunluqun qaytarir)
-- endregion
--End Ders8

--Ders9
--region Hesablama isleri
SELECT 3 + 2
SELECT 3 * 3
SELECT 4 / 2
SELECT 9 - 7
--endregion
SELECT PI() --Pi ededin bize qaytarir
SELECT SIN(90) --90 ededin bize Sinusun qaytarir
SELECT POWER(2,3)-- 2nin usdu 3 ededin bize qaytarir 
SELECT ABS(-12) -- ededimizin mutleq qiymetin qaytarir (yeni ancaq musbet halin qaytarir)
SELECT RAND() -- 0-1 arasi Random qiymet qaytarir 
SELECT FLOOR(4.5) -- Floor ededin tam hissesin qaytarir 
--Numune : 
SELECT FLOOR(RAND()*100) -- 100-e vurmaqda sebeb 1 ve 0 araliqinda eded qaytarir diye tam ededi 0 olur 
--End Ders9

--Ders10
--region Taxir funksiyalari
SELECT GETDATE() --bu gunun tarixin qaytarir
--DATEADD : Verilen tarixe qeyd edeceyemiz mudeet qeder elave etmek
SELECT DATEADD(DAY,24,GETDATE())--GUN ARTIRMAQ
SELECT DATEADD(MONTH,24,GETDATE())--AY ARTIRMAQ
SELECT DATEADD(YEAR,24,GETDATE())--IL ARTIRMAQ

--DATEDIFF : Iki tarix arasinde ki gunu,ayi, ili bize qaytrir 
SELECT DATEDIFF(DAY,'03.07.2001',GETDATE())--GUN ARALIQI
SELECT DATEDIFF(WEEK,'03.07.2001',GETDATE())--HEFTE ARALIQI
SELECT DATEDIFF(MONTH,'03.07.2001',GETDATE())--AY ARALIQI
SELECT DATEDIFF(YEAR,'03.07.2001',GETDATE())--IL ARALIQI

--DATEPART : Verilen tarixin heftenin,ayin, ilin hansi gunu gunu oldugun heasb;ayir
SELECT DATEPART(DW,GETDATE())--heftenin gunun qaytarir
SELECT DATEPART(MONTH,GETDATE())--necenci aydi onu qaytarir
SELECT DATEPART(DAY,GETDATE())--ayin necesidi onu qaytarir
--endregion
--End Ders10


--Ders11
--region Top Emiri
SELECT TOP 5 * FROM Personeller -- Tabel-daki ilk 5 in bize qaytarir
--endregion
--End Ders11

--Ders12
--region Distinct Emiri
SELECT DISTINCT Sehir FROM Personeller -- Tabel-daki eyni seher adlarin yalniz birin gorsedir tekrarin qarsin alib bize qaytarir
--endregion
--End Ders12

--Ders12 video 17
--region Group By Emiri
SELECT * FROM Urunler
SELECT KategoriID, COUNT(*) FROM Urunler GROUP BY KategoriID-- Tabel-daki eyni kategoride olan mehsullari kategori ve ona uygun olan mehsullarin sayin qaytarir bize
SELECT KategoriID,TedarikciID ,COUNT(*) FROM Urunler GROUP BY KategoriID,TedarikciID-- Burdada eyni olan KategoriID ve TedarikIDsin qruplasdirir en yaxsi yuxarida ki sekilde yazmaqdi
SELECT PersonelID, SUM(NakliyeUcreti) FROM Satislar GROUP BY PersonelID-- Tabel-daki eyni PersonalID olan satislari cemin qaytarir bize
--endregion

--region Group By Emiri ve WHERE
SELECT KategoriID, COUNT(*) FROM Urunler WHERE KategoriID>5  GROUP BY KategoriID --Tabel-daki qruplasdirmani kategoriIDye gore edirik ama ID-nin deyeri 5 den yuxari olanlari qruplasdirirq whereye gore
SELECT PersonelID, COUNT(*) FROM Satislar WHERE PersonelID<4  GROUP BY PersonelID 
--endregion
--End Ders12

--Ders13
--region Having Emiri
SELECT KategoriID, COUNT(*) FROM Urunler GROUP BY KategoriID HAVING COUNT(*) > 6 -- Tabel-daki eyni kategoride olan mehsullari kategori ve ona uygun olan mehsullarin sayin qaytarir bize ama mehsullarin sayi 6-dan yuxaridisa bunu Having bize edir
--Having-in group by-dan sagda olma sebebi fikrimce qruplasdirdiqca her kategorisinin sayin bilirik ve sonra havong-nen sorgu gondeririy
SELECT KategoriID, COUNT(*) FROM Urunler WHERE KategoriID>5  GROUP BY KategoriID HAVING COUNT(*) > 6 -- burdada yuxaridakiynan eynidi sade where isledilib ve bildirilib ki KategoriId si 6 dan yuxari olanlarda qrulasdirsin ve neticeni having sorugsunu icra edib qaytarsin
--endregion
--End Ders13

--Ders14
--region Tabel-llari birlesdirme
SELECT * FROM Personeller
SELECT * FROM Satislar
SELECT * FROM Personeller,Satislar -- arxa planda kiciy tabel-i boyuk tabel-nan birlesdirende
-- Fikirressey ki 10 o birinde ise 850 column vr ilk 10unu normal edir qalanlarinda ise NULL deyerin verir
SELECT Adi FROM Personeller,Satislar -- Burda Adi adli colun ancaq personellerdedi diye problem yoxdu normal isleyir
SELECT PersonelID FROM Personeller,Satislar -- Burda ise PersonelID her ikisinde var diye problemdi 
SELECT Personeller.PersonelID FROM Personeller,Satislar -- Bu halda yuxaridaki problemi helll ediriy biz bildirriy hansi tabel-dan hansi column islediriy
SELECT p.PersonelID, s.MusteriID FROM Personeller p,Satislar s -- alyans atama ede bilerik
SELECT p.PersonelID, s.MusteriID,Musteriler.MusteriID FROM Personeller p,Satislar s,Musteriler -- tabelda ede bilerik
--WHERE ilede isledilen maraqli numune
SELECT p.PersonelID, s.MusteriID FROM Personeller p,Satislar s WHERE p.PersonelID=s.PersonelID
SELECT * FROM Personeller p,Satislar s WHERE p.PersonelID=s.PersonelID
--endregion
--End 14

 
--Ders14
--region Join - Tabel-llari birlesdirme
--relationship elaqesi olan tabel-llari birlesdirme(mone to one)
SELECT * FROM Personeller p INNER JOIN Satislar s on p.PersonelID=s.PersonelID -- Burda her bir saitsda bir personel ID-si yerlsir biz ise buna esasen elaq qurub duzgun birlesdirme etdiy
SELECT u.UrunAdi, k.KategoriAdi from Kategoriler k INNER JOIN Urunler u on u.KategoriID=k.KategoriID -- kategoriID-ye esasen mehsullar ve kategorileri qaytardi 
--WHERE ilede isledilen maraqli numune : Beverages kategorsiinde olan mehsullari qaytarsin isdiyirik.
SELECT u.UrunAdi from Kategoriler k INNER JOIN Urunler u on u.KategoriID=k.KategoriID  WHERE k.KategoriAdi ='Beverages'
-- Count ilede Beverages kategorisinde ki mehsullarin sayin oyrenmey isdesem
SELECT COUNT(u.UrunAdi) from Kategoriler k INNER JOIN Urunler u on u.KategoriID=k.KategoriID  WHERE k.KategoriAdi ='Beverages'
--Seafood kategorisindeki mehsullarin listin qaytarir asagida ki yazida
SELECT u.UrunAdi from Kategoriler k INNER JOIN Urunler u on u.KategoriID=k.KategoriID  WHERE k.KategoriAdi ='Seafood'
--Hansi satisi hansi isci edib? Asagida ki kodda (Qeyd Satislar ile Personeller arasinda elaqe var)
SELECT s.SatisID,p.Adi + ' ' + p.SoyAdi [Full Name] FROM Satislar s INNER JOIN Personeller p on s.PersonelID=p.PersonelID
--Faks nomresi 'Null' olmayan tedarikcilerden alinmis mehsullar HANSILLARDIR?
SELECT * FROM Urunler u INNER JOIN Tedarikciler t on u.TedarikciID=t.TedarikciID WHERE t.Faks <> 'Null'
SELECT * FROM Urunler u INNER JOIN Tedarikciler t on u.TedarikciID=t.TedarikciID WHERE t.Faks != 'Null'
SELECT * FROM Urunler u INNER JOIN Tedarikciler t on u.TedarikciID=t.TedarikciID WHERE t.Faks IS NOT NULL
--endregion
--End 14

--Ders15
--region Join - 2den cox Tabel-llari birlesdirme
--relationship elaqesi olan tabel-llari birlesdirme(mone to mone)
-- 1997 ci ilden sonra Nancy nin satis elediyi firmalarin adlari : (1997 daxil) (Musteriler, Satislar, Personeller)
SELECT * FROM Personeller p INNER JOIN Satislar s ON p.PersonelID = s.PersonelID INNER JOIN Musteriler m on s.MusteriID = m.MusteriID WHERE p.Adi='Nancy' AND YEAR(s.SatisTarihi)>1997
-- Limited olan tedarikcilerin alinmis seafood kateqorisindeki mehsullarin umumi satis cemi.(Urunler, Kategoriler, Tedarikciler)
SELECT SUM(u.HedefStokDuzeyi*u.BirimFiyati) FROM Urunler u INNER JOIN Tedarikciler t on u.TedarikciID =T.TedarikciID INNER JOIN Kategoriler k on u.KategoriID=k.KategoriID WHERE t.SirketAdi LIKE '%Ltd.%' AND k.KategoriAdi='Seafood'
--endregion
--End 15

--Ders16
--region Join - Tabel-in oz daxilinde olan relationship elaqesine esasen ozunu ozune birlesdirme
SELECT p1.Adi,p2.Adi FROM Personeller p1 INNER JOIN Personeller p2 on p1.BagliCalistigiKisi=p2.PersonelID
--endregion
--End 16

--Ders17
--region INNER JOIN GROUP BY  
--Hansi personelin umumi ne qeder satis edib ve satis sayi 100 den yuxari olan ve ve adinin bas herifi 'M' olan kayitlar gelsin
SELECT p.Adi, COUNT(s.SatisID) FROM Personeller p INNER JOIN Satislar s ON p.PersonelID=s.PersonelID WHERE p.Adi LIKE 'M%' GROUP BY p.Adi HAVING COUNT(s.SatisID)>100
-- Seafood kategorsindeki mehsullarin sayini qaytarin (Kategori, Urunler)
SELECT k.KategoriAdi, COUNT(u.UrunAdi) FROM Kategoriler k INNER JOIN Urunler u ON k.KategoriID=u.KategoriID WHERE k.KategoriAdi='Seafood'  GROUP BY k.KategoriAdi
-- Hansi personeller umumi ne qeder satis edib> (Personeller,Satislar)
SELECT p.Adi, COUNT(s.SatisID) FROM Personeller p INNER JOIN Satislar s ON p.PersonelID=s.PersonelID GROUP BY p.Adi
-- En cox satis eden personellim? (Personeller,Satislar)
SELECT TOP 1 p.Adi, COUNT(s.SatisID) FROM Personeller p INNER JOIN Satislar s ON p.PersonelID=s.PersonelID GROUP BY p.Adi  ORDER BY COUNT(s.SatisID) desc --desc coxdan aza asc azdan coxa default asc-di ve hecne yazmasam desc-in yerine asc kimi gorecey
--Adinda 'a' herfi olan personellern satis id-si 10500-den boyuk olan satislarinin umumi deyeri(miktar*birimfiyati) ve bu satislarin hansi tarixde oldugunun lisleri(Personeller,Satislar, [SATIS DETAYLARI])
SELECT s.SatisTarihi, SUM(Sd.Miktar*SD.BirimFiyati) FROM Personeller p INNER JOIN Satislar s ON p.PersonelID=s.PersonelID INNER JOIN [Satis Detaylari] Sd ON s.SatisID=Sd.SatisID WHERE p.Adi LIKE '%a%' AND s.SatisID>10500 GROUP BY s.SatisTarihi
--endregion
--End 17

CREATE TABLE Filimler(
  FilimId INT IDENTITY(1,1),
  FilimAdi NVARCHAR(255),
  CONSTRAINT PK_Filimler_FilimId PRIMARY KEY (FilimId),
);
INSERT INTO Filimler(FilimAdi) values('GORA')
INSERT INTO Filimler(FilimAdi) values('Lord Of The Ring')
INSERT INTO Filimler(FilimAdi) values('Dugun Dernek')
INSERT INTO Filimler(FilimAdi) values('Bir Zamanlar')
INSERT INTO Filimler(FilimAdi) values('Kurtlar Vadisi')
INSERT INTO Filimler(FilimAdi) values('Recep Ivedik')
INSERT INTO Filimler(FilimAdi) values('Dugun Dernek')
INSERT INTO Filimler(FilimAdi) values('Kahpe Bizans') 

  CREATE TABLE Oyuncular(
  OyuncuId INT IDENTITY(1,1),
  FilimId INT ,
  Adi NVARCHAR(255),
  Soyadi NVARCHAR(255),
  CONSTRAINT PK_Oyuncular_OyuncuId PRIMARY KEY (OyuncuID),
  CONSTRAINT FK_Oyuncular_FilimId__ FOREIGN KEY (FilimId) REFERENCES Filimler(FilimId),
  );
  INSERT INTO Oyuncular(FilimId,Adi,Soyadi) values(1,'Cem','Yilmaz')
  INSERT INTO Oyuncular(FilimId,Adi,Soyadi) values(2,'Muiddin','Impatrino')
  INSERT INTO Oyuncular(FilimId,Adi,Soyadi) values(2,'Turgay','Arslaner')
  INSERT INTO Oyuncular(FilimId,Adi,Soyadi) values(3,'Gokhan','Asker')
  INSERT INTO Oyuncular(FilimId,Adi,Soyadi) values(4,'Mustafa','Guloglu')
  INSERT INTO Oyuncular(FilimId,Adi,Soyadi) values(4,'Mustafa','Nuroglu')
  INSERT INTO Oyuncular(FilimId,Adi,Soyadi) values(5,'Mustafa','Tayat')  
  INSERT INTO Oyuncular(FilimId,Adi,Soyadi) values(5,'Mustafa','Agaoglu')
--Ders18
--region OUTER JOIN
   --LEFT JOIN
   SELECT * FROM Oyuncular o LEFT OUTER JOIN Filimler f ON O.FilimId=f.FilimId -- sol-da olana uygun olanlari cixardir olmuyan varsa null qaytarir
   SELECT * FROM Filimler f LEFT OUTER JOIN Oyuncular o ON O.FilimId=f.FilimId -- sol-da olana uygun olanlari cixardir olmuyan varsa null qaytarir
   --RIGHT JOIN
   SELECT * FROM Oyuncular o RIGHT OUTER JOIN Filimler F ON O.FilimId=F.FilimId -- sag-da olana uygun olanlari cixardir olmuyan varsa null qaytarir
   SELECT * FROM Filimler f RIGHT OUTER JOIN Oyuncular o ON O.FilimId=f.FilimId -- sag-da olana uygun olanlari cixardir olmuyan varsa null qaytarir
   --FULL JOIN
   --Iki setirde ki sorqular eyni isi gorur burdada iki tabeli birlesdirir qarliqi olanla uygunun cixardir olmuana ise null verir
   SELECT * FROM Oyuncular o FULL OUTER JOIN Filimler F ON O.FilimId=F.FilimId -- sag-da olana uygun olanlari cixardir olmuyan varsa null qaytarir
   SELECT * FROM Filimler f FULL OUTER JOIN Oyuncular o ON O.FilimId=f.FilimId -- sag-da olana uygun olanlari cixardir olmuyan varsa null qaytarir
--endregion
--End 18


--Ders19
--region CROSS JOIN
SELECT COUNT(*) FROM Personeller
SELECT COUNT(*) FROM Bolge

SELECT p.Adi,b.BolgeID  FROM Personeller P CROSS JOIN Bolge b --CROSS JOIN TABEL-lari birlesdiri ve onun sayi iki tabelin sayinin hasiline beraberdir ve on ile sert qoya bilmeriy
--endregion
--End 19
--endregion


--DML(Data Manipulation Language)
--SELECT,INSERT,UPDATE,DELETE
--Ders1
--region SELECT
SELECT * FROM Personeller
--endregion
--End 1

--Ders2 VIDEO 27/28
--region INSERT
INSERT Personeller(Adi,SoyAdi) VALUES('Senan','Mem') -- burda verilen deyerlere diqet yetirey basda adi onra soyadi qedy etmisiyse o ardiccililada deyer vermeliyik
INSERT Personeller VALUES('Senan','Mem','Software Developers','MS','03.07.2001',GETDATE(),'AA','BB','CC','06130','FF','234560',NULL,NULL,NULL,NULL,NULL)--Burda ardicciliqi bilmey ucun personeller tabel-nin column folderinde olan ardicciliqa esasen qeyd ediriy yeni tabelinin sutunlarini soldan saga add ediriy
--Into emirinin Insertin yaninda yazilir elave olaraq hec bir funksiyanallaqi yoxdur evveler Insert-nen bir yerde isledirdiler indi vacib deyil
--Diqet yetirmeli olduqumuz bir movzuda ada nese reqem daxil etsey xeta verer ve not null-ada null versez xeta verer
--Diqqet yetilmeli olmali olduqumuz diger movzu ise biz adi ve siyadi edib ancaq adini yada hamisin secib sadece 1,2-sine deyer versey xeta verecey
--Diqqet Identity ozelliyi olan colum-a deyer vere bilmeriy
 --Praktiki yollar
--eyni columlarla insert edeciyikse bele praktik yolu var
 INSERT Personeller(Adi,SoyAdi) VALUES('Senan','Mem')
 INSERT Personeller(Adi,SoyAdi) VALUES('Emin','Mzem')
 INSERT Personeller(Adi,SoyAdi) VALUES('Elvin','Maem')

  INSERT Personeller(Adi,SoyAdi) VALUES('Senan','Mem'),
                                       ('Emin','Mzem'),									   
                                       ('Elvin','Maem')

CREATE TABLE TestPersonel(
Id INT IDENTITY(1,1),
Adi NVARCHAR(255),
SoyAdi NVARCHAR(255),
);
 INSERT TestPersonel SELECT Adi,SoyAdi FROM Personeller -- burda biz bir tabel-in butun ad ve soyadin basqa bir tabila insert etdiy
 --Diqqet
 --INSERT ETDIYIMIZ TABELDA ne qeder columns varsa selectdede ne az ne cox tab o sayda column qaytarmaliyiq
 --Insert etdiyimiz tabel-in columns ardicisliqi necedise select sorgusundada ele olmali ve tipleride eyni olmalidi
 
 --SELECT soqru ile gelen necticede ki tabel-i yeni tabel kimi db-ya qeyd etmek
 SELECT Adi,SoyAdi,Ulke INTO Test2Personeller FROM Personeller

--endregion
--End 2


--Ders3
--region UPDATE
--insert etdiyimiz deyeri yenilemey
UPDATE TestPersonel SET Adi='SENAN' -- BURDA TABEL-DAKI Adi column-un hamisini SENAN-A CEVIRI

UPDATE TestPersonel SET Adi='Aqil' WHERE Adi='SENAN' -- Burada ise biz adi SENAN olanlarin hamisin Aqile cevirir
UPDATE TestPersonel SET Adi='AQIL' WHERE SoyAdi = 'Mem'

--INNER JOIN ILE UPDATE ISLETMEY
UPDATE Urunler SET UrunAdi=k.KategoriAdi FROM Urunler U INNER JOIN Kategoriler k on k.KategoriID=u.KategoriID -- burda deyirem ki urunlerin adlarin oz kateqorileriin adlarina cevir bunun ucun ise biz inner joinden isdifade eddik menasiz bir isdir ama mqesed bunun yolun bilmeydi
--UPDATE SORGUSUNUN SUBQUery ile guncellesdirme(Subquery - sorgunun icinde sorquya deyilir)
UPDATE Urunler SET UrunAdi =(SELECT Adi FROM Personeller WHERE PersonelID=3) --burada biz mehsulunun adini set etmisiy personeller tabeilinda id-si 3 olanin adini
--UPDATE SORGUSUNU TOP KEYWORDU ile guncellesdirme
UPDATE TOP(30) Urunler SET UrunAdi='S'
--endregion
--End 3

--Ders4
--region DELETE 
 --secdiyimiz datanin silir tabelin columuna tesiri olmur sadece data-lari silir
 DELETE FROM Urunler -- biz bura sert elave etmesey butunu dtalari silecey bos tabel qaacaq
 --DIQQET BIZ BURDA BUTUN TABEL-I SILSEY IDENTITY SIFIRLANMIR ONA NESE ELAVE ETSEK 30-DAN DAVAM EDECEY
 ---HER IKISIN EDMEY ISDESEY TRANKEYDEN ISDIFADE EDECEYIK
 DELETE FROM Urunler WHERE KategoriID<3 --burda sert qoyuruq ki id-si 3 den kiciy olanlari sil
--endregion
--End4
--endregion
--endregion

--Ders1
--region Union
--BURADA BIZ AYRI AYRI IKI TABEL GORECIYIK BU IKI SETIRI EXECUTE ETSEK
Select Adi,SoyAdi FROM Personeller
Select MusteriAdi,MusteriUnvani FROM Musteriler
--Burada ise bizde iki tabeli-i birlesdirib alt-alta gorsedecey
Select Adi,SoyAdi FROM Personeller
UNION
Select MusteriAdi,MusteriUnvani FROM Musteriler
--2DEN artiqda etmey olar
Select Adi,SoyAdi FROM Personeller
UNION
Select MusteriAdi,MusteriUnvani FROM Musteriler
UNION
Select SevkAdi,SevkAdresi FROM Satislar

--Join-ler tabellari yan yana Union ise alt alta birlesdirir,Joinlerde  mueyyen bir neyinse esasinde birlesdirilir amma union-da bele bir vezyet yoxdur

--Diaqqat etmeli olduqumuz seyler
--Birlesme zamani en usde olan colon-nun column adlarina gore yaranir ama isdesem alyanslar elave edib o adlari cixarda bilerem
--Usdeki kolomda ne qeder sira melumat gelibse altakilardanda o qeder gelmelidi
--Usdeki kolomlun tipleri le altdaki kolomun tipileri ile eyni olmalidi
--Eger ferqli setirler eyni seyleri ozunde dasiyirsa tekrara icaze vermir ve onu gorsedmir
--Union-da isledilen tebillara kolon elave edile biler ama diqqet edey ki yuxarida ki qaydalara uygun olsun asaqidaki yuxaridakiynan eyni sayda kolonlar elave etmelii

--endregion

--region Union All
Select Adi,SoyAdi FROM Personeller
UNION ALL
Select Adi,SoyAdi FROM Personeller
--Union etsey heresinde olan 17-sinden tekararlari qoymuyacaq umumi 13-un goturecey(qeyd oz daxlinde 4-tekrar var 2 ayri columda)
--Union ALL  etdikde ise tpluyub alt alta cixardir 17+17=34

--endregion
--End1


--Ders2 
--region With Rollup
--Group By ile beraber islenen bir emirdir
SELECT SatisID,UrunID, Sum(Miktar) FROM [Satis Detaylari] 
GROUP BY SatisID,UrunID WITH ROLLUP --BURDA BIZ GROUP-lasdirdiq sonra ise eyni satis ID-de olan ama muxtelif urunId-de olanlarida qruplasdirim neticede SatisID NULL SUM SEKLINDE CIXARDACAQ NETICESIN NULL yazilan hissenin null olma sebeb ise eyni kategoriID-de muxtelif urunID-si olmasidi ve o onlardan birini cixarilmasi duz olmadiqi ucun null verir
--bir sozler group by-larida grouplasdirir
--Elave numune
SELECT KategoriID,UrunID, SUM(TedarikciID) FROM Urunler 
GROUP BY KategoriID,UrunID WITH ROLLUP

--HAVING EMIRI ILE BERABER ISLEILE Having-den evvel yazilmalidi
SELECT SatisID,UrunID, Sum(Miktar) FROM [Satis Detaylari] 
GROUP BY SatisID,UrunID WITH ROLLUP  HAVING SUM(Miktar)>100
--endregion

--region With Cube Komutu
SELECT SatisID,UrunID, Sum(Miktar) FROM [Satis Detaylari] 
GROUP BY SatisID,UrunID WITH CUBE -- BURDA ISE UrunID-ne gore qruplasdirir ROLLUP-BIRINCI YAZAN CUBE-ISE IKINCI YAZANA GORE HEREKET EDER VE EN AXIRDADA ROLLUP-UN SAYESINDE ARALARDA YAZILAN CEMLERI ONDA BIR ARDICIL OLARAQ GORSEDIR

SELECT KategoriID,UrunID, SUM(TedarikciID) FROM Urunler 
GROUP BY KategoriID,UrunID WITH CUBE

--HAVING EMIRI ILE BERABER ISLEILE Having-den evvel yazilmalidi
SELECT SatisID,UrunID, Sum(Miktar) FROM [Satis Detaylari] 
GROUP BY SatisID,UrunID WITH CUBE  HAVING SUM(Miktar)>100
--endregion
--End2

--Ders3
--region Case - When - Else - End

--Personeller tabelinda ad ve soyadinin yaninda Unvaneki Mr ise Kisi Ms ise Qadin yazsin
SELECT Adi,SoyAdi,UnvanEki FROM Personeller


SELECT
Adi,SoyAdi,
CASE
WHEN UnvanEki = 'Mrs.' OR UnvanEki = 'Ms.' THEN 'Qadin' --Mrs ve ya Ms-ni cevirsin Qadina
WHEN UnvanEki = 'Mr.' THEN 'Kisi' -- Mr-ni cevirsin Kisiye
ELSE UnvanEki -- Hec biri deyilse  olduqu kimi qaytarsin
END
FROM Personeller

--Eger urunun birinin qiymeti 0-50 arasidisa Cin mali, 50-100 arasidisa ucuz 100-200 arasidisa normal 200-den yuxaridisa bahali yazsin
SELECT UrunID, BirimFiyati FROM Urunler
SELECT 
UrunID,
CASE
WHEN BirimFiyati BETWEEN 0 AND 50 THEN 'Cin mali' 
WHEN BirimFiyati BETWEEN 50 AND 100 THEN 'Ucuz' 
WHEN BirimFiyati BETWEEN 100 AND 200 THEN 'Normal'
WHEN BirimFiyati > 200 THEN 'Bahali'
ELSE 'Bilinmir'
END
FROM Urunler

--endregion
--End3

--Ders4
--region With Ties
   
SELECT * FROM [Satis Detaylari]

SELECT TOP 6 * FROM [Satis Detaylari]
--Ilk 6-ya giren ID-leri cixartmaq isdesem 6ya giren ve 6-da daxil olmaqla
SELECT TOP 6 WITH TIES * FROM [Satis Detaylari] -- BIZE XETA VERIR KI NEYINE GORE with ties edey ona gore order by edeceyik
SELECT TOP 6 WITH TIES * FROM [Satis Detaylari] ORDER BY SatisID --BURDA ILK 6-IN CIXARDIR VE BAXIR ONUN ICINDE OLAN ID BASQA YERDEDE VARSA OLLARIDA CIXARDSIN ONA GORE O 10250 6-DA GORDUYUNUN TEKRARI 7 VE 8-DEDE VAR DIYE 8CEN CIXARDIR
--endregion
--End4

--Ders5
--region WITH emiri 
--WITH EMIRI BIZIM ISIMISIZI SAVE ETMEDIYIMIZ HALDA ISDIFADE EDIRIY 
--Esasen kompleks islerde islenilir meselen asaqidaki numunede biz 3qrupu innernen birlesdirmey isdeseydin on-dan sonraki yerde davamin yazmali idiq ama biz iseyse
--2ci selectden sonra yaza bileriy ve bu isleri anliq elemey isdesey isdifade olunur with ona gorede save olunmur yaddasda
WITH PesonelSatis(id,adi,soyadi,satisid)
AS
(
SELECT p.PersonelID,Adi,SoyAdi,SatisID FROM Personeller p INNER JOIN Satislar s on p.PersonelID= s.PersonelID
)
SELECT * FROM PesonelSatis ps INNER JOIN [Satis Detaylari] sd on ps.satisid=sd.SatisID
--endregion
--End5

--Ders6
--region Subquery(Ic ice sorqu)

SELECT * FROM Personeller p INNER JOIN Satislar s on p.PersonelID = s.PersonelID WHERE Adi='Nancy'
--bu yuxaridaki sorqunu biz indi  Subquery ile edeceyik eslinde INNER JOININ isleme mentiqi ile SUBQUERY-NIN ISLEME mentiqi eynidi
SELECT SatisID,SatisTarihi FROM Satislar WHERE PersonelID=(SELECT PersonelID FROM Personeller WHERE Adi='Nancy') 

SELECT Adi FROM Personeller WHERE Adi = (
SELECT Adi FROM Personeller WHERE UnvanEki = 'DR.')
--Bu iki Subquery srogularinda diqqet etmeli olduqumuz sey sorgunun icinde olan sorguda bir melumat gelmeli olduqudu
-- meselen bir yuxarida DR. yerine Ms. etsey xeta verecey cunki ordan coxlu sekilde Ms. olan melumat gelecey
--endregion
--End6

--Ders7
--region Bulk Insert
--Biz colden data add elemey isdiyiriy meseln bir txt fayl ile onun ucun Bulk Insert-den isdifade edmeliyik
--men oz yaratdiqim txt faylindan datalar arasi bir tab qeder bosluq qoyaraq yaratdim
BULK INSERT Kisiler
FROM 'C:\Users\tamsa1\OneDrive\Desktop\Kisiler.txt'
With
(
	Fieldterminator = '\t', -- columnlari ayirmaq ucundu men kloumnlar arasinda tab bosluq qoymusam burdaki qarsliqi \t-dir
	RowTerminator = '\n' -- \n bir setir asaqi demeydi
)

--endregion
--End7

--Ders8
--region Truncate Emiri
--Truncate ile Delete arasinda ki ferq delete datalari silir yenisin yaradanda bizde ID identiy-dise o qaldiqi siradan davam edir
--ama truncate ise identity-de sifirliyir
DELETE FROM TestPersonel

TRUNCATE TABLE TestPersonel
--endregion
--End8

--Ders9
--region @@IDENTITY
INSERT Kategoriler(KategoriAdi,Tanimi) VALUES('X','X KATEGORISI')
SELECT @@IDENTITY
--BIZIM ETDIYIMIZ EN AXRINCI INSERT ISINDE YARANAN IDENTITY DEYERINI BIZE QAYTARIR
--ESASEN ELE YUXARIDA YAZILAN BU IKISIN ARDICIL YAZILLAR KI INSEERT EDENDE NECENCI MEHSUL YARATA ID YARANDI
--endregion
--End9

--Ders10
--region Rorcount Emiri
--BIZIM isimiz ile bir yerde execute etmeliyik ki o default olan 1 deyerin yox hemin sorguda nece is gorulubse onun altindan sayin qaytarsin
--meselen delete edirem mem soyadli sexleri ve altindanda @@rowcount yazmisam bu o ikisin bir yerde excecute etsem nece mem elementi silinib onun ayin qaytarir ayri ayri etsem 1 qaytaracaq default deyeri 1di diey
INSERT Kategoriler(KategoriAdi,Tanimi) VALUES('X','X KATEGORISI')
SELECT @@ROWCOUNT

DELETE FROM Test2Personeller WHERE SoyAdi ='Mzem'
SELECT @@ROWCOUNT

SELECT*FROM Test2Personeller
SELECT @@ROWCOUNT
--endregion
--End10

--Ders11
--region Identity-e mudaxile etmey
--biz bele bir sey ede bileriy meselen idenditity x tabelinda yeni deyer insert etsey ID-ye 5 deyerin verecey ama biz isdiyiriy ki 105 den dava etsin onu ise
--asaqida ki sorqu ile edeceyik
DBCC Checkident(Personeller, reseed,10001) --sintaksisi beledi
--diqqet emeliyik biz identity deyerinden yuxari deyerle reseed etmeliyik 
-- umiyetce bunu isledmey meslehet deyil
--endregion
--End11

--Ders12
--region NULL DEYERI UZERINDE ISLER
SELECT MusteriAdi,Bolge FROM Musteriler
-- case - when - else -end ile Null uzerinde is
SELECT MusteriAdi,
CASE 
WHEN Bolge Is Null Then 'Bolge Bilinmir'
ELSE Bolge
END
FROM Musteriler
--Coalesce FUNKSIYA ILE NULL kontrolu
SELECT MusteriAdi,COALESCE(Bolge,'Bolge Bilinmir') FROM Musteriler
--IsNull FUNKSIYA ILE NULL kontrolu
SELECT MusteriAdi,IsNULL(Bolge,'Bolge Bilinmir') FROM Musteriler
--NullIf FUNKSIYA ILE NULL kontrolu
--digerlerinde hamisinda yoxluyur null-dusa Bolge bilnmir qaytar bunda birez ferqli isleyecey
-- biz NullIf-in daxiline 2 deyer daxil ediriy eger onlarin ikiside eynidise bize NULL qaytarir
SELECT NullIF(0,0)
--eger eyni deyilse birinci deyeri qaytarir
SELECT NullIF(10,5)

SELECT HedefStokDuzeyi FROM Urunler
SELECT AVG(HedefStokDuzeyi) FROM Urunler

--Hedef stoku 0 olmuyan urunler ortalamasi
--BURDA 43 OLMAQINDA SEBEB DEYERI 0 olanlari ortalamada sayadiq diye sayi azaldi ve ona gore deyer qalxdi
SELECT AVG(HedefStokDuzeyi) FROM Urunler WHERE HedefStokDuzeyi <> 0

SELECT AVG(NULLIF(HedefStokDuzeyi,0)) FROM Urunler

--endregion
--End12

--Ders13
--region T-SQL ile DataBase-de olan butun tabellari qaytarir
SELECT * FROM sys.tables
--ve ya
SELECT * FROM sysobjects WHERE xtype='U'
--endregion

--REGION T-SQL Bir Tablonun Primary Key Olup Olmadığını Kontrol Etme
SELECT OBJECTPROPERTY(OBJECT_ID('Urunler'),'TableHasPrimaryKey') --1 
--eger primary key varsa 1 yoxdusa 0 qaytarir
SELECT OBJECTPROPERTY(OBJECT_ID('Test2Personeller'),'TableHasPrimaryKey') -- 0
--endregion
--End13
--endregion.

--Region DDL GIRIS
--Ders1
--region CREATE,ALTER, DROP
--create yaratmaq ucun
--alter create olunmus bir seyi duzeltmeydi
--drop create olunmus bir seyi silmeydi
--endregion
--End1


--Ders2
--region CREATE
--DataBase
CREATE DataBase Senan
--default deyeri ile yaranir

CREATE DATABASE Senan1 -- bu  on palnda goreceyimiz addi databes- hissesinde
On
(
Name = 'OOsdsd', -- bu arxa planda esil adidi
Filename='C:\senan1sd23.mdf', -- bu adresidi
Size=5,--ilk yarananda ne qeder yer tutamsin isdiyirik di 5MB dediy
Filegrowth=3-- biz 5 mbni kecende nece mb artsin 3 artaaq 8 olacaq 8de kecse 11 olacaq bele ardicilliqla artacaq
)
--endregion
--End2

--Ders3
--region Create LOG fayli yaratmaq
CREATE DATABASE Senan1 -- bu  on palnda goreceyimiz addi databes- hissesinde
On
(
Name = 'OOsdsd', -- bu arxa planda esil adidi
Filename='C:\senan1sd23.mdf', -- bu adresidi
Size=10,--ilk yarananda ne qeder yer tutamsin isdiyirik di 5MB dediy
Filegrowth=3-- biz 5 mbni kecende nece mb artsin 3 artaaq 8 olacaq 8de kecse 11 olacaq bele ardicilliqla artacaq
)
log
On
(
Name = 'OOsdsd_LOG', -- bu arxa planda esil adidi
Filename='C:\senan1sd23.ldf', -- bu adresidi
Size=10,--ilk yarananda ne qeder yer tutamsin isdiyirik di 5MB dediy
Filegrowth=3-- biz 5 mbni kecende nece mb artsin 3 artaaq 8 olacaq 8de kecse 11 olacaq bele ardicilliqla artacaq
)
--endregion
--End2

--Ders3
--region CREATE TABLE YARATMAQ
USE Senan
CREATE TABLE SENANORNEYI
(
COLOM1 INT,
COLOM2 NVARCHAR(50),
COLOM3 MONEY,
)

CREATE TABLE [SENAN ORNEYI]
(
[COLOM 1] INT,
[COLOM 2] NVARCHAR(50),
[COLOM 3] MONEY,
)
--endregion
--End3

--Ders4
--region 55-) T-SQL DDL Create Komutu İle Tablonun Kolonuna Primary Key ve Identity Özellikleri Verme

CREATE TABLE ORNEY3
(
ID INT PRIMARY KEY IDENTITY(1,1),
COLOM2 NVARCHAR(50),
COLOM3 MONEY,
)

--endregion
--End4

--Ders5
--region T-SQL DDL Alter VE Drop Emiri
--DATABASE
ALTER DATABASE Senan
Modify File
(
Name='GGSA',
SIZE=20
)
--TABLE
ALTER TABLE ORNEY3
ADD COLUM4 NVARCHAR(MAX)
--Column Update
ALTER TABLE ORNEY3
ALTER COLUMN COLUM4 INT
-- Alter Komutu İle Tablodaki Kolonu Silme
ALTER TABLE ORNEY3
DROP COLUMN COLUM4 
--Alter Komutu İle Tabloya Constraint Ekleme
ALTER TABLE ORNEY3
ADD CONSTRAINT OrnekConstraint DEFAULT 'BOS' FOR COLOM2 
--Alter Komutu İle Tablodaki Constrainti Silme
ALTER TABLE ORNEY3
DROP CONSTRAINT OrnekConstraint 
-- T-SQL Sp_Rename Komutu İle Tablo Adını Değiştirme
SP_RENAME 'ORNEY3','ORNEY_YENI_ADI'
--T-SQL Sp_Rename Komutu İle Kolon İsmini Değiştirme
SP_RENAME 'ORNEY_YENI_ADI.COLOM3','COLUM_YENI_ADI','Column'
--endregion
--End5

--Ders6
--region DROP
DROP TABLE ORNEY_YENI_ADI
DROP DATABASE Senan --bunun icinde is gorursense silemmersen basqa database-de olanda sile bilersen
--endregion
--End6

--Ders7
--region Constraintler

--1 DEFAULT CONSTRAINT
--2 CHECK CONSTRAINT
--3 PRIMARY CONSTRAINT
--4 UNIQUE CONSTRAINT
--5 FOREIGN KEY CONSTRAINT

--endregion
--End7


--Ders8
--region DEFAULT Constraintler
CREATE TABLE ORNEY1
(
ID int primary key identity(1,1),
Kolon1 nvarchar(MAX),
Kolon2 int
)

ALTER TABLE ORNEY1
ADD CONSTRAINT KOLON1CONSTRAINT_DF DEFAULT 'BOS' FOR Kolon1

INSERT ORNEY1 (Kolon2) VALUES (1)
INSERT ORNEY1 (Kolon1,Kolon2) VALUES ('Senan',2)

SELECT * FROM ORNEY1
--endregion
--End8

--Ders9
--region CHECK Constraintler
ALTER TABLE ORNEY1
ADD CONSTRAINT ORNEY4_CK1 check (Kolon2 > 0)

INSERT ORNEY1 (Kolon2) VALUES (2) -- icaze verir
INSERT ORNEY1 (Kolon2) VALUES (-3) -- icaze vermir
--birde biz 1-den boyuk desey xeta lacihyiq evvelki qeydlerde 1 var diye problem yaradacaq
--eger biz kohneki deyerli gormezden gelib yeni deyerlere check etmey isdiyirkse 
Alter Table ORNEY1
WITH Nocheck ADD CONSTRAINT KOLON2_ck CHECK(Kolon2 > 2 )
SELECT * FROM ORNEY1

--endregion
--End9

--Ders10
--region PRIMARY Constraintler
ALTER TABLE ORNEY1
ADD CONSTRAINT PR_KEY PRIMARY KEY (ID)
--endregion
--End10

--Ders11
--region UNIQUE Constraintler

ALTER TABLE ORNEY1
ADD CONSTRAINT UNQIUE_PD UNIQUE (KOLON1)
--endregion
--End11
 
 
--Ders12
--region FOREIGN KEY Constraintler
CREATE TABLE TELEBE
(
ID INT PRIMARY KEY IDENTITY(1,1),
DERS_ID INT,
ADI NVARCHAR(MAX),
SOYAADI NVARCHAR(MAX),
)

CREATE TABLE DERSLER
(
ID INT PRIMARY KEY IDENTITY(1,1),
DERS_ADI NVARCHAR(MAX)
)
ALTER TABLE TELEBE
ADD CONSTRAINT TELEBE_FG FOREIGN KEY (DERS_ID) REFERENCES DERSLER(ID)
--CASCADE
ALTER TABLE TELEBE
ADD CONSTRAINT TELEBE_FG FOREIGN KEY (DERS_ID) REFERENCES DERSLER(ID)
ON DELETE CASCADE

ALTER TABLE TELEBE
ADD CONSTRAINT TELEBE_FG FOREIGN KEY (DERS_ID) REFERENCES DERSLER(ID)
ON UPDATE CASCADE
--ELAQELI TELEBENI SILSEY ONUN ICINDEKI DERSDE DERS TABELDA SILINECEY

--SET NULL
ALTER TABLE TELEBE
ADD CONSTRAINT TELEBE_FG FOREIGN KEY (DERS_ID) REFERENCES DERSLER(ID)
ON DELETE SET NULL

ALTER TABLE TELEBE
ADD CONSTRAINT TELEBE_FG FOREIGN KEY (DERS_ID) REFERENCES DERSLER(ID)
ON UPDATE SET NULL
--ELAQELI TELEBENI SILSEY ONUN ICINDEKI DERSDE DERS TABELDA NULL EDECEY

--SET DEFAULT
ALTER TABLE TELEBE
ADD CONSTRAINT TELEBE_DF DEFAULT 1 FOR DERS_ID

ALTER TABLE TELEBE
ADD CONSTRAINT TELEBE_FG FOREIGN KEY (DERS_ID) REFERENCES DERSLER(ID)
ON DELETE SET DEFAULT

ALTER TABLE TELEBE
ADD CONSTRAINT TELEBE_FG FOREIGN KEY (DERS_ID) REFERENCES DERSLER(ID)
ON UPDATE SET DEFAULT
--ELAQELI TELEBENI SILSEY ONUN ICINDEKI DERSDE DERS TABELINDA KI DERS_ID DERS_IDNIN DEFAULT DEYERINI VERECEY 

--endregion
--End12

--Ders13
--region DESIGENLER
declare @x int
declare @y nvarchar
declare @z money
--ve ya
declare @x int, @z nvarchar, @y bit
-------------------------------------------
declare @Yas int = 17
--BURDA set ve yaratmani ikisin bir yerde isledmeliyik ki isdesin
declare @x int
-- SET
SET @x = 125


DECLARE @tarih datetime
set @tarih = GETDATE()

--Oxumaq --3 setiri bir yerde isledmeliyik
declare @x int
SET @x = 125
SELECT @x
--ve ya
declare @x int
SET @x = 125
print @x
--Sorgudan gelen deyeri deyere vermey
declare @adi nvarchar(MAX),@soyadi nvarchar(MAX)
Select @adi=Adi,@soyadi =SoyAdi from Personeller
SELECT @adi,@soyadi
--endregion
--End13

--Ders14
--region GO emiri
--IKI ISDEDE HAMISIN ISE SALSAN GO OLANLR ISDIYECEY HEM OXUNARLIQI ARTIRI HEMDE EXECUTE ETDIYIN BIRDEN COX SORQUNU AYIRIR
CREATE DATABASE ORNEK_IS
USE ORNEK_IS
CREATE TABLE ORNEKTABLE
(
ID INT PRIMARY KEY IDENTITY(1,1),
KOLON1 NVARCHAR(MAX),
KOLON2 NVARCHAR(MAX)
)
--
CREATE DATABASE ORNEK_IS
GO
USE ORNEK_IS
GO
CREATE TABLE ORNEKTABLE
(
ID INT PRIMARY KEY IDENTITY(1,1),
KOLON1 NVARCHAR(MAX),
KOLON2 NVARCHAR(MAX)
)
--endregion
--End14

--Ders15
--region IF ELSE
-- = - BERABEDIRSE
-- <> - BERABE DEYILSE
-- < - KICIKDIRSE
-- > BOYUYDURSE

-- BIR SETIRLIY IS
DECLARE @Isin nvarchar(MAX)
SET @Isin='Senan'
if @Isin = 'Senan'
  print 'Beli'
else 
  print 'Xeyir'
-- Cox Setirli BEGIN END(SCOPE)
DECLARE @SAY1 INT = 3
DECLARE @SAY2 INT = 5
IF @SAY1 < @SAY2
BEGIN
PRINT 'Beli'
SELECT @SAY1 [Say 1], @SAY2 [Say 2]
end
else 
BEGIN
PRINT 'Xeyir'
SELECT @SAY1 [Say 1], @SAY2 [Say 2]
end
--Musderiler tabelinda USA musdesi var?
SELECT * FROM Musteriler WHERE Ulke = 'USA'

IF @@ROWCOUNT>0
 PRINT 'BELI'
ELSE
 PRINT 'XEYIR'
-- Adi Senan Soyadi Senan olan personel var? varsa bei yoxdusa qeyd et
Declare @adi nvarchar(max)='Senan',@soyadi nvarchar(max) ='1Mem'

SELECT * FROM Personeller WHERE Adi=@adi AND SoyAdi =@soyadi
IF @@ROWCOUNT > 0
PRINT 'Beli var'
ELSE
BEGIN 
PRINT 'XEYIR YOXDU'
INSERT Personeller(Adi,SoyAdi) values (@adi,@soyadi)
END
--endregion
--End15

--Ders16
--region IF - ELSE IF - ELSE
DECLARE @adi NVARCHAR(MAX) = 'Senan'
DECLARE @yas INT = 25

IF @adi = 'Senan'
print 'He de he'
ELSE IF @yas > 24
print 'Beli de beli'
ELSE IF @yas=20
PRINT 'ASDADASD'
ELSE 
PRINT 'ABC'
--endregion
--End16

--Ders17 
--region T-SQL Exists Fonksiyonu
-- verilen tabel doludusa tru deyilse false verecey
SELECT * FROM Personeller

if Exists(SELECT * FROM Personeller)
print 'Dolu'
else 
print 'Bos'
--endregion
--End17

--Ders18
--region T-SQL While Döngüsü
DECLARE @Sayac INT = 0
WHILE @Sayac <100
BEGIN 
PRINT @Sayac
Set @Sayac= @Sayac+1
END
--Break Komutu
DECLARE @Sayac INT = 0
WHILE @Sayac <100
BEGIN 
PRINT @Sayac
Set @Sayac= @Sayac+1
if @Sayac>50
   break
END
--T-SQL Continue Komutu
--cut ededleri cixardiq
DECLARE @Sayac INT = 0
WHILE @Sayac <100
BEGIN 
Set @Sayac= @Sayac+1
if @Sayac%2=1
   continue
PRINT @Sayac
END
--endregion
--End18

--Ders19
--region T-SQL Geçici Tablolar
--databesa-de muveqqeti olaraq yaranit ve test merhelesi kimi isdediriy
--Bir tabeli fiziki olaraq koypalayiriq
SELECT * INTO GeciciPersoneller from Personeller
--Primary ve forenkey elave olunuyub ama qalan her sey kopyalanib

--Bir Tabloyu # İfadesi İle Belleğe Geçici Olarak Kopyalama
SELECT * INTO #GeciciPersoneller from Personeller
--Bu kecici tabelda nese bir sey deyisdirdiyde nese bir sey etdiyde database yazilmiyacaq server baglandiqda yada kompu sondurduyden sonra yeniden database giris edende gorsenmeyecey
--ve tabellar bolmesinde gorsenmeyecey # isaresin yazsaq aftomatik size gorsedecey ve sizin ram-vizda qeyd edir
SELECT * from #GeciciPersoneller 
INSERT #GeciciPersoneller(Adi,SoyAdi) VALUES ('Senan','Mem')
Delete from #GeciciPersoneller where PersonelID = 3
UPDATE #GeciciPersoneller SET Adi = 'Senan', Soyadi = 'Mem' WHERE PersonelID=5

--Bir Tabloyu ## İfadesi İle Belleğe Geçici Olarak Kopyalama
SELECT * INTO ##GeciciPersoneller from Personeller

SELECT * from ##GeciciPersoneller 
INSERT ##GeciciPersoneller(Adi,SoyAdi) VALUES ('Senan','Mem')
Delete from ##GeciciPersoneller where PersonelID = 3
UPDATE ##GeciciPersoneller SET Adi = 'Senan', Soyadi = 'Mem' WHERE PersonelID=5

-- bU TABEL-I OTURUM ACAN sexs  onun  serverine qosulan diger sesde bunu islede biler ama #  ile bu mumkun deyil
--Qalan butun isleri eynidi ve serveri acan sexs baqladiqi anda ## tabe silinecey #-de olduqu kimi

--endregion
--End19

--Ders20
--region T-SQL Uniqueidentifier Deyisen tipi
CREATE TABLE NUMUNE1
(
id int primary key identity(1,1),
Kolon1 nvarchar(MAX),
Kolon2 nvarchar(Max),
Kolon3 uniqueidentifier
)
SELECT NEWID() -- TEKRARLANMIYAN REQEMLER HERIFLER VE SIMVOLDAN IBARET BIRLESME VERIR
-- NEWID saglanildiqi tipde uniqueidentifier-dir
--numune  bir insan bir siteme daxil olduqu zaman gmail tesdiqlenmesi lazim olanda ona link verilir o link bu tipde verilir ki sirf ona ozel olur o linke o adam daxil olanda sonra yoxlanis olur o link bu dataya uygundusa aktiv olsun(basqa yerlerdede isdifade oluna bilir)
INSERT NUMUNE1 VALUES('X','Y', NEWID())
SELECT * FROM NUMUNE1
--endregion
--End20

--Ders21
--region T-SQL View  isdifadesi
--umumi biz kompleks qarisiq sorqular yaradiriq biz bunu tek bir sorquya cevirib rahat sekilde isllede bileriy
--ve guvenliy sohbeti biz oz sirgularimizi 2-ci 3-cu sexlerden gizledib ama ollarin isledmeyine icaze vermey ucun bu sekilde islede bilersiz
USE Northwind
-- YARADIQIMIZ VIEWLAR YAZDIQIMIZ DATABASE-DE VIEWS FOLDERININ DAXILINDE SAQLANILIR
CREATE VIEW VW_GOTUR
AS
SELECT p.Adi + ' ' + p.SoyAdi [Adi Soyadi], k.KategoriAdi [Kategori Adi], COUNT(s.SatisID) [Toplam Satis] FROM Personeller p INNER JOIN Satislar s on p.PersonelID = s.PersonelID
			Inner JOIN [Satis Detaylari] sd on s.SatisID = sd.SatisID
			Inner JOIN Urunler u on sd.UrunID=u.UrunID
			Inner Join Kategoriler k on k.KategoriID = u.KategoriID
			Group By p.Adi + ' ' + p.Soyadi, k.KategoriAdi

SELECT * FROM VW_GOTUR 
SELECT * FROM VW_GOTUR WHERE [Adi Soyadi] Like '%Robert%'
SELECT * FROM VW_GOTUR order by [Toplam Satis]
--view-un daxilinde order by islde bilmeriy amma top emiri ile birge isledile biler
CREATE VIEW VW_GOTUR2
AS
SELECT TOP 100 p.Adi + ' ' + p.SoyAdi [Adi Soyadi], k.KategoriAdi [Kategori Adi], COUNT(s.SatisID) [Toplam Satis] FROM Personeller p INNER JOIN Satislar s on p.PersonelID = s.PersonelID
			Inner JOIN [Satis Detaylari] sd on s.SatisID = sd.SatisID
			Inner JOIN Urunler u on sd.UrunID=u.UrunID
			Inner Join Kategoriler k on k.KategoriID = u.KategoriID
			Group By p.Adi + ' ' + p.Soyadi, k.KategoriAdi
			order By  [Toplam Satis]
-- BU SEKILDE ORDER BY-I DAXILINDE ISLEDMEYI MESLEHET GORULMUR
SELECT * FROM VW_GOTUR2 

CREATE VIEW VW_PERSONELLER
AS
SELECT Adi,SoyAdi,Unvan FROM Personeller

INSERT VW_PERSONELLER VALUES ('Senan' , 'SENAN','Software Developer')
UPDATE VW_PERSONELLER Set Unvan='Bunu oxuyan gotdu'
Delete from VW_PERSONELLER WHERE Unvan='Bunu oxuyan gotdu' and Adi='Senan'
--bizim bele ne is  is gorsey o view-un goturduyu tabelin ozunede tesir edir

--endregion
--End21

--Ders22
--region View - With Encryption emiri
--bu onun ucundur ki biz views folder-ne gedib onun designan hissesinden onun daxilin gormuyek
CREATE VIEW VW_NUMUNE
WITH ENCRYPTION
AS
SELECT Adi,SoyAdi,Unvan FROM Personeller
--BU ISLEM EDILDIYDEN SONRA DESIGN HISSESI BAGLANACAQ
--VE BUNDAN SONRA BUNUN DESIGNEN NE BUNU YAZAN NEDE BASQASI GORE BILMIYECEY BIRDE
--endregion

--region View - With Schemabinding emiri
CREATE TABLE NUMUNE2
(
id int primary key identity(1,1),
Kolon1 nvarchar(MAX),
)
CREATE VIEW NUMUNE_VW
WITH SCHEMABINDING
AS
SELECT id,Kolon1 FROM dbo.NUMUNE2 --DBO DATABASE OWNER BIR SEMA-DIR C# NAMESPACE KIMI
ALTER TABLE NUMUNE2 
ALTER COLUMN KOLON1 INT
--BIZ WITH SCHEMABINDING OLDUQU UCUN BUNU SILMEYE ICAZE VERMIR BIZ ONU YAZMASAYDIQ O SILECEYDI VE BEZIL HALLARDA VIEW-U ISDEDMEY ISDESEYDIK XETALAR VERECEYDI
--endregion
--region View - CHECK OPTION emiri
CREATE VIEW NUMUNE_VW4
AS
SELECT ADI,SoyAdi FROM Personeller  WHERE aDI lIKE 'A%'

INSERT NUMUNE_VW4 VALUES('Amin','Easd')
INSERT NUMUNE_VW4 VALUES('BSmin','Aasd') -- BU ISE DUSSEDE AMA INSERT ETMIR BUNUN QARSIN ALMAQ UCUN
SELECT * FROM NUMUNE_VW4

CREATE VIEW NUMUNE_VW5
AS
SELECT ADI,SoyAdi FROM Personeller  WHERE aDI lIKE 'A%'
WITH CHECK OPTION 

INSERT NUMUNE_VW5 VALUES('Amin','Easd')
INSERT NUMUNE_VW5 VALUES('BSmin','Aasd') -- INDI ISE XETA BILDIRECEY

SELECT * FROM NUMUNE_VW5
--endregion

--End22

--Ders23
--region T-SQL FUNKSIYALARA GIRIS
--1. SCALAR FUNCTION - RETURN DATA QAYTARIR 
--2. INLINE FUNCTION - RETURN TABEL QAYTARIR

--IKISIDE CREATE ILE  YARADILIR VE DATABASE-DE SAXLANILIR
-- YERLESDIYI YER pROGRAMMABILITY FOLDERINDEKI FUNCTIONS-UN DAXILINDEDI

--region SCALAR
CREATE FUNCTION SUM(@NUM1 int,@NUM2 int)RETURNS INT
AS 
	BEGIN
	  return @NUM1 + @NUM2
	END
--BIZ QUERY-DEN CIXANDAN SONRA FUNSIANIN KODUNA TEZDEN BAXMAQ ISDESEY FLDERDEN HEMIN FUNKSIYANIN UZERINE GELIB SAG DUYMEYNEN BASIB MODIFYEDEN GORE BILERIY

--FUNKSIYANI ISLEDMEY
SELECT dbo.SUM(2,5)
PRINT dbo.SUM(2,5)

CREATE FUNCTION UmumiXerci(@BirimFiyati int, @StokMiktari int)Returns nvarchar(MAX)
AS
	BEGIN
	DECLARE @Netice int = @BirimFiyati * @StokMiktari * 1.18
	return @Netice
	END

SELECT dbo.UmumiXerci(10,20)
--endregion

--region Inline  isledilen vaxt Begin End isledile bilmez
CREATE FUNCTION fc_Gonder(@Ad nvarchar(20), @Soyad nvarchar(20)) Returns Table
AS
	return Select Adi, Soyadi from Personeller WHERE Adi=@Ad and SoyAdi = @Soyad
--Funksiyani isledmey
SELECT * FROM dbo.fc_Gonder ('Nancy', 'Davolio')

--endregion

--Funksiyalarda With Encryption isledmey 
--Kecdiyimiz kodumuzu gizledmey ve diqet yetrey hec kim kodu goremir bu kodu yazan sexsin ozude gormur

CREATE FUNCTION FUNK1()RETURNS INT
WITH ENCRYPTION
AS 
	BEGIN
	  return 3
	END

CREATE FUNCTION FUNK2()RETURNS Table
WITH ENCRYPTION
AS 
	  return SELECT * FROM Personeller

--endregion

--region Otomatik Hesaplanabilir Kolonlar
CREATE FUNCTION SUM(@NUM1 int,@NUM2 int)RETURNS INT
AS 
	BEGIN
	  return @NUM1 + @NUM2
	END

SELECT UrunAdi,dbo.Sum(BirimFiyati,HedefStokDuzeyi) FROM URUNLER
------
CREATE FUNCTION RAPOR(@Kategori nvarchar(MAX),@UrunAdi nvarchar(MAX), @BirimFiyati int, @Stok int) Returns nvarchar(MAX)
AS
	Begin
	   Declare @Cikti nvarchar(MAX) = @Kategori + ' kategorisindeki ' + @UrunAdi + ' urununun toplam fiyati : ' + CAST(@BirimFiyati * @Stok As nvarchar(MAX)) + ' dir. '
	   return @Cikti
	End
-------
SELECT dbo.RAPOR(k.KategoriAdi,u.UrunAdi,u.BirimFiyati,u.HedefStokDuzeyi)  FROM Urunler u INNER JOIN Kategoriler k on u.KategoriID=u.KategoriID
--endregion

--End23

--Ders24
--region Stored Procedures
--Adi sorgulardan daha suretli isliyir 
--Cunki normal sorguda Execute edilen zaman 'Execute Plan' islemi icra olunur. Bu islem sirasinda hansi tabeldan hansi columna gelecek ve.s kimi islemler edilir.Bir sorgu her islendiyinden bu ilseri tekrarliyir ama sorgu Stored Procedure olaraq isledilse bu ilsem sadece bir defe edilir ve o da ilk isledilme sirasinda. Diger calistirmalarda bi isem tekrar edmir.Buna gorede suret ve performans artisi olunur.

--Icerisinde Select, Inset,Update ve Delete islemleri edilir
-- ice ice islene biler
-- icerisinde funskiya yarada biliriy
-- Sorgularimizi colden alacqi deyerle pametre olaraq Stored Proceurelere gecirilebildine gore, sorgularimiz 'SQL injectionn' yemelerinin qarsin alir,buna gorede daha guvenilirdir
--Store Procedur fiziksel bir database obyektidir, buna gorede create emiri ile yaranar
--Fiziksel olaraq database-de 'Progammability' -> 'Stored Procedures' kombinasyasinda yerlesir 

--Prototip-i
--Create Proc ya da Procedure [Adi]
--(
--parametirler
--)AS
--YAZILACAQ Sorqular,Kodlar,Sertler,Funksiyalar,Emirler
CREATE Proc sp_Numune -- moterze isledmeseyde ola ama oxunarliqa gore islediriy
(
@id int
)AS
Select * From Personeller Where PersonelID = @id
--isleme prinsibi Exec yaziriq adin yaziriq sonra alacaqi paramtri yaziriq
Exec sp_Numune 3
--Deyer qaytaran SP  yaradaq
CREATE Proc sp_Numune1
(
@Fiyat Money
)AS
Select * From Urunler WHERE BirimFiyati > @Fiyat
Return @@ROWCOUNT

Exec sp_Numune1 40 -- bunu bele ise salanda bize returunu yox icindeki sorqunu ancaq qaytarir

Declare @Netice int --  bu setirde deyisen yaradiriq ki returunden geleni goturey
Exec @Netice = sp_Numune1 40 -- bu setire esasen sorqunu qaytarir ve Netice-ye returunu menimsedir
print CAST(@Netice AS NVARCHAR(MAX)) + ' ADET URUN BU ISLEMDEN ETKILENMISDIR' -- bu setire esasen return deyerini menimsediyimiz deyiseni qaytarir
-- Output ile deyer qaytaran SP yaradq
CREATE Proc sp_Numune2
(
@id Int,
@Adi Nvarchar(max) Output,
@SoyAdi Nvarchar(max) Output
)AS
Select @Adi =Adi, @SoyAdi = SoyAdi FROM Personeller WHERE PersonelID = @id
--Biz burda xaricden ID alaciyiq ve o ID esasinda bize AD ve Soyad qaytaracaq

DECLARE @Adi nvarchar(MAX),@Soyadi NVARCHAR(MAX)
Exec sp_Numune2 3,@Adi Output,@SoyAdi Output
Select @Adi + ' ' + @SoyAdi
--Numunde :
CREATE Proc sp_Numune3
(
@Adi Nvarchar(max) Output,
@SoyAdi Nvarchar(max) Output,
@Sehir Nvarchar(max) Output
)AS
INSERT Personeller(Adi,Soyadi,Sehir) Values(@Adi,@SoyAdi,@Sehir)

Exec sp_Numune3 'Senan', 'Senan', 'Senan'
SELECT * FROM Personeller

CREATE Proc sp_Numune4
(
@Adi Nvarchar(50)='Adsiz',
@SoyAdi Nvarchar(50)='Soyadsiz',
@Sehir Nvarchar(50)='Seher girilmiyib'
)AS
INSERT Personeller(Adi,Soyadi,Sehir) Values(@Adi,@SoyAdi,@Sehir)

Exec sp_Numune4 'Senan', 'Senan', 'Senan' -- bele olanda daxilindeki deyerler yox bu deyerler daxil olur eger men her hansinsa yazmasam onda default deyeri qeyd olunacaq
Exec sp_Numune4 -- daxilinde ki default deyerler yazilacaq onda
Exec sp_Numune4 'Senan' -- ancaq adi senan olacaq qalani default
Exec sp_Numune4 'Senan', 'Senan' -- ancaq seher default olacaq qalani senan

--SP daxilinde tabel yaratmaq
CREATE PROC sp_TabelYarad
(
@TabelAdi NVARCHAR(MAX),
@ColumAdi NVARCHAR(MAX),
@ColumunOzelliyi NVARCHAR(MAX),
@Colum2Adi NVARCHAR(MAX),
@Colum2ninOzelliyi NVARCHAR(MAX)
)AS
EXEC
('
CREATE TABLE ' + @TabelAdi + '
(
 ' + @ColumAdi + ' ' + @ColumunOzelliyi + ',
  ' + @Colum2Adi + ' ' + @Colum2ninOzelliyi + '
)
')
EXEC sp_TabelYarad 'NumuneTabel1','Id', 'INT Primary Key Identity(1, 1)', 'Colomn2', 'NVARCHAR(MAX)'
--endregion
--End24

--Ders25
--region Exec emiri
--T-SQL PROQRAMLA DILINDE KI HER SEYI ISE SALIR
EXEC('Select * From Personeller') 
SELECT * FROM Personeller -- bizim bele yazib Execute-deye basmmaqimiz bu yuxarida ki setirdekiynen eyni isi gorur

--Xetali islem (2setiri 2sin isledseyde xetali olacaq
Exec('Declare @Num int =0')
Exec('Print @Num')
--Duzgun hali
Exec('Declare @Num int =0 Print @Num')
--endregion
--End25

--Trigerler-e giris
--Ders1
--DML TRIGERLER
--Bir tabelda Insert,Update ve Delete islemleri edildiyinde basqa bir islemi ise  sala bilen tetikleyicidir
--DDL TRIGERLER
--Bir tabelda CREATE,ALTER ve DROP islemleri edildiyinde basqa bir islemi ise  sala bilen tetikleyicidir
--endregion
--End1

--Ders2
--region  T-SQL DML Triggerlar - Inserted ve Deleted Tabellari

--Insert Tabeli
--Eger bir tabelda Insert isini icra edirikse o arxa planla isini evvelce Ram-da yaradilan inseter adli tabelin uzerinde yaradilir, eger islemde bir problem yoxdusa inserted tabelinda ki verilenleri fiziksel olaraq tabela insert edir.Is sona catdiqdan sonra Ram-da yaranan bu insert tabeli silinir

--Delete Tabeli
--Eger bir tabelda Delete isini icra edirikse o arxa planla isini evvelce Ram-da yaradilan Delete adli tabelin uzerinde yaradilir, eger islemde bir problem yoxdusa Delete tabelinda ki verilenleri fiziksel olaraq tabeldan delete edir.Is sona catdiqdan sonra Ram-da yaranan bu Delete tabeli silinir
--Bu iki tabel bize elcatandi ama isi bitmeden ve ise basdayandan sonra cunki o araliqda yaranir ve sona catir biz ona gore is geden vaxti isimizi gormeliyik
--Eger bir tabel-da update isi gorulerse arxa planda update tabel-i yaranmaz!!!
--Cunki update-in mentiqi birinci silmey sonra yenisin yuklemeydi yeni delete edir sonra insert edir
--Rmada arxa palnda delete yaranir sonra o isin qutarir isnert yaranir ve ikiside eyni vaxta yaranmir beleliyle isimiz bitir

--QEYD: Update eddiymiz vaxt yaranan islemde orjinal datamiz deletde olur cunki biz delete edende orjinali delete tabel-da gonderib sonra siliriy, Yeni data ise insertit tabel-inda olur
--Delete ve inserted tabelinda,isimizi gorduyumuz tabelin columlari necedirse bu tabellarin columlarida ele olur ve buna gorede select-id sorgusu vere biliriy
--endregion
--End2


--Ders3
--region  T-SQL Trigger Tanımlama
--CREATE TRIGGER [TRIGERIN ADI]
--ON [TABEL NAME]
--AFTER VE YA FOR DELETE,UPDATE,INSERT
--Numune 1
CREATE TRIGGER TRIGGER_Numune
on Personeller
after insert
as
Select * From Personeller
--Biz indi triggerimizi yaratdiq
Insert Personeller(Adi,Soyadi) Values('Trigger', 'Trigerovic')
--bu yuxarida isi execute etsey hem insert hemde selec edir iki si birden gorur
--Numune 2
--Mis: Tedarikciler tabel-inda bir data silindignde butun mehsullarin qiymetin otomatik olaraq 10 artsin
CREATE TRIGGER Trigger_Numune1
on Tedarikciler
after delete
AS
UPDATE Urunler set BirimFiyati=BirimFiyati * 10
Select * From Urunler

Delete from Tedarikciler where TedarikciID = 31 -- hem delete isin gorduy hem update etdiy hemde select isin gorduy

CREATE TRIGGER Trigger_Numune2
on Tedarikciler
for update
AS
Insert Kategoriler(KategoriAdi) Values('Meyve Kokteyli')

Update Tedarikciler SET MusteriAdi = 'Hilmi' Where TedarikciID =29
Select * From Kategoriler

--Numune 3
-- Personeller tabelinda bir data silindiyinde silinen datanin adi,soyadi, kim terefinden ve hansi tarixde silindiyi basqa bir tabel-da qeyd edilsin. Bir nov log tabeli meseli

Create Table LogTabel
(
Id int primary key identity(1,1),
Rapor nvarchar(MAX)
)

Create Trigger triggerPersoneller
on Personeller
after delete
AS
Declare @Adi nvarchar(MAX), @SoyAdi NVARCHAR(MAX)
Select @Adi=Adi,@SoyAdi=SoyAdi from deleted
Insert LogTabel(Rapor) Values ('Adi ve Soyadi ' + @Adi + '  ' + @SoyAdi + ' olan personel ' + SUSER_SNAME() + ' tarafindan ' + CAST(GETDATE() AS nvarchar(MAX)) + ' TARIHINDE SILINMISDIR.')
--from deleted-deki deleted delete isini goren zaman ramda yaranan tabel-di biz onu oraz yazanda o bizdi yoxmus kimi gorsenecey ama ise salanda yaranacaq SUESER NAME-DE BIZIM O ANKI SERVERIN ADIDI
DELETE FROM Personeller where PersonelID =14
SELECT * FROM Personeller

--Numun 4 
-- Personeller tabelda update islendiyi anda devreye giren ve bir log tablosuna 'Adi ... olan personel ... yeni adiyla degistirilerek ... kulanici tarafindan ... tarihinde guncellendi kalibinda rapor yazan triggeri yazalim
CREATE TRIGGER trgPersonellerRapor
on Personeller
after update
as 
Declare @EskiAdi nvarchar(MAX), @YeniSoyAdi NVARCHAR(MAX)
Select @EskiAdi=Adi from deleted
Select @YeniSoyAdi=Adi from inserted
Insert LogTabel(Rapor) Values ('Adi  ' + @EskiAdi  + ' olan personel ' + @YeniSoyAdi + ' yeni adiyla deyisdirildi ' + SUSER_SNAME() + ' kullanicisi tarafindan ' + CAST(GETDATE() AS nvarchar(MAX)) + ' TARIHINDE SILINMISDIR.')

UPDATE Personeller Set Adi = 'Senan' where PersonelID=3
SELECT * FROM LogTabel

-- T-SQL Multiple Actions Trigger
--Yuxarida yazdiqimiz numunelerde bir actions bas verirdi, bir necesi olanda multiple actions olur

CREATE TRIGGER MultiTrigger
on Personeller
after delete, insert
as
print 'Merhaba'

Insert Personeller(Adi,Soyadi) Values('Senan','Memmedov')
Delete from Personeller  where PersonelID=12

--T-SQL Instead Of Triggerlar
--biz bu vaxta qeder yartdiqmiz triggerde bu isin yaninda bu isi gor idi indi ise bu isin yerine bu isi gor deyeceyik
-- sintaksisi eynidi tef ferqi after for-un yerine instead of yazacayiq

--Personeller tabelinda update islendiyin anda edilecek gunceleme yerine bir log tabelina 'Adi .. olan personel .. yeni adiyla deyisdirlerek ... kulanici tarafindan .. tarihinde guncellenmek istendi . ' kalibinda rapor yazan trigger yyardaq

CREATE TRIGGER trgPersonellerRaporInstead
on Personeller
instead of update
as 
Declare @EskiAdi nvarchar(MAX), @YeniSoyAdi NVARCHAR(MAX)
Select @EskiAdi=Adi from deleted
Select @YeniSoyAdi=Adi from inserted
Insert LogTabel(Rapor) Values ('Adi  ' + @EskiAdi  + ' olan personel ' + @YeniSoyAdi + ' yeni adiyla deyisdirildi ' + SUSER_SNAME() + ' kullanicisi tarafindan ' + CAST(GETDATE() AS nvarchar(MAX)) + ' TARIHINDE SILINMISDIR.')


UPDATE Personeller Set Adi = 'Senan' where PersonelID=1

Select * from Personeller
SELECT * FROM LogTabel

--endregion
--End3



--Ders4
--region DDL Triggerler
Create Trigger DDl_Trigger
On DATABASE
FOR drop_table,alter_table,create_function,create_procedure,drop_procedure -- vs. vs...
as
print 'Bu islem gercekletirilmez.'
Rollback --rollback bizim etdiyimiz isi geri alir

Drop Table LogTabel
--endregion
--End4

--Ders5
--region T-SQL Trigger Disable - Enable
--Disable
Disable Trigger trgPersonellerRaporInstead ON Personeller
--Enable
Enable Trigger trgPersonellerRaporInstead ON Personeller 
--endregion
--End5


--Ders1
--region Transaction
 -- Biirden cox isi bir yerde etdiyimiz vezyetlerde eger parcani yaradan islemlerden her hansisa birinde problem yaranarsa butun isleri dayandirir evvelki halinda saxliyir

 --Meselen : Kredi karti ile  alis veris islerinde transaction islemi vardir. Siz marketten mehsul alarken sizin hesabinizdan pul dusulecek,marketin hesabina pul elave olunacaq. Bu islemde xeta olmamasi lazimdi ve buna gore bu islemde bir transaction bloqundan gerceklesdirilir. Bu esnada her hansi bir problemler olarsa butun islemler transaction terefinden legv edilecktir.

 -- Begin tran veya begin transaction : Transactio islemini baslatir.

 --Commit tran : transaction islemini basariyla sonlandiri.Islemleri gerceklesdirir.
 --Roolback Tran : Transaction islemini legv edir. Islemleri geri alir

 -- Comit tran yerine sadece commit yazilabilir
 --Rollback tran yerine sadece rollback yazila biler

 --Normalda default olaraq her sey Begin Tran ile baslayib, Commit Tran ile biter. !!! Biz bunlari isledmesey bele arxada isleyir.
 --Protataypi
 
 -- Begin Tran [Trancation Adi]
 --Islemleri

 Insert Bolge Values(5,'Sumqayit') -- varsayilan transactiob kontroller bir islemdir.Netice olaraq yene varsayilan olaraq Commit tran olaraq bitirmektedir
 --asqida ki le yuxarida ki eyni netice eyni isdi
 Begin Tran Control1
 Insert Bolge Values(6,'Sumqayit')
 Commit Tran
 
 --Tracntion-a ad vermeseyde olar
 Begin Tran 
 Insert Bolge Values(7,'Sumqayit')
 Commit Tran

 --Numune
 Begin Tran Control2
 Declare @i int
 Delete from Personeller Where PersonelID > 20
 Set @i = @@ROWCOUNT
 IF @i=1
 Begin 
	print 'Kayit silindi.'
	Commit
	--ya da Commit Tran
END
ELSE 
BEGIN
	PRINT 'Islemler geri alindi.'
	Rollback
	-- ya da Rollback Tran
END

--Boyuk Numune
--Iki edet bank tabel-i yaradaciyiq. Banklar arasi kocurme islemi edeciyik ve bu ilsemleri ederken transaction isledeceyik
Create DataBase BankaDb
GO
USE BankaDb
GO
CREATE TABLE ABanka
(
HesabNo int,
Balans money
)
GO
CREATE TABLE BBanka
(
HesabNo int,
Balans money
)
GO 
Insert ABanka VALUES (10,1000),
			         (20,2500)
Insert BBanka VALUES(30,2300),
			        (40,760)
GO 
Create Proc sp_Kocurme
(
@BankaKimden nvarchar(max),
@GonderenHesabNo int,
@AlanHesabNo int,
@Miqdar money
)AS
Begin Transaction [Control]
Declare @ABalans int, @BBalans int,@BalansdakiPul money
if @BankaKimden = 'ABanka'
Begin
	Select @BalansdakiPul = Balans from ABanka where HesabNo = @GonderenHesabNo
	if @Miqdar > @BalansdakiPul
	Begin
	  print CAST(@GonderenHesabNo as nvarchar(MAX)) + ' numarali hesab, gonderilme istenen miqdardan az pul movcuddur'
	  Rollback Tran -- islemleri geri al
	  END
	 ELSE
	 BEGIN
	 Update ABanka set Balans = Balans - @Miqdar WHERE HesabNo = @GonderenHesabNo
	 Update BBanka set Balans = Balans + @Miqdar WHERE HesabNo = @AlanHesabNo
	 PRINT 'ABankindaki ' + CAST(@GonderenHesabNo AS NVARCHAR(MAX)) + ' nomreli hesabdan BBankindaki ' + CAST(@AlanHesabNo AS NVARCHAR(MAX)) + ' nomreli hesaba ' + CAST(@Miqdar as nvarchar(MAX)) + ' deyerinde pul kcourmesi edilmisdir'
	 Commit Tran
	 END
END
ELSE
Begin
	Select @BalansdakiPul = Balans from BBanka where HesabNo = @GonderenHesabNo
	if @Miqdar > @BalansdakiPul
	Begin
	  print CAST(@GonderenHesabNo as nvarchar(MAX)) + ' numarali hesab, gonderilme istenen miqdardan az pul movcuddur'
	  Rollback Tran -- islemleri geri al
	  END
	 ELSE
	 BEGIN
	 Update BBanka set Balans = Balans - @Miqdar WHERE HesabNo = @GonderenHesabNo
	 Update ABanka set Balans = Balans + @Miqdar WHERE HesabNo = @AlanHesabNo
	 PRINT 'ABankindaki ' + CAST(@GonderenHesabNo AS NVARCHAR(MAX)) + ' nomreli hesabdan BBankindaki ' + CAST(@AlanHesabNo AS NVARCHAR(MAX)) + ' nomreli hesaba ' + CAST(@Miqdar as nvarchar(MAX)) + ' deyerinde pul kcourmesi edilmisdir'
	 Commit Tran
	 END
END

Exec sp_Kocurme  'ABanka',10,30,100
Exec sp_Kocurme  'BBanka',30,10,300
Exec sp_Kocurme  'ABanka',20,40,5000

--endregion
--End1

--Ders2
--region  T-SQL SQL Server Database Yedeğini Alma ve Yükleme - Backup ve Restore
--Backup ile kopyasin Alma
-- Restore ile Kopyasin yukleme
--Backup : Lazim olan database uzerine gelib mausun sag duymesin click edib tasks bolmesinden backup-i secib click ediriy yeni pencere acilir orda diqqet etmeli olduqumuz  backup type full olmasidi,Transactionlog secdiyimiz database-in log-unun kopyasin alir,full database-in her seyini bir butun olaraq backup-in alir,diferencion ise database-in hecmi boyuk olar diye ancaq deyisen datalari goturur

--Restore : Database folderine sag click edib yeni database yaradiriq

--Generate Scripts :  bir database kopyasini goturmeyin en rahat en yaxsi yolu. Database seciriy sag click ediriy taskt bomesinden Generate Scripts-i seciriy birce diqqet yetirmeli olduqumuz hisse advanced gorduyumuz yerde ona click edib types of data to  script hissesinde  Schamel and Data secey

--endregion
--End2

--Ders3
--region  T-SQL En Son Primary Key ID yi Bulmak

SELECT IDENT_CURRENT('Personeller')

SELECT IDENT_CURRENT('Personeller')+1

--endregion
--End3



--Ders4
--region T-SQL @@Identity, Scope_Identity ve Ident_Current Komutları
--@@Identity
-- Acilmis olan connection, tabel yada sorgunun islediyi scope-a baxmayaraq sonuncu yaranan identity deyerin verir
-- Trigger kullanilan sorgularda duzgun olmayan neticeler vere bilmesi ehtimalina gore cox tovsiye olunmur

INSERT Personeller(Adi,SoyAdi) Values('Senan','Senan')
SELECT @@IDENTITY

--Scope_Identity()
-- Acilmis olan connection, tabel yada sorgunun islediyi scope-a baxmayaraq sonuncu yaranan identity deyerin verir
-- Trigger kullanilan sorgularda @@identity yerine bu funksiyani islemey meslehet gorulur
INSERT Personeller(Adi,SoyAdi) Values('Senan','Senan')
SELECT Scope_Identity()

--Ident_Current('TabelAdi')
-- Elaqe ve sorgunun islediyi scope'a baxmayaraq parametre olaraq verilen tablda islenen sonuncu identity deyerin verir
INSERT Personeller(Adi,SoyAdi) Values('Senan','Senan')
SELECT Ident_Current('Personeller')

--Numuneler

CREATE DATABASE NUMUNE_DB
GO
USE NUMUNE_DB
GO
CREATE TABLE NUMUNE_1
(
ID INT PRIMARY KEY IDENTITY(1,1),
KOLON1 NVARCHAR(MAX),
KOLON2 NVARCHAR(MAX)
)
CREATE TABLE NUMUNE_2
(
ID INT PRIMARY KEY IDENTITY(1,1),
KOLON1 NVARCHAR(MAX),
KOLON2 NVARCHAR(MAX)
)

CREATE TRIGGER CONTROL_1
ON NUMUNE_1 
FOR INSERT
AS
INSERT NUMUNE_2 VALUES('', '')

INSERT NUMUNE_2 VALUES ('1','1')
INSERT NUMUNE_2 VALUES ('2','2')
INSERT NUMUNE_2 VALUES ('3','3')
INSERT NUMUNE_2 VALUES ('4','4')
INSERT NUMUNE_2 VALUES ('5','5')

INSERT NUMUNE_1 VALUES ('6','6')

SELECT @@IDENTITY 
UNION ALL
SELECT Scope_Identity()
UNION ALL
SELECT Ident_Current('NUMUNE_1')

--NETICE 6 1 1
--tRIGGERDE DEMELI @@IDENTITY ISLEDENDE BELE SEHVLER VERIR
--endregion
--End4

--Ders5
--region  T-SQL Default Values İle Sadece Identity Kolonuna Veri Eklemek
CREATE DATABASE NUMUNE1_DB
GO
USE NUMUNE1_DB
GO
CREATE TABLE NUMUNE_1
(
ID INT PRIMARY KEY IDENTITY(1,1),
KOLON1 NVARCHAR(MAX),
KOLON2 NVARCHAR(MAX)
)

INSERT NUMUNE_1 
DEFAULT VALUES
--ANCAQ IDENDITY DEYERI OLAN TABELIN IDENITIY-I OLAN COLUM-A  QIYMET VERIR QALANI NULL QALIR
SELECT * FROM NUMUNE_1
--endregion
--End5

--Ders6
--region T-SQL Top Keywordü İle Update İşlemi
USE Northwind
SELECT TOP 2 * FROM Personeller
UPDATE TOP(2) Personeller SET Adi = 'Senan'  
--endregion

--region T-SQL Top Keywordü İle Delete İşlemi
USE Northwind
SELECT TOP 2 * FROM Personeller
DELETE TOP(2) FROM Personeller   
--endregion
--End6

--Ders7
--region T-SQL ROW_NUMBER Fonksiyonu
--bizde bele bir problem var 15 dene data var tabel-da 13silsem 12den sonra 14 gelecey 13 adinda hec vaxt qeyd edile bilmyecek
--ROW_NUMBER() OVER-NEN ISLEDILIR TEK YOX 
SELECT ROW_NUMBER() OVER(ORDER BY Adi) indexer, * FROM Personeller

SELECT ROW_NUMBER() OVER(ORDER BY Adi) indexer, * FROM Personeller order by PersonelID

SELECT * FROM Personeller

--T-SQL ROW_NUMBER Fonksiyonu - Partition By Komutu İle Gruplama
SELECT ROW_NUMBER() OVER(partition by MusteriID ORDER BY OdemeTarihi) indexer, * FROM Satislar
--endregion
--End7

--Ders8
--region T-SQL ANSI_NULLS Komutu
--NULL eyerlerini gorsun gormesin onu seciriy
--ON  deyerini verisek NULL deyeri diqqete alinmiyacaq
-- OFF deyerin versek NULL deyeri diqqete alinacaq
SET ANSI_NULLS ON

SELECT * FROM Personeller WHERE  Unvan = NULL

SET ANSI_NULLS OFF

--endregion
--End8


--Ders1
--region SQL Server 2016 Dynamic Data Masking Giriş
--SELECT EDIRIY MESELEN PEOPLE-NI VE ISDEMIREM KI HEC BIRI NSANIN SEXSIYETININ FINI GORSENSIN ONU GIZLEDIREM VE TABEL-IN ORJINAL HALINDA HEC BIR DEYISIYLIY OLMUR SADECE ISDIFADECIYE HER SEYI GORSEDMIRIY
 --BIZ VIEW ILE EDE BILERIY BUNU AMA COX UZUN ISLEMEY LAZIM OLUR AMA DYNAMIC MASKING DAHA YAXSI DAHA RAHTDI
 -- SEXSE GORE DEYISECEY HALDA YARA BILERIY BIRI BER KOLUMU GORMUR DIGERI BASQA KOLUMU

 --SQL Server 2016 Dynamic Data Masking - default, email ve partial Parametreleri

--DEAFULT PARAMETRE
--METINSEL : XXXX EGERSIMVOL 4-DEN COXDUSA 4 X AZDISA SAYINA GORE X
--SAYISAL  : 0000
--TARIHSEL : 01.01.2000 00:00:00.0000000
-- Binary : 0 - >ASCII

--EMAIL PARAMETRE
-- SENAN.MEM@GMAIL.COM :

--PARTIAL PARAMETRE
--Partial(3,H,2) ilk 3 simvol gizlenmir qalani H ile evez olunur ve son 2si gizlenmir

--SQL Server 2016 Dynamic Data Masking Uygulama
--PROTOTIP
--CREATE TABLE [TABEL ADI]
--(
--[COLUMN ADI] [ COLUMN TYPE] MASKED WITH (FUNCTION ='DEFAULT()')
--)

CREATE TABLE Telebe
(
ID INT PRIMARY KEY IDENTITY,
Adi NVARCHAR(10) MASKED WITH (FUNCTION = 'default()')NULL,
SoyAdi NVARCHAR(10) MASKED WITH (FUNCTION = 'default()')NULL,
Memleketi NVARCHAR(10) MASKED WITH (FUNCTION = 'default()')NULL,
TCNo int MASKED WITH (FUNCTION = 'default()')NULL,
Sube NVARCHAR(1) MASKED WITH (FUNCTION = 'default()')NULL,
Email NVARCHAR(MAX) MASKED WITH (FUNCTION = 'email()')NULL,
Hakkinda NVARCHAR(MAX) MASKED WITH (FUNCTION = 'partial(3, "H", 2)')NULL,
DogumTarihi NVARCHAR(10) MASKED WITH (FUNCTION = 'default()')NULL,
)

INSERT TELEBE VALUES('SENAN','MEM','SUMQAYIT',1234,'A','senan.mem@gmail.com','Sumqayit gozel seherdi','2001-07-03')

INSERT TELEBE VALUES('Ibrahim','Tatlises','Bilmirem',12134,'B','ibo.show@ibo.com','Kebab Show','1666-06-06')

SELECT * FROM TELEBE

CREATE USER YETKILIUSER WITHOUT LOGIN
GO
GRANT SELECT ON TELEBE TO YETKILIUSER

EXECUTE AS USER  = 'YETKILIUSER'

SELECT * FROM TELEBE

--SQL Server 2016 Dynamic Data Masking - Alter İle Maskelenmiş Kolon Ekleme
ALTER TABLE TELEBE
ADD ELAVE_COLUMN NVARCHAR(MAX) MASKED WITH (FUNCTION = 'partial(3,"XXX" ,0)')

EXECUTE AS USER = 'YETKILIUSER'
SELECT * FROM TELEBE

--SQL Server 2016 Dynamic Data Masking - Alter İle Kolunun Maske Formatını Güncelleme
ALTER TABLE TELEBE
ALTER COLUMN ELAVE_COLUMN ADD MASKED WITH (FUNCTION = 'partial(2,"AAA" ,4)')


-- SQL Server 2016 Dynamic Data Masking Özelliğini Kolondan Kaldırma

ALTER TABLE TELEBE
ALTER COLUMN Email DROP MASKED


--SQL Server 2016 Dynamic Data Masking Özelliğini Kullanıcıya Özel Pasifleştirme
GRANT UNMASK TO YETKILIUSER

--endregion
--End1


--Ders1
--region  SQL Server 2016 Temporal Tables Giriş
--DML ISLERIMIZI RAPORLAYIR
--sehven delete ve ya update ediymiz isleri geri qaytara bilir

--SQL Server 2016 Temporal Tables Çalışma Mantığı
--Bir datanin tarixi teqibi
--data ilk yarandiqi an(insert)
-- data ilk update oldugu an(update)
--data sonra ki guncelleme oldugu an(update)
--...
CREATE TABLE DersQeyidleri
(
--1
DersID INT PRIMARY KEY IDENTITY(1,1),
Ders NVARCHAR(MAX),
Onay BIT,

--2
StartDate DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,

EndDate  DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,

--3
PERIOD FOR SYSTEM_TIME(StartDate,EndDate)
)
--4 MERHELE
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.DersQeyidleriLgo))

--SQL Server 2016 Var Olan Tabloyu Temporal Tables Olarak Ayarlama
CREATE TABLE DersQeyidleri2
(
DersID INT PRIMARY KEY IDENTITY(1,1),
Ders NVARCHAR(MAX),
Onay BIT
)
insert DersQeyidleri2 values ('Riyaziyyat',1),
							 ('Fizika',1),
							 ('Kimya',1),
							 ('Turkce',0),
							 ('Cografiya',0),
							 ('Konustutsiya',0)

--2 sual yaranir bunu sonradan tempural edmey isdiyende bunda data var ya yox
--eger DATA YOXDURSA
ALTER TABLE DersQeyidleri2
ADD
StartDate DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
EndDate  DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
PERIOD FOR SYSTEM_TIME(StartDate,EndDate)

--eger Data varsa
ALTER TABLE DersQeyidleri2
ADD
StartDate DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL DEFAULT CAST('1900-01-01 00:00:00.0000000' AS DATETIME2),
EndDate  DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL DEFAULT CAST('9999-12-31 23:59:59.9999999' AS DATETIME2),
PERIOD FOR SYSTEM_TIME(StartDate,EndDate)

--HER IKI HALDAN BIRI ISLIYENDEN SONRA
ALTER TABLE DersQeyidleri2
SET (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.DersQeyidleriLoG))


--SQL Server 2016 Parametrik Olarak Temporal Tabloyu Sorgulama
--AS OF<datatime> parametri ile
-- mentiqi StartDate >= datetime and EndDate < datatime' seklindedir
SELECT * FROM DersQeyidleri2
FOR SYSTEM_TIME AS OF '2016-09-26 06:22:53.4332443'
WHERE DersID=3

--FROM <START_DATE> TO <END_DATE>
-- mentiqi StartDate >= datetime and EndDate < datatime' seklindedir
SELECT * FROM DersQeyidleri2
FOR SYSTEM_TIME FROM '2016-09-26 06:22:53.4332443' TO '2016-09-26 07:22:53.4332443' 
WHERE DersID=3

-- SQL Server 2016 Veritabanındaki Temporal Tabloları Listelemek
SELECT
NAME,OBJECT_ID,TEMPORAL_TYPE_DESC,HISTORY_TABEL_ID,OBJECT_NAME(HISTORY_TABEL_ID) AS [Histroy Tabel Adi]
FROM SYS.tables WHERE OBJECT_NAME(HISTORY_TABEL_ID) IS NOT NULL
--YA DA
SELECT
NAME,OBJECT_ID,TEMPORAL_TYPE_DESC,HISTORY_TABEL_ID,OBJECT_NAME(HISTORY_TABEL_ID) AS [Histroy Tabel Adi]
FROM SYS.tables WHERE TEMPORAL_TYPE_DESC = 'SYSTEM_VERSIONED_TEMPORAL_TABLE'

--SQL Server 2016 Temporal Tables'i Pasifize Etme
--TEMPROL NE DROP NEDE TRUNCATE EDE BILMIRIY
ALTER TABLE dbo.DersQeyidleri2 SET(SYSTEM_VERSIONING = OFF)
--endregion
--End1



--Ders1
--region  SQL Server 2016 Row Level Security Özelliği Giriş
--BIR DATANI 4 USER ISDEDIR VE HER USER OZ DATALARINI GORMESI UCUN BUNDAN ISDIFADE EDE BILERIY

--SQL Server 2016 Row Level Security Özelliğinin Kullanımı
CREATE DATABASE Yenilikler
GO
USE Yenilikler
GO
CREATE TABLE Satislar
(
SatisID INT PRIMARY KEY IDENTITY,
Urun NVARCHAR(MAX),
Adet INT,
Kullanicilar NVARCHAR(MAX)
)
GO
INSERT Satislar VALUES
('AUrun',3,'Senan'),
('BUrun',5,'Zabil'),
('CUrun',13,'Zaur'),
('DUrun',23,'Senan'),
('EUrun',35,'Zabil'),
('FUrun',43,'Zaur'),
('GUrun',53,'Senan'),
('HUrun',65,'Zabil'),
('IUrun',73,'Zaur'),
('OUrun',83,'Senan'),
('PUrun',93,'Zabil'),
('RUrun',133,'Zaur')

--Userleri yaradaq
CREATE USER Senan Without Login
CREATE USER Zabil Without Login
CREATE USER Zaur Without Login

GRANT SELECT ON Satislar TO Senan
GRANT SELECT ON Satislar TO Zabil
GRANT SELECT ON Satislar TO Zaur


--Row level securty isledmey ucun Inline Value Function yaratmaliyiq
CREATE FUNCTION RowLevelSecurtyFunction (@UserName as sysname)
RETURNS TABLE
WITH SCHEMABINDING
AS
RETURN SELECT 1 RowLevelResult
WHERE @UserName = USER_NAME()

--indi funksiyani birezden yaradacaqimiz Securty Policy(Guvenliy Politikasi) icin Filter Predicate olaraq elave ediriy,Yeni uzun sozun qisasi filtre olaqraq ayarliyiriq
CREATE SECURITY POLICY GuvenlikFiltresi
ADD FILTER PREDICATE dbo.RowLevelSecurtyFunction(Kullanicilar)
ON dbo.Satislar
With (STATE = ON);

Exec as User ='Senan'
Select * from Satislar


--endregion
--End1

--endregion

























































