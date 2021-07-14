Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EB83C7BDB
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 04:30:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 523823C9CBF
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 04:30:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 107A33C562F
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 04:30:39 +0200 (CEST)
Received: from esa19.fujitsucc.c3s2.iphmx.com (esa19.fujitsucc.c3s2.iphmx.com
 [216.71.158.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 979B7200C0E
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 04:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1626229839; x=1657765839;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=949pfMaxXtGClUmFuFTS9XYUFxRJUrbgnrx8XyV+oYY=;
 b=V9e6JoXAIDe6vm3aT+mF0LDWgYaKMWs1Wl/rwzqDq81ifAeA3rPHwE2X
 mMRIEdKy5XmGtVgozScxxSaBzbugmv4GHesHWng+YvNIs4lbmeJqjDaey
 6O9+PmIuVOn6gTj83cET6Z/rZT6926qpYJqizCp0h+IZa6mP5VqZyRzTC
 dXNXDQg+RL6HnOvbhtGqG1H5W7GG1t+M6UAC1NThm3sIVZDLI0nMo61Ml
 oVt2gm7aCq/B1qZVGtGxL4Sa4R5yCGO4MHOOkqb4w2GCGN6dMxk2g2FZV
 CF0caHxJwJ9BaTxuJ9egyNj12iNcQPwePBdo2zUXx08C7m3cnhVmBsFj/ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="34657850"
X-IronPort-AV: E=Sophos;i="5.84,238,1620658800"; d="scan'208";a="34657850"
Received: from mail-sg2apc01lp2053.outbound.protection.outlook.com (HELO
 APC01-SG2-obe.outbound.protection.outlook.com) ([104.47.125.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 11:30:36 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTieKULbfelOxp6oSGo1xim1sPb8uyrqqRIKqiG3hGdPeCxFXU9kM/lhv6I6sEKNNMFGQrfWduG7T71E9l4k5JE2b4YdrGKumWupT72Bvc2n3pfHA+mTQNN4BP9atJ1jq4qkcoLV9qVbPRguO5prrNaDXNku7gksxb5rI/I0SSCiD32bLbDEUjL8uTGIhXOJ/8YMUhE0FReiWZUZALl8R2P7SyuCGo5dBEPou+WT7qCn49W4anAoG8owSNUDJ3KIDdXS/WKlbB8Rk30mCa48jG7NQQZkEOc713fAfk/CYJDN0u7biMe7JL75J4W1FeZg0JTLPgLFnC2BmAewMpM2jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=949pfMaxXtGClUmFuFTS9XYUFxRJUrbgnrx8XyV+oYY=;
 b=lJX5aLMGkGSU/47CGxjgvRjD5fVEBQpz9YQb5yTnxop1Kt6tKShoRXNemHTF7PCS3RzJZUmJ92zPAahiGtRv4vcSxuL96p/CoRzkKwQj9BAb0eJw05NmBcQxhHEgOdt59r4/5qYqVZXAKjYdmW0RSHZMtn3rgqKcaeIt0Jr+Bh/9c0ep8zAqJ1FS3KeQblyBcAEAd6iHb7tO9vrAYtOhGA3IcQjP4nqhVPmkkWEQ984oYyqQA+/H2hVf2mooHbYdMbo4knRaHyzKEnLHSI36DN++jyzAjTl2ZTXxg8Oi+hxsN0LoBj6rKmOc2ojJq2R0kHGPwTB9OIOl8kTNDk4xDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=949pfMaxXtGClUmFuFTS9XYUFxRJUrbgnrx8XyV+oYY=;
 b=EsIlvFkguoT2mKJHQmigbMEazsjkspADjnSWxF6fhCWVmQ6NxSX1DERCpYIj5vGvYsl7y7U7zRPo0W+2WJ4Nng8+8uAucgI2J7Wq0SBD9ZWIsidSI3OATEJuB1fdvQko/AbS2YfFNkEPXzsFgC3HZJ1yICM0LKRQ/xww2iU0fFc=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB2332.jpnprd01.prod.outlook.com (2603:1096:404:6d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Wed, 14 Jul
 2021 02:30:32 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4331.021; Wed, 14 Jul 2021
 02:30:32 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Ian May <ian.s.may@gmail.com>
Thread-Topic: [LTP] [PATCH] syscalls/shmctl05.c: Fix leak of shared memory
 segment
Thread-Index: AQHXd+vl74fCun/OcECD8zmKFIETS6tBwMwA
Date: Wed, 14 Jul 2021 02:30:32 +0000
Message-ID: <60EE4C74.7040802@fujitsu.com>
References: <20210713133449.33278-1-ian.s.may@gmail.com>
In-Reply-To: <20210713133449.33278-1-ian.s.may@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc42dd03-e58f-4508-44a9-08d9466f5adf
x-ms-traffictypediagnostic: TY2PR01MB2332:
x-microsoft-antispam-prvs: <TY2PR01MB2332049CF3E453D483297219FD139@TY2PR01MB2332.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: niZfnhry085r5Yhx3cie0Lrvj6ywn5I65UwgPsyEOUIRjfxgK4Qq6XeTlcUN09k74cRUh9/D140/lhtiTYD4V2uDTUe0cNmPA28iyGEEDR6epEgsFZYXyEJfwFHz2UZboByGnZ37XUaOonSSsFxpWh/748ggGU507dgcXt98fYGlXx38vdq9I9HPi5GVcfJ0GzR0Lk9i5YB2CHhBqEkJhPp103ErMnU2q59kCSILgTWtanWMXhT1qHhaKRIc0kFqziVhEOUFRzWn25uoq4cMsGRU2n3YVBFPtSZt+JDmfhgizHsSC8oGpVC2w22FAuJflP1iqXwG9cUUcxOwr/lgDwz2i79ORloKE5DWAfJzf+KlISQmRxdLkvMkNH0wk7P2+neXVG2RHt+Ctr2CJAmW/Oq84qbaVQ4YkS/hxwvXq5ytmnG1k3FQr0Tc3H7wGeQaDFQMgUY5zMpPzA4364D5LZGZL/tifNZeBwpNrZQ0SQF157UxA5hyx6pjZA+QaaCLCMgObGwnA4os1lpTlm//UtTjFJINWlNPsUc74sYjR/z+lInW/jtU3NNsG4cvPybBYeH0hHpO+7Z/QdiQzNm7m46UiGPSv7GhlNnI0iVXWnezroyJhNThvi2002vPT+13I9enIpi0cd1+mNEe6FlA6sOnmLlWZxhDp6iRQGibjtkUpQ3PhRF1JvgAJnJpRBetG4RTUOVn921D5q8B26A7FA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(38100700002)(6486002)(91956017)(83380400001)(76116006)(316002)(86362001)(8676002)(66476007)(66446008)(64756008)(66946007)(6916009)(87266011)(4326008)(478600001)(2906002)(66556008)(6512007)(26005)(71200400001)(5660300002)(8936002)(85182001)(36756003)(2616005)(6506007)(122000001)(186003)(33656002)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?Z242NDhoNXdiU3FtN3duVUVpcGozQ2dwUnNodGtsWWt0NTAxSmR0NkhJY295?=
 =?gb2312?B?a0NNVUJRUmVCMW1mbEIxUUVUbnVFdTg5dW8xTkZ6ZkdQOWk4UWRuLzZGRVp5?=
 =?gb2312?B?UFFldzQxYWJBWlZrNSs4MDlQeG5OdjFVbHA3a0Q2d3NyK2llWHRkd3ZIaTZP?=
 =?gb2312?B?RG0yWXhzMGVmczRjRGw2dHh3L1pHNDM2ajNvNGlGM3BrY0xhdzdaVnVGM3pY?=
 =?gb2312?B?NkVZWmRXNVRYODhvT0ZQVWRPN29zRk1CUWNFbW5IclpyWld0NHRNdFd4MDJi?=
 =?gb2312?B?TFN4aGhWQTVkUlltYk90ZmFYODNjMEJkSS9oTGUxSVdUVTJHekhyNDdNMzkz?=
 =?gb2312?B?WDMzWkJOZnRPNFFzM3cvd3lFbVFDeWRKMFJkN3BvQzZKL1JKa1JEbUJCU2F4?=
 =?gb2312?B?YkpPSHhQYTBIR1hDQkxwZ2ttU3NEYlJOY0lieFNMOFBPMWU0UWdOUzJnRC9n?=
 =?gb2312?B?TDFyOW5sSm9tcjFCdjREOTRYelg1SFo1dlhvenIyL2haWDF1MlJ0bFZXUkdB?=
 =?gb2312?B?ek1WOVM3YzZOTTVMZUNmZ0RGV3N6TXp3MDhvbndQTzAxcVRWYWR4MTNnRXlS?=
 =?gb2312?B?NW1QU25QSmtYalk0U254dGdiZStSazBScWIyV1RFemNjYzM0eTdObGpLMmxj?=
 =?gb2312?B?dEJpUnpCN1ZtYmI2Z21IbVdwSE5iODR6NXJCcks2bmFRYk12dk5La3BaZE1S?=
 =?gb2312?B?TEx0d2l6emtlUGRoSnlESFlZenZLRkF4M0V3MzQvTUF1ZmlGNzFOUGRXSnR3?=
 =?gb2312?B?d2R5WXY1OWV0QlNwN2dDTjBjYWgxSDhqYldzcklZNU53bEJLVDFhM0ZQckNr?=
 =?gb2312?B?V0x6Q004bVFFMGdBNnZwWm1iamJOSHVmUktLV3pXOCtvbHkwRmpEdnlFQ2kw?=
 =?gb2312?B?T0ZIaW51UzNxczgyd3FYSHlnMUxHdWVCZmJkelJUVDlLenh5cFJXR3picHI1?=
 =?gb2312?B?R1pwSUM0ZkllUVJkWUlUdi9jVVg2N2U2bXFWRUVKYnhBL2R0TDZ5eE5QZ3FG?=
 =?gb2312?B?ZDdqMVVIdU5CckNQR3NhNklRTTZvRlg1YytGU3FLeDRrL1JlNmhmSGFBNVZL?=
 =?gb2312?B?L2s1V1A1MzZ3dUhHVDdhVHNscHNoNlh3S3RiQ1hIN09SaGo3NVd0NzVyMVdC?=
 =?gb2312?B?NEFqNjY4aDNWSlFIVUVIQTU0T1VWa2R5Qmw2Mm1kK2JwU3RWbmpUSXZlelcy?=
 =?gb2312?B?ZHZFT1F4WVpiaVNxSzZQWlhNQ2VrVkltVXVjN2hUbzdrbEg5dXV0VFdxRUFQ?=
 =?gb2312?B?cjZpUFdxTkdaSXRVL2JJUGQwdDB3MzRXd2V5emlSbmszc2N4Tk1lWWJVS3VY?=
 =?gb2312?B?eU1sUjVlTHBwcHlqUTNpMVU0RXNwOXQwdUVsWno3NXFUWGhVL3N2T21kMWxZ?=
 =?gb2312?B?MXpUNG1ZNGZqWWk3cnNFWEJpY3A0cW9pU043WGplb3dWUzlZV282VzhwN00x?=
 =?gb2312?B?b0p2M0ZRaXVLdjgzcS9KRnQ5MG9MdWxScDlyOEVJQUpwajU5TjZUbnFqcEJM?=
 =?gb2312?B?ZU5OYm5UMXcxSFdiQTRLZ3Z6T2NvTnpDNThIYTVkZUVDQ0VjYS9FbzE4alN4?=
 =?gb2312?B?MnpXZENVZys3bmNET2ZseWNURlVGWVdSdzd4UlIvL25qdWMwNDYyL3dOckxH?=
 =?gb2312?B?MWxpc2tkMUdTVE12OTFaQ29Qbm82ZFlsemVKV1grd3ppaGduS2xaNnlCSnli?=
 =?gb2312?B?UnRvOC9KaHNQbmxrOGVkbEMxZkY2NlozaUN4OVFEN3U4TXFIeUZqeEw5NytX?=
 =?gb2312?Q?ljtoDlB7IfDGaDWOH+KhDqvlnJARfuanrP7PFXX?=
x-ms-exchange-transport-forked: True
Content-ID: <18496892666B544AA7DAA9D255842AC2@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc42dd03-e58f-4508-44a9-08d9466f5adf
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2021 02:30:32.8177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3lS9CTXwuh5CI8BjQDLs/RxgD3kF48JSH6Ru8JNKq6j5xFUHNVgN/I0anvaiw+rWy8U4epyROeXhfWdHSaSlB2g+WaKJ+Lr9dCgPwkUtIoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2332
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/shmctl05.c: Fix leak of shared memory
 segment
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

Hi Ian

Thanks! Applied.

Best Regards
Yang Xu
> The cleanup function is using the key 0xF00F instead of the id in the shmctl call.
> This causes the shared mem segment to not be removed properly.
>
> This can be reproduced with the following:
>
> $ ./shmctl05
> tst_test.c:1342: TINFO: Timeout per run is
> ../../../../../include/tst_fuzzy_sync.h:522: TINFO: Minimum sampling period ended
> ../../../../../include/tst_fuzzy_sync.h:345: TINFO: loop = 1024, delay_bias = 0
> ../../../../../include/tst_fuzzy_sync.h:333: TINFO: start_a - start_b: { avg =   ns, avg_dev =     ns, dev_ratio = }
> ../../../../../include/tst_fuzzy_sync.h:333: TINFO: end_a - start_a  : { avg =   ns, avg_dev =     ns, dev_ratio = }
> ../../../../../include/tst_fuzzy_sync.h:333: TINFO: end_b - start_b  : { avg =   ns, avg_dev =     ns, dev_ratio = }
> ../../../../../include/tst_fuzzy_sync.h:333: TINFO: end_a - end_b    : { avg =   ns, avg_dev =     ns, dev_ratio = }
> ../../../../../include/tst_fuzzy_sync.h:333: TINFO: spins            : { avg =     , avg_dev =       , dev_ratio = }
> ../../../../../include/tst_fuzzy_sync.h:678: TINFO: Exceeded execution time, requesting exit
> shmctl05.c:89: TPASS: didn't crash
>
> Summary:
> passed   1
> failed   0
> broken   0
> skipped  0
> warnings 0
>
> $ ipcs -m
>
> ------ Shared Memory Segments --------
> key        shmid      owner      perms      bytes      nattch     status
> 0x0000f00f 629964859  user       700        4096       0
>
> Fix
> In the cleanup, add a SAFE_SHMGET to fetch the id and pass into shmctl call.
> Confirmed this resolves the leaked segment.
>
> Signed-off-by: Ian May<ian.s.may@gmail.com>
> ---
>   testcases/kernel/syscalls/ipc/shmctl/shmctl05.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl05.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl05.c
> index f8b76bda7..ea7eef6f1 100644
> --- a/testcases/kernel/syscalls/ipc/shmctl/shmctl05.c
> +++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl05.c
> @@ -91,8 +91,10 @@ static void do_test(void)
>
>   static void cleanup(void)
>   {
> +	int id;
>   	tst_fzsync_pair_cleanup(&fzsync_pair);
> -	shmctl(0xF00F, IPC_RMID, NULL);
> +	id = SAFE_SHMGET(0xF00F, 4096, 0);
> +	SAFE_SHMCTL(id, IPC_RMID, NULL);
>   }
>
>   static struct tst_test test = {

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
