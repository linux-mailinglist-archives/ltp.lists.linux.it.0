Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4D53AE357
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 08:42:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C86873C2415
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 08:42:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B88A53C2311
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 08:42:31 +0200 (CEST)
Received: from esa16.fujitsucc.c3s2.iphmx.com (esa16.fujitsucc.c3s2.iphmx.com
 [216.71.158.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 44F9B6002FC
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 08:42:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1624257750; x=1655793750;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=R2uY8Vr8iE8UEIeYdPuwrVqLH/NJzyDZt24F95nY0g0=;
 b=opm95Bm6f8rlXYKR1cfm3zEUiqxtyKNiuWTmRli6ZdxyegydTAZjC2/C
 bcs+eRinB3qNc/ZVVHEd1Dpbq7e0sdmyz/xexmoyDTXAmQCG11xyvJFxQ
 VPHTqo67AOEIAalPHMveOwLSowNTVBccENEb9Xp5ncyXzIByRJF/m5Ofj
 c+wb+NPm85z6i+JLlremyTWfw+IUPuO+ttJeiFjsf/4uRWrdTtLa6SN6V
 uCNUyvKrdKfkMG9/p52VgLF1g+98/SBwqEjWJTA6kVrUhN+rMRPM0pwnT
 jk8nVGg9cOYyA5NWnPtyXs/Q1b7tCcrwHZlQVr9BXgKlZ02kiS6gfdq4N w==;
IronPort-SDR: KncjfHuULVydWmj5w0P2pZ1rfndzkekIc2AOPB7vaoRiQcmLFJFD8wGAfOHQ4isDpKHWWbFIGS
 y/AHQNT6HakBWvOyx5bWaWz4VfQdyguRHqjf+HDEgRLD6f+Rsugd0y4BDUkTM0Di3pSHyAR26/
 ifFKrweR+Ojo2VNDHMns1XeO5pWiaYtOqS7fSAlphvgra2+e2X/N3J8reuyXpMCgoOv/ZGInc4
 8T3octrPawPEe8ZZFP4kOPzsr4KqlKfqopsVUyrDyVAHapZM3eIK9UAtR+Sd7H/RZVsFD47LN+
 8GQ=
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="33471036"
X-IronPort-AV: E=Sophos;i="5.83,289,1616425200"; d="scan'208";a="33471036"
Received: from mail-ty1jpn01lp2059.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.59])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 15:42:28 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jdu4kjM49BqsrtRzR88UUrkRiy/oZVekD/PjII12LAbnePsCq+wrOOqg8kJfSyndFru1zPsUda5cmaVuoWTSUUvE9ILjDmmYtVQzoweXs863/3jE6GVDK/0JZWgm/l9LwaQAaEe4lYVrfNglktikPw1BOONnBK17vRlTnq6UjJiJoi3bFuzoaVKX34lmabdiDXeE6nHg4FMzltfTQn9b3lnPV+Az0x6Y+fy2N8FLLJFwj0T0P0XKaCIn0UeEymcrRL6MzLg8aVu+JYjaAVVNVoRknYt7uSCt+14SjYWk0Fwb+2m2t0FE/jirgRt+vaJWB24KpPyicS+q0VOGtzShYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2uY8Vr8iE8UEIeYdPuwrVqLH/NJzyDZt24F95nY0g0=;
 b=jHhGpU84m02Esr11xhFz1a1JaUHCUgKtw0bW350Qn3hJAlNwtud7riX+zDCnhNv6Ar1LdxV3dj8TT+27fpy88yzkiBSyBAPbj3l8guipH9TN+HZlVLeAlayykPcg0hkxu2zv3lmnAyPpsXbCA57XXx0QYjq8qV1sdi1U4oEVJO5R3vCazgE++QzJzEhYpI3XV3xpMQJ8naGR1Bbq3hapdkmabkpX8mLx64RGh4TFpjzgR2R9AxRmX8OdgrIdv/mkS07DYyCYVASE5z/jXShg+DL8+UiUmM1okJO3gtpCqvqM6pfPvTFb1O4j5YBRLPiya4vr4eOOpeXQSklcFfV84w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2uY8Vr8iE8UEIeYdPuwrVqLH/NJzyDZt24F95nY0g0=;
 b=oknIIhUIxWicJw5OesOzzf/zPpxmyZ59bdHB8efkXhgRC/qhl8edi7qHdLobyURdyPwC1ujIiaIGpqKrMHoCCRQznXIVVucXMS+X/BWxhqpl7/b45XIMQIOFaJZl2e2NXRfYM1ESRuxe9Hl4czOAxJQjiO0uvRSE6Npxw2YNWRY=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB6281.jpnprd01.prod.outlook.com (2603:1096:400:86::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Mon, 21 Jun
 2021 06:42:25 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4%9]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 06:42:25 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [RFC] Makefile: simplify code
