Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6BA34C214
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 05:00:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 578423C2C1C
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 05:00:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DBBA13C00C1
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 05:00:34 +0200 (CEST)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com
 [68.232.151.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A4D2460073E
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 05:00:33 +0200 (CEST)
IronPort-SDR: z3DJFEjZp5wN+YdrrOfFknuZsoTb5q9YX/9vODHnwFtmj+h8tD0NTZtXlep8wiyT2rx57aJ6H2
 JAQTojvZHhmgENRPA8R6bmrsvUzM8Lbg+Bop/bgoGbIGlLVP2QNu+rlmFObSAcku28JbUH/Y+r
 ZEAnwxdIJ2z/ltKbGKPFqFuELrs42v+/vKJ+2UHqXO4JNbexKYDFETUEmFvpzYhm76lJhkoLqe
 x/y6OBqMcoAhBc4TZhpyblckG2N5QCVgP7ujL8TQWCyCW3gicDbA3u/EvN/xFD3Om37Z+1KrLh
 d5s=
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="36748708"
X-IronPort-AV: E=Sophos;i="5.81,285,1610377200"; d="scan'208";a="36748708"
Received: from mail-pu1apc01lp2058.outbound.protection.outlook.com (HELO
 APC01-PU1-obe.outbound.protection.outlook.com) ([104.47.126.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 12:00:31 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVkiBzjAzDp6+FcJqz+eWpfKzVIQ0n794qKchjivWYzrEtsLsKaXjYomhjRf/ixu9X/5URiuS2mGW0I7ltSvyGSheUCURdSfsJTXPYfUKQxvJ+2I6vrUaeQzyR1brAcs7M/OgapF4J7aq8qlUkgC7S6gwsUdqEmlGk37P40/nf7KCyGrvxfdfZWNL1gBHrOI0J9u19QIJNzvBtZOMKOwfeldoCsuTICa0gqQnfRH2VhIwn2/72boQbFxSBRJOoGj6Dv6oUZZjEU6Eqmspr7enGh6mY6SanqRxWKvMtJIIB9ULq53+UrM8ks1ildFbz3IHuGEBRk4kGzghxHqiNk4jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PAljahkd9Xq01su35qWrWUtyuzh5pNsweJW9x22yYI=;
 b=lEWT99qBFWMYyNMvmnNsENJqUMZ7/bW5MYKT4xbtLVjy02vbHSuReX2IudMA7bFMsaSy7PYNqFotd5wDqAgEUJQ2ss1HQAHCW1lW2SReSUu7zANiFIranvBdlOSa0p2eOmcoDlEc0UdBQGcgXffcSVOZtZgOZyiD/ov13VBKBHJSHsEcv11bcdf2BWgwziZrPiMa7CP2oVMTdiOtMDi7HWcEnm0fePWZTE1IDri6wj40IJ1zuwYTVlGwx8aLDrL76nYfb/aN2dFoSZ9pAn06NI6GINpBHhuZIMOeBly8aRULHO54ZdGEV3E6fH/TVpa764dFh5e/AF3AEktOhpUeug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PAljahkd9Xq01su35qWrWUtyuzh5pNsweJW9x22yYI=;
 b=N3+FPLJisF+/egmgJVriHkrOUqxjffQFSlB0hMcr13uSU7KcqQP2qCYny6i+xMqrKe5XbD9Q0BPZXWjeH2W02/548mKgVlQaTHAmDsD5PVMEBfY39RfJQ3ZOSqLp+abm7Hrwyhm07iA0+v+YSC/aN5oDNRt8+QOcWOt5qSnKov8=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB4201.jpnprd01.prod.outlook.com (2603:1096:404:d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Mon, 29 Mar
 2021 03:00:29 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 03:00:29 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: zhaogongyi <zhaogongyi@huawei.com>
Thread-Topic: [LTP] [PATCH] syscalls/shmctl: Using TERRNO to macth errno
Thread-Index: AdckRA9OMHYr18qpRVmjJddmstPDJgAA6GYA
Date: Mon, 29 Mar 2021 03:00:29 +0000
Message-ID: <606142D4.8080005@fujitsu.com>
References: <F3D3F6AC3820BB4C9FCA340DB5C32CB40389DCF2@dggeml531-mbx.china.huawei.com>
In-Reply-To: <F3D3F6AC3820BB4C9FCA340DB5C32CB40389DCF2@dggeml531-mbx.china.huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ee6ad9a-2341-424e-c1a0-08d8f25ecf7b
x-ms-traffictypediagnostic: TY2PR01MB4201:
x-microsoft-antispam-prvs: <TY2PR01MB4201ABD6F954F18C1279B508FD7E9@TY2PR01MB4201.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k6AQT7yn19R1EVXHtDSkuM/QjmcCY5wBF6xo5G3hfid5XV9ypNyVHoAa3szs2cHwRfU+AjeL+UiF0HkIQhW8gFbT5s2RxUWNxcQDWQTJUHNGOMltt6ZOjiTrldaE71BILfx+XkTIx69sNS/9dynlau6IVT+4OudjFhmnJdTWDTVSbxQb4p+PkIQgxaFq+Ip7qvtOtJZnMeYKKirAdG8DQ9BQlNLELDPu7BrM51eqTYaqThqUYVJ4IvZZWAGkguZxH+SzfbSJhNjjQOtFqqQ6qeii/OX40+XugGttu+hipf36ytXv2wxzNO/RMo+xp/zXvq4/dFmDG3UfkSRoWQIUwqVRUTPQBsJ7Yaf0Ccai/13SpSGY/j4jvFqTOJlAR8O76gpt+Mo0mg3KZkkQ38w1er9oR5GqBJqOyhfMalBLh6L/CiNyv7QEAG95xVRJz04DxHZKtcJDr2evCQsh8zSiC7jqR45/BIo6Ud8PGqKEuAaSyUWdKqZKSRD6D/HE7E8rT76VlN7f7K31az9gqxYkeNAeKXQHsQoMa8vI2AXITH5B4K3goYW1WRE2b8jS5ZIIki60rlD9weQPUGgVD+uDScbjWUqlPp6xq0aegblsoGdLFiySqu3bQF9WsMOE7WBpv+D8IoRwRWbPHwBbOmWlFMZonVCkpxkYU9vdG6kUll4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(6916009)(83380400001)(85182001)(186003)(87266011)(66556008)(66476007)(2616005)(6486002)(6506007)(26005)(86362001)(8936002)(4326008)(8676002)(33656002)(316002)(5660300002)(71200400001)(2906002)(38100700001)(54906003)(36756003)(6512007)(478600001)(64756008)(91956017)(66446008)(66946007)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SkVseFFpTmdTZW9ldDFtT2tlaElBcXloNENoY3RjU3g3RG1LeGtvMzUvNG9m?=
 =?utf-8?B?ZjA4V2UzUVlHM3lqcFpYTlVFVy8ra0c3U2hQMnJEcmNuVHlXMG5IUE52cGpD?=
 =?utf-8?B?ZWg3VGRWNUdnUHk5ZGoxVTBYa2ZlNlFaQ0Fab0wyNnVUbDhOSXdrR2hKaFVz?=
 =?utf-8?B?c1gvME1Da1A3cWt1OWRaZ3pGTFVjalVZT2d4V2RMYnYzQnpMVmxBUmRiVUFU?=
 =?utf-8?B?ZHNHL2RYZ1dKRzdnNG9GZnhKL214N1FsYjZRNUVTSys3TURrbTF5K24yaHEw?=
 =?utf-8?B?aitzcmd1WVZCcFpaek1EUC9vVjREMFBQOCt5YUtKRjR5K0dhOThvbTl2bnlr?=
 =?utf-8?B?ODdOSFBnbFNweStkODFHd3NvS1ZNMVd6Z1VQc2RpQjlJNUw2OEFjckFoODRQ?=
 =?utf-8?B?cVlaT2RCb3RzMGd1VDNRUGFvVlZmZUFPRjVSa3BJSUplQ2N1N2JoUm1jR1Fn?=
 =?utf-8?B?elArZW8yd2pocUlUNUpCQ01SZDV0aW45Ny9XN0s3bWt4M05vWG52Vjg3dTNu?=
 =?utf-8?B?SzNTRTZXbU1YakNibjIwa1EyV1E3K1BOVnZUT0F4SU1QZTdLTytoN3lYWCtt?=
 =?utf-8?B?Y2NwQVZSQWRia0hOMHlOc3V0aU4yeWhtbTdUbG5aTGFodmNJUFRRRWkyNjNu?=
 =?utf-8?B?VjZ2UzZISmhTa2Y5VFQ2NmZ0bUlRQWNFVFdQUXJ5bHNrbUw5U2d2OWFGeGxW?=
 =?utf-8?B?S0dNNGhOZUtmRHpwR2ZQbkZveXVnOFM3OEpRSnA5V1hMQTBxeHNZNmdzeFBE?=
 =?utf-8?B?TnRmaThNb3NKTWJUVTJySGRvekhaL010dzFqMW81SWlQKytnSllYRXdJSXhk?=
 =?utf-8?B?ZDlwR0FxZVU4VmxVUWpYbjZEMmxISHlzUEg1ais3NTZ3OHRobEVVWmxuWGxj?=
 =?utf-8?B?QjlMYVQ1THZEcm9lNGFWUHdNakJ4R1piQittZ2crd0NHTHp2aWRrTVVOMm42?=
 =?utf-8?B?c2pzaXZ4eVN0aTU2eXIrOUlqYStTVzdCbzcwczZ6dEJhMis0bUR5N29KcitN?=
 =?utf-8?B?eXZ3MU9tck0wOEhhaUVEVy9sdjhYQlBuakJsLzVNWG1xcWV5Tll0bUx1MUM4?=
 =?utf-8?B?YXNKalV6dmtZR1lnWDZ0NUlnUXR1dlgxVVFvSWkyQnFadGZSNGpIampJdldY?=
 =?utf-8?B?dVZrekVFKzRXTWdGcXFOTHkzR2xicGp4bWcvY3haR3VqY2V0QStueVNLS2tm?=
 =?utf-8?B?VHNON0JNbmRsVXN5ckdYSGxhRUZUcXAwRHRYZnJvSk93NnVOb2pDSW9nbW9U?=
 =?utf-8?B?Q1F5TTJobUZ5QS9iQ1RndkluaGIxSkVjQjVOYXJhd3grMUViRi9KdFVFTjZx?=
 =?utf-8?B?cTBrNU44eTZJbjNWTUV2V2ZqU2o5THFLYVpueFB0WDRTd1preVZMMGVXdi9J?=
 =?utf-8?B?US8rRDdNbVFJU0l0WFNTWWtjMDA0UWpqWDgxVVJOb3M4c1hZZTZRM2drVXZW?=
 =?utf-8?B?SmZpRHhYYkVXSXNUeVNXQWx3RCsxaHd6czUyR3Q0SVNSWnY5R3AwTUpiM3lj?=
 =?utf-8?B?T0lHajZFVFRheVl3Q0hXaHRnampkMmtGMk5rWHUyNHBOblQxQVc3Q0RkRC9S?=
 =?utf-8?B?RlBGZFl6Zmk1TXVzdjBhZ2F3eDQrZDFqajF0SE5QdXpNeXU5NUo1MTlkWVEx?=
 =?utf-8?B?dzNlMUthTzhtblE2K2c4R2RzeTVCeFpEWHdyVTdJZHROZmh0Rnk5NVpuU1ZR?=
 =?utf-8?B?ZlViY3ZqYU9mb0R0eGU5TFNVOTFjczA5VzNjbUpKbGFBZnVpWU5EeUZyUGYx?=
 =?utf-8?Q?AVP8jaaBNkQOSkfofWY6hO8JjalrEFDQD5KQ3lX?=
x-ms-exchange-transport-forked: True
Content-ID: <F45E0CC838B904499666C3AA6FE54306@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee6ad9a-2341-424e-c1a0-08d8f25ecf7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 03:00:29.4169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wHO95pVq595x6MXdzFRF0nlBG05IUVDlWNO+FdZa3zS4DMxpnzehl2LBWy7wLVLMQGV9oSvPDrjHY6D3vu/HC9EnQ8vG54zL0DhZlN9ZEXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4201
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/shmctl: Using TERRNO to macth errno
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Gongyi

> Hi Xu, Li,
>
> On the other hand, we have created a shm in setup, why we query with SHM_INFO and return 0?
Because SHM_INFO ignores shm_id parameter like IPC_INFO in kernel. We 
created a shm in setup just to make sure that there is at least one 
during the testrun.

>
> Best Regards,
> Gongyi
>
>> Hi Gongyi
>>
>> The SHM_STAT_ANY cmd was introduced since kernel 4.17. I guess we
>> should add check for it.
>>> Hi Li,
>>>
>>> Yes, I find the problem in my testing of qemu with kernel version 4.4
>>> and the config is vexpress_defconfig.
>>>
>>> Specifically as follow:
>>>
>>> tst_test.c:1294: TINFO: Timeout per run is 0h 05m 00s
>>>
>>> shmctl04.c:119: TINFO: Test SHM_STAT_ANY with nobody user
>>>
>>> TST_RET: 0 SHM_STAT_ANY: 15
>>>
>>> shmctl04.c:134: TFAIL: SHM_INFO haven't returned a valid index: EINVAL
>>> (22)
>>>
>>> shmctl04.c:150: TFAIL: Counted used = 0, used_ids = 1
>>>
>>> shmctl04.c:85: TPASS: used_ids = 1
>>>
>>> shmctl04.c:92: TPASS: shm_rss = 0
>>>
>>> shmctl04.c:99: TPASS: shm_swp = 0
>>>
>>> shmctl04.c:106: TPASS: shm_tot = 1
>>>
>>> shmctl04.c:119: TINFO: Test SHM_STAT_ANY with root user
>>>
>>> TST_RET: 0 SHM_STAT_ANY: 15
>>>
>>> shmctl04.c:134: TFAIL: SHM_INFO haven't returned a valid index: EINVAL
>>> (22)
>>>
>>> shmctl04.c:150: TFAIL: Counted used = 0, used_ids = 1
>>>
>>> shmctl04.c:85: TPASS: used_ids = 1
>>>
>>> shmctl04.c:92: TPASS: shm_rss = 0
>>>
>>> shmctl04.c:99: TPASS: shm_swp = 0
>>>
>>> shmctl04.c:106: TPASS: shm_tot = 1
>>>
>>> Summary:
>>>
>>> passed   8
>>>
>>> failed   4
>>>
>>> broken   0
>>>
>>> skipped  0
>>>
>>> warnings 0
>>>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
