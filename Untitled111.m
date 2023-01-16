fprintf('       Tarih       |   Gün Doğumu       |       Gün Batımı     |\n');
    for j=10:1:12
        for i=01:1:31
    gunler=i;
    aylar=j;
if  aylar==10        
    n=gunler+273;
    elseif aylar==11       
    n=gunler+304;
    elseif aylar==12        
    n=gunler+334;
    end


r=((2*pi)*(n-1))/365;

dec=((0.006918)-(0.399912*cos(r))+(0.070257*sin(r))-(0.006758*cos(2*r))+(0.000907*sin(2*r))-(0.002697*cos(3*r))+(0.00148*sin(3*r)))*(180/pi);

latitude=36.897; 
longitude=30.693; 


Hsr=acosd(-tand(latitude)*tand(dec));


geo_SR=12-(Hsr/15);
geo_SS=12+(Hsr/15);
geo_saat=fix(geo_SR);
geo_dakika=fix(60*mod(geo_SR,geo_saat));
geo_SS_saat=fix(geo_SS);
geo_SS_dakika=fix(60*mod(geo_SS,geo_SS_saat));


Q=3.467/(cosd(latitude)*cosd(dec)*sind(Hsr));


sunriseMinutes=(geo_SR*60)-Q;
sunsetMinutes=(geo_SS*60)+Q;

B=(360/364)*(n-81);
E=(9.87*sind(2*B))-(7.53*cosd(B))-(1.5*sind(B));

Yerel_Zaman_Meridyeni = 30;

YSZ_cik=(((4/60)*(Yerel_Zaman_Meridyeni-longitude))-(E/60)+1)*60;

conv_SR= YSZ_cik + sunriseMinutes;
conv_SS= YSZ_cik + sunsetMinutes;

conv_SR_saat=fix(conv_SR/60);
conv_SR_dakika=fix(mod(conv_SR,60));

conv_SS_saat=fix(conv_SS/60); 
conv_SS_dakika=fix(mod(conv_SS,60));

if not(i==31 && j==11)


fprintf('%d / %d / 2022    -       %.2d:%.2d             -       %.2d:%.2d\n',i,j,conv_SR_saat,conv_SR_dakika,conv_SS_saat,conv_SS_dakika);


end

        end
    end
    
    