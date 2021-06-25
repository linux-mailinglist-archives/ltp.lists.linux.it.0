Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C86BE3B4042
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 11:23:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39C3C3C6EF3
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Jun 2021 11:23:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7CE593C201B
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 11:23:11 +0200 (CEST)
Received: from esa17.fujitsucc.c3s2.iphmx.com (esa17.fujitsucc.c3s2.iphmx.com
 [216.71.158.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 23B421A014C1
 for <ltp@lists.linux.it>; Fri, 25 Jun 2021 11:23:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1624612990; x=1656148990;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=usV78VM1RHn/jYNgsuCmk62W+vtXtFWLOzj2RW99vq0=;
 b=lYg2YtKNYzBmhqCJV3egbr1KsGEsherxyQ3DHyhNZ5Z/tgUh2jrvkv5k
 wx2JMV73M5cizf86+UZP8ejtBiWQdFsp8ufiHZ63WDAUP62pOojHdjB4g
 T+jkiLYK9+ZTyt0nXnFtx6HR5U20P5EvoRK1LJUnXoiY+EG2eRHYyezCT
 asFV7TS72IpNxr0hJIyR1XPhZ8Nf57GHyIwcmsFmsI0cGPSJ2yKfKcNwx
 Rwe5uoNqJMhXHTNuGuEnn4usabifCd/Noarm7p97majrNN/Itmo616bUG
 pFpT5WSrXtWKaUBB6MXXkGnn48oNHwXQdxuUwqBOlNTgDWfvL+iQYsT50 g==;
IronPort-SDR: ffAa+WIa4yqAySgSAF/WF80zqo5Hme7wQymHNdmngsit+8Lxxh1iCcCrB1o6HdHGCS1YUayI9h
 O6zuCV2vtRgnHz55aJa6Ex1HVGuqoocSsJm33S2FNoWex3lb6Yng/EzaJHKnyzzE8MvzwJAm1u
 /ywYkqVLKTrQtwvO8AAohFtFRP1XACGxu3OsWhsnKkgMXLxioBNrgS7X+gHoKC6ZjL9qCu9guA
 3VKvlA3GA7kk4S3L8DI7b3EjPjOqTr70Y9MTv8SorJn47bENWtkq1pGzwc3iSAt0iXAl6FPxDi
 vqs=
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="33662672"
X-IronPort-AV: E=Sophos;i="5.83,298,1616425200"; d="scan'208";a="33662672"
Received: from mail-ty1jpn01lp2051.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 18:23:08 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G71YjzGzeE1Fio94RN1GKqztFfcB1EhlwTH6OCoUMHnwJ8b+6zG3omsUUlYTHS7pSH/xVTipeAp1rcsK7A3bm8AAHlLMgkBxfbgKoFNJEnC02hRiHljyDqybRbfHgHUmznwiy84m98glUPp5L6iUb6xooF0r0C9vOC14TnifHevHO4GG15rTNmFphqo/LW3SBiENjq1SUMm3Umc25jAgaXKCZzJVIIn3xkJnXHbg0T0byXWjZTNbo1nccFEo66DTmBLUf4Hi5xbs+DHYa3iouQHElIBDiepELEwR4VLYRKrJbNwTJohYs18bNIZGcutsoorWdXAqJ/2bhX7MHBYRgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usV78VM1RHn/jYNgsuCmk62W+vtXtFWLOzj2RW99vq0=;
 b=lo5roNOW+2mcnOLktAkV9/HQqt9nvDsNWU+qbbrsp747lzWKldH1NdlddI5nyO2kiC1wb5R+ymn78U3DrHsAztNjm3bS+JWEIUdkw/hhrwfK9x2MLsOhePwum62MxUe0eTnM1VH9d4sWkOgqYgF3L/UtyYzM9TCejWq64NXEi/wg4j3fvZglSNgW1zJINu27BeBqgpmwr6YohLd7LXHM7HdZXD/hvxEHVijwwu/K/ULf6/p5f4pgn+Lw6OGtd/vSVvrR+7PDgMnBWMtp1FQiTMy1vufS8MmKiQSKDDYzUUYEjl3feKyX6z+GrSlgkFZ2bZa2TIj2kHenrnRzwx5yjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usV78VM1RHn/jYNgsuCmk62W+vtXtFWLOzj2RW99vq0=;
 b=qnvGOVhAzESjtlqv+wmaZl5IyfMleL2CJqnk3+UXzhYzvHkC54sgHngRIor320Sg4aQyhXxCej9nZOh/wjHBNIjeutxDIAtAe5cnIYUoTrgr/vb9uQJGU0zVbZ5hactu7Cg2PCnR2zzaJt+w2Nlk3C0QkC0z9q72XREEXxvdcEQ=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYCPR01MB6541.jpnprd01.prod.outlook.com (2603:1096:400:9a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Fri, 25 Jun
 2021 09:23:05 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4%9]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 09:23:05 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Li Wang <liwang@redhat.com>
Thread-Topic: [LTP] [PATCH] ipc/msgget03: Make sure we get ENOSPC error after
 creating MSGMNI message queues
Thread-Index: AQHXaMBy3VXvEeLv/EqXtGiERcKpg6skcH2AgAAFmAA=
Date: Fri, 25 Jun 2021 09:23:05 +0000
Message-ID: <60D5A0A0.7060801@fujitsu.com>
References: <1624515373-3899-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <CAEemH2eJLd5cSHZLUyXCYBhr643noDPT4RrMb8YBxrE_M3d1gA@mail.gmail.com>
In-Reply-To: <CAEemH2eJLd5cSHZLUyXCYBhr643noDPT4RrMb8YBxrE_M3d1gA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f258b06-3678-468f-b2fc-08d937bad6d5
x-ms-traffictypediagnostic: TYCPR01MB6541:
x-microsoft-antispam-prvs: <TYCPR01MB6541CB06711A22C9E42FA4CEFD069@TYCPR01MB6541.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gl3dyeTOgs41Mq1/a5PtPQfjaXPUJfsgSrwqeFi/WnSoTeGqYtYNuz41A5dhc/N0qGw52VXDvWUCu4aEmZBxEdrqzLfS1IRyoflMYEVgdQpwLsCt8dd0+znnwbY8VQsZ5iJerzQplLVrvM+wLdAPj00ma0aqdX9kFo0b+oa3cCZMZzXhfee8hgRB+JL2anuwCtRtHUQWcHAKYam439GFD4Rz1wduOHNnnJUawCvXnDoEt/nLGZWhZ1DqbcnQiCpcHvHAHHJ4Rte2oiJ5SvxLLs66dqI8p9d6DgetV8rpjujITmisHX//ELagpI/ouK58EvqX7IhduCLbTJvf4sGGPLDzV2DCgQr4NCVFDK0fjfVXoXW8VT4MR3Vg3/IoVlZHjG9AhV4dtye++u3uxq6ofp3OdIFVnVz89hTMWqYlLC3HGrfHZ2JgBpWrPtVPiQeBw2spr9UpdcIa/ayVVaPnS0YWiXacl4Zy6hyoDvUCJxeR/4RatjNdoXdJF+/Lym/+AvwzxXdE1UhLF4sKY9nPQlQMsdvTykKmjHRplG0e7HfBWaC4djed6ry+JEKZuex0JBtWeJW1AxFuYVl3tQnEB+aE0TfQ78CnoriAnARIdwImFF+mUu/7NLMHn7zRtB2VHk2+cws7obdgWl1DdpCWYc95C0EZYwWKGzMTyQPdh+AY0Obzjfu9i0IQmriyESYvSWoMO09KKjrEjsj/O0ol+/0Vo7AtOQnYSfeEqqzm4q0rbIPiRb0IFO3GV1XVDTiM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(186003)(87266011)(71200400001)(6506007)(66556008)(64756008)(66446008)(66476007)(83380400001)(86362001)(66946007)(91956017)(76116006)(54906003)(8676002)(8936002)(33656002)(15650500001)(38100700002)(122000001)(2906002)(6916009)(53546011)(26005)(966005)(5660300002)(36756003)(6486002)(316002)(6512007)(478600001)(85182001)(4326008)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bG9VUEpxNVZSd2tLalZUOWtYVTdOWHBrUTRwUXVYSURCaSt3L2k0eDcyWnFn?=
 =?utf-8?B?dHRUcUM5N0xGT1h3L2I4dE8wdUhOYzd0SWh6MWFuM2ZVZmNDMnBQaFFvaVFF?=
 =?utf-8?B?QzdneWV6clhqZFVVSXUxVHVuOVVuMTZhdHdMdFdMQ0JEYWdyUjlFQkRzSDNo?=
 =?utf-8?B?dUtKUmsrNlZFNDFaNFB4dXl1THRjU1hGN2EwbzZ0ZW5hM3FNVjRUUnR1Mktk?=
 =?utf-8?B?RitFRmpXRFlOZkRRaitiWmw5RytlZ29ORWNBK0MrRHo4OHh4NFZqY0xvOFNL?=
 =?utf-8?B?KzdzbE9SZUlmVjBzTmZCZUcxY3BBOXFFNW5aU0dBajBjSnlGT3Q1UmhzQXNN?=
 =?utf-8?B?czlkc2ZSVkRDeFNKNnJCUHFHOEFRek1BdjluS3hkRHJOSWdwMkxmQTVQeEt3?=
 =?utf-8?B?T2ZXWnZUTnMvRHdLUnVnRitpTG1UK3Z1QmtLcGVOY2taLzRIQmJvellkNXM1?=
 =?utf-8?B?NGovL093S3BDUFlwSDNOWTY2U0FRV3VhL3VZRURLVTYwcGh6V2Vqak9DUHYv?=
 =?utf-8?B?SU5Xcjd1VTM0M1ZWWGczb3p6RHkzNlJvU2s3NFVkSmpaTkJsV3paSlFNeC9l?=
 =?utf-8?B?aG9YUGxZc0V4TldBS2VWUmhxVCtLYk12MGluTmt2R2lBVC9YWG55cm1ZMUNp?=
 =?utf-8?B?dW5BZFVQdkZXeTZVRFl5RlV0LzJFQmpzbmxseCtmTmwzWUpDb0x3VC9FbTBo?=
 =?utf-8?B?d0NMUVRhRTY4YjIzbjNGUzVzbW53aXA5Tkw5ZEdxY3NCU0JLalI2anI2RytG?=
 =?utf-8?B?TjFMSEpYNjFJbmswSW5lM2xFOS9ra3g2bGN0Yk9MSFFuejhPY2Y4bkxrYnlX?=
 =?utf-8?B?dHR2TTZHK1lQcHNRd3ZyblVCWXV3SXVITFpSRmdSTit0MDdHY0hTNy81elYy?=
 =?utf-8?B?UEowU3dYWVhDVmtZYi9jMi9WWUVjNmwxekNYK3ZnVWdxdjNTTEdVT3UxRDR3?=
 =?utf-8?B?bS95MU96bDlMbXYwWEd2amlhb2tCYXZEcXE2QlNRaDUyUUFadm1WRytnUEZG?=
 =?utf-8?B?d2N3MVJHQlhUR1BoS0JmSnNXcGVvMW1DZ2U0eUVKNmJHNlVQdW1WRDUwRkR3?=
 =?utf-8?B?N0x3TktXbk4ybmxGblYzazVveW5NbXU0SVZ5M0tJTjRpRjIxK3FHZVZRRkE1?=
 =?utf-8?B?dzRwQ29HSFh0emdqR0dadlJNWTk1U1MxVHhNdUtlS3U1VVBqeXZOWFo5ajFs?=
 =?utf-8?B?R3FHMTBVbTYvdTU5VmFUZFZUYUNNY0VxV0gzcFM4L3l0Z1gvOEpoMkF4S0tk?=
 =?utf-8?B?VmhtRkh4cGxXc0RVOWVjYWZmT3RyTjBWSjBTd1VKMHRuQmJiYloveldRWFZl?=
 =?utf-8?B?MENTcFFreDIyQ1pvTXZEYzBIZHBOT045cy9HSTIxSzJMY3JMRjM0YWUweXRJ?=
 =?utf-8?B?cEx4cnpWOGE5UVlCM1lGaW0zMzFrU2p1cTZ4TnNDNHJ2S0lJeEtkS3JuVnRR?=
 =?utf-8?B?V24zLzdDN3Q2Z3lHS0Rubm1iTWNIZVlrcVltWHRqWGxwNkcwNFk0bmpMWGNP?=
 =?utf-8?B?cFlCVmdwdysycnFHRmNMV1piWW1YQlE5ODNqL2E3ZTB5WC94Z1p6SzdiYlRX?=
 =?utf-8?B?L1k3QnJqclVyQXdWNkZXSlloZVJoVE8wOU14NnlxdE95ZWVBOStjOFgxanJZ?=
 =?utf-8?B?MEdEeDBMYW5EZ0JjS1JhTm9wSnZGSis4dDJvdFdUREZwZzkzc0JTUWxnNFlP?=
 =?utf-8?B?Ylg1WllHSVdYd1J6eWVtNHBRSXd0eHJDbjloZzkrdWdXdEcxOFFvQkFhVCtL?=
 =?utf-8?Q?93f+gASaetvdo6L35ik9XBzOUXJ6Ca5WcFj2FKs?=
x-ms-exchange-transport-forked: True
Content-ID: <AC250DA31C7AD64CBC81D197C7DDAD4F@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f258b06-3678-468f-b2fc-08d937bad6d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2021 09:23:05.6424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0wxKF7z1REt8ymMPSoPMFjmYOzkjlcUYPpyK19BeiB6AOkn+1EkiPj5jsw9uNTx5buZhmQXQUjR0T1SwpOpafbWsj8BQwzwmPcabp8/CHYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6541
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ipc/msgget03: Make sure we get ENOSPC error after
 creating MSGMNI message queues
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

Hi Li
>
>
> On Thu, Jun 24, 2021 at 2:16 PM Yang Xu <xuyang2018.jy@fujitsu.com
> <mailto:xuyang2018.jy@fujitsu.com>> wrote:
>
>     Even msgget() failed, this for loop still continues. So we can't
>     know whether
>     system creates actual MSGMNI message queues and then fail with
>     ENOSPC. Fix this by
>     reporting fail if msgget failed in setup.
>
>     Also make use of TST_EXP_FAIL2 macro.
>
>
> Do we have TST_EXP_FAIL2 macro? or do you mean TST_EXP_FAIL?
> And the remaining part looks good.
Sorry. I should have added this macro implementation url(In review).
https://patchwork.ozlabs.org/project/ltp/patch/1624512827-3256-2-git-send-email-xuyang2018.jy@fujitsu.com/

Best Regards
Yang Xu

>
>
>     Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com
>     <mailto:xuyang2018.jy@fujitsu.com>>
>     ---
>     .../kernel/syscalls/ipc/msgget/msgget03.c | 21 +++++++------------
>     1 file changed, 7 insertions(+), 14 deletions(-)
>
>     diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget03.c
>     b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
>     index 8fa620855..da3753a19 100644
>     --- a/testcases/kernel/syscalls/ipc/msgget/msgget03.c
>     +++ b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
>     @@ -20,22 +20,14 @@
>     #include "tst_safe_sysv_ipc.h"
>     #include "libnewipc.h"
>
>     -static int maxmsgs;
>     +static int maxmsgs, queue_cnt;
>     static int *queues;
>     static key_t msgkey;
>
>     static void verify_msgget(void)
>     {
>     - TEST(msgget(msgkey + maxmsgs, IPC_CREAT | IPC_EXCL));
>     - if (TST_RET != -1)
>     - tst_res(TFAIL, "msgget() succeeded unexpectedly");
>     -
>     - if (TST_ERR == ENOSPC) {
>     - tst_res(TPASS | TTERRNO, "msgget() failed as expected");
>     - } else {
>     - tst_res(TFAIL | TTERRNO, "msgget() failed unexpectedly,"
>     - " expected ENOSPC");
>     - }
>     + TST_EXP_FAIL2(msgget(msgkey + maxmsgs, IPC_CREAT | IPC_EXCL), ENOSPC,
>     + "msgget(%i, %i)", msgkey + maxmsgs, IPC_CREAT | IPC_EXCL);
>     }
>
>     static void setup(void)
>     @@ -52,8 +44,9 @@ static void setup(void)
>     queues[num] = -1;
>
>     res = msgget(msgkey + num, IPC_CREAT | IPC_EXCL);
>     - if (res != -1)
>     - queues[num] = res;
>     + if (res == -1)
>     + tst_brk(TBROK | TERRNO, "msgget failed unexpectedly");
>     + queues[queue_cnt++] = res;
>     }
>
>     tst_res(TINFO, "The maximum number of message queues (%d) reached",
>     @@ -67,7 +60,7 @@ static void cleanup(void)
>     if (!queues)
>     return;
>
>     - for (num = 0; num < maxmsgs; num++) {
>     + for (num = 0; num < queue_cnt; num++) {
>     if (queues[num] != -1)
>     SAFE_MSGCTL(queues[num], IPC_RMID, NULL);
>     }
>     --
>     2.23.0
>
>
>     --
>     Mailing list info: https://lists.linux.it/listinfo/ltp
>
>
>
> --
> Regards,
> Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
