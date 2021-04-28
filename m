Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F73A36D40F
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 10:40:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B869D3C634F
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 10:39:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9964A3C19C3
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 10:39:55 +0200 (CEST)
Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com
 [68.232.159.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 675F7200D0B
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 10:39:54 +0200 (CEST)
IronPort-SDR: hJ9ioLcNG9tJFnsvL+Zrmp7SyJ94bHVAnmi/JuIS+281LPrjWz62oIUjm1kty6M2QvKOsYCHnA
 h3+USeMQ6nDx0MN85iV7zQSta3x2pFm/cYNBb8adbfh1q+laukE3tGY/knCx3OpKRY+UjYgYoy
 81dC4DAZxpLq/SFe0t3yG+AmBDDbdXTB5SzKS//pb/yCPRrFHdkWY41pCXIT0pqzgGW6EN7RzI
 c/Lg21nJxrBpN6KPd/o0tNJVgMlMP9xZhUkNmA/in/wczZQREmf655aSEYZE6Jlg0+fyYM0YG2
 ovA=
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="30562952"
X-IronPort-AV: E=Sophos;i="5.82,257,1613401200"; d="scan'208";a="30562952"
Received: from mail-ty1jpn01lp2050.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.50])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 17:39:52 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIkQLlBGUVOpGp5bA5P+gMTJS1wXnYCZt4t97EhPnG8DDHzrqGEckYDBO8M8QEG/sO2hTbBbeIQ5VmeSsNv+5Q4DTUtg9KUVneiMx+ocXnak3IbijV90mgE0gAqRuHAOkC0/Plt6uNcQoDWM8xTLjh9TqquoHI3TThJnuXWHmTBygYecSSgg/NhG6gDjtna/sKcqucSifEEHO5hKeZciS8kotABaZLyAi2Z6Tco5nqdSg4J1S9VRXyNqSTVa1xsN/4LG50vNfPXEaVtiwatRa2NiIHV5jZ2nrUx8CSlGwWrVHOCNOd/1G+LBKysu3lnnIISOtc4DFU1qxIOthPKimg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wugCCeRcilnktAJZe4uf4/F1n8Axc+ZuGo5zEzxkAP0=;
 b=Hc6euA3hF3otnzFCwXcq8fcY11gZsbpxkwqF/grrbGFV1SQWgpxVhb10uE3Tp9F1MyfihTZbDoY96WqwEPadAiGw73wKN6vgzZJxQdPqhoe7ypGs0BDVr7fjQP0N/rbKmz+BXmSSfaNglanvYwb2cEjB8I0IbIepTGt0WagdhSB6FJNvEwts81gGXwAwPU/8YfALwYNVZLvZcks63MLY5n5p9j46nG6DY7TE6agonFY9aF8QMF3EYcXYPtHXFI2nNMAJqQnkl+7/PYH+f3+RlmXPnrrXcaJaZtZkRPpzTPG8MghmmpPHBd6mP2mcM9wxFBZYeFiuOLzx9S46PViUQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wugCCeRcilnktAJZe4uf4/F1n8Axc+ZuGo5zEzxkAP0=;
 b=d1kv2Z7xF/wsGLPONDF2GjNVPuy1fMtCe/cOLcPsuG0pXragx/nBrjdtuYJPYbzgcQkTub+aRQ8Bu80TvNBUIpriMPlisW00xNsoFkU15yyQ9YfnF8ehb7RCpk0D+J/QHoVKdkTL3oubUV7jtg5VtoP2BKBGpCBZ0UlKAkGmayk=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB4096.jpnprd01.prod.outlook.com (2603:1096:404:bf::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.26; Wed, 28 Apr
 2021 08:39:50 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.4087.026; Wed, 28 Apr 2021
 08:39:50 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: "huangjh.jy@fujitsu.com" <huangjh.jy@fujitsu.com>
Thread-Topic: [LTP] [PATCH] syscalls/chown03.c: Remove the redundant pass
 information
Thread-Index: AQHXPAWyxIVwKK3ohk6CGE0eVFc1UarJnDGA
Date: Wed, 28 Apr 2021 08:39:50 +0000
Message-ID: <60891F73.7020608@fujitsu.com>
References: <1619597275-12846-1-git-send-email-huangjh.jy@cn.fujitsu.com>
In-Reply-To: <1619597275-12846-1-git-send-email-huangjh.jy@cn.fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e86b0fa8-078b-42b9-03b4-08d90a212fdc
x-ms-traffictypediagnostic: TYAPR01MB4096:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB409672486A95B4E34AA33A86FD409@TYAPR01MB4096.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:901;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TGeVMZ3W+1haay4QCOWNxEv9S1FXrDtFZvjI+/TD53C9kauK3rakm4/DyeWSuK26Zlrg0emAlCCWg3sUqUulD18VDnV+qov1jhIfzTTjwy6LReZL2+k+NuiGUfIXMqsrseOCacOV/WeKSpLKwMZ37Mfm1w0QW52xEvFiv48TOjJmRTCJ2xvSk/qbX9FFyT18RaVJeWmDkVaLrs+ZMvayq2uHUY94t5Gn2+iLq/g7ahwCmIan8KOIWAC4j3tptlrlY+CgerMaVKqlA3rEk8sh4QC1stQl6dgMsCb5jKArSISYkP2WMFKUkm80LW+PMe3uwBrWkLcC+fyIdCSHBmgwkU2k94B1gM2DNuwKN1K8m37WQM5785PG2VapxjRqNvAdCPPFR0RaQb4qu063smf4u3sIkQ5/Hvq8naG2PP3BTH+cUSIAbB6eDV5s4QnZg1efMIRG56h4HEbNSt43qbfW/a3/NWyexGAr9fUn1cFHHECliF8MESH7C8vIrxAkMRs4qPVtpoPNx8Y1R68u+0RudMx9VMEZDXoXJIw4FcCSBCnBu16aPgRx/D9w3NSf1IdvRDHDPYJiNaFvNIRfR32iEPiKy0093ZQu04XRw/MyKFs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(2616005)(71200400001)(186003)(86362001)(83380400001)(26005)(8676002)(85182001)(5660300002)(33656002)(478600001)(6636002)(6506007)(91956017)(6512007)(76116006)(66476007)(8936002)(316002)(64756008)(6862004)(37006003)(66556008)(66446008)(87266011)(66946007)(36756003)(4326008)(38100700002)(6486002)(2906002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?ZWtyeVp4Nkt3aU9yZmV0akdlNkZNaER1M2VDb09rMGc0eU45ZG44VmF3clBR?=
 =?gb2312?B?R2I3MjluQUl2a2pyUHhDWmNoMTcwbXpHNnl5Q0U0U2R5M3RBYnR5OHNudVZU?=
 =?gb2312?B?eWNWR3JPNlBobFRKR25YSjBaUWprTFFLaXkxUDdPNFVnd0NkdUhpVUNKZjVZ?=
 =?gb2312?B?bFdUNk85MzRib2hKYnBkYjFzbWZJOWROT2tNTVU5WGRoMGpTeTZqem9qMzBl?=
 =?gb2312?B?cUxrUDhlaDUzZStiSjduR2pRTGFmaFBJWUhtdFkyWUV6cERMZDBHcVpGR21h?=
 =?gb2312?B?T1ZRckFCR3lzRXgvM2dua0s0RXdRNmpsUFNvQUw0bmhKdnpmT1ZjVXY4b1FV?=
 =?gb2312?B?YTVReHlQUm5ZOWlwMTBIUzUzNzJGSzdQV0FPUEJpSmRKQXpmTitHK3dZVjBP?=
 =?gb2312?B?OVQweXVuNDFVWFpScW1qZlFRS3hiTWxlSzdmMktWQm1ycGZ5Z2FJUlkrUXU1?=
 =?gb2312?B?NlJ6UDYvMFc4dVV2KzdwYWpPYkV6c0JsUnd1T0QwNHlzVzRQNld5clcyeHlM?=
 =?gb2312?B?UnNpTFRlK3FOKzJ3SlZvYWhWbnlzZ0NGTU1tYTlUWFowTVR5aU84MkZjTnBP?=
 =?gb2312?B?MUhDQ1pCQm95ZndTSGNhR1QySGN0bGtQVFJWVEVSYktNc2hJTWxtbEZ5YnB3?=
 =?gb2312?B?QnYrdnl4UngyeSt1R2dxUjdjeEdqMlBRUmx0eXBKd0xJRHNIVWtrZFFKWS9v?=
 =?gb2312?B?Qk5UTGtoTGdSM0lyNkJ4RlNqemh6QjVLNytZQms0UG5SNTF0NEN4S0R4S2E4?=
 =?gb2312?B?cnBJU3RBU3BPbDFBUTY4Q1BZVnY3QkpBY2lFQVRVVjh2VTh1TUlHSDF1d2xv?=
 =?gb2312?B?c2I4TGlLZW9URW5OZ3hrVndmRFNESnRacVdpV1pvMFdRejVzRytINU05eW14?=
 =?gb2312?B?aDduRHg4bTlVYUpkdHRDa1NmNkpFcW8vWUNKdExwUjhmeGY1NHF4NTg5RHVV?=
 =?gb2312?B?Yy9UejFPZHUxc25Cc0FMbnNKU3pRQUxUVE1NaG5JVzdZL3JGTjc5a1p3SEhi?=
 =?gb2312?B?WWZ4VmlTSVRGSElLczMrYWR5NHVGZzZWeGo1bTljcVZraXNubWFwd29PNE5Z?=
 =?gb2312?B?L0QvanJnK2twREhlVWdNVmsrWXYzZHVUa3Rhd2pJQlYxVDhualFrTXhxbDVS?=
 =?gb2312?B?dCtOYjJwL0phVzB6MFdOZFBMTVNEL1FNeURGYVJlU1VkdGVOMUowdWUzM3Y3?=
 =?gb2312?B?VUlJeGNRU1BHUENidmFzZGNIbUZLOFIyQy93d0NKaXJTQlRUTnRRVEZuN1VJ?=
 =?gb2312?B?c2NVZ1hRM3JZeG5hRXJCcUhDbitKQXh1TmtraFJDRmlSSTM5anFKMVNHOTAw?=
 =?gb2312?B?UXYvMjZBdTBmdDhVdklldUZWaHBTajZjdnZHdi9HY2MxNUtYQ2VOYmNDRm16?=
 =?gb2312?B?NEFYZlVDbTZXcUwrbHMxTVNwUjlMaEF4WHhFcUVXVEVXUGE4cnhhSDZqSWRm?=
 =?gb2312?B?RVFoTGhVd3kyazc0dUg0R1VPNy9IekhLZWNJYlozN3B1RkVVRHdlUGZUVXEy?=
 =?gb2312?B?bkhndlVlNjZNbVBnMnNTZGdaa2VQbTRMeWV6Y2lFSW1weGZTcXlST25IM1Qx?=
 =?gb2312?B?enJ1T1hKczloRU5WNnVadEtYT3dHd3ZkeXd6d2txN2VzSEtubFczRi9VblZZ?=
 =?gb2312?B?VHBDN015RFFBeGc3dm5uOTVRcVdoVUJwczVvR1FSWmIzSFhMRnJlLzJ0WnhF?=
 =?gb2312?B?bndwdEYrMitmNUtyOUw5dXIxazR1TTdNcmZKNTB6aWRZNTJkNldtTDhILzB1?=
 =?gb2312?B?NlJqb0dxR0ZrcjVMaTFIYTdodVBhaEErSXAyZ0p3Y01wR0xmUXg0MkxVTWJ3?=
 =?gb2312?B?UVFrNUxVcGUxay9JZXlGQT09?=
Content-ID: <71729A96EB808C40BF286C7768923FD9@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e86b0fa8-078b-42b9-03b4-08d90a212fdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 08:39:50.1776 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o0oe0JtYMohRHq2en6hv6/iSS2anQVAyh/s1GYoWglRsPyNnRABkN4cjo/yxwC0vTftFQHpflNP69RR1RRkAcJM8JpM0rQWC4a+Ti7ajyxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4096
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/chown03.c: Remove the redundant pass
 information
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

Hi Jinhui

Sound reasonable,
Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>

Best Regards
Yang Xu
> When executing testcase chown03_16, the system will report pass information
> even if 16-bit version of chown() is not supported, for example:
> --------------------------------------------------------------------------
> tst_test.c:1313: TINFO: Timeout per run is 0h 05m 00s
> chown03.c:48: TPASS: chown03_testfile: expected owner set to (uid=99, gid=0)
> chown03.c:58: TPASS: chown03_testfile: expected mode permissions 0106770
> /root/ltp/testcases/kernel/syscalls/chown/../utils/compat_tst_16.h:153: TCONF: 16-bit version of chown() is not supported on your platform
>
> Summary:
> passed   2
> failed   0
> broken   0
> skipped  1
> warnings 0
> --------------------------------------------------------------------------
>
> The redundant pass information may mislead testers, so we should remove them.
>
> Signed-off-by: Jinhui Huang<huangjh.jy@cn.fujitsu.com>
> ---
>   testcases/kernel/syscalls/chown/chown03.c | 6 ------
>   1 file changed, 6 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/chown/chown03.c b/testcases/kernel/syscalls/chown/chown03.c
> index 8ff2602..ff6e904 100644
> --- a/testcases/kernel/syscalls/chown/chown03.c
> +++ b/testcases/kernel/syscalls/chown/chown03.c
> @@ -43,9 +43,6 @@ static void check_owner(struct stat *s, uid_t exp_uid, gid_t exp_gid)
>   		tst_res(TFAIL, "%s: wrong owner set to (uid=%d, gid=%d),"
>   			       " expected (uid=%d, gid=%d)",
>   			FILENAME, s->st_uid, s->st_gid, exp_uid, exp_gid);
> -	else
> -		tst_res(TPASS, "%s: expected owner set to (uid=%d, gid=%d)",
> -			FILENAME, exp_uid, exp_gid);
>   }
>
>   static void check_mode(struct stat *s, mode_t exp_mode)
> @@ -53,9 +50,6 @@ static void check_mode(struct stat *s, mode_t exp_mode)
>   	if (s->st_mode != exp_mode)
>   	      tst_res(TFAIL, "%s: wrong mode permissions %#o, expected %#o",
>   		      FILENAME, s->st_mode, exp_mode);
> -	else
> -	      tst_res(TPASS, "%s: expected mode permissions %#o",
> -		      FILENAME, s->st_mode);
>   }
>
>   static void run(void)

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
