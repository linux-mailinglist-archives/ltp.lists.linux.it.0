Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F2434C1FE
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 04:42:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 038BA3C6121
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 04:42:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EC2D73C1A28
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 04:42:24 +0200 (CEST)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com
 [68.232.152.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A4EB860005D
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 04:42:23 +0200 (CEST)
IronPort-SDR: eM9cOzldcJ3N9MAy++blathXFtaPualSKGKy/hbO/vwN4qNAhHBH3dsxG2f4m3b79YGO0dVkoU
 WjIzCJ8Xk+xcHsPGIyJ9mVj5SxpaAFqwDlWGZfAepxkAMEhkv9Gj14eHsfUgzMxIiQfupvEmhU
 AtB3LYuq2Tc+MGbgh956wZ1Vex6fjItSxR6XiJPXQFfWFxh9NALLg0APg/C2L+Pecj0Df+fvkG
 BAAejemevH3geDWOmpua8N0K7caz1NiYi8MYGSflnHqC9eP6SM4DG/mGFqG8BRbo4ZBa8Cnwq1
 pw8=
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="36866165"
X-IronPort-AV: E=Sophos;i="5.81,285,1610377200"; d="scan'208";a="36866165"
Received: from mail-os2jpn01lp2054.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.54])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 11:42:21 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOaFDiPfm6b9ousguAhU4TL0Voj06305jMbHZ7hLne0fPJkS+ANyfWxmyg9iu162rNQ6RL01b+Wz+QkqUCYeXZm1s2+rd+LiErQwHm3KjMR2ya+wO1/zNdjZH0zMd8DisA1Y6byQHTAPtVBZ+Ekjps5FXKsmjyTa0dn3ttLQiBB4aqWPgbOl+9zwBdWj+XHWjNsXq5YX/04Gej4E/a8VnKiHh0T1r+yDfRp+VEk3zx/kXqp4+fkMeNl6GOQ7v41HaxR3lAmuWBinUPZpcY/nfSchJRklrpoLpuEaujsBL0i3MLv5OAR8hCAt4Ztmuv8Fp14H+2ZZUXym1ufzfVie/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MK8wTQ16o9PJQ8aVOufQhgNG40RdThAKZU3HJMC58+8=;
 b=k/pv5QYosIMzgHZWh8ESoU/7fqFVvlVpq1g/iEURhe5QTFFj19wFI2JH2vmxdvpAtpJDkgiDyVzaVH9Nm+XcikTyRNJ3V/F9e9g7wthGecHLe+sM/eaJVibsba0/dyOKr2pttidYs3wcdbgZ0D9SK/ROHxGl+ooepivQ2cFRuXtG5FPCi9yMN08/Bxc3nULWVZ/U7Rif0bUUCKwScOGBoWeZ7mOP4tzD9JhzbMeIwgiTrUx8zuntJCy3IxrhT3PakHuJwhpoUowhInO4WvsP1iJ4ob7INShvO2dQa5qToyEHhR+GRxYP7okvUPRlcgbUro0mLftKsj4bu4gH3KHndA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MK8wTQ16o9PJQ8aVOufQhgNG40RdThAKZU3HJMC58+8=;
 b=Bm+WasC6JCZYMzr0hcjrMnePzj0l/7rzpu/SkTWWp6nYGefNmx2bgyE5k/HFHT/uZ97WVhksG6b/p3i9ie6Rtq6sE2J8ztGmkndVFHJ3h7J/xJKyLajb3B92fFWicYEEMfEUHftqREVEe3sh+JU6OjSftZLmMGAt7LXk8YrIDAk=