Thread-Index: AQHXZAu3fdiPH6LM00ahdFuV5Tq6vasZqvGAgAReToA=
Date: Mon, 21 Jun 2021 06:42:25 +0000
Message-ID: <60D034F1.2060006@fujitsu.com>
References: <1623997931-18117-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <YMyK1/MluG2RHy+s@pevik>
In-Reply-To: <YMyK1/MluG2RHy+s@pevik>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4a34b5e-ad96-42a5-0175-08d9347fbb01
x-ms-traffictypediagnostic: TYAPR01MB6281:
x-microsoft-antispam-prvs: <TYAPR01MB62813D717C8F88E69D0EC59DFD0A9@TYAPR01MB6281.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: APSJyKeKd6vISDby6oU9UNzB7ukHHDlJjSR7GADgVLVZS1IJwAJLQ1HfumjIx74lZs24S7bkPqfpABeuKNaWatRRVQ2cMGflioz9lTewidEdPE8qIS9XviXpJ6CdACMGCxqXzqCMtMoM7FRAm/Zt2vsXeCFftU+hGrl6dsnojLOMHztKu/kJTM7JLpCFZgq+AJ8GJyShTnibIze9jDQ0RlCrCWomfOcHmb9bpamK9cEV1TwRHlgJSNqurx56UK1q6grLYpBNssz20X2M+K3jiGOShre8GsOn8LvuCfCTJqGFU6wvR8XBIHK6B+Is6z+tbMsbhhOW6MsPkrcTYMP5uRdtA3gD+uBtmjd9qAYpHzrjtTAEJiJx95n3wVw0FBOisQ5J651SFM0ZP5YEwncjTz8lClBZq8eUtDEasaWuwK85b0blfQnluiMH3s/+gwov1jDHwtv4BLu/upcP1Vupr+3NJME191F0pnTE+pNrysRlARvY+n6XlCnDV1gQh9torb4EIITbAKBIM7c5yupPbkAvqORy9/VbvqGG3yHL3dZgX878vGyzVvNqKSJqQg7zeuY15bKS991M1Ij+ahi5j93TQv5orHr3oTczmfVT+z8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(66556008)(66446008)(64756008)(66476007)(66946007)(6506007)(2906002)(6916009)(6486002)(8936002)(87266011)(122000001)(85182001)(4326008)(91956017)(76116006)(86362001)(5660300002)(2616005)(33656002)(8676002)(26005)(6512007)(71200400001)(36756003)(558084003)(478600001)(186003)(38100700002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?QkZmWk5BaEdNb0dURmxWMTZMalVGM2ZOdDVrYk83azBuSVFaMUVBYUpUcEZL?=
 =?gb2312?B?S00rNC9RTlZUbngyOXcwZERSWWJTM1AyckxJNHdDYjFiVkIzYVd4NnNVU3Jm?=
 =?gb2312?B?TEpMcDFuZUh2eExmYjdkS3V3RkhlTkt6RnllZDlMdUNIZVNHVmx1Uk5SanlN?=
 =?gb2312?B?djR5TnFPTS8vRStMM2tXdXdrYnNnN3E3NDZUWmtEdkwrYk1peHNxNW82RHg0?=
 =?gb2312?B?RVBueFN0NXlBa0RlN1ltS0VFUkM1SWtlZVFjNG5TeHBtaUtqN25FNzNiRTZB?=
 =?gb2312?B?bi9Wb3o2VnZkZWo2U0xubDBLNjRPWkpqYWhCYlMySnR6S1k0OTd2d0tENC9y?=
 =?gb2312?B?Y3VLVFh3TmRtWkM2NENRYjBwNXdUSm1tenlzN3dkdzljRmFkM3ZwVWh2QThG?=
 =?gb2312?B?L3E4b3RTMjFnZ1FybWlPOHVLNTJGWWJUbEhLaFA4aWtFaDY3VWM2TFpUQ0pM?=
 =?gb2312?B?WXZtS2VXYTlySU1jYnRDVWgybGV1OWNraUx6OXc4MjA2R2V5WkVMSUlFYlFo?=
 =?gb2312?B?NzYzV01IYXhJRUFsWWF6amRUdldHZXVWc1FnUFRXenJHS2JEYzdlSnIwUThj?=
 =?gb2312?B?dDY2ZFZsTVp1RE5tUXhTNFJNK0VCLzNRQmNKemxSZi92REFJeTBpdWdGY0RY?=
 =?gb2312?B?K3EyZVVCdjBMRHkzbTdEZXR4bzJZR0ExVWJXOE9ZT2gyY0V4ODc2b3BJKzYy?=
 =?gb2312?B?TGhPYWpZK1RtMnh0Q3dEYUp6OGZjazc4b3NDVTM2TUpzVjFCKzVGdWt4MDBJ?=
 =?gb2312?B?Nk1uOTVaKzNxV3A1YTBJRW51SytqWHF1Tkd3RVFzQ1cyOGlqSXdFa3B2SDNY?=
 =?gb2312?B?c0h5Skk5clM2aDZ3VGVjbHk4eTJYbXJyQ1NTY2pYdDM5enA1TVp3VHlMNWpE?=
 =?gb2312?B?TjhkSUxxVHBNQTd5bU9EQXdnVFRiWFVQekdWODBSWWc2Z21xeWpudEZMc08v?=
 =?gb2312?B?bGFQTDJVbnFRYW5iNEw4bURvZmp1YUxYVzF5NFJXUnRMMkdPN1dBcktwZjFH?=
 =?gb2312?B?K2gybEJyNU9CVGZjRVlsRmUxRUEzVXR0S1dFdUxGdTYrc1ZmUnNjYVp4WDF5?=
 =?gb2312?B?WXIrR3lkcnpWVDB3YWNnNFZpTGRtZks5M0drWXNDRFhWd0I5eGswM1hpVnBs?=
 =?gb2312?B?NTBKS1ViNUMrZURpWlAydHNtRnlzZk1lYWpoUW9oN2hPVlZxak9YMFpQV1pk?=
 =?gb2312?B?aWYxMGVHcWtmMGM2dHhmc2lOMUxQbE96VFVqQTFFbmxqN0xRZTM3VlpvQ1dK?=
 =?gb2312?B?VnQ2RDlEVEV1WGRndTBIMmpoNVlRWUYxREI1NE56aUI2TE14N1gvdjk0bGg3?=
 =?gb2312?B?MytrdzIxYTY5NlYvRUdLcmZtUDVQL3lQclB5N0RRK1dOMEI1d0lTRkJMNmxO?=
 =?gb2312?B?ZGhDNCtqVngzRDh4YnFNM3BMbU5TWDdqOG9VZytmQ2drVzNOL3pHWDRENnd2?=
 =?gb2312?B?cjF5TUE3eFdpOWVSdld3cXpTaTNpb2Q3YkQ1MytxRStVQUFHV1hjZm1OeTZ0?=
 =?gb2312?B?czFNVVZpZ3g5dnplaFN1SmM1OVVySmlWN0NRT0FQaEcvM0Z6QVBIQVROdlFi?=
 =?gb2312?B?dWlCYkRlSDNFVFlXb3RSdnl4SzJyUS9KdWtHWndWZENILytFUmdUQWEycnVl?=
 =?gb2312?B?d3dYOGRoaXFFMlZiVXJhdldZcHovSlRRL3E1aE1FWDFBczBLRGw5Mk45YlJ0?=
 =?gb2312?B?QXNjT2p1OW14ekZ1aFlSNmhaTDVlZHVqMVN3QjM2ak5xL0haaER0bkhjUFg3?=
 =?gb2312?B?YU81SXlLa2VmdHJJSVVMdUtJYXNUSHRaNDZ3ZmY1amFYbFB3ZUpmcmJKdW83?=
 =?gb2312?B?VGVEWksyZmpzbVpDTEFPZz09?=
x-ms-exchange-transport-forked: True
Content-ID: <7FCB4AA98686354D9356307F69DD3C54@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a34b5e-ad96-42a5-0175-08d9347fbb01
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 06:42:25.1357 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z5cw9wWXRBPu6m52ub5XWhQnEjOLKfohK40Oa3O52NEeucEK9W4xNGKvEag28V/mwKG9tX+nrXz5pSJjt+kxir/Z1Hh+luQ4g5E5e/6TjCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6281
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Makefile: simplify code
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr
Thanks for your review, merged.

Best Regards
Yang Xu
> Hi,
>
>> When these target use CFLAGS or LDLIBS, they can be in one line instead of separate lines.
>
> Reviewed-by: Petr Vorel<pvorel@suse.cz>
>
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
