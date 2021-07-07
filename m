Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 368B43BE0E7
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 04:36:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F16A23C9558
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 04:36:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 96B913C2B15
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 04:36:34 +0200 (CEST)
Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com
 [68.232.159.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F17CD1000ECF
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 04:36:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1625625393; x=1657161393;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wWqR5dKo6g3rAaUySDaLdYJe/UrofsRVhrlva3YMDlo=;
 b=d3NYEgNeIbXGtUoIXS3aGs+VSZA3fM2+GvuTx+r8SBEqUjqJxti4HXNu
 4qwaFMsfCfdogcxCuHq/5dRzUY80IlqZP5D2hrMTFG6iiEa7NNgDUSEI7
 JWdBbqRGBnyG3T/owqNtgNoDpYnqoB0jf07W39yicLBJ5gAiSNuXEKbXQ
 /r/ZeSfTT/grC8FiahHmG/AzehcN8WZkdK0GTEwnNK5BtEALu+07KOpeq
 L/Lz/TGXU3HCZ0B2HK3ti/z2aM+lIuB/z199DpDuFZgTki0WJO+lBo1ZA
 lfxHEaAgTpIi/1jqTRqzkBfBGvnWhNlT2wLbiJi84+e63/hqPlYD+zaD7 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="34423302"
X-IronPort-AV: E=Sophos;i="5.83,330,1616425200"; d="scan'208";a="34423302"
Received: from mail-sg2apc01lp2056.outbound.protection.outlook.com (HELO
 APC01-SG2-obe.outbound.protection.outlook.com) ([104.47.125.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 11:36:26 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5hvPbn4p0CiIRiNbB1P1sd4wlh+tQ/u1JEjc0OI4Wr/IKwXPoiYT9ylujZ1lviIegtaOloSjG0FiuLQQsElV8gI20/f7l1fKD1PNHnmOcipWXlQwdzN4hs8F19DWxRuuLPcyHp0DPWw475FdYtcMJ3VjB3DFb929TDVe1bTc3/HHv9/CWNkjPe5dY+PU5GZgjedi3WUYAtpKMR3vEo8c9QChgLJQeDlleC0joe7f7IF2mEDJb303JYX7Q1aIH7zdMhmS8ZkcEEGsPxNSWN+WNk/mjSYdDGrg4QqHnxwVJ88L8KF0yeSZ9vlhBT2+jiP+TOwsGfyi4VzzzFgEb2Z0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWqR5dKo6g3rAaUySDaLdYJe/UrofsRVhrlva3YMDlo=;
 b=Sxfbk0W5nksnjI8EKFRIaSq4ipqMBUAJUzXolt8t+4pQpQzl9NJbN1f6XRMt+ByGk71afXBPV/p1hIo0isZAyZVLas3r02Up5vKYJiQunHtpK9V2EuQDm5zLtK/BSGgj8K5PGA389+bt8uQaW++W4fb0pN0ipjkgCT64cTjENCCE7l2m/5VQVNegx8SQvXFkkUX/spqFkc4siMUCTE5TgQLmzjxdWKflFOk2Yehhd7zBJODh1o8OuhmlPPjWdcejDmPDLKYx5b4k8093gW6hNE2V0InPwPWzQavy/AJUfe4PZe8Z808nHkA62GkJPnUKKf+idv2JgHH6ZGBWhob++w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWqR5dKo6g3rAaUySDaLdYJe/UrofsRVhrlva3YMDlo=;
 b=HDg6oZgD2xKwP+H70kU+kNgoAxijKTzoBAnQB5stYZ0OwH1+gKySRlAWzrfz8WoIvKnIWzzLAxV28LYJNJo9zZlFF2p4P651/mcdl3ggfq0vy3Yw0v0sc8DbE6ZSUddl9fY3wCXQc2S3e0KXZ4EoygIPbOYPCMhor0v4SS1pVYo=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB3067.jpnprd01.prod.outlook.com (2603:1096:404:74::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Wed, 7 Jul
 2021 02:36:21 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 02:36:21 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Thread-Topic: [LTP] [PATCH] shmget02: fix EPERM test when RLIMIT_MEMLOCK is
 large enough
Thread-Index: AQHXcmnx9Xu6T6pyeUaT1Py5bi5Tq6s2zRKA
Date: Wed, 7 Jul 2021 02:36:21 +0000
Message-ID: <60E51347.5000209@fujitsu.com>
References: <20210706132114.204443-1-cascardo@canonical.com>
In-Reply-To: <20210706132114.204443-1-cascardo@canonical.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83969e21-2610-4883-6c8e-08d940f001f1
x-ms-traffictypediagnostic: TY2PR01MB3067:
x-microsoft-antispam-prvs: <TY2PR01MB3067050B1CB0A9C20FB4C1F3FD1A9@TY2PR01MB3067.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UHPfFceYCLurJN5LLxFCJmPCVWroj7sH3qlIiSBY2wUXE3HgRaJ2jhhsVQ4jbMzFq+oAYo4iztWNI045d5OK9THjBtfGbX1RbMUr2nBQvZuVEoxz50HufxNr76OlzOIOMTGUt6sVApUVkd39QGI011ww8L7OEfA4lnTRMg7RyYouW3RyQnF3Qb6gjDR7MK1fmKmfD3k2IFU4rEOh05zzcHtOBGVb0Ow50MrmbDyAGb1UJjuKCdvcSXj0+aycTvsStHQDllCxh02/4ogEpcfcSAfwzixTaILr0xoOn2fpUhCsOtaLZ+b2qwTXo8iuQpqI5PDnaLJws1F9cMYGaociw+jUcFWzTxxjL5/L/DNV7SYv+9u42K7HzpxJnAw477FuhhFYJx+qj5vj4mOr95OBh8UwrYy39GlcFrzAnz0CCT9hXkV7wntk6rFlMwRrGxZ2BtLdroAEo4jHPbYQrmdtEBvlSohvObvhCH6b/EjAjMMeC24uYzykpyONSIY4/T0fO0cEeepxKN4sBnlB4s2P8WnPdiAbNWNDPGfTbDRX2kb2dkor4X9QauVHz8pz6QR7UFoJ0J1iRQUvwZu6mxqF7TJmgzzo5cil93QFa8OhkiqVtze71z9w5FvgqLJfEZ3UAKtYPuOQYp7gSyiboSsO6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(8676002)(6486002)(6512007)(85182001)(26005)(6506007)(2616005)(83380400001)(2906002)(36756003)(8936002)(86362001)(4326008)(5660300002)(87266011)(76116006)(122000001)(33656002)(71200400001)(91956017)(64756008)(38100700002)(66946007)(6916009)(186003)(478600001)(66476007)(66556008)(66446008)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?K2F3YTB1WkZoRWhiSHRlZUk3aldlWDFPZENXVVhmN0xRRXN4S1o4R24vc1d5?=
 =?gb2312?B?V3lRMWowUHVsaTJiMkdRdmRDaHlIQkVpMXhYVG5haEIrU2ZtNC9sMDlGcHh4?=
 =?gb2312?B?UGNHSnMzYVg1b0FpSTlNYWYySmhhRHY4YXAzS2pmUGZrN0p2OVg5cC90UEUz?=
 =?gb2312?B?cFQwSTZGakdDQW9QQkkwck9oaUVyYlp4WmdHdnpJMGxuVmdPdGwwWFREcWpD?=
 =?gb2312?B?cWczS1d2UnZHYXJLdTZEUEVMSnRRRUpJL3hhZXVmTVpkZGRoV2VZc1lzWGha?=
 =?gb2312?B?QkszWmFUeU9wWVhGKzIvWktxMHUxemlKVnRPaG1oOWRHMW5wNUoyanlRQ0tr?=
 =?gb2312?B?TEtRaGxJKy9ma3Z3bnZHakozN0gveXEvSWhUT2RWWXFxWUVOT3BKV3ZTeDhl?=
 =?gb2312?B?TXdGUHJKTkcyaDdtN05GT0VUMFVaY3lpNC9zWXp2bkc0RVlhY3dabGxlS0Ey?=
 =?gb2312?B?Q25CTGt3Rkl0c2J2ZllKVE40NUpYUFRjMDVtU2xEQU0rSlVWay9XSEFMaTdR?=
 =?gb2312?B?eFhzZmIza2kyZ2RXVUtwa1pLRGtkU2NrYXh6Ly9NZHN3ZHk2cVErb2hiWE1W?=
 =?gb2312?B?QzRoM2k1RVJnR0duQk5ST2cvZnBNWE5kSG9ZUE1qb21RV3YzM1NvMFJZbkRn?=
 =?gb2312?B?aVFIVWF4ZHdpK2VMTEJxS3hnUEVtMkxIMGlhNkZoMGRYZkx4N3FYMVcvODRX?=
 =?gb2312?B?ODNuQ3lVLzRvOEVsYnZHMGQxSmo0am9KRzVEVkxqdUJySVI1ejRvcWJETnZl?=
 =?gb2312?B?M01XOHQ4S2ZmY0EvcjdFU3Y1eUl2MFVpVXBlQ2NXU1FZRGlURThHbDhBZ3dD?=
 =?gb2312?B?M21pUXhwSkFPTkJQQXJWRzZ5TWJ3Rk4rNE9zSG5UWDE5S29UQmpRWGVPRHdL?=
 =?gb2312?B?Q252VVUyT2VvNTVCYXlqQVppWllGYk9aWFpQMGVXNkdwZG9iWFFIMnR0ZGFV?=
 =?gb2312?B?c3Rsc3ZZSkRFTHJMQWdXTExYSStoQ3IxL2tDVTdZUnNjYUprU2I3OW1KekZn?=
 =?gb2312?B?TjAySUZnL0VEOFVSelRtUCtUOFAzZy9FVDNGQzJtUUovSDlkbGlKdGE1MHZW?=
 =?gb2312?B?TkVtRjZDQnY1cU5SMmlmbW9EelRiUmZOUzY0blhKNnladWpvRjBXL2ZLM1M1?=
 =?gb2312?B?cUZrWVNaN3ArWEhwZFplV0ZJMllkSXljUmpSVXVyelhtaUE5bm1sMGlPQXBP?=
 =?gb2312?B?UUU4SkxyNHNYTUdJenpLMm1uWGFoSnRvOG1leWJJZlRkZVRUZFhPTnBoMEgw?=
 =?gb2312?B?VUg2dDNxMzFjOVhDNXVKMnV2Ky9nRmdJODRhSHRneWQvZm5ETlN0OGRGa2ts?=
 =?gb2312?B?OE5SY2t5TVlVR3dnWTNzTkpSNnl4QlpsRThDaDY1Zk5CdTl5ekRyQ2FQUmJZ?=
 =?gb2312?B?RmlVKzlIMTdDb3ozc0M4N3RSRFZNUGM2QXcrTGpoUVN6MktJb1luZFNWMEJE?=
 =?gb2312?B?eUhLb2p4NDFYWExkL1FJblFnSnlDR1JWTEZ2bEZvSjRVMXJRY1lGN01wdkFY?=
 =?gb2312?B?cTN2TTlkUjdhY1EwMHA4Q3ZTZk1wbVRwMFZ0eDg0YjNVbGdXMmJEZU1MY3kw?=
 =?gb2312?B?MDRxQ2NCZDRnV1RpNUpWSlZVTGpwaWZtZlNsdzFvOHRQTTBoNkl1eEpjRGNm?=
 =?gb2312?B?TlhMMU0wSW1HVzVZczVLci91N1g2NnBuaXFuU1NSUVFFeEFOUm9oZWFnWC9k?=
 =?gb2312?B?UnVWYzhOM1pZOExobGt3dFE5ZndZSFRuOUVRbDg0emdtYkdLeEU0M2J2TGR3?=
 =?gb2312?Q?W4wtgNGpXHtUE7lv/eit55WYSDFauiFZ1n1bs9m?=
x-ms-exchange-transport-forked: True
Content-ID: <840FF39EE7A05D41B75F2A35A998A71E@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83969e21-2610-4883-6c8e-08d940f001f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 02:36:21.2351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D/pi/a/5U8h2bHt+gTT/VHxF0HZP8N0eCG0O7t7nQmUkmkZATfk05vSrmHLkkHI0vSryVEov0mQDyOAlQrPe57ZT5PBL8yoKJaSFMRTttr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3067
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] shmget02: fix EPERM test when RLIMIT_MEMLOCK is
 large enough
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

Hi Thadeu
> shmget(..., SHM_HUGETLB) will not fail with EPERM if there is enough space
> for RLIMIT_MEMLOCK. If the limit is 0, it will fail with EPERM as expected
> when a not enough privileged user calls it.
>
> Set RLIMIT_MEMLOCK to 0 for all calls, as this is the only one which will
> fail because of that limit, unless we are talking about very old kernels
> (before 2.6.9).
>
> Fixes: 4dc493b44a85 ("syscalls/shmget*: Convert into new api")
> Signed-off-by: Thadeu Lima de Souza Cascardo<cascardo@canonical.com>
Thanks for the fix!
Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>

just a small nit: Since a child process created via fork(2) inherits its 
parent's resource limits. I prefer to move it to setup function, so we 
don't need to set it in each sub case.

Best Regards
Yang Xu
> ---
>   testcases/kernel/syscalls/ipc/shmget/shmget02.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget02.c b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
> index 6be8d8157999..8857207cfd3d 100644
> --- a/testcases/kernel/syscalls/ipc/shmget/shmget02.c
> +++ b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
> @@ -64,6 +64,7 @@ static void do_test(unsigned int n)
>   {
>   	struct tcase *tc =&tcases[n];
>   	pid_t pid;
> +	struct rlimit rl = { 0, 0 };
>
>   	if (tc->exp_user == 0&&  tc->exp_group == 0) {
>   		TST_EXP_FAIL2(shmget(*tc->shmkey, tc->size, tc->flags), tc->exp_err,
> @@ -78,6 +79,7 @@ static void do_test(unsigned int n)
>   			SAFE_SETGID(pw->pw_gid);
>   		}
>   		SAFE_SETUID(pw->pw_uid);
> +		SAFE_SETRLIMIT(RLIMIT_MEMLOCK,&rl);
>   		TST_EXP_FAIL2(shmget(*tc->shmkey, tc->size, tc->flags), tc->exp_err,
>   			"shmget(%i, %lu, %i)", *tc->shmkey, tc->size, tc->flags);
>   		exit(0);

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
