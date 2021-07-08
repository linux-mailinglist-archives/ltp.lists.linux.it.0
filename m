Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AE03BF3F5
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 04:24:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5130A3C9544
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 04:24:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 037493C2A8B
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 04:24:16 +0200 (CEST)
Received: from esa12.fujitsucc.c3s2.iphmx.com (esa12.fujitsucc.c3s2.iphmx.com
 [216.71.156.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id ED079600720
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 04:24:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1625711056; x=1657247056;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=38GFzZ1RwwxLnSP7JbPJuyg7+szgWOpymsz76kZmRjQ=;
 b=Hv1f06Wazr30WB130mi5Yr3Lb/anN2amYSm8v73oqXV8rCWmIovGEoQK
 PhM5vwc1tUb9i1yZSMcWwJFPr9f6tAypgxbU43+1h2vv5zFHdyp/PtJMd
 wZdoDpQ186hy6zD/JV05fXtQEyCigIToagDb4gFlsdfCFUyPquS1bwsBH
 qxLI31CaogmGwoYSWjLXiDEf94nOHFDu/37Ca7DawtF5YN1wXhte5ZA+E
 Zyg3wf/E6JHiDbGVhhfXR6WYrjdmHcoyTrQ9hnBWtZZqNMn9tNdExd7Ex
 5a9vIy2pMWQy9U8s+cOIZwEjf6pqD5jOi+5vd5AYWUJ3Oy2djBMdxEsdM w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="34586099"
X-IronPort-AV: E=Sophos;i="5.84,222,1620658800"; d="scan'208";a="34586099"
Received: from mail-os2jpn01lp2057.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.57])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 11:24:13 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXXD+eXKdOPhYa4CkC/a/gpoTFKwOPvhAKDJMTa+iGfTNEwxNllE1VRHmeMjdAQZKIRqNrLuNYR+bhSgJ3Is5sFYVcT8btsavH9BtJ7UitAv16CHvyoOzyHwwcHRCJx2OdPfHfdbWWxEOQM+xurj01qw0oasg4nkgESO21fd+wp8F9yk0Y70rB9Wgk/PPqwpLRu7+k5STJEuxso0y9CNsHPqO9q7TR1HHIWol7j/GW2G5zpditHXEv2e1m+NiYQRQXLOddcguCO0M1uu0axnnJ2GUPF7NkHJzeTIzP5iF65PEm7p1zmagFuFmakhm9DBxO//wKiiO3qodLA00HDkeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38GFzZ1RwwxLnSP7JbPJuyg7+szgWOpymsz76kZmRjQ=;
 b=UwrmNiIvbT13lQ03KsXD9NzHOvpXGu4Qv+DtPrpaHpY7q/S3JclD25/Blf+2boXVVoLh+V3jwv9F2zCCE6Tw557ML4DqukiGQMLtK3L6z7FcedAzOjicc/hOHDhqGos8ueFLDYq2Fod0fd9sGFA1tr9f9B2uZyS2uRL6JsHu7tDZ7jKUkOWHW4Gx07yc1+XZaXMCXkf4WL6JVmtvgAPTCOieFLIFBXfz8Giy9Ajbq1I7TFjV9jGKUn/dL22NpV7HlXA9TwNdm+HL0Nnv3Mjo3zeYhev9jytIY4ugSdRzPXagCg1STEarDDTcPvCEtxHx9kQd/cF1GS/X1XiGP3A8aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38GFzZ1RwwxLnSP7JbPJuyg7+szgWOpymsz76kZmRjQ=;
 b=bzXtiL6RYoqDteEieEOm+R+ZqOdfxrFIL5nvBl0ZHRB+xdwraRvfmCf6tRcp/1/1eedN1s3NBKX3H0hUswhO6Aj+bcXVytb4qF8HycPPm1v+lnSy9TZRHq7be8eeTGDdT3GUtrUd6ua8PlWvF3BXYSbzXKLOLhyN+t2Azw1ZtwM=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB6538.jpnprd01.prod.outlook.com (2603:1096:400:a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Thu, 8 Jul
 2021 02:24:10 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 02:24:10 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Li Wang <liwang@redhat.com>
Thread-Topic: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
Thread-Index: AQHXclX8FtNVc6CAyUCt+wJTvZ4uTKs15fuAgAAPCoCAAAnXAIAAwZgAgAAIVgCAACRLAIABbxSA
Date: Thu, 8 Jul 2021 02:24:10 +0000
Message-ID: <60E661ED.7000305@fujitsu.com>
References: <20210706105758.43220-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cOm+1BMWE7oWVFttXNOeQsYk9veXePS+ctxAABk2rCWQ@mail.gmail.com>
 <c2c7ff46-df28-c7b6-49dd-c891d9655d00@bell-sw.com>
 <381b8420-3dba-d7c1-027c-e2e2adc719de@bell-sw.com>
 <60E50890.9040903@fujitsu.com>
 <CAEemH2fKXJmgKAr4JXW5y+dcgEwL1taobXLY7OdTWBzLXGVOYg@mail.gmail.com>
 <60E52E00.8020105@fujitsu.com>
In-Reply-To: <60E52E00.8020105@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 659f64cc-8dc0-450b-f164-08d941b77886
x-ms-traffictypediagnostic: TYAPR01MB6538:
x-microsoft-antispam-prvs: <TYAPR01MB6538A8C27686FF7B8067AE47FD199@TYAPR01MB6538.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W5Pd9BRlRCEL2vdqdegXyKmF6NN40dU0gHHzGxTekQgwLJpB2iWho7gYjEVI4LeXIWnnp4pfNt4PCFJElDGD+T9/pndXJPa632NoXyVUZPRogv1YWEV4/zWILhYloxIscDbtx50B2aDYNR1dvu4HNoXRwpIRSdCJonrGHEnuNlrm4xuNK+LkJsfHZbsu5ChPUztVLuim8TgyLRGrM8hjdsOmq097R3G1qUoeEmdQ8Vy0MaSdO2p6OEekwPXUafGZnP/R7mSejyuegYGOzskPf8ds1ZccJCgEx4C/x283Am5bxjFgW+rSc9GPSiVGLhK1I7cnGrRDB1mssJPPVBFXDz4ZljyBSWfkav+llFEIKRf+3qzr85IgY+1Y4V6DAp9oFtO5hUkHOqwM7WY668u7AV7U88udboKf3anV+84DUPjdDfVqdfUH262BefFWObUoHRKCOhq4l/z8QoFKz6f4k/xLBl+jpI0of7GTxNpWA/CDtub+jSDEazbj8Ajtsu7Te+k4lZwq+m3VkPYps9wlpjNnGJACfTlb4ZjgtahwWkVQ/HXZy3Tancz+bV0BOVZXYmAEG89XSgU+kHrUURLROxMw7f4FmNnAmTeC4pdXpukixpDPL1ktnGMUqjss6DfQQygHwNf94uuZI3VQFgkSMg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(2616005)(316002)(54906003)(6916009)(87266011)(33656002)(86362001)(85182001)(15843345004)(8676002)(122000001)(36756003)(8936002)(5660300002)(38100700002)(83380400001)(91956017)(2906002)(6512007)(64756008)(66476007)(76116006)(186003)(4326008)(6506007)(6486002)(66556008)(71200400001)(66946007)(478600001)(26005)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?bzlvTnpoTjZ5RUltUmw3OEZRblJCMVMxS3B3VTU4cmNjUzBoWjVBRituVTBa?=
 =?gb2312?B?VjRlOG9OMDNJajVJOE4yZmdwRDlRRjJKMTJBdVV0ZXlwWFM2UFZMWUJNb2ho?=
 =?gb2312?B?VThYOFVqaWlhaUphc1loYjQ1SmtQaldLUWh4cEVYQU12RjRXQUY3cDBiQUxx?=
 =?gb2312?B?ZTg2QzhXcXA3NncwQUc1NEhRSkdQT05kOE1ueEQ2SG1NRTNiTFIrcW04dmxS?=
 =?gb2312?B?d1dUU1J5R2VPUnJHVVR5Y2l6a3NscWU4L1R5dTVJVUdXWlFhd2VWOGV0Sm9q?=
 =?gb2312?B?cC81TW5sRytaWjlReVd2R3RYaldTNUd0YTVEbjdQdTROSS85UmJwL2F0TWRr?=
 =?gb2312?B?MkNpTkcwbXJ1cFQ3YldXSjk0ZXRXTFBpbWNzLzBSUWZpMUpGZVlMWDNlYktw?=
 =?gb2312?B?Y3YxbkVCMzlBaFVyb3BaRUhidkU2ZFhPeEFwbzA3V1RDM3dQa2EyOUtwWkdM?=
 =?gb2312?B?c2dLZDBQcDVucDdWODBTRldpbWF2ZGhkbzFsQ1M0VGMwQUpLODFSRVA0bVNF?=
 =?gb2312?B?ejJ2RExVaHZ0b1lDNHJnSGtlUE1WdmdtRklLcnEzaVYraFE4cE5KU3dwNTZz?=
 =?gb2312?B?ZzN6b2xzT1BWa1VDNWcyMmh6eXNsTWRVLzVKOUMxNTJpdkcxRjB5bTFmK3V6?=
 =?gb2312?B?SWZyMmZGTHI5MHdJUlU5MExNcE0xeWNJcml0VWhRZmZhTGVaWWU0Y1FmdE1Y?=
 =?gb2312?B?c0lycUFNSHN5OE1DUGJtZWNJZGlIZUlmKzhhNUJZRURWb2NIQTZzNnFJTHQ1?=
 =?gb2312?B?Q1pnOWxxbFlpTVY1R0J2Yk5PUmtzbDhqR2J5OFRhRFdXcXZCNytuMUtyd3lR?=
 =?gb2312?B?OXVWbU5qYUtlMC9VQ2c2Q3pQaGsvVlBQdkpVUlA1TTB1eFhlNmlSemovYlha?=
 =?gb2312?B?RGRRazY1SUNZRFdRRU9MN3dCZkplenVRamxqZGxUc0t1WWN6WWIwSHNGOEpi?=
 =?gb2312?B?Wlh4TDgvbEsxd09YQ2haNmR1Z0JMbExiNG8rc1FXc0JLNmRrWHhCeXdaL0Fm?=
 =?gb2312?B?MW1QWC92M3p1RXZkVmUwakFTdFIwU2RtZTZzM25ha2grT3dDWXpuZDR6STE0?=
 =?gb2312?B?WFRxdnVUcis5UWhxQ3lZZGRMYTRIZkswVlAzbnpOS2pQdXlQOXBGZ2FXTkFq?=
 =?gb2312?B?b3RpZnd5NElwelJSYWo5SENhL2RndGRLc2lPM1RlYVVSSzNBcFp0bSt3Kzl2?=
 =?gb2312?B?c2krU2NTcXVkelR6aFdvZnJOTHRSZi9JeWFybmNYU0d6c2JGWjN3WEpTaFpQ?=
 =?gb2312?B?R1B4Qk4wZXREa2M1SlJwL0VjSzZTNDlZc0dEWTJLMnVaOTc5MXNKeUtjTW5W?=
 =?gb2312?B?cURVclB1MjJFTWIyQ0lUSUpneDZWTUQ5cDNxTnpKSzFOY280YVBuR1R4MStM?=
 =?gb2312?B?aHZ3UFdyUDBmQnBSZ2Q3MFdzWlAwUVg0RlR0aDNIdTNlUTVQV2JDY1NSeFd1?=
 =?gb2312?B?eThEektxT1kxcWFRL1RLRDk4SGkrNitoZGZiRloxMjJMS28rbnBYL2dVSklY?=
 =?gb2312?B?QmJOUU13UE9XQkRLRVN6U3VkelZnZTdtNVFMQllCSUtPa0Z4SzBCRndFNEpq?=
 =?gb2312?B?eDRaVCtCZVdUS25GTGhpVHNOZHZlYkU0Y0YrbjRHTlNWNkdsWmtHcGpMUFNL?=
 =?gb2312?B?RG55aXF1K3NkK25rUU1NT1liUElqNUJzb0Irbmh4QTU4dW15ZVNxQmdURWRs?=
 =?gb2312?B?Ny8vUDdmQzRBV1lzUFZjVkI5VTdUdlJXOWprVXo3V1RJNE5DZVg3Tmt5aGVQ?=
 =?gb2312?Q?KceIiT7h2OGegnzvniZPvYD8DcXPSBEN77BvRIs?=
x-ms-exchange-transport-forked: True
Content-ID: <A7901ED1EF0A69419258C52294200BC8@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 659f64cc-8dc0-450b-f164-08d941b77886
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2021 02:24:10.5510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FvYIjH9pN+vP3epHQYHgQPzjT8qf8SBGce1EtBJGpjvlQt128FWYsU5ysvh6z13TseOHNwJ8fx85IkU1+o4KbVuA8BlKCyITqfsNf5oU7ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6538
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
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
Cc: LTP List <ltp@lists.linux.it>, Huanian Li <huanli@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li

How about using CLONE_NEWIPC to test this, so we can avoid this race 
situation.

Best Regards
Yang Xu
> Hi Li
>> Hi Xu,
>>
>> xuyang2018.jy@fujitsu.com<mailto:xuyang2018.jy@fujitsu.com>
>> <xuyang2018.jy@fujitsu.com<mailto:xuyang2018.jy@fujitsu.com>>  wrote:
>>
>>      If we use this old format, then we can not ensure whether we trigger
>>      the
>>      ENOSPC errer correctly when reaching the expected nums.
>>
>>      So to avoid the existed memory segments error, I think we should alter
>>      get_used_queus api to count the existed memory segments by adding a
>>      file argument.
>>
>>
>> Just as Alex pointed, if there are some resources be freedafter invoking
>> get_used_queus, then the value of existed_cntwill be imprecise, how do
>> you think that affects the test result?
>
> We can move this count api and the create phase into verify* function,
> but still exist the chance to free resource after invoking get_used_queues.
>
> We can't avoid it because /proc/sys/kernel/shmmni is designed for all
> user instead of the calling process.
>
> I think it is common in ltp because user also can set a different value
> after we use ltp api to set proc value.
>
> But if we only use for loop to trigger the ENOSPC error, it goes against
> the test's aim(see old shmget03.c, it also does the same thing as I do,
> it doesn't trigger error because it uses a big value than default 4096).
>
> Since this case only wastes a little time when run, I don't think we
> should avoid rare race to give up to test the ENOSPC error when reaching
> the expected num.
>
> Also, Let's listen advise from other maintainers.
> @Cyril,Petr
>
> Best Regards
> Yang Xu
>
>>
>>
>> --
>> Regards,
>> Li Wang
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
