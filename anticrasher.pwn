#include <a_samp>

new AOFCT[MAX_PLAYER];
new AOFCW[MAX_PLAYER char];


public OnPlayerUpdate(playerid)
{
            new Float:x,Float:y,Float:z;
            GetPlayerCameraFrontVector(playerid,x,y,z);
            if(floatcmp(1.0,floatabs(x))==-1 || floatcmp(1.0,floatabs(y))==-1 || floatcmp(1.0,floatabs(z))==-1)
            {
                    if( AOFCT[playerid] < GetTickCount())AOFCW{playerid}=0 else AOFCW(playerid)++;
                    if( AOFCW{playerid} < 2) AOFCT[playerid]=GetTickCount()+1000; else
                    {
                        new string[128],pName[24];
                        GetPlayerName(playerid,pName, 24);
                        format(string, 128,"%s Sunucudan Yasaklandı! [Sebep: Crasher]",pName)
                        SendClientMessageToAll(0xF60000AA, string);
                        Ban(playerid);
                    }
                    return 0;
            }
            return 1 ;
}

//ANTİ BULLET CRASHER

public OnPlayerWeaponShot(playerid,weaponid,hittype,hitid,Float:fX,Float:fY,Float:fZ)
{
    if(hittype != BULLET_HIT_TYPE_NONE )
        {
            if(!(-1000.0 <= fX <= 1000.0)) || !(-1000.0 <= fY <= 1000.0))|| !(-1000.0 <= fZ <= 1000.0))
            {
                new string[128],pName[24];
                GetPlayerName(playerid,pName,24);
                format(string,128 "% Sunucudan Atıldı [Sebep:Bullet Crasher]",pName);
                SendClientMessageToAll(0xF60000AA, string);
                Kick(playerid);
                return 0;
            }
        }  
    return 1;
}
