Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67884350CAB
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 04:24:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C34F03C8A89
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 04:24:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D70EC3C232D
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 04:24:53 +0200 (CEST)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com
 [68.232.152.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8716F200DAD
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 04:24:52 +0200 (CEST)
IronPort-SDR: zJAotNLuvPDiYgt0LRjniGm67ssMGLO38+Qpn8ky0dSBomx/5NkZCydSm1VsB/O18g40AuKCsp
 dnztCI46STexZEoWiPAW7T21hK71X+Tf95n8PaML1erQ9HEts3OVsucS84WyQRUu1evJLXQ0Xf
 B+aGA0tPbWAcLtuMoHvIUQbBMuRa39Ry1rG4z1fmZpospeWKvAZoRgOxKzXL8sHoW1btzLSFq4
 ZK/DUxLHMZQIbGj2InWsV/J+P2YEjN98YJAjIvizoHTwEP8RGhPTqz1+Mg2KWqkqtPbRqHiEF9
 piM=
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="37090276"
X-IronPort-AV: E=Sophos;i="5.81,295,1610377200"; d="scan'208";a="37090276"
Received: from mail-hk2apc01lp2051.outbound.protection.outlook.com (HELO
 APC01-HK2-obe.outbound.protection.outlook.com) ([104.47.124.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 11:24:50 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tu9YmmMNA0V4ga0fEh3kSOtot5Dd9OWye48fi0U6sVwCir1DiiS+eVyJa5yzk4EoTiRGlWhwCSiBS/sDZBSQtOaEz58ki17W+OmknS118r96nk2A4wdZhD0Xj86YPMvbmTp6mZF0Isdd0GvqjysLeJSnRae+lBl6g0EwgM6gFceQyfGf8VIkj4/XCECbGzC5NJ/5oSL7jY2PhXuxl8hTfO+WTMzgSgYhZr0lqIS4+PrJyEsLLNxnAER/lQBb81GKYsGF14iuGVZp9MwHmCmDAUxQY4fen5L+sdZJhOFql0AagNG9UmzFqlPQ2NSSOZBi5kNT9FvR6ME/MxSb34NLYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmxGNU7a/qY31pf6Mj5YZDnZtKzdmyvmUtjOYH27Koc=;
 b=Gs+NYpCyBvZnHTQzxOzNI3+tO4jdNEoc6M9N8ft4nUewM9gTm5uGedBY02pq3UXw7si11eI+OYR1vFftT5f6tS2JQiVzfJfSf3M5/IMpmQr1Yjuv1117VbmIit4XX5KdTC7aiM++ZELxh6dkI35uSdObJN1+Geg293N9S9xGFR2MuoQTibQqFKcSjRYZDIS5ZMYPQuZv9upQReUJchXMp5fVjXRKe7gtZ0RLb74djasAMm5El0T1WBxdq3fmQ7V5C3BgWlsSuHdpLNXyxaBs7KVsXxnNrSHpka8nB87oNdle83rbgj2z+NCqkkmK49MztJmqkrTOq+f2P9dNn0UuMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmxGNU7a/qY31pf6Mj5YZDnZtKzdmyvmUtjOYH27Koc=;
 b=hp9FVWPd+oTFovOOcx2LnIpKUEzvFR945fvILqHR+iwgE9KaXg6ldf7JW15iIqfB+wOCbTHSoEXkmIKyhiUgYzxwBvnDbA4jg1NqnH/oNJWoWuWjAMvM6bwsovJ8O6LMraqQ+7gyPJE0Pl8iQ2w365oZdqAwXEtelVwv8aQgUJY=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB2009.jpnprd01.prod.outlook.com (2603:1096:404:12::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Thu, 1 Apr
 2021 02:24:46 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.3999.028; Thu, 1 Apr 2021
 02:24:46 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [PATCH 1/3] tst_safe_sysv_ipc.c: Add SAFE_SEMOP macro
Thread-Index: AQHXH9NaDO3N7Fnjr0+kLLSyDIoAeKqe/MQA
Date: Thu, 1 Apr 2021 02:24:46 +0000
Message-ID: <60652EFA.4050806@fujitsu.com>
References: <1616497037-19158-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1616497037-19158-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none; lists.linux.it; dmarc=none action=none header.from=fujitsu.com; 
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2926f201-2123-4efb-397d-08d8f4b5513e
x-ms-traffictypediagnostic: TY2PR01MB2009:
x-microsoft-antispam-prvs: <TY2PR01MB20099ABBC14CE9FFA8D83FA2FD7B9@TY2PR01MB2009.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iGCZL9P1J7+ME3Ymy2JPOIedL6sUP25sbom8Lt/tdOwLpx8XJVCHprFo3zITNKsZkoL/WgM3FTAkLj1Kc6m3/rflhafRutb8ZCfTxUeXxbvLxH9mJOfzo4iORS/9zlOAvzWnsl0b8bTp7813NKUFkrFizEJxbUhyvpnXXpTLvooZdfm9dkJXSJFj7Bo+f8Sf34OsOPunY1gRU1S9riMAqIcEz1V6v1A4BjlV9a4er0efB7YOrIZucSpDqrPFzx0BSXtBjy/CLVMseJVa54afo+axTMrMTTBhYYp55D7n9AAAyrWlnIuCdd/qfMHH4BCaihCDp0htKEx7risczgF8a7O9KLC2OdteshVDJk/+l5VeLkfDBUp0t1mcwQb0JaQEGP1Fkg5Gam13uW7+sC0a0surWff1pJQEat21hdUtyIBQjz8tM4TDxphmwgVKlDMm3pG90TVABRvigTwPvdtBsGluA5E92H798SC+V/fsgzgt6LCbngoEDuPKg/QOavU4CU24EUoEYsnlX9U1+l/xcUJIFhvpqii0kY+hD/9e+KXL1AyuTMKV3Bl5vOLirTc0KygH+U/U+ILiGX1X1YU03FQoP3+liXLErv5wdSabMEmq4KJg9kCgGhl99mNUghh1BO3oPC6wgeRWovt05wzHoQJTP9x95rdvHdb2T+htC5I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(26005)(85182001)(36756003)(33656002)(71200400001)(86362001)(186003)(2616005)(2906002)(6486002)(87266011)(6512007)(8676002)(8936002)(38100700001)(5660300002)(478600001)(66946007)(66446008)(66556008)(64756008)(66476007)(316002)(6916009)(6506007)(76116006)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?b01XT3UvV1BqQWlGbmVrK3FWdnFQL1Rnd1VMTy8rWUZtS0xVMEt6QzFLMEZ0?=
 =?gb2312?B?R3M5MEErRHg3ODdpcGUvbDF1MVJTZFRvOGd6T3RvZ3U5VldIWVo3V2tqOUw5?=
 =?gb2312?B?VG1iaE9yWFVncjBFV29jd0FhSkVzTXdzUEFRQVlYTVczbDMrV1gvdU9FenZ0?=
 =?gb2312?B?T0x6dG9MK05TY2NuWVh6YktJK2dSeUh2T1NMeVNYNzhiMnFiTEJFL3NIME03?=
 =?gb2312?B?aS9PRnpFcmYzWW1PNm9PaVJoQ0dsNE1EVGkyT0JTVUc4N1BMMGZRQ1BGUFcw?=
 =?gb2312?B?cWM1Nk5uTXhsajk2amM0dVQvZFhBcWR6Ukd3VUJTejZxemFLcmZJRjJXa0xw?=
 =?gb2312?B?N01VNkMzVUJuWTZxcWRoUUxoazRlTitFVGNSeUZUd0s2SUt6amk4dWR0S3Nj?=
 =?gb2312?B?UWxTcm1GdGE3VUt1RW90enlDSVd6TW1lTlJucE0wTTZ3TFE2UjRrM2hwR1Mv?=
 =?gb2312?B?Vy9VNDVUeUFKTkZHeVhBblVJRURjckIrdVFGbzVTNzBXbCtwQ0dLT3VNTW51?=
 =?gb2312?B?M1N4a0VZek5BYjVDblV1R01nQWJiUFZpb3EwWWZvL1ZjSzViODFkcUhkeTh6?=
 =?gb2312?B?Z2ZaU3Fxd1hTZ3Ezbzg3WnNpQUkwdUYzYm0vdERYS3dTbzVmak5pNDVBaURK?=
 =?gb2312?B?eVpqYVJDeDBvUkxFOFlkR3RYV01ud0lpaElaaUU3WVY3QWhBM0owN0Q0WjFy?=
 =?gb2312?B?VHNuN2pYOFhQZExsNjZiWVlpQy9RODhwckRTMG4xYmRKYkhmK05ZOWY4ZFRD?=
 =?gb2312?B?Tm4zQS82UVVjVUJmeXFFUG1iK0dBQVlOTDU3dkZBMFVjYzlYUTZYOWJTQ3di?=
 =?gb2312?B?K3prcGh0Tzl0L0djdlFiamIzdWg0aWpEQjJOT21TUTlOM0c5dHc0dG1rWDc2?=
 =?gb2312?B?bzFiOWh6L0JNRk1OaU5FZG1wdkZyVCtVZ214a2tCcTFDcFhBYStBTmdRdXEr?=
 =?gb2312?B?bTZZc1lOUlhWUlFDUHU5VTNSQWRHNEEvVXJ3cUpVNXBpOGUreXppUzVWMWJz?=
 =?gb2312?B?OXhtNjVzTXNZS1lYWVF6UUUxdDJiWnFZOFFWTkpPSXk2RGc2Y1p0UjFLUnlJ?=
 =?gb2312?B?MFBxYTBxWGlQR1JEemV5clFwS3hjcWxmRFUxT3ZoS1pHZmRsMmRhTUg5SkZF?=
 =?gb2312?B?T21GTEpNVVFMZDlGc3VGUTZtOWNncFFCUFg3UzZkYmpLejBoR0Z5UWVDKzZq?=
 =?gb2312?B?K0tkdHpvMXlCNFFXVEk4MkxmYm95bithb2pxVmFDMFNMWTV5cDB0bUR3NDRs?=
 =?gb2312?B?SWhmMTFSaC9OUFQxNm5VOWZtN0dWbE1vQkFPR2lLY2cwSzVxcXRkWkk1aDlB?=
 =?gb2312?B?c1FXcHdXSDVpQ3ljZ21FWlVCcjBLaEQwWGJsM3ZvOWtWZlBHbThsN204Y2tr?=
 =?gb2312?B?aVVBV0NIdHVPNkFsYmFUdi95a1VUQWZ1S3lrNUYxclVKZmJSRytqcWx6dUZR?=
 =?gb2312?B?TFowV0s0QUdITDNaQnlqMmk3bmthUjYxOUxNSy9DTXJ1UnZhOTVpeGtzMXp2?=
 =?gb2312?B?NzVmc0czMkF4aFVVdnZ0cHJ0eVVFaHFWTnVzNVBZSHhJeHJSald0bUdkVkls?=
 =?gb2312?B?ai9peHNTQWw1L0dQRzBKdXhuc0szUXVLVU8xb0xsdEtJR0g5M0FTMWlURHpO?=
 =?gb2312?B?bVdpK0kzZlZQaU5Eb0YvMEtTMzlYbEhzUlJTZFBaRyt6Wi95OWp2eHlidG9Y?=
 =?gb2312?B?RHhDS1BNamRUUUlET2t3cjlZbXRoMlRidUd0d0kyaFJuZWVZa2VTblB1aUpz?=
 =?gb2312?Q?pC/5Psnb9TDd3z6i02yXJyiRh9aSlexpQw0Xd7G?=
x-ms-exchange-transport-forked: True
Content-ID: <FB30610322D2CB40829BFA3C26DDDCC7@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2926f201-2123-4efb-397d-08d8f4b5513e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2021 02:24:46.1478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A+cpuM7NO+y37ZR8bMufMpsNeRRlTfR+hhRoaIQqw3E5Wgu5eF0GGm4/Vr/Uuq5dt73HSm8O+dHSv6Opic8xrwii2wdfUl1twlT+K9jD/pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2009
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] tst_safe_sysv_ipc.c: Add SAFE_SEMOP macro
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi
Ping.
> From: Yang Xu<xuyang2018.jy@fujitsu.com>
> 
> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
> ---
>   include/tst_safe_sysv_ipc.h |  4 ++++
>   lib/tst_safe_sysv_ipc.c     | 18 ++++++++++++++++++
>   2 files changed, 22 insertions(+)
> 
> diff --git a/include/tst_safe_sysv_ipc.h b/include/tst_safe_sysv_ipc.h
> index bb6532662..7804ce192 100644
> --- a/include/tst_safe_sysv_ipc.h
> +++ b/include/tst_safe_sysv_ipc.h
> @@ -65,4 +65,8 @@ int safe_semctl(const char *file, const int lineno, int semid, int semnum,
>   	(semid) = ((cmd) == IPC_RMID ? -1 : (semid)); \
>   	tst_ret_; })
> 
> +int safe_semop(const char *file, const int lineno, int semid, struct sembuf *sops,
> +		size_t nsops);
> +#define SAFE_SEMOP(semid, sops, nsops) \
> +	safe_semop(__FILE__, __LINE__, (semid), (sops), (nsops))
>   #endif /* TST_SAFE_SYSV_IPC_H__ */
> diff --git a/lib/tst_safe_sysv_ipc.c b/lib/tst_safe_sysv_ipc.c
> index e72985d61..012f5ba38 100644
> --- a/lib/tst_safe_sysv_ipc.c
> +++ b/lib/tst_safe_sysv_ipc.c
> @@ -227,3 +227,21 @@ int safe_semctl(const char *file, const int lineno, int semid, int semnum,
> 
>   	return rval;
>   }
> +
> +int safe_semop(const char *file, const int lineno, int semid, struct sembuf *sops,
> +		size_t nsops)
> +{
> +	int rval;
> +
> +	rval = semop(semid, sops, nsops);
> +	if (rval == -1) {
> +		tst_brk_(file, lineno, TBROK | TERRNO,
> +			"semop(%d, %p, %zu) failed", semid, sops, nsops);
> +	} else if (rval<  0) {
> +		tst_brk_(file, lineno, TBROK | TERRNO,
> +			"Invalid semop(%d, %p, %zu) return value %d",
> +			semid, sops, nsops, rval);
> +	}
> +
> +	return rval;
> +}

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