Received: from OS0PR01MB6371.jpnprd01.prod.outlook.com (2603:1096:604:104::9)
 by OSYPR01MB5416.jpnprd01.prod.outlook.com (2603:1096:604:81::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Mon, 29 Mar
 2021 02:42:18 +0000
Received: from OS0PR01MB6371.jpnprd01.prod.outlook.com
 ([fe80::d890:a1e4:ea0a:15c0]) by OS0PR01MB6371.jpnprd01.prod.outlook.com
 ([fe80::d890:a1e4:ea0a:15c0%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 02:42:18 +0000
From: "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>
To: "ruansy.fnst@fujitsu.com" <ruansy.fnst@fujitsu.com>
Thread-Topic: [LTP] [PATCH 1/2] syscalls/chmod0{1, 2}: Cleanup and Convert to
 the new API
Thread-Index: AQHXFw0Z5LHfEanxE0GA61OMP3kcvqqaXCmA
Date: Mon, 29 Mar 2021 02:42:18 +0000
Message-ID: <60613E89.2060306@fujitsu.com>
References: <20210312065757.380144-1-ruansy.fnst@fujitsu.com>
In-Reply-To: <20210312065757.380144-1-ruansy.fnst@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38529cee-8bdf-46ab-3fe7-08d8f25c455d
x-ms-traffictypediagnostic: OSYPR01MB5416:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSYPR01MB54162244D2B3B95BCAA7E95A837E9@OSYPR01MB5416.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:71;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /P73tP/2yA92xt3tb7nmV3yBCNJXeJTpK/5B4uVuudY2hRP824eJ693arMvmvhlrbM6x9mDnVh0Akm9JHUMjSAcWHsktrpdrYoGunp1Ufgqjuf68cgbyv96t1lAnOOTl12MiozQeBHLuOm981XAWA44FGe6nvdFz6mp5T+a0RBEFAIrMf4pmWUTkJ6jYqT9ooU+Zf9h865g5uFWfLp0YnhekJsIJWGhiEgckH+jb0AARnrBYNaFA4pOsSbBtv007Kkw2fqirz4Kg0aVmEDNlzoeoeskU+ueCLIJ6BuXU48oAR4dbsMEYvX9IJjt15DH2yLGi//RPquoarnnSwGRx4eoth3k7hdz9R1cS0bY00Um3PajitLhj/m69UBhOSXdgY/P8YYIn5y44ibB79/AhBpypEgRbE35SSSjGoXPicWXV2ls2/taXCU+hNryaq+R+v2u6em2Ade0Nb2UY/H313+J11cQiyK52SNu5QozcB5f8S5SieuJpSyfnn2r+yQCSTR5BhKzNOIvNCEWvGnxA0NX90wwcAGlXi+IR8i2qgW8mY9YGgWhK791bpwNzt9JEONd9RAz5LZKQpx+vnrSBdifvymEqLmLSM87hJcBs02SYcT8hK52e39WGNDh2YpHe+zSLMkU0p0uDiN0iY9LT8o70qtX5FADqDrgPjn3bNuk49h9oorF7HWLA/nH7hvDpnNMpP0THrMquNhtDl4RNsAxHx2I4BNzya1odMdLXkXN3CG7OCxnTFZ4FlN6r9htE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB6371.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(6486002)(86362001)(2906002)(2616005)(38100700001)(4326008)(5660300002)(8936002)(66476007)(85182001)(64756008)(186003)(83380400001)(6636002)(6862004)(26005)(66556008)(316002)(71200400001)(87266011)(6506007)(966005)(6512007)(91956017)(76116006)(478600001)(33656002)(66446008)(8676002)(37006003)(66946007)(53546011)(36756003)(2004002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?bHUxVjNhTVl4cSt1aExVV1UvOG1yL3I3RjFUcW5JNDdmQ1J6cXFybmRoYTBS?=
 =?gb2312?B?d1pPa05SK0VPRnVMS3drOEViTTFuZmJCVlFUZ0R1QUgyazRhZ3R4MllTVVZi?=
 =?gb2312?B?WGNlRVdNd3BPaSs5N2taUVNEWllaSllKaGxOc0d1NXlIcjd5bWNPY0tXTE15?=
 =?gb2312?B?V09BWTdPMVlhNWJOamxxTWxXd0lianh6OEhLRUZXNTBScVNNc2U5R0JZRDBw?=
 =?gb2312?B?VE5ia01UVXFmTWo5akhuaGZ4YmI0SWh5SHlVc0hjeDFJOUU3NytkWWZxVkVK?=
 =?gb2312?B?bUF3a2FNdUV3M2d0V1NhK1VJVExDdE9GY0tTUUR5RGR1QmdjNURpaFQwZTN3?=
 =?gb2312?B?QUZCZlZnS1F3TjljODFlcllwMDQwU3NzUVJqZVYxTXdNQjFwcnkrUlA5S0NU?=
 =?gb2312?B?em9abWMzZGo1dGRuV2hiVG9ybk5wMGJQT1ArcW1TN1M2TmN6U2grTGlOMEVL?=
 =?gb2312?B?eEd5Nzl3RjNuTC9DU3U5TWxkazhLRW5uRGMvNndoUnlmekd0azFIMFltN01h?=
 =?gb2312?B?dXY1TU9rcEZkdnZTckg5OEF5WXNhbkhyWk5oYXZWZkxDL2JjOFBaeUdpblFU?=
 =?gb2312?B?QXhOV1FIOVpiS3gxbTVRd2E1Z25rKzNDemFQZEZldGl6ck13Y042aEVCMnNl?=
 =?gb2312?B?RDhhZHlTTkxUUVFoN0pPNXdaclM2MktzK3AxcktmcEtxVWxMeWFnSGViR1lB?=
 =?gb2312?B?TEtacGRoR05FN1RDRWVaL3A3dkJPSlZVcEIvSDdTM3NVVDJiNGNWVnRYNnUv?=
 =?gb2312?B?d1NzWE9CSTJMNVA5c3MyVzRJL3lHSmFWVmhMZFpGcFRHQkFUbVhWQkVFZExu?=
 =?gb2312?B?SUJVNWpvbStmbmZxVUw2aWlPN2YrZEh0dmQrREpGMEIrVG5zNlNQV2lLRk0v?=
 =?gb2312?B?K1d1L2o4SHdad1RJY3NGdlNJelJaNzJXdnhxb09WTlJEWllMeENMNlN4Wi9E?=
 =?gb2312?B?ZXRWUTVjRkpsS3NKZ0VOc2tjME1wQTIvNTNRaFB0NTZvbHpOY3NMSGNNS3FK?=
 =?gb2312?B?US9WRUt6VzFEdTE3OGNBM3N0NHQzRGxxNVpPZUpvMXRKcTJkeFBHaGtqS001?=
 =?gb2312?B?YzM0aVUyd05lc044WW9NSGxncUVwaXJITTBVZ25aeWx1UTF0YnpPTXlDM3dU?=
 =?gb2312?B?enJMZm83Ky9MeVRuN2llUnBGUUl2Nm9PUGhQNFdpMm11ZjA3NXBJRWZSdERE?=
 =?gb2312?B?VGFMbUp4V1lablhJUDNFUkNJV2V0bjd5ajJFY3lCSytDdmV2aGw5cTBHVnls?=
 =?gb2312?B?WGwvZWl2eVNZdVlXY2dPRnFObndqUk14ZmV4VUI1RE9KZkJWVEowRDYzYUFh?=
 =?gb2312?B?T1kyWWhNa1FmSjdrYnk3K2F6cG1lT2JMRWxsNW1nVHlZOE1kSVkwZGF4V3Ni?=
 =?gb2312?B?L2Nyd204RlhjcFZlRUFEZ1l5c01hMjBkWm9CeG5POW5qVnBsK2RNNUxzQWRG?=
 =?gb2312?B?TjNWeVA1UnozWXo4YW1kbnFCa1c4S1dwanEzY2xUcktZRTNyR0RZblY5bHEz?=
 =?gb2312?B?M2EzT2pKeGk1TmIwUzF4UmFJRENHT0J1YVRjVzVDUWt2NDk0NC92bS9UMVQ5?=
 =?gb2312?B?eVMxdVFkbzM2NEZ6cnR1TTNNWVZnalVkZ3lCUEU5enYwZUE2RkpLNG81M25r?=
 =?gb2312?B?U2N1TkNReXpjOU4vVisvVFlqNVYvR0U1NkUxb0pvd3Z3bnB0RmNjb3k2UUQ3?=
 =?gb2312?B?MENpYmZ5ZE5MRStKSm9RL1JNV1B5WHJwM0F6UTJzU0duWWRLclRFTU9aOEVZ?=
 =?gb2312?Q?cpptSBGvoB0s6OEnKgjA5SXS95QE6rhA+2UjpaQ?=
Content-ID: <B24EE02B36D2BE4E9E8EEB199341D659@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6371.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38529cee-8bdf-46ab-3fe7-08d8f25c455d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 02:42:18.6273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rnNumuEqH34mKR84Iwf7bxmBuXExmuoOQhh/wdQemGUiWfnhljfBcCmawHNc5SZBsMs0MfD6S2cdCPDfxmMBvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5416
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/chmod0{1,
 2}: Cleanup and Convert to the new API
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

On 2021/3/12 14:57, Shiyang Ruan wrote:
> Testcases in chmod02 is contained in chmod01. So remove it.
>
> Signed-off-by: Shiyang Ruan<ruansy.fnst@fujitsu.com>
> ---
>   runtest/syscalls                           |   1 -
>   testcases/kernel/syscalls/chmod/.gitignore |   1 -
>   testcases/kernel/syscalls/chmod/chmod01.c  | 175 +++++----------------
>   testcases/kernel/syscalls/chmod/chmod02.c  | 107 -------------
>   4 files changed, 37 insertions(+), 247 deletions(-)
>   delete mode 100644 testcases/kernel/syscalls/chmod/chmod02.c
>
> diff --git a/runtest/syscalls b/runtest/syscalls
> index fe22ae5b6..6108d5fdb 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -61,7 +61,6 @@ chdir04 chdir04
>
>   chmod01 chmod01
>   chmod01A symlink01 -T chmod01
> -chmod02 chmod02
>   chmod03 chmod03
>   chmod04 chmod04
>   chmod05 chmod05
> diff --git a/testcases/kernel/syscalls/chmod/.gitignore b/testcases/kernel/syscalls/chmod/.gitignore
> index 4e856df43..072fa5b80 100644
> --- a/testcases/kernel/syscalls/chmod/.gitignore
> +++ b/testcases/kernel/syscalls/chmod/.gitignore
> @@ -1,5 +1,4 @@
>   /chmod01
> -/chmod02
>   /chmod03
>   /chmod04
>   /chmod05
> diff --git a/testcases/kernel/syscalls/chmod/chmod01.c b/testcases/kernel/syscalls/chmod/chmod01.c
> index 55ddf8a73..cbe83dab0 100644
> --- a/testcases/kernel/syscalls/chmod/chmod01.c
> +++ b/testcases/kernel/syscalls/chmod/chmod01.c
> @@ -1,159 +1,58 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>   /*
> - *
> - *   Copyright (c) International Business Machines  Corp., 2001
> - *
> - *   This program is free software;  you can redistribute it and/or modify
> - *   it under the terms of the GNU General Public License as published by
> - *   the Free Software Foundation; either version 2 of the License, or
> - *   (at your option) any later version.
> - *
> - *   This program is distributed in the hope that it will be useful,
> - *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
> - *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
> - *   the GNU General Public License for more details.
> - *
> - *   You should have received a copy of the GNU General Public License
> - *   along with this program;  if not, write to the Free Software
> - *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
> + * Copyright (c) International Business Machines  Corp., 2001
>    */
>
> -/*
> - * Test Name: chmod01
> - *
> - * Test Description:
> - *  Verify that, chmod(2) succeeds when used to change the mode permissions
> - *  of a file.
> - *
> - * Expected Result:
> - *  chmod(2) should return 0 and the mode permissions set on file should match
> - *  the specified mode.
> - *
> - * Algorithm:
> - *  Setup:
> - *   Setup signal handling.
> - *   Create temporary directory.
> - *   Pause for SIGUSR1 if option specified.
> - *
> - *  Test:
> - *   Loop if the proper options are given.
> - *   Execute system call
> - *   Check return code, if system call failed (return=-1)
> - *   	Log the errno and Issue a FAIL message.
> - *   Otherwise,
> - *   	Verify the Functionality of system call
> - *      if successful,
> - *      	Issue Functionality-Pass message.
> - *      Otherwise,
> - *		Issue Functionality-Fail message.
> - *  Cleanup:
> - *   Print errno log and/or timing stats if options given
> - *   Delete the temporary directory created.
> - *
> - * Usage:<for command-line>
> - *  chmod01 [-c n] [-e] [-f] [-i n] [-I x] [-P x] [-t]
> - *     where,  -c n : Run n copies concurrently.
> - *             -e   : Turn on errno logging.
> - *             -f   : Turn off functionality Testing.
> - *	       -i n : Execute test n times.
> - *	       -I x : Execute test for x seconds.
> - *	       -P x : Pause for x seconds between iterations.
> - *	       -t   : Turn on syscall timing.
> - *
> - * HISTORY
> - *	07/2001 Ported by Wayne Boyer
> - *
> - * RESTRICTIONS:
> - *  None.
> +/*\
> + * [DESCRIPTION]
>    *
> + * Verify that, chmod(2) succeeds when used to change the mode permissions of
> + * a file/directory, and the mode permissions set on file should match the
> + * specified mode.
>    */
>
> -#include<stdio.h>
> -#include<sys/types.h>
> -#include<sys/stat.h>
> -#include<fcntl.h>
>   #include<errno.h>
> -#include<string.h>
> -#include<signal.h>
> -
> -#include "test.h"
> -#include "safe_macros.h"
> -
> -#define FILE_MODE	S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
> -#define TESTFILE	"testfile"
> -
> -char *TCID = "chmod01";
> -int TST_TOTAL = 8;
> +#include<sys/stat.h>
> +#include "tst_test.h"
>
> -int modes[] = { 0, 07, 070, 0700, 0777, 02777, 04777, 06777 };
> +#define FILE_MODE	(S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH)
> +#define DIR_MODE	(FILE_MODE | S_IXUSR | S_IXGRP | S_IXOTH)
>
> -void setup();
> -void cleanup();
> +static int tmodes[] = { 0, 07, 070, 0700, 0777, 02777, 04777, 06777 };
> +static char *tpaths[] = { "testfile", "testdir" };
>
> -int main(int ac, char **av)
> +static void verify_chmod(unsigned int i)
>   {
>   	struct stat stat_buf;
> -	int lc;
> -	int i;
> -	int mode;
> -
> -	TST_TOTAL = sizeof(modes) / sizeof(int);
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		for (i = 0; i<  TST_TOTAL; i++) {
> -			mode = modes[i];
> +	int tmode = tmodes[i % ARRAY_SIZE(tmodes)];
> +	char* tpath = tpaths[i / ARRAY_SIZE(tmodes)];
>
> -			TEST(chmod(TESTFILE, mode));
> +	TST_EXP_PASS_SILENT(chmod(tpath, tmode), "chmod(%s, %#o)", tpath, tmode);
>
> -			if (TEST_RETURN == -1) {
> -				tst_resm(TFAIL | TTERRNO,
> -					 "chmod(%s, %#o) failed", TESTFILE,
> -					 mode);
> -				continue;
> -			}
> -			if (stat(TESTFILE,&stat_buf)<  0)
> -				tst_brkm(TFAIL | TERRNO, cleanup,
> -					 "stat(%s) failed", TESTFILE);
> -			stat_buf.st_mode&= ~S_IFREG;
> +	if (stat(tpath,&stat_buf)<  0)
> +		tst_brk(TFAIL | TERRNO, "stat(%s) failed", tpath);
Hi Ruan,

It is ok to use SAFE_STAT() macro here.

>
> -			if (stat_buf.st_mode == (unsigned int)mode)
> -				tst_resm(TPASS, "Functionality of "
> -					 "chmod(%s, %#o) successful",
> -					 TESTFILE, mode);
> -			else
> -				tst_resm(TFAIL, "%s: Incorrect "
> -					 "modes 0%03o, Expected 0%03o",
> -					 TESTFILE, stat_buf.st_mode,
> -					 mode);
> -		}
> -	}
> +	/* Ignore the file/dir flag */
> +	stat_buf.st_mode&= ~S_IFREG;
> +	stat_buf.st_mode&= ~S_IFDIR;

Why do you need two steps?
How about stat_buf.st_mode &= ~(S_IFREG | S_IFDIR) or stat_buf.st_mode 
&= ~S_IFMT?

Best Regards,
Xiao Yang
>
> -	cleanup();
> -	tst_exit();
> +	if (stat_buf.st_mode == (unsigned int)tmode)
> +		tst_res(TPASS, "Functionality of chmod(%s, %#o) successful",
> +			tpath, tmode);
> +	else
> +		tst_res(TFAIL, "%s: Incorrect modes %#o, Expected %#o",
> +			tpath, stat_buf.st_mode, tmode);
>   }
>
> -void setup(void)
> +static void setup(void)
>   {
> -	int fd;
> -
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -
> -	tst_tmpdir();
> -
> -	fd = SAFE_OPEN(cleanup, TESTFILE, O_RDWR | O_CREAT, FILE_MODE);
> -	SAFE_CLOSE(cleanup, fd);
> -
> +	SAFE_TOUCH(tpaths[0], FILE_MODE, NULL);
> +	SAFE_MKDIR(tpaths[1], DIR_MODE);
>   }
>
> -void cleanup(void)
> -{
> -	tst_rmdir();
> -}
> +static struct tst_test test = {
> +	.needs_tmpdir = 1,
> +	.test = verify_chmod,
> +	.tcnt = ARRAY_SIZE(tmodes) * ARRAY_SIZE(tpaths),
> +	.setup = setup,
> +};
> diff --git a/testcases/kernel/syscalls/chmod/chmod02.c b/testcases/kernel/syscalls/chmod/chmod02.c
> deleted file mode 100644
> index 94a77aeb1..000000000
> --- a/testcases/kernel/syscalls/chmod/chmod02.c
> +++ /dev/null
> @@ -1,107 +0,0 @@
> -/*
> - * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of version 2 of the GNU General Public License as
> - * published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope that it would be useful, but
> - * WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> - *
> - * Further, this software is distributed without any warranty that it is
> - * free of the rightful claim of any third person regarding infringement
> - * or the like.  Any license provided herein, whether implied or
> - * otherwise, applies only to this software file.  Patent licenses, if
> - * any, provided herein do not apply to combinations of this program with
> - * other software, or any other product whatsoever.
> - *
> - * You should have received a copy of the GNU General Public License along
> - * with this program; if not, write the Free Software Foundation, Inc.,
> - * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> - *
> - * Contact information: Silicon Graphics, Inc., 1600 Amphitheatre Pkwy,
> - * Mountain View, CA  94043, or:
> - *
> - * http://www.sgi.com
> - *
> - * For further information regarding this notice, see:
> - *
> - * http://oss.sgi.com/projects/GenInfo/NoticeExplan/
> - */
> -
> -/*
> - * AUTHOR	: William Roske
> - * CO-PILOT	: Dave Fenner
> - * DATE STARTED	: 03/30/92
> - *
> - *  Calls chmod(2) with different modes and expects success.
> - */
> -
> -#include<sys/types.h>
> -#include<sys/stat.h>
> -#include<fcntl.h>
> -#include<errno.h>
> -#include<string.h>
> -#include<signal.h>
> -
> -#include "test.h"
> -#include "safe_macros.h"
> -
> -static int modes[] = { 0, 07, 070, 0700, 0777, 02777, 04777, 06777 };
> -
> -char *TCID = "chmod02";
> -int TST_TOTAL = ARRAY_SIZE(modes);
> -
> -#define FNAME "test_file"
> -
> -static void setup(void);
> -static void cleanup(void);
> -
> -int main(int ac, char **av)
> -{
> -	int lc, i;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		for (i = 0; i<  TST_TOTAL; i++) {
> -
> -			TEST(chmod(FNAME, modes[i]));
> -
> -			if (TEST_RETURN == -1) {
> -				tst_resm(TFAIL | TTERRNO,
> -					 "chmod(%s, %#o) failed", FNAME, modes[i]);
> -			} else {
> -				tst_resm(TPASS,
> -					 "chmod(%s, %#o) returned %ld",
> -					 FNAME, modes[i], TEST_RETURN);
> -			}
> -		}
> -
> -	}
> -
> -	cleanup();
> -	tst_exit();
> -}
> -
> -static void setup(void)
> -{
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -
> -	tst_tmpdir();
> -
> -	SAFE_FILE_PRINTF(cleanup, FNAME, "File content\n");
> -}
> -
> -static void cleanup(void)
> -{
> -	tst_rmdir();
> -}

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
