Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AF8356530
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 09:25:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17A873C1DF3
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 09:25:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A1EA63C1DDE
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 09:25:09 +0200 (CEST)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com
 [68.232.151.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3D791200961
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 09:25:07 +0200 (CEST)
IronPort-SDR: R1IGq+ehnh9CWVXfSQvmBqOj5UnNKSxN6extGwSa1M480YgMgT1gtIBVKq5L8++7Tbnx2GcSGD
 Xrm5dDbC82b7n0X9l7y25t6dQlwOUk3boQHnU4B3WPsEl2iGWdBKojsw7eQk8+gYySjQck/kB1
 qoLQ/1uDaf8CrMzAFY1PZyVUssZk/3GZIhTKisDmlOkSW0ZKlXVkzyPFZ2wTNgo8VcJzsZM8T+
 K/DH8CbpRiaM+MUcaypjqw41kXWppxe7scpc6tF3yganag2Ata7U0cZI23OXhNKL67vgB/2R6J
 WKY=
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="37287108"
X-IronPort-AV: E=Sophos;i="5.82,201,1613401200"; d="scan'208";a="37287108"
Received: from mail-ty1jpn01lp2050.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.50])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 16:25:05 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhnGyrblJY2wJYmG13ITcIF8JohFmGMQvSUaVft7sRZAWMjg4ExXMu6GzVWJ58dYgg2XTZ3C/X8/cyJPVMpU7ctQoyKToKnuXl8OEC9EWs7xxcOtWE88AhMdZ8bURH05aeB8Qw3bNY/SquBvz8GGsTSwjCvMsNIW8UBOL+W6JsUIMt3V+NYzeIjBNYvVuHtPHrWGZqXXk4L4O/isWQi2vVXed6ixz3o/2ZbwIMeasN6d72A5Ij2kFVeZnKzm1xzWbhob7QkKZOWnVrNVUaNiBJ1aU3ZLkeu3wTSlVGkFhrSSixnH7V5swQUWUBMzC+2d320FdBBQf/4P3jz4yYAQpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0/SedaAzp4sHpxt4vnjcuZKkcNidYRuGlnn4d9IJ4A=;
 b=nMuU+DoVrw4S1ME1+QDFWAAvZQl43blsqgwVLFJj6OMrDCpzqka/yaLLGjAXgxiYpnuGEcu+xRrKIMeBh4Ur891nK1sLMvbfVfg+XRLNDaWieWUQ6yuENKgCQ4wtN4ZryXZBxYcx+mFMgxzXZvHj1GtJBERh9KwyveRtKO9OoQlWhBqRrXE55i9/yt8ODb9QnIAWOhg9N/Je+3s95csW115DTV6OMm3eXTHP+WmTr3lUefGxoe7jIS+psx/uKZDBzmp2tjN2pp9JWDqYexMpwdRbcbktX5G0rMaPKKK/WSd3UAWmawxUj7ffADWuMxuYMmOlpt0Gh7GnYxpR8VO2rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0/SedaAzp4sHpxt4vnjcuZKkcNidYRuGlnn4d9IJ4A=;
 b=QotPbqiiSytWgoPSmoXHzhUUTXL8HUgB6GnK8s13ZICpPbrLxnmDR4MtEkS1N4dVn+JxSkrtBcNCrCHnxA+OxwkaPU33I2K+QBTiLR5UJGKNfIpjxetJb/sI0r0bBbx7bqYCDAHdn1u+Gf/E8AwRMXoBQY9cx7lTZZgxq9gljkw=
