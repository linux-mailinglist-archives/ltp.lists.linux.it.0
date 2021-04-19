Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C50363925
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 03:42:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 57D2A3C6E3C
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 03:42:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A8F193C1D68
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 03:42:57 +0200 (CEST)
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com
 [68.232.159.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4B9F61400C5B
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 03:42:55 +0200 (CEST)
IronPort-SDR: xddE9jPZ25IKetD2OoFyBaIXumUhq15juZjIwGZ0The0Ms3sL8y6VgG/onIpY7Lo07564QLQNy
 3EZRJmMpfGX+1wX6oWmPBWUi+NuCt4ODZeOcYl+ipkM+UulETzY2Nuqj1CjBmlEOk2tK2udnEg
 GA+2Et8p/ZJM4GT+IINDyeWmGqABIuT51qgTwf4uZaps1hOxG5ZgtFJfhjhiA+3m+kg2j1Tyv8
 4t2w5dQA7CBiSyqkaWCs6v3V5Dz50K/Eavg2yuNlgpxeLu9ofIZ8PLEcoWOsLS/WACA4ORRp3A
 ymQ=
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="29967776"
X-IronPort-AV: E=Sophos;i="5.82,232,1613401200"; d="scan'208";a="29967776"
Received: from mail-ty1jpn01lp2052.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.52])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 10:42:54 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNVfKC0jdMoxoJYUZEts2h9GyQmVRRakkF6sBllzZ21vsgo1LwQAEROMb91L9sdOyrayBAMoQmD+KeEG53jeeV49qCSRuV3yPCmLr4rZf5E1fixaxFfaT9kkhoHM8LwgG1mvsP2kXC5J/hoDMUrtL3u4O/2zAf5EmEN2DLC+hOB2WnVmbhmXBqrdTQR9eDRpU7RQpbWc/0POm9FDFV1dDglwLo95B+hlGl9hd8gxZbD5wgV2IOIOyy951ImiI3Fa3MQ1pySlifCzBxhm3TUiOWTbbL+tjo4fKFwR4/2/tBTmFGgE86W+cW0kwphLHCXwnfS2tY+Wv4lB2VzBeqJnmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2z3QOuX/BxkXTyai3OXUYzz3emfJTkRkasX+U0Sq0g=;
 b=a1hq6Cdjf5R06vUJ5KBIpU+KOWHhETPFUgz92KlMpzUq5yVCDejpfGqgmY9fgK586AeAqlr/LTd1BJG+qjOLmPKYbFucK5n/iOsNR3cZ5YF5wrelOdIBVJ2KzaYOJYe2yxtOe5Q4K17WfJxifObednpVPFKjd94ONnOtqAdEDh55Z2lJJVg2m+ZaSvRupzF+IMwKHaGLHEFW7eIFyIvMqn9wdWRNWy/aYcKIWfeLT7QhCvcI34HfVug7YVxQT4CJ/KkLM+MzLwndN8mBs4mN6YODEYc78PvSjD7QoYk6ia0aljVLtsLt8nsg62EOzxyBimYAr4Ce423JxdapuB7uAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2z3QOuX/BxkXTyai3OXUYzz3emfJTkRkasX+U0Sq0g=;
 b=mtvWtCvy65rOsEiiMLM/AJe0wZkK/hhweGb7LW1DlGq/GMuisnav+MmIbDOGSclI00dli7S7Rv9WNdDX61WA6vdONR9sze3oM+30bay4rB0RTRD9Vh58H10m1yY3lmOey1v8S6MXYJntIdTVOOkn8+lq7cARm4JItNLOnrAzo7U=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB3680.jpnprd01.prod.outlook.com (2603:1096:404:c2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Mon, 19 Apr
 2021 01:42:51 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 01:42:51 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Thread-Topic: [PATCH v4 1/3] tst_safe_sysv_ipc.c: Add SAFE_SEMOP macro
Thread-Index: AQHXL2xX2VZLuUvzbkOIYxbFXW9SUqq7LKsA
Date: Mon, 19 Apr 2021 01:42:51 +0000
Message-ID: <607CEE48.80408@fujitsu.com>
References: <d1c91207-35eb-402f-566c-1289ba2c786a@oracle.com>
 <1618215614-24840-1-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1618215614-24840-1-git-send-email-xuyang2018.jy@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 119c6985-6518-4e57-44b1-08d902d471a9
x-ms-traffictypediagnostic: TYAPR01MB3680:
x-microsoft-antispam-prvs: <TYAPR01MB3680A63D60F8F8E31B2BF43CFD499@TYAPR01MB3680.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rvA35K1w10MwtZrQYX5hfKKvXe7YfkHi8SnQNDMinkz1flPJxgPYe9Nms7r/OSSkSbKXpTqKYwRjffIH2nJ7a8gGfe3glsgOY+zHv6HxBqfz5EMFyFOE+sL3ZpzpjxWfLzylVsxlBoavhYArINUUEhwc/WINCmGwrfV5l99jt/m3PA8HhQQXpDIlnD1lwrqw2xnUoM2IO0d1JOhBMGlL+Qs5vkYi9Ms3Htx6IBvBM64F6CYqIfyxfVEV7P/71eE6ON/gB7aR+dzju0q3Fuwqi6NyC+mU79hnUjXwZlmTSPmDg4PzRZ2+ByYUsgLgeWbcEBQmfimUiZLjfSiuWW1E2ElcQqWwLKwK2odFRwzr8LAtYaBuABqEJVbFvi8U+Vv6jWITw6gO1XXoEY30wVPdWOcQN/7/1HJxy55sNquXXhlmz5iMlMflp2fGEH0xgDd3G4psxnuTeahQs72T0+HgA9pDKJ7pcP9i9NzNmxXRh+G4JBxjwV5/QbdCOBcKagj47PC826GYWP34rs7C7w8pVW8BNV5Sa5hOhXSpv5odjPkgi0EWt2XvsjuI6DCueosQH7B8J9nQTuWIHiE62SgF3ty2UJh3m437PQbA8FvfrjE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(8676002)(478600001)(2906002)(4326008)(6512007)(33656002)(36756003)(6486002)(26005)(38100700002)(85182001)(71200400001)(186003)(316002)(66946007)(86362001)(66446008)(5660300002)(91956017)(76116006)(64756008)(66556008)(6916009)(122000001)(2616005)(66476007)(6506007)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?cEVTSDN6U1NOWGpJazIxOURHalc0Z0Zla0VsZjcxZE96ZkZ2aTRUOWFRSVBE?=
 =?gb2312?B?QUQ0Sk9YMmo0UXF4UXdzN2RYdUxKM0dIWkRPYmtnV2hkdExERUE3ajViQTFT?=
 =?gb2312?B?aDVtQUJuZ0FOVnZyTXdGRnNudjhFZ2l3cWFrSFFnYlBEUDIwbzVpVW1PVHpk?=
 =?gb2312?B?ZkFQMjVwMFljT0N5bDB2Y1ltc1l1M2JSbHVFMHVROUlseTVmYkMrTFk5OXkw?=
 =?gb2312?B?dlBYN0twS29GbXh6bk82RC9sM3pXRVZMNnhUMU1UTjZqcTdkcmNDN09vTGJ1?=
 =?gb2312?B?bkVZZDZocy9OSDdwaDNQd0hMVFhHc0dTREpnTGgwTmtVQXN5a0VDak9FcDZO?=
 =?gb2312?B?MkJrL0x6KzF2Q2Q5aEJKNHpwOURlTmdNbjkwVVM0dEpUVGRId1pvRFFUTzkv?=
 =?gb2312?B?WEsva1JQYWpCc1U0UzhEdEcvMERpcENBeTk5QjBQRGh2VnJKbi9Qb0NiRmlv?=
 =?gb2312?B?RmJrV1BGNG5VVEhVT01PeDZ0TG1lU0xjcHFyVElld0lxU0M0VFNEVDF6ejMy?=
 =?gb2312?B?Q0pzcHVrK2swNlowejlWckVWL2FGZDNKOTJNYXhkNWpQT2YxN1A0RFZWaU1G?=
 =?gb2312?B?Y1NDdEJ3REJGUzltOE5LbytnM2NsVm5aREp4RGVqaEJsVUVzb2liMW5CbDdw?=
 =?gb2312?B?T2hLcTVvanpGbDd1aFhUV2U5NTVxSHJrYXJaQ0UvZWpmdmJOS2ZsMXdNTVYy?=
 =?gb2312?B?ZWVpSmZuRFVTVjBhWUpGYVh4UGhCNWRjbk9KYXN1RGhVQUJLYytsQ0FHTzNY?=
 =?gb2312?B?MEp5bDlzMUt0aHlydWdUU0hRRzhlN1VJVU00eFpPQ2lRRnlpdEdJQkhFZ2pP?=
 =?gb2312?B?blhHUE1uV0cxNmNObHBYdEQxWHRjcnpJSWhycGIzVlZXZ2FaSVhwdnpSdUxB?=
 =?gb2312?B?SjlzV1M3dHZuS3BHMlJBU3RiQllvOHRuNFV2aGZBUjhhbFpPd3EweFZxaFJV?=
 =?gb2312?B?eUQ4OFMzK1QrV0RSekErckxoazlWQ2ROSDMxYmNnbE1pTXRsalplUlNWSGVp?=
 =?gb2312?B?UWVSenlZZVRSVis5TlRFazE0Y0d1Z0w1Vnk0MTlOK05jZWIzNG1xby9yeXo2?=
 =?gb2312?B?VnVyWVlsSWVuTmlFQzlHdFhJbE9GTmVha3cyK1FkVGtXTG51a3o5WXQyWE5m?=
 =?gb2312?B?NXVjdHhvOE5SS0hlU1MyTE5GUWtFaTI1ZEZXL2taMXh5bFExMnNneHA0WWdj?=
 =?gb2312?B?bWlOaUJ2azYyaHhJcXUvdXdrTmEzbXhSdlFlQWJlSUFLRnFuTkhnK0hJUG9X?=
 =?gb2312?B?UDcvZUIvNXBpaHgwR2dpY1JBL2NGK09JZGNlZDNvYkUyeDBtZlNXSmZqNWM5?=
 =?gb2312?B?aURkNlVjUVhmUzRGYlFGUEhLUm9ubk1sMTM3WjNHeWwraTlRckdWRGF4MEw5?=
 =?gb2312?B?T28wRVRsN211ZURUWkV6L3gzbjMvNEpodFM4aHA2UktZb2ppR3JKZjZjSEpq?=
 =?gb2312?B?NkV3a0gzR0dKSkFDaStWTWxUWkhzOTBBSWRnQTkzZHI3cWF4Q2Y0MDJMSnJF?=
 =?gb2312?B?emV3UmdqY3BqZWtzL0ExeUtMUHNkbFhkOUFMcThuOFNrZjZFRitxWXY2VVF2?=
 =?gb2312?B?SVdRMEhnRDlNSDlzSmFwb2tZNTlTR1VsdGpvTUZ2bE5hWEpZM1lIZS8yLzZR?=
 =?gb2312?B?ZXpScVY0b1hjLzBYc2lMNGlnWU5GV2piSnBpYy91RVN3cElDem9ZZlpvNFY2?=
 =?gb2312?B?Ujk2anZvdUV2Vzh4TjJyRHB4QnBONE5HR3paT0pUcEJvanlOSXMyeDc0enVL?=
 =?gb2312?Q?41yk7Cg0nh79+7o34RKZDidXBw2srtOFj4BHc7g?=
x-ms-exchange-transport-forked: True
Content-ID: <F19458888F3DDD4489AB3D3532B9E873@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119c6985-6518-4e57-44b1-08d902d471a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 01:42:51.1831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OYVkjb3PwSRblkCTW1y/z5z2XoWk00wmlJ90RJ22JgOM2vmG5iWqWirc7qpG9ODChzAoo+yony6oY3jDzWpbGT0neysvh1HQc77otpuuZQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3680
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/3] tst_safe_sysv_ipc.c: Add SAFE_SEMOP macro
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

Hi Alexey

Thanks for your review. I have merged this patchset.

Best Regards
Yang Xu
> Reviewed-by: Alexey Kodanev<alexey.kodanev@oracle.com>
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
