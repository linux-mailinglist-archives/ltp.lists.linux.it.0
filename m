Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 672CA3566D7
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 10:30:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D0013C1DF7
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 10:30:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AA4E63C1DDD
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 10:30:40 +0200 (CEST)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com
 [68.232.151.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 82B4E6005D6
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 10:30:39 +0200 (CEST)
IronPort-SDR: r5noCxAfNxCP6lOmvkxzJf+2D45+wMRFzBqnHnzqNT6QHE+6tH3K0PTVyTCYnJ2dbWbd08Z62A
 9eIIXc23VZIGLbfin6v/iE7utQrsRLXRkyj1/IlD/nyHp+XmSQ8VqDzcvgIiSe3PMwzSIfPt6n
 ZaRGN8GvXkdVJoxiEdSUVTb9BN3ezqRro9ZaWZAtx0VlCqgYXYH7HM7ew2AZV8IRpQgu7gBIAo
 hID1HCZHPasxtOIuNvgqXFpOoA8O+P0blyKhjDZvqsBzAbGVj5GRQtg3eH4BBfFneiJDdFJxVF
 9gU=
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="37293006"
X-IronPort-AV: E=Sophos;i="5.82,203,1613401200"; d="scan'208";a="37293006"
Received: from mail-ty1jpn01lp2053.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 17:30:37 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=diJItN9GpUqAIzrG6dAIA598rLthnPUgV7yvlUvZCcwl3AiPVpfh3CZnKw7FsliDVa0dRZ5r+fp2F2dYtSEsP7797FWvjub47fTBPpyjd1b9ItAiPjpCXqI/9ch8UD1iRpzHL01K505nxjfDwhApN/BkcM5MxLBw/Vx6078thPIlEzzba/Aut6USHdcarApPAVzb9uv1St8moLgeIX3+M8KeIIKACKlglH44MpQrFBdzMOpd5sgmVAue6fVSWRUSW2c1SLatJYTRxoQiFU5U1emmMDQW/+fYbD+H41GV1GiegF209QnQRLap6LwclcoVWPunMtrZJSEHbrRbrA8FAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oa40xdxNckLNGRF0FG1zAoAp72quoMrdeLAWJBg8Zgg=;
 b=FwzWFmCo2bDmsR6Vu1ug2TyQGqrhhN2tgHxSUHuLNVWuHG1PXxGDn1jer+I45ywRmGakb+1ae7g5+CTYztqkV17I2sBK9jsG2VSTIjO37l/wY10gCu3E12kXcekDTGFEUl4rwNcqVMigWTJ3jz0m1t96Hz566HzzHxloOqQ7u8YeXIQlaqbZg/Dt7T1ATn8Ss8GKMyIJjiHOb+Nb6rOoc8P0JPSyujXPWaZQBdB5E4NCMLV/+lYiZ2pSVW/hT8cohOZYKAOr4EbBj+DEJ9ArCefqHtxDl28JBdyLPPv2J0ARReGWKtk3OmWNn0AKHq0Hc7kZ+xFvnCNl/+8CMNFJlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oa40xdxNckLNGRF0FG1zAoAp72quoMrdeLAWJBg8Zgg=;
 b=bs6mzyOTu8ITwbwAXT2ZbMHddMPQmQpnbQsW6m9ljeOkVEQH+9X43Z0H8413RFkx5OXVasIxBNnBccIQwOr8gsYoilYUgUMFSttyjWWHAYi+b6dKheeVB0WjX3beGdDFTlUbncc6XePfIyvA02cNGig0ksR0e3865aKNrcfOnbY=
Received: from OS0PR01MB6371.jpnprd01.prod.outlook.com (2603:1096:604:104::9)
 by OSAPR01MB2050.jpnprd01.prod.outlook.com (2603:1096:603:1a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Wed, 7 Apr
 2021 08:30:30 +0000
Received: from OS0PR01MB6371.jpnprd01.prod.outlook.com
 ([fe80::d890:a1e4:ea0a:15c0]) by OS0PR01MB6371.jpnprd01.prod.outlook.com
 ([fe80::d890:a1e4:ea0a:15c0%5]) with mapi id 15.20.4020.016; Wed, 7 Apr 2021
 08:30:30 +0000
From: "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Thread-Topic: [LTP] [PATCH v2] Makefile: Use M to build extern kernel module
 instead of SUBDIRS
Thread-Index: AQHXK4Sosy6pfiETHUyLkyaLzgRi6qqouXEA
Date: Wed, 7 Apr 2021 08:30:30 +0000
Message-ID: <606D6D9A.3020102@fujitsu.com>
References: <606D5E48.1060307@fujitsu.com>
 <1617786257-6032-1-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1617786257-6032-1-git-send-email-xuyang2018.jy@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd78ea4f-b1e6-4100-5c9c-08d8f99f674c
x-ms-traffictypediagnostic: OSAPR01MB2050:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB2050FFB227440D733E2C01AB83759@OSAPR01MB2050.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:229;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +CAJkfOi7A/wCRdoFpbKj5R6a0BzPNWKJdpB2p5TEfelYLiAxVMl21maUnkj6xu7J7EZjnmkuqJxzxY/w/QoEL1Pa5++NIUam5F0QaFnRdz+kANijx2P5P+eEhMSDIJnHIxtBLYwcr37nM2ShFvkU95ZqA7Bin/fMJ7+1YXCVMN3wqpcDWd0YuNCtGAjhZbZbH/vfwFUMBHGmmpD0g9qltmGHOmvsM0tbCRxNBXOAZUL07LBvBU3qTaKMVe4GuAS86GiLJSy50j+zPGQxrmQ4bM5plzxNS0ExeNSBUegwDOVx0r3//r/uZ4I69ncKJ/ymO2hq55LTa4KbQ6PhgcSwF+QoF23x5jlfC9Qm9zhrl3g1iiN7rtI33rYNWHfu8e1QO6hi0nkIXBkfwyAO+wBDaquA91btLsvCZbgIkgR02YNI9cCOF8ZOHiZu2qQ3GprgrKr3OZ9X8Nzdnvv6HvFWWLKWCGxjeY8nNrSVMmBM9GSsH1Ww2tfZo/VR0Xr3oe7xYpq88YHxVbNH8qlTwZDQtCz1QFxotwHkcaYxSK0k5M++cpNIRPIbeg1QdSLAAkeaJNfXrEtI8VgzrE5w5hv2Dgg1ha5r5iDXt2OOcho6pbVYlXoBcFitDln9+lSWR9E2c/+9G0ZGG1aEeRO4JYG3Z5Q52k4oVM+z1e9X7sw2XA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB6371.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(5660300002)(186003)(85182001)(6862004)(91956017)(26005)(66946007)(6512007)(6636002)(71200400001)(2616005)(2906002)(76116006)(66446008)(64756008)(66556008)(66476007)(4326008)(478600001)(6486002)(38100700001)(87266011)(53546011)(6506007)(8676002)(8936002)(33656002)(86362001)(37006003)(316002)(83380400001)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?WmIxcVdZVkxteGgxRUhJMW5KbWZ4Qk81Q1RMK0ZiNlhkQ0Y3QTkyUHFaeGY0?=
 =?gb2312?B?SEEyYk9yQTBBOXdrSGRCSjBaM2FVY0Y5T3ZQNDRyR0NjT1hyNlRqcHpFZWlZ?=
 =?gb2312?B?VU9FNTRGczl5US9WZWVqeEdTN0ozZlg4aFkxR2Q1RE9HZzJocElUc0xnenE0?=
 =?gb2312?B?bERQRk5CcmtnWVNqSWdtTnMwNjl3alNjM05uZFdMK3dsd1I3UlljcUNpb0dx?=
 =?gb2312?B?czk0UHFhT2ZZTVYvbWxuRndiajZ3aGtjSFJ1OFJNTXVCbFRDcTEvUFRQTHM0?=
 =?gb2312?B?a2gxdGlCZGNibFNIaFV2ODUyc0cyZUlGMXBoQ0FrUFpGY09pWWw1Q0N2aDNE?=
 =?gb2312?B?UWtGZUxvY0Q5OVAyZlQ3VkJSeWhjTytWM3haOFJEMDRIMjhYWkxhdGVrM3RI?=
 =?gb2312?B?ajBnUUZraXdxd3BmNUx3bHYrcisxL1M1WXlEV0psTHU0emIzRU5FUHMzWlBB?=
 =?gb2312?B?NWF6Znp3dk94SmY4cEVMWndpMWlxclZBQi8xZ0lyd1UweFBFTVJMUm1CeTFI?=
 =?gb2312?B?R2I4amt6RHZ0R21KQ2x6UUJaTEpBUE54OGZDQWNsK0U5aWYxeldnTmsvSmlP?=
 =?gb2312?B?TUM3TXNORXl2V2FmMXNFV1l2M09GaWJCdTZiMFoyRDB3bWdxQWZ3Q0VjNXJK?=
 =?gb2312?B?cGpHV0hRUldmNnZvMitHUGJ2U0Z4bU1WclVjUzJpSWpLaEJGK1hTeVpab0d6?=
 =?gb2312?B?Qi9GNFZ5MkY0Tzhxbi92VFJKKzhNbDNEeVhrS2pEUUdtcGpSNWNrSEt4cmtr?=
 =?gb2312?B?L0pBUFJKUWpUZ2x3TUxYVVZuYmhpNnhoQmcyZ21pNU9BSkZGRTFvZjF3UTFT?=
 =?gb2312?B?bVdVVFdEdENjZC83eXFBREowdmhxaVpjSFlETGhPWWlVem5qV1k5RVh5N0t6?=
 =?gb2312?B?UjJXa0pJT3VXeHhtY3duOUUzQW5FZEt0N3ZZZTlUVGRnVnZ0N1h1Z2trSXl4?=
 =?gb2312?B?NlRQeDF1dU9YNGJ0RzA4VVd2RXBpOUhaTTVKbmFUUks5S0Npd2VSSFJEQjJj?=
 =?gb2312?B?akZWTFlZQjFNako2ZjA1bFZiZmh6UUszZFplWjFwMmV6Ymw5a2R2OTRVZmlS?=
 =?gb2312?B?YURrUVQ3T1VHS2d2UXowREFFVUVLcmJGbkp5RUI1dU5RcVFUa3phQ2RCWGVB?=
 =?gb2312?B?ckR6bTJ5MVlWcWJ4Wld2bGQ0K08zcG5CazJuRTRqaHJkdndpaVJQK25UeEJH?=
 =?gb2312?B?d2gyZzhwakFsR09rNGlYYURyMDNoNzJCbGVSNEdGZ1JwaDYzcC8yODRCYmJn?=
 =?gb2312?B?MDV3cW9uWFM2Wk9jQytDMngrUmZmbW0rOTU2WU5oWUNDL1ZoUGFtVlFBK1pX?=
 =?gb2312?B?d0V6cFZkN2lNSE1ZelBjUzV2dmtwSlQ0THZ3T3hFMHU2enBBdFRXQmlUb2JT?=
 =?gb2312?B?KzJma290ZElBK1Z4TEJVVWd5cnhPaThWRnM2NHg3TTllSURBREZuYStEb0U1?=
 =?gb2312?B?REdKeE0yZU5kQ3o0R21XaG1wZXJyN0NpeHh5ZGNSR1FpNmhtVzZzWWowd0xp?=
 =?gb2312?B?eTNDL2RsUDVYc201T2tkQmo1TEZvbkZQNUdkZkVIdGhvUEFzTjdRL2FrcmRn?=
 =?gb2312?B?TllFZ1c3bDBTT0pNa0pPdlBjRXB3ampQZi9DUXdTYjVCcE01WEFiWVRkeGty?=
 =?gb2312?B?RU4rbGdrRDRxT0RyVFNUTXdxZ1RxVXUyTGtQd0NuMjZ4V3pvaVVPaDhYVFZp?=
 =?gb2312?B?RXU2ZHpRelF0cjMyTng4NDZNYWRrUzBNanZRNWZ6K1FoajNyNnBVS0xMc2JL?=
 =?gb2312?Q?EJZxwru+26/TjFupL/LBvdoevgslUfJsfvdi0Uf?=
Content-ID: <FB0ED127B878964790A9C6703DB5AF44@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6371.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd78ea4f-b1e6-4100-5c9c-08d8f99f674c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 08:30:30.0461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IxjzC8DBHpDqksmvs5sXLoA4UKShkGG56z/w1QxRovlN6ZJCm9xhxMRVABcxHKenGGAg/8AXeVWkUbnQ9yNVaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2050
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Makefile: Use M to build extern kernel module
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

On 2021/4/7 17:04, Yang Xu wrote:
> Since 5.3 kernel commit 7e35b42591c0 ("kbuild: remove SUBDIRS support"),
> SUBDIRS has been removed. We can only use make M=dir or set the environment
> variable KBUILD_EXTMOD to specify the directory of external module to build.
>
Hi,

LGTM.
Reviewed-by: Xiao Yang <yangx.jy@fujitsu.com>

Best Regards,
Xiao Yang
> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
> ---
> v1->v2:
> add mssing .../dev_sim_framework/kernel_space/Makefile
>   .../kernel/device-drivers/agp/kernel_space/Makefile    |  4 ++--
>   testcases/kernel/device-drivers/base/tbase/Makefile    |  4 ++--
>   .../dev_sim_framework/kernel_space/Makefile            |  4 ++--
>   .../kernel/device-drivers/drm/kernel_space/Makefile    |  2 +-
>   testcases/kernel/device-drivers/include/Makefile       |  4 ++--
>   .../misc_modules/per_cpu_allocator_module/Makefile     |  8 ++++----
>   testcases/kernel/device-drivers/nls/Makefile           |  6 +++---
>   testcases/kernel/device-drivers/usb/tusb/Makefile      | 10 +++++-----
>   .../kernel/device-drivers/v4l/kernel_space/Makefile    |  8 ++++----
>   testcases/kernel/fs/scsi/ltpfs/Makefile                |  4 ++--
>   10 files changed, 27 insertions(+), 27 deletions(-)
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
> diff --git a/testcases/kernel/device-drivers/dev_sim_framework/kernel_space/Makefile b/testcases/kernel/device-drivers/dev_sim_framework/kernel_space/Makefile
> index e7e7be607..ccaf3f9ac 100644
> --- a/testcases/kernel/device-drivers/dev_sim_framework/kernel_space/Makefile
> +++ b/testcases/kernel/device-drivers/dev_sim_framework/kernel_space/Makefile
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