Received: from OS0PR01MB6371.jpnprd01.prod.outlook.com (2603:1096:604:104::9)
 by OS0PR01MB6372.jpnprd01.prod.outlook.com (2603:1096:604:105::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 7 Apr
 2021 07:25:03 +0000
Received: from OS0PR01MB6371.jpnprd01.prod.outlook.com
 ([fe80::d890:a1e4:ea0a:15c0]) by OS0PR01MB6371.jpnprd01.prod.outlook.com
 ([fe80::d890:a1e4:ea0a:15c0%5]) with mapi id 15.20.4020.016; Wed, 7 Apr 2021
 07:25:03 +0000
From: "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Thread-Topic: [LTP] [PATCH] Makefile: Use M to build extern kernel module
 instead of SUBDIRS
Thread-Index: AQHXK2yuyDpxLjx35EugRekhxQIYbaqop14A
Date: Wed, 7 Apr 2021 07:25:03 +0000
Message-ID: <606D5E48.1060307@fujitsu.com>
References: <1617775951-3717-1-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1617775951-3717-1-git-send-email-xuyang2018.jy@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1283c772-a45a-4712-7773-08d8f9964307
x-ms-traffictypediagnostic: OS0PR01MB6372:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS0PR01MB63721635F205A1B0537EB00A83759@OS0PR01MB6372.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:331;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0qW1KKgIMGzlEbHb2vBGYdqTgqM1qIAmJ0Law3sdUJ1JFpgAq9KQRIZYQx+Y8Wz5JxFLFDZ877MFZkYpWwtUpPSSWnrm/a9OF01ggawxBVu9bco/AbdmJ7buKFiOWe2/mhpcZwjqaCR6T0sEpikZtR0YgobZbRGZVpGFIiATB4ntnV/825TQy0q6A08L6PPv07ywDgikXAZem2qcWddObY/FiOlyU7GchyIZTiXIuwXlpgEvvUNZCb0X+lscjGDiBGx6wl2erdnGQ17JsYRu0OgBMN5CtrpDW/f4kXsWMgk4V3yqwRcKobXb1FbqR+nxH/eu+hHyh3cjaGBGc6jQ7IqavqDkUxSRCishU/T7Fv+0f6d3KJH8AsENok9SF1drIY1H0R3Way/IsMJpb4q386B3J2ZYJrYy6Xm+FPDSBz+ylmGdjcvQIFPQHBGMmWGBTRl9KgscpKe0Yoxslx8he3pl5j3jBQZhyuSOAysrTm81Gyqlu6+cEOqt/RUyhz2msw9DBu5tA45nNTPnZRK7UNZTUQi0lSO1/iee2oB0jtnEew4P0m8H8ctdHCBm68gJ0RaLAcEQMD1/kb0NowEn/lWHjRw5/id4rkjiKpjfJ2iUTZ4gPIPr7aEfq6530G8Wj3KOP73w/oIfyU7bs2cDlXLmUtmNILsnlcbzstmBzAw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB6371.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(6506007)(53546011)(85182001)(8676002)(8936002)(6486002)(83380400001)(5660300002)(4326008)(86362001)(87266011)(71200400001)(2616005)(37006003)(66446008)(76116006)(64756008)(66556008)(66476007)(478600001)(316002)(36756003)(186003)(38100700001)(6636002)(2906002)(6862004)(66946007)(33656002)(91956017)(26005)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?ajNmRStGRW54ZlgzVVhnTGtRVnpQZmt0MjlHQkZDakhDQnU0TytEbUpIdFhk?=
 =?gb2312?B?Q0NOVmpUR2c5M1Q3SU16ZS9kdzkyVS9ZOVd6Ykd6NDVLRUdWUVArNVhBVlZy?=
 =?gb2312?B?TWdFaStDSlhXTkg5T3N1SkZkMlo4MEkxczFEKzlmN2FwSEtFck9zYzBHSEN5?=
 =?gb2312?B?SlZMSUsva0xZVGJ5NVdjWTAraXVpRHBaU2dlV3lkR052M21RNmRNS1JIdE1N?=
 =?gb2312?B?MUhiYTIxcjM3eWFJRGFzWEhjVU1Rb3NtRk51TUkvdmh3K2RwUm94NE5qSDhV?=
 =?gb2312?B?ayt6QXNxa084VmFnSzlRazBhOUV4R282bXBqSnh3VGIrb2s2VFZJNUZmOUl6?=
 =?gb2312?B?QlIwSVUrNy9EZjdkeWdWOUxUYmRDdVBOTktyODBXQ3hSdFBmSi8rYnFCTmFz?=
 =?gb2312?B?N29NSk5zclZkbEFCRUZ0RDdheUJuSlNKa1pXUi9lMXA5czZOdFVCYlhwU1Vo?=
 =?gb2312?B?bzhSQnN4T3UrUTc4WXVvaFA2c09MSTIyNzJESHp2VVRENUxNaDNIRDBQTFl4?=
 =?gb2312?B?Z1d5M3JOTUpjdEpjcFdlcEIvek12WTlsYTJyS0xiL1dDVUR0ZzREanpyK21a?=
 =?gb2312?B?VUwzQnRSMXNZUjZhSy91Y25NYy9uWmdZUE90VEVYV0FXN1llUlQxd1l3NG1a?=
 =?gb2312?B?c215MGRVMUlibm16SytxNGtYNlN3aDVJYk5oZCtSTVNaSlVJMjNrR2dxYmd5?=
 =?gb2312?B?MG5KL2tpN3c5T3VPbE1XQkdEd0x4ZXlaY2RyN3ZKdm1qdVp5ZkNmcFhXT1Rq?=
 =?gb2312?B?WGU3dy9iV0RPZnJmMERSNkQvbFFVTHZNbUtncDh0MldzMDlXd09jZmZxNzFk?=
 =?gb2312?B?ZlErZ2c5VGtBNU5CM2lpZmhSRGpYS0F6TnZmZkRmRk1KZk16aS9GbEJ6U2hF?=
 =?gb2312?B?VEFwWWFBU01nYkZJTWhsaXVlcjRZUDVQaEpGaUwxODF1bWM2bXpZbHlhYTBj?=
 =?gb2312?B?VS9xaTNFcnN4bUY1ai96cVpuU3Q3TC9JeGNRbzQ3UzhmYTczRjR3UVlPNmgw?=
 =?gb2312?B?QmExRkRBL1oyOUM4K0lubnUwSVdDaEFZMmxmc2Y3dndvbGRWaWVSMWZJRk5O?=
 =?gb2312?B?Ylh0VE9FNDFrZzBPeHNmMUVtR0R0Y0I2OHNGWGpWa3ZhZlZsd1J2aUdpeWZY?=
 =?gb2312?B?ZHROMTBjWFNBcGg2VFBVcnMyRW1iUXpvUTBRMVd5TFMzM3hZRmxsdCtLSXRN?=
 =?gb2312?B?ajdtN2pOWnM2djRSWmt5czdYbDNoNWtNNVJEOGFjd0FmRnBsNWRtaWF2Tzhl?=
 =?gb2312?B?SU1ld3ZTcEdNUkllUzlqYXdzeFUrWlNadVdkUjE3OWZ1Z3NwNWw1MmtrcFZx?=
 =?gb2312?B?SnUybXJ6QWQxUHdBREk1ejRaNWZndTRwWnJhZFdSRzZRMmlKK2l0TDNTcWdt?=
 =?gb2312?B?RFVQd0RxZC9ZbHRzWWVGVnF6SUhBZ1J5eWluN1lvN0w2QysraUJlb2J6NUhV?=
 =?gb2312?B?V3NTaVNLOEQ3QWdqbnRBTDhkUTZ5dEZWeFgvQ2tkQnh1WmEyN3JiQi9BdlZs?=
 =?gb2312?B?WE80c2dSb2Z2WWZhMURqNXdoZktvTjBvVVJZTEdsanExbURzRThwSmRMdEU5?=
 =?gb2312?B?QmlFT2hOMWk3bCtWREd4UlczVTFRSUFlWDdNNlduNHZmQVdFNUo1eUkwNkdo?=
 =?gb2312?B?d2FvSkU1aGw5VEJlcFRjc1Y5ekIvWk5mSVRzZ0F3T2o5amhpZjlRT0xOeUw3?=
 =?gb2312?B?MmFrQlBFUXc0bnZtZWdlTnZNc3NaQ3RIVGN3RG5WN015M1c2T2NEM080czY2?=
 =?gb2312?Q?YGLSMGP0P+9h0DK3vnxOkByLEp5nmbdWLEqN13p?=
Content-ID: <F1A01C81AE897D4D966B5AB2D48DE69F@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6371.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1283c772-a45a-4712-7773-08d8f9964307
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 07:25:03.7251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ACraw6wRF6e1PS8FLg7bhxAjqSxOkr7sovAmGxT+QTglPERagxQwChnJbQdoZu2ib+mUYVmq+OZFCIvUNcqCZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6372
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Makefile: Use M to build extern kernel module
 instead of SUBDIRS
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

On 2021/4/7 14:12, Yang Xu wrote:
> Since 5.3 kernel commit 7e35b42591c0 ("kbuild: remove SUBDIRS support"),
> SUBDIRS has been removed. We can only use make M=dir or set the environment
> variable KBUILD_EXTMOD to specify the directory of external module to build.
Hi Xu,

One missing Makefile:
testcases/kernel/device-drivers/dev_sim_framework/kernel_space/Makefile

> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
> ---
>   .../kernel/device-drivers/agp/kernel_space/Makefile    |  4 ++--
>   testcases/kernel/device-drivers/base/tbase/Makefile    |  4 ++--
>   .../kernel/device-drivers/drm/kernel_space/Makefile    |  2 +-
>   testcases/kernel/device-drivers/include/Makefile       |  4 ++--
>   .../misc_modules/per_cpu_allocator_module/Makefile     |  8 ++++----
>   testcases/kernel/device-drivers/nls/Makefile           |  6 +++---
>   testcases/kernel/device-drivers/usb/tusb/Makefile      | 10 +++++-----
>   .../kernel/device-drivers/v4l/kernel_space/Makefile    |  8 ++++----
>   testcases/kernel/fs/scsi/ltpfs/Makefile                |  4 ++--
>   9 files changed, 25 insertions(+), 25 deletions(-)
>
> diff --git a/testcases/kernel/device-drivers/agp/kernel_space/Makefile b/testcases/kernel/device-drivers/agp/kernel_space/Makefile
> index 5357c135e..5a10064f0 100644
> --- a/testcases/kernel/device-drivers/agp/kernel_space/Makefile
> +++ b/testcases/kernel/device-drivers/agp/kernel_space/Makefile
> @@ -14,8 +14,8 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
>   PWD	:= $(shell pwd)
>
>   default:
> -	$(MAKE) -C $(KDIR)  SUBDIRS=$(PWD) modules
> -#	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) modules
> +	$(MAKE) -C $(KDIR) M=$(PWD) modules
> +#	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

Is it necessary to update these comments? In other words, could we 
remove these comments directly?

Best Regards,
Xiao Yang
>   endif
>
>   clean:
> diff --git a/testcases/kernel/device-drivers/base/tbase/Makefile b/testcases/kernel/device-drivers/base/tbase/Makefile
> index 6f7e5e2c1..5e5a40e61 100644
> --- a/testcases/kernel/device-drivers/base/tbase/Makefile
> +++ b/testcases/kernel/device-drivers/base/tbase/Makefile
> @@ -13,8 +13,8 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
>   PWD	:= $(shell pwd)
>
>   default:
> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
> -#	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) modules
> +	$(MAKE) -C $(KDIR) M=$(PWD) modules
> +#	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
>   endif
>
>   clean:
> diff --git a/testcases/kernel/device-drivers/drm/kernel_space/Makefile b/testcases/kernel/device-drivers/drm/kernel_space/Makefile
> index 11e54d9be..24b768d76 100644
> --- a/testcases/kernel/device-drivers/drm/kernel_space/Makefile
> +++ b/testcases/kernel/device-drivers/drm/kernel_space/Makefile
> @@ -11,7 +11,7 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
>   PWD	:= $(shell pwd)
>
>   default:
> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD)  modules
> +	$(MAKE) -C $(KDIR) M=$(PWD)  modules
>   endif
>
>   clean:
> diff --git a/testcases/kernel/device-drivers/include/Makefile b/testcases/kernel/device-drivers/include/Makefile
> index c9810ba5e..72d7293c2 100644
> --- a/testcases/kernel/device-drivers/include/Makefile
> +++ b/testcases/kernel/device-drivers/include/Makefile
> @@ -13,9 +13,9 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
>   PWD	:= $(shell pwd)
>
>   default:
> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
> +	$(MAKE) -C $(KDIR) M=$(PWD) modules
>   	${CC} -Wall -o userBlockInclude userBlockInclude.c
> -#	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) modules
> +#	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
>   endif
>
>   clean:
> diff --git a/testcases/kernel/device-drivers/misc_modules/per_cpu_allocator_module/Makefile b/testcases/kernel/device-drivers/misc_modules/per_cpu_allocator_module/Makefile
> index 3bc274dad..ae802f77c 100644
> --- a/testcases/kernel/device-drivers/misc_modules/per_cpu_allocator_module/Makefile
> +++ b/testcases/kernel/device-drivers/misc_modules/per_cpu_allocator_module/Makefile
> @@ -9,16 +9,16 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
>   PWD	:= $(shell pwd)
>
>   modules:
> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
> +	$(MAKE) -C $(KDIR) M=$(PWD) modules
>
>   clean:
> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean
> +	$(MAKE) -C $(KDIR) M=$(PWD) clean
>   	rm -f modules.order
>
>   help:
> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) help
> +	$(MAKE) -C $(KDIR) M=$(PWD) help
>
>   modules_install:
> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules_install
> +	$(MAKE) -C $(KDIR) M=$(PWD) modules_install
>
>   endif
> diff --git a/testcases/kernel/device-drivers/nls/Makefile b/testcases/kernel/device-drivers/nls/Makefile
> index 172510fe8..a1fab20f8 100644
> --- a/testcases/kernel/device-drivers/nls/Makefile
> +++ b/testcases/kernel/device-drivers/nls/Makefile
> @@ -12,12 +12,12 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
>   PWD	:= $(shell pwd)
>
>   default:
> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
> +	$(MAKE) -C $(KDIR) M=$(PWD) modules
>   	${CC} $(EXTRA_CFLAGS) -o userBlockNLS userBlockNLS.c
> -#	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) modules
> +#	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
>
>   clean:
> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean
> +	$(MAKE) -C $(KDIR) M=$(PWD) clean
>   	rm -f modules.order
>   	rm -f userBlockNLS
>
> diff --git a/testcases/kernel/device-drivers/usb/tusb/Makefile b/testcases/kernel/device-drivers/usb/tusb/Makefile
> index 9488cd563..4dcbca36c 100644
> --- a/testcases/kernel/device-drivers/usb/tusb/Makefile
> +++ b/testcases/kernel/device-drivers/usb/tusb/Makefile
> @@ -13,17 +13,17 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
>   PWD	:= $(shell pwd)
>
>   default:
> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
> -#	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) modules
> +	$(MAKE) -C $(KDIR) M=$(PWD) modules
> +#	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
>
>   clean:
> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean
> +	$(MAKE) -C $(KDIR) M=$(PWD) clean
>   	rm -f modules.order
>
>   help:
> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) help
> +	$(MAKE) -C $(KDIR) M=$(PWD) help
>
>   modules_install:
> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules_install
> +	$(MAKE) -C $(KDIR) M=$(PWD) modules_install
>
>   endif
> diff --git a/testcases/kernel/device-drivers/v4l/kernel_space/Makefile b/testcases/kernel/device-drivers/v4l/kernel_space/Makefile
> index 56e255b04..549c37d5c 100644
> --- a/testcases/kernel/device-drivers/v4l/kernel_space/Makefile
> +++ b/testcases/kernel/device-drivers/v4l/kernel_space/Makefile
> @@ -9,16 +9,16 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
>   PWD	:= $(shell pwd)
>
>   modules:
> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
> +	$(MAKE) -C $(KDIR) M=$(PWD) modules
>
>   clean:
> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean
> +	$(MAKE) -C $(KDIR) M=$(PWD) clean
>   	rm -f modules.order
>
>   help:
> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) help
> +	$(MAKE) -C $(KDIR) M=$(PWD) help
>
>   modules_install:
> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules_install
> +	$(MAKE) -C $(KDIR) M=$(PWD) modules_install
>
>   endif
> diff --git a/testcases/kernel/fs/scsi/ltpfs/Makefile b/testcases/kernel/fs/scsi/ltpfs/Makefile
> index 7c46a4c4d..5f4030661 100644
> --- a/testcases/kernel/fs/scsi/ltpfs/Makefile
> +++ b/testcases/kernel/fs/scsi/ltpfs/Makefile
> @@ -14,9 +14,9 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
>   PWD	:= $(shell pwd)
>
>   default:
> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
> +	$(MAKE) -C $(KDIR) M=$(PWD) modules
>   	${CC}  $(CFLAGS) -o ltpfstest -lm  main.c
> -#	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) modules
> +#	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
>   endif
>
>   clean:

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
