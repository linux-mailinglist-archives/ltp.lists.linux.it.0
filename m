Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A603D33C3
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 06:36:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA1523C58F0
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 06:36:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 936103C2F9F
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 06:36:13 +0200 (CEST)
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com
 [68.232.159.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 83DE8600F81
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 06:36:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1627014973; x=1658550973;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=3lz8MbymE8EQtgpHtHsl7CRao9Tc1gPVAisNo3KRicQ=;
 b=DyVGiQtsdE25sf5/2OwwTv89IREx+9iH3StjlOiokO1bjHGOJZThGG2S
 CmhJaZ3MuikDRELlAPC4Pd+eOXPo86ROpVp2xUoCgWRvCaSHT/ApTM5kT
 o1/MCIg66MySXSxcXMUX9gZ+39RPexTPBmuHouNBkjeRozWKaf53FmOcu
 IU5Juwwu2AYd7CKYNE6lgj9Tzk7g2WTzvovjA6xT85536gU9dyRrucz04
 3J9+T6y1sSnPJp6TBwqZVVUycqwRFAjMGVcn2EGTkjr1Zbx/Gklx4pHBt
 fwLwo+u4jm8L9diEWfenXqUU55CLAr0smxDL3wbFthNKyxp6QYuD+44bX w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="35461510"
X-IronPort-AV: E=Sophos;i="5.84,263,1620658800"; d="scan'208";a="35461510"
Received: from mail-os2jpn01lp2059.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.59])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 13:36:10 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5wiP+s7VKaYH6AXDbjPjdR1s1PfvYsSgYGrnA7sZN2pvDRkSsFeMZ18xLBsDLwWSaUktX2tgtZqx5yiNUKrXT0BPvSNNSCVShQMht13QKUt8tUmasMM3wqlj7MH9hdgdrJNwltaOIIwEcvNZYqgD55NibQqbop1qPzS0dYJpMJzg7hJibO5e0EFmTK9GtDTbf5wvDlPHtKVWpfIpyYdklslAjyxVIrqN6YggVoZQg4FBPtkjfE+Bt5tP+wcWPsMvtXoZBm/X8sRBzk0EFJaeNLEHtSRWE9VEthoe226Nae7IFUi5z33OWwkBErCKWJNrKoFoH3ajVHW3Mxrgmvcdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lz8MbymE8EQtgpHtHsl7CRao9Tc1gPVAisNo3KRicQ=;
 b=ff0kYhtv1MLDnSXhgJ0rlHSoNy8G7YRLrJULgxUxnOp/4Za44BDqN4fXt5HSGa5hHOGiyN0N8D2cRXYyv+KT/MdC6Bkb49s4p9UFizmMKb5944XC1TGPRB9WKGlNsYeIfJwZDU9a1XZ+0vDuMAVZpGl61l0n/ulWIu+wjUtwpg/eCS+a0RvLeBsJckulT/jbDCaKVegQ1TLlKVhpAVMvwHMiQ9qjF8zxGqqNCnd0zATJEjVUfsxAOIiV1ADFn6ycPy86Y4+qkUg6TDtlf/mtow+LnO8PVJiN8dsM+xDRlcgc+UG93gz3TdxrFrJ7B6Kmo6PEvq6m7zoBXp5abL8jzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lz8MbymE8EQtgpHtHsl7CRao9Tc1gPVAisNo3KRicQ=;
 b=GMAN92mwEF8+ONAJGFJJS5uBT+/3KVhn6dbOdmc46ckv1fyvfV3F8/HUsKOqcXWHtsXGUFYJ1BAhbvA8zLJVoLtZNWRhQ2k9tvBikLOelOGzur/dH3NDDxWw6n5mQNL3Hi+sCsyLR7UQYsooLZmsvew5Lk6/HgtQx22tH9c19UQ=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB6284.jpnprd01.prod.outlook.com (2603:1096:402:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Fri, 23 Jul
 2021 04:36:07 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4352.026; Fri, 23 Jul 2021
 04:36:07 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [PATCH v3 3/3] syscalls/shmget*: Convert into new api
Thread-Index: AQHXaLqOfI/bHIZixUiPo+BY3ip3WKtO/bmAgAEpcIA=
Date: Fri, 23 Jul 2021 04:36:07 +0000
Message-ID: <60FA474F.5090502@fujitsu.com>
References: <YNM4rlDJLzb4xk6v@yuki>
 <1624512827-3256-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1624512827-3256-3-git-send-email-xuyang2018.jy@fujitsu.com>
 <YPlNzVze5T9r5qCz@yuki>
In-Reply-To: <YPlNzVze5T9r5qCz@yuki>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5597898-dc09-441e-b7b5-08d94d936350
x-ms-traffictypediagnostic: TYAPR01MB6284:
x-microsoft-antispam-prvs: <TYAPR01MB6284F9B5C81556225E2C672CFDE59@TYAPR01MB6284.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UFBj7UdPp4gIs86KpLN9ArKzruHQmeJB405dTXgx66RaZK11BJnojyWx/RHQzv11Ig4YAFWNPUeWHIi6HOZ5scyHMghzoG2ZGqvsh42MieDfCLHO+VTIo/MgCT93Jbys+PYq3SpkU0STpR9YZ7B5WFtxSLj218DPlPhLctq/Dqaz/F/o0YT5VYxyKasuke7JCT8PL/JrstXMdCMMaQLGFRJVYbUhKa8QH4h1HWjV4DbMHx6zEuNgHWDUH1RZ/vlFiHP8BtSvBROPa1tghm9TpcCFYtkMPSbQ6+C6SG8/xGwV6COLhkBBE2IuGdqIAFgToAcvMvi2A14oQ6veEctt70AmwkvAxmr/vQOzg/siAqs562F58Og5GVmlmfww+yXoeRarl3bKwQIhtn7KHhoHiJ7j+NVAsc4KWjwZvEZnxRpTMUj51Vcb9pz7WVVD+KNnM0hRDsv9UdbObvh0HuTD2cJ1rXByXAydXYO865gGE6aPc3UTqV29QK/g+mIcPCMmpacKgL1PB1JFZSYuhg/8g9OA/YIHVA4xENLgRha9eO37xxwoTXLl5ZT9H9M5tvrGJNa5JDWqFJxYlYjIt2m+58UClRfEHkfOZlYy6C7wKPfLkp4NF+FlsXqqc2RawKp+Sy0k9bqMZqWEqcYWdPrP+/gDt/rhxH/aRmZotnevle1dPCbaUo0joiqTuyU/IJVScaBWFuVlku+fJsYCF3hy6g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(86362001)(6916009)(26005)(8676002)(83380400001)(5660300002)(6486002)(2616005)(186003)(478600001)(87266011)(33656002)(8936002)(91956017)(4326008)(2906002)(6506007)(71200400001)(76116006)(36756003)(6512007)(66446008)(316002)(38100700002)(85182001)(66946007)(122000001)(64756008)(66556008)(66476007)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?a1NCWCtKY0VlWi9QbTV4MysvTTZhcFVFc28zT3h2Rjk0akVhSEMwMzFvWkdJ?=
 =?gb2312?B?dW5MeWF5bi9ibWRjVXdzNTEvNVVWRVdDY0ZkWlRtMUIxdGpEZnp6c1QvbkY5?=
 =?gb2312?B?dlB0SXp2Rzdzemt3MEs3citlbXJMUzA4UTVsV3hJQWpLZTk4QVV2eEt6Y2Yz?=
 =?gb2312?B?SDhQdlFCeHY0TGZlNkdtRDlrT1pTaVNOY3pNc2JsSmdHWmFMTmFNTGJhL3pV?=
 =?gb2312?B?UVhEWEozcDl0bDdXWmdxaXZabnhpdThSM3hDRU83QklCY2ZOQUdQa29zcW1q?=
 =?gb2312?B?bTJyOS9uL0ozZlVlV2lrTVF2RnRGS1YwK3JJUEpUWmsrL3duZG11Q3N2czg1?=
 =?gb2312?B?elZXMDRqRUl1Yy81KzVSY29tUTB0SkU1d2VpNXFTdjJxa1d3a2JITk9CRytl?=
 =?gb2312?B?RGZqV0Yzekd3VjdRSGVNUWIrRWs1TUN4d0lvcmxhSmtORk13emh4LzFxemdq?=
 =?gb2312?B?Rldua0w0U0hULzloV2J1VFpWSFNSRDZWN01LeGdWWVdhTDVUSVlhaHplWHBx?=
 =?gb2312?B?cTFUbHlIVEJXb25FaW1BL1ZFbVdNY3YwQTNLQi9GU0pZY3VRa1JBT3lmeEds?=
 =?gb2312?B?Wld3WThnVEh1VGtWQTl1cE0vV25MYU9LZVd6T2l0bkJ0VFF1UGplN0F0Q0du?=
 =?gb2312?B?Uzlkc0FtdlBLWkRNRVl6QVJyNUFDb3pSakM3VTBoMFh3ZHBNaFozNk10cDB3?=
 =?gb2312?B?cDI5Yy9qeWx2eWlnVEhZTEVtRHJJQ0ZUZ3dKQm9ZT2N6OHdsNlBxMkhoTEIy?=
 =?gb2312?B?NmNENUZOK1pvcmI3b0lZV0FWeFlnZTIrUDZSSUVtbFBjZHZDTGVsRmF1djln?=
 =?gb2312?B?MGtkWmpXNjNpbTc1WDZ1ZVhuQjhhYXNZL3pWSHpmY1FPZnN3djNiYm9rckRj?=
 =?gb2312?B?b0tRU2Q2WmlKRnRDNmcycHZvZVpQYUQ3OW91MXhIdWxUdFBscHdrczA3VkF3?=
 =?gb2312?B?ZjIrbmVNZWJLSXFGMFNxakwyczZ6Z08zY3NOUnRLKzM4SDNRQ3BBYlQraWVT?=
 =?gb2312?B?cGFoRW56TW8wMEpPT1dYZklOendIQ3phM0puM0JKL1FtdFdOTjkzajlDaTh0?=
 =?gb2312?B?Z1RLNitob1NFdmxHemtKSnBPZldPY0duNjZXbFZGMjd6R3ZNeXFmZW5ySFJJ?=
 =?gb2312?B?Uy93QjVEM3Qxa2dsVTVFa1YrWEFCZlRENTdGQkFVNlQrMXlEVlBPRm8ySUZE?=
 =?gb2312?B?VVFKWFFjOHByWVJHd3YxOFQ3NUtsQ2FpODVHeE53U3U0VHdGeis4U2E3U2pG?=
 =?gb2312?B?TlI1UmlOdUN1SDZqQTY2c3ozdkY5RWNCQ280TzNmNGh4VHEyeWZITW04Zm9F?=
 =?gb2312?B?VUFGakR2bnRDbE9wbjJlY0E4UmdkVnVXdW90MksvSytWbXdiTyt3bzBBdlNq?=
 =?gb2312?B?RjdOcGZic1oxbXB2emFmTTJ1WTRjYmtNbU0wMVZPNnV5STZDUjVEUVZBS0ht?=
 =?gb2312?B?M0VRdko2TVcrZFlvVEw4djZhN281Tm0rTXFRWDBldTBrSmpTbnUxY2x4S05h?=
 =?gb2312?B?SXRlcFd1b1FoaHJYckV6d0VVeTNkNnkzV1pQcFl6aHUwL0J0MGZ1VXdFZXoz?=
 =?gb2312?B?TUdjcjBOL3lCWDBIdE16TXUyM29kbnpBRjBFUlM0eHp1WVV1L3U3SEMxbFdv?=
 =?gb2312?B?czhreVNyY2o2Wk5vTk5vQUUrK2tzUElUcHFEOExac1Q2ckQ2UGN2aEFTZUtB?=
 =?gb2312?B?VDNwNlkvTUVZSEZGc20rQ2pYMTREbW92cDdmOEZCdXVCS1huemxnWXFiSGJy?=
 =?gb2312?Q?xD+y266NB1p7Vbsnh53W1bRa867E3fbMii2X2zW?=
x-ms-exchange-transport-forked: True
Content-ID: <E02E331D5FBCF445A2D0AC828FE12782@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5597898-dc09-441e-b7b5-08d94d936350
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 04:36:07.0644 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2oWhV1ZylY+0uFw1OkbkcLpYnSqJVpGi1RhdFVVKEAdoO4wSj90hfaqjPnLhGz3eQAx62vn7n/tD+GQBXfelfX8XeEWcPDelV2GWaWMlnts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6284
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/shmget*: Convert into new api
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

Hi Cyril
> Hi!
>> diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget02.c b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
>> index 4436ca7f8..6be8d8157 100644
>> --- a/testcases/kernel/syscalls/ipc/shmget/shmget02.c
>> +++ b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
>
> ...
>
>> +static struct tst_test test = {
>> +	.needs_tmpdir = 1,
>> +	.needs_root = 1,
>> +	.forks_child = 1,
>> +	.setup = setup,
>> +	.cleanup = cleanup,
>> +	.test = do_test,
>> +	.tcnt = ARRAY_SIZE(tcases),
>> +	.request_hugepages = 0,
>> +};
>
> We got some test failures for the ENOMEM hugepage test and then I we
> realized that setting .request_hugepages = 0 is no-op since zero is the
> default value when it's not initialized and we ignore it the tst_test.c.
>
> Thinking of possible solutions I guess that the easiest would be to add
> a special value that would tell the library to set the pool size to 0.
Yes
>
> Something as:
>
> diff --git a/include/tst_test.h b/include/tst_test.h
> index c7d77eb09..5f05e3a33 100644
> --- a/include/tst_test.h
> +++ b/include/tst_test.h
> @@ -125,6 +125,8 @@ struct tst_tag {
>
>   extern unsigned int tst_variant;
>
> +#define TST_NO_HUGEPAGES ((unsigned long)-1)
> +
>   struct tst_test {
>          /* number of tests available in test() function */
>          unsigned int tcnt;
> diff --git a/lib/tst_hugepage.c b/lib/tst_hugepage.c
> index 1d0e62e5b..ef93afc61 100644
> --- a/lib/tst_hugepage.c
> +++ b/lib/tst_hugepage.c
> @@ -34,6 +34,11 @@ unsigned long tst_request_hugepages(unsigned long hpages)
>          else
>                  tst_hugepages = hpages;
>
> +       if (hpages == TST_NO_HUGEPAGES) {
> +               hpages = 0;
> +               goto set_hugepages;
> +       }
> +
It should use tst_hugepages because set_hugepages will set by this.
I will send a patch to fix this.

I think the reason of introduced problem is that we don't add library 
test for 0 hugepage. Also will add it.
>          SAFE_FILE_PRINTF("/proc/sys/vm/drop_caches", "3");
>          max_hpages = SAFE_READ_MEMINFO("MemFree:") / SAFE_READ_MEMINFO("Hugepagesize:");
>
> @@ -47,6 +52,8 @@ unsigned long tst_request_hugepages(unsigned long hpages)
>                          goto out;
>          }
>
> +set_hugepages:
> +
>          tst_sys_conf_save("?/proc/sys/vm/nr_hugepages");
>          SAFE_FILE_PRINTF(PATH_NR_HPAGES, "%lu", tst_hugepages);
>          SAFE_FILE_SCANF(PATH_NR_HPAGES, "%lu",&val);
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
