//
//  MarketData.swift
//  Crypto
//
//  Created by Baris Karalar on 26.10.23.
//

import Foundation


// JSON data:
/*
 
 URL: https://api.coingecko.com/api/v3/global

 JSON Response:
 
 {
   "data": {
     "active_cryptocurrencies": 10559,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 901,
     "total_market_cap": {
       "btc": 38266956.25517586,
       "eth": 716585555.4635252,
       "ltc": 18790832316.100086,
       "bch": 5196561026.289102,
       "bnb": 5819522214.3877,
       "eos": 2146920045709.567,
       "xrp": 2352008231922.999,
       "xlm": 11355198659579.94,
       "link": 120060744371.94456,
       "dot": 300596915663.1336,
       "yfi": 222311995.6454684,
       "usd": 1323484107017.8118,
       "aed": 4861150507655.871,
       "ars": 463258215540568.25,
       "aud": 2096832928303.3164,
       "bdt": 146112409834595.53,
       "bhd": 498997183321.24585,
       "bmd": 1323484107017.8118,
       "brl": 6612391295482.407,
       "cad": 1825869409653.0256,
       "chf": 1190694976108.3938,
       "clp": 1223534587255826.8,
       "cny": 9686712527674.059,
       "czk": 31045760788781.02,
       "dkk": 9366065415646.324,
       "eur": 1254890572719.294,
       "gbp": 1095138100097.5994,
       "hkd": 10351167723602.365,
       "huf": 481623622160648.9,
       "idr": 21036238029449440,
       "ils": 5390968988861.357,
       "inr": 110116397617621.58,
       "jpy": 199032598590831.3,
       "krw": 1796970833745398.8,
       "kwd": 409331135070.78894,
       "lkr": 433040111419922.6,
       "mmk": 2783100823140079,
       "mxn": 24273763927412.812,
       "myr": 6335518420294.281,
       "ngn": 1046274950399901.6,
       "nok": 14841597098041.504,
       "nzd": 2279185215536.4453,
       "php": 75484917367244.94,
       "pkr": 366437271918259.5,
       "pln": 5610177661506.745,
       "rub": 123686199280445.14,
       "sar": 4964915632098.418,
       "sek": 14795321476239.62,
       "sgd": 1815117424767.6123,
       "thb": 47960655297250.62,
       "try": 37256474657783.51,
       "twd": 42971541081739.625,
       "uah": 48412826289381.79,
       "vef": 132520463635.69354,
       "vnd": 32570057520520104,
       "zar": 25360157768015.348,
       "xdr": 1010535702040.5931,
       "xag": 57221722101.26668,
       "xau": 664269908.15331,
       "bits": 38266956255175.86,
       "sats": 3826695625517586
     },
     "total_volume": {
       "btc": 5736016.630899752,
       "eth": 107412427.47900456,
       "ltc": 2816647500.126693,
       "bch": 778937323.1441185,
       "bnb": 872315947.5507909,
       "eos": 321812087830.6457,
       "xrp": 352553734463.75616,
       "xlm": 1702084898631.3445,
       "link": 17996477740.30971,
       "dot": 45057905727.939644,
       "yfi": 33323405.597445257,
       "usd": 198383346665.01917,
       "aed": 728661040383.8795,
       "ars": 69439983964813.76,
       "aud": 314304290855.09656,
       "bdt": 21901486159582.43,
       "bhd": 74797068343.15204,
       "bmd": 198383346665.01917,
       "brl": 991162876607.771,
       "cad": 273688276375.63397,
       "chf": 178478950344.07782,
       "clp": 183401436324876.94,
       "cny": 1451987552575.9404,
       "czk": 4653597192729.353,
       "dkk": 1403924227262.6738,
       "eur": 188101534574.06473,
       "gbp": 164155474331.51654,
       "hkd": 1551585911769.1152,
       "huf": 72192862377811.92,
       "idr": 3153222074519375,
       "ils": 808078060104.168,
       "inr": 16505872164421.625,
       "jpy": 29833945715339.89,
       "krw": 269356530968183.5,
       "kwd": 61356596606.59698,
       "lkr": 64910448178521.914,
       "mmk": 417172259548159.3,
       "mxn": 3638510276430.5156,
       "myr": 949661080485.449,
       "ngn": 156831143714909.72,
       "nok": 2224677792918.66,
       "nzd": 341637945125.2963,
       "php": 11314794375422.703,
       "pkr": 54927030827553.12,
       "pln": 840936293812.2992,
       "rub": 18539914472279.312,
       "sar": 744214889912.4614,
       "sek": 2217741319202.517,
       "sgd": 272076610067.3273,
       "thb": 7189051425449.347,
       "try": 5584550723624.289,
       "twd": 6441209294426.483,
       "uah": 7256829492604.192,
       "vef": 19864124501.568375,
       "vnd": 4882081301718265,
       "zar": 3801355031990.617,
       "xdr": 151474017279.3019,
       "xag": 8577236909.904351,
       "xau": 99570585.52463977,
       "bits": 5736016630899.752,
       "sats": 573601663089975.1
     },
     "market_cap_percentage": {
       "btc": 51.021369114924596,
       "eth": 16.778045322114128,
       "usdt": 6.371834393089435,
       "bnb": 2.6423299831683353,
       "xrp": 2.2720321772088896,
       "usdc": 1.9023518560724066,
       "steth": 1.2244076156982235,
       "sol": 1.0270739483467075,
       "ada": 0.7819549663611014,
       "doge": 0.7732790487444989
     },
     "market_cap_change_percentage_24h_usd": 2.903174443143363,
     "updated_at": 1698310719
   }
 }
 Response headers
  cache-control: public,max-age=120
  content-type: application/json; charset=utf-8
  expires: Thu,26 Oct 2023 09:02:07 GMT
 Responses
 Code
 
 */

// MARK: - Welcome
struct GlobalData: Codable {
    let data: MarketData?
}

// MARK: - DataClass
struct MarketData: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double

    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
    
}
