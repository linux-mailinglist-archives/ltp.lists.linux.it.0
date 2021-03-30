Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D35534E2B1
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 10:05:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA2DC3C2571
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 10:05:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6CE1A3C0DF7
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 10:05:45 +0200 (CEST)
Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com
 [68.232.159.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 70079600660
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 10:05:44 +0200 (CEST)
IronPort-SDR: 9ofEG8+mUgO6G92LJMit1yYpBK7ypKo5NoXrY43LHDpHtq1EneykMRzWTsWHjqDFxdYgIocqmX
 CQhfoK6IIfREqZKwLnI+d4azuYKy0XuZ8nfoN7VwAzRCrrUcXW4ytqGV2aR0AI0QdayXmLdBEt
 LfnaZpOPNcpDCJdEmbu5LfzjLcmZyt7EjZzDPajUwiCItwAnxOsCdX7jg59El/nqoFLpBWtD9a
 U3O6we4WHW0L2JTa0m+uhFWLTRw27KhGBggrGuIauh6G7JBXUNmlJFGiWgdD1egB5wj/2lvRCe
 JzA=
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="28713417"
X-IronPort-AV: E=Sophos;i="5.81,290,1610377200"; d="scan'208";a="28713417"
Received: from mail-ty1jpn01lp2058.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 17:05:43 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3e6LuVMYl3qo4Lw3NX3qdT/HIeZThro6p1dhZH3Cts2eLYdQRJN82h9hHnAMSjWOrxz2rUofnAsv/KHfFa2HJxBU1TP8zlPkRFuTDH/HngQknfRxNz5CRmXvT4Pz57rgXxmk/UcbLBb2yHQAv57Tr6fuAlU9pvwgagM58me3kkrhef1gstRPSdlxhbY6WFCR9A+dTFR0id6QEUuhv4ArPokZimCqR5f1hXVOdU1CXDxMScsntH14XIwwk9McO22fvpg3T5cY10fTk6NA7yMQPKig09bGGEHf8TIMyAa2hZuvamGqHeDNSwGGyn1qtVLYx1LePi9jUBSh5+oCy8EnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AALvxKAEB3HGfy3fq2HuD9hqkLFzjthgcYZ1pon/Io=;
 b=NIa+8vIdgjUiO4hoB8/dBjodSRJo49gfbfFBe67V7pAlwtLPXK72yykJDWddiWV/llHBEwoNn0YLRDAUb8BSlHOrLRxDNZbWnXL6xc0l+DyklwwYYOS+csuoD1rtSvuz5V3SRyN8Eckv9d0moxmLisK7y6WY/PN4jLXEtF4SdpOcnXuK6HPf0fweeFpDwdwNHiMLdjAMlew9bwJcmC95pemooE5+79N8aC5SptQa1vQj77GCt7zETkFPVAP0vUkk9wH24/WWgo3k31FiMX2Wi0JCbncBCogm/AUnsfRY67WkYzSiSkQmUfO/8D8uuprtFXgC8W1YzN0u/dt8meyDzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AALvxKAEB3HGfy3fq2HuD9hqkLFzjthgcYZ1pon/Io=;
 b=K83BhN17SDK+Wnn3rWDTcv+IdSf3zrDDzFfweoZcU8su4DlW8tReRL49QO4i24KlyWzYQY63gvI87rTjsN7DoW226uW+xwzBsQd+KIT/QtieMjbOWS/cRcuDKSFuqbDGvosecDr/tCm74FKbNfyzYLRL72Lk/mQUJ6uuzsA1E/0=
Received: from OS0PR01MB6371.jpnprd01.prod.outlook.com (2603:1096:604:104::9)
 by OSBPR01MB4231.jpnprd01.prod.outlook.com (2603:1096:604:43::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Tue, 30 Mar
 2021 08:05:40 +0000
Received: from OS0PR01MB6371.jpnprd01.prod.outlook.com
 ([fe80::d890:a1e4:ea0a:15c0]) by OS0PR01MB6371.jpnprd01.prod.outlook.com
 ([fe80::d890:a1e4:ea0a:15c0%5]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 08:05:40 +0000
From: "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Thread-Topic: [LTP] [PATCH] min_kver: Add kernel version requestions
Thread-Index: AQHXJTij1S6GUz92uEO2KnsMiMYWOaqcLH8A
Date: Tue, 30 Mar 2021 08:05:39 +0000
Message-ID: <6062DBD2.30501@fujitsu.com>
References: <20210330074437.3208-1-zhaogongyi@huawei.com>
In-Reply-To: <20210330074437.3208-1-zhaogongyi@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f134b54-9b86-4f70-30e8-08d8f3529bd7
x-ms-traffictypediagnostic: OSBPR01MB4231:
x-microsoft-antispam-prvs: <OSBPR01MB4231EC4377B292849C04B4B1837D9@OSBPR01MB4231.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vZaPI6JyzNypSaHxkFWr52mIyGfzPJa5Oe+DBL1N5R5raY2nNx2LQVE/nt2actQ3QnMJSiYqAqWMyx3oft1H5Pm/D5tJ+/DphRXF/lFh73zUbTAtMEZPbE9eRsPanEHfCXCag/a9qULX4tQdzBHLDqKV0sYXx/lbLeuuRupGFHYPpk7FDS4PM/BaeqXuZlSwyRR296DQhJXgJchJb6uAoPtQmzq+wJeUcd1/VOlApqOaRJgTvEHYJVWvqtn2u8b9PfTpFs7tByYIPivcP8RqobCbgxLBu983lF/gcamCG+FKlEe5pIxZAa+s98CUs+ssWkVVNZL6t4TKcVA7Xc2BIALhpEBZs2gAnzeZx0qT5nSsWQlNHTG7fWjS/MC2kbpjzPYvcIh4EMkWptWZsHjBsL3dhCcqkj4bLMkhrdeVbvsoS+wYtebkVwR14KNBxPg1+mUyIoEp9D5rOtIW7nC8ZIsilVxp4pI5CwwXVdVYC6/6hRDr7/n0DlhaKOaZTxk5Xz+iIr+tsNGRmE4q1RKsN0CtBvx4b+RygJW1vQTGtp9Rnhyqme/iiOMOjdvd6okup1odyJ73mft+/IXnfx9hM7UMZ6kdO4x4Jmkg0TKwaOOOBYLkgJ8OY4itNRWp5c1rlpukdvj9+51LaaJsk8nyi/bIa70QnJf1avC+rnKOgHU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB6371.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(6916009)(2616005)(91956017)(76116006)(6486002)(83380400001)(478600001)(186003)(71200400001)(6512007)(85182001)(86362001)(6506007)(53546011)(26005)(8936002)(36756003)(38100700001)(33656002)(64756008)(8676002)(316002)(4326008)(5660300002)(2906002)(66946007)(66476007)(66446008)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?M0F4NUt6Wi92bFlrd0ZXaTZSbFYzVGNudVdTV3U4VmtRaG9qVExOT1hlN2F0?=
 =?gb2312?B?aGJpaUk3K2V2NUs2YUJjbnF0ZDNWNnovU0JtN0VIOUhlTk9LSHdNcU1Kazhi?=
 =?gb2312?B?cVhtNzkwQysyaEpkR0VMNU1Ya2c2QkFzckxYMUZQcCttc3JNNGdDRGpGUzdV?=
 =?gb2312?B?VlRjWXVhb0x2QlJvTENNbDZxVFBVSlN5dElsc0VOSTQwb0tQa3VtbVErNzZt?=
 =?gb2312?B?bStKbWR3dElCRlFCSHFTNHNqNmNqM25LVWNnSC96S2V5UGhUZVgrOHlRS2Fy?=
 =?gb2312?B?Yy9JU1pEa1BKQ05zckRoWWNEUFVtdlE3YmhTRG9MVm12dXhsYnlhMnlrYjV4?=
 =?gb2312?B?aDBFZ09DZllJVUNQdXZIUVlIbTNTay9TUVRMNXF0dXMwcVduUVZKOVBzYnlh?=
 =?gb2312?B?V29FWFNKYU5BeXpROTdRMnJ2am55dlNnVk80RXowZ0FNc0hKTm9rTHVvWldY?=
 =?gb2312?B?VC9Bb2N3VGZJSHZmODN2L2JtR3NDMi93RTRlTFlwTFhTekp0TDNiN085R3F5?=
 =?gb2312?B?ZFdUNDVTZ3lLQk1qWnFaOGdWMERIZE92dC94RUhKTFhWellSSGFvWVRTMk5G?=
 =?gb2312?B?eHhRaDVnQ09IYklNb0FnM1g2c0ZlSUYwaTdBWjBlc3JDUkwrV1Y2d09WbUcz?=
 =?gb2312?B?M2JBWW1CL2ZWWWdGN1JHM3dQVnRCTVpwLzlCM2VNOHFiZVAxV2pLeXdxWHcz?=
 =?gb2312?B?T1p1eW1xRWVEdk8vRk5JMmh3ZjJUcEQwU0RiK0NUUHN3TnVNWDlWNUtOYS90?=
 =?gb2312?B?ODQ3ZUZTcHlJa01SWjFGZW53cUlEajZnM0dKeFNSNFQvbUhXd085NGV4azJx?=
 =?gb2312?B?NG1KbG0zOXRUb2g0Tml6SXAwcUlyNFNUaEt0MHM0RUIwS2J3L2JwNjNKVXM5?=
 =?gb2312?B?R1UvYWxMcGMyTmlrRHlsdW5mWWxVVlJHYXJFMlpxR2w0aDhJcnI4VkFIVmFS?=
 =?gb2312?B?WE1WRDlPS3BGZ0ZEc2FDaWVvU053dnZ0aXNHMDZLYkV6RmNJVDUzckh4aWJH?=
 =?gb2312?B?LzdEMVF3Yk9PS3R3M0k1UXpPZnp0WW1ER3hTTUQrRXlHdkk5YnFQUjFwSWlw?=
 =?gb2312?B?TE14SEViNlRGdWsrOS9MazdLQkFSU1BuejJGeSswS2xjM0JKSWx4THF1VEJk?=
 =?gb2312?B?NHQ0aGVJM0JGWW42REQ3aU9vU0NRdnNsUEMza3loMXhrMW9ZOVVWbXZYeWk1?=
 =?gb2312?B?dWxVR21nM2VZcFdDT3ZBM21OazliUjg3MTFzMytEUU5wVlB0NXRUazJIVkRG?=
 =?gb2312?B?aXFiQmpXNk1wVDZleDdaeS9ybFVDWk40MjBvVFVZaVZ3WmFLSFJWZmNwRU5K?=
 =?gb2312?B?TUl1ZnhOV0pyM0NsbDhhc0lVWkRDWjlJc3htNTliM3E0b3BXM1dQN2VTbnhE?=
 =?gb2312?B?ZGV5TGtzVkUzSnVhcGdxTVEyQ3JyUDhCTUE4NGpmS0h0MWhmbCtKM1prLzM3?=
 =?gb2312?B?TXQ5ZDFjL1pEV1pZM0ZOMDlFcE10N1ZSVzlqaDg3MGx0WDBSQjdFSlY1anRm?=
 =?gb2312?B?WTIvbDV3dGlBbmlscVlNYlJWZXV5S3NoSE5yZ01HYVBXS0lsaW9lbndaTHhs?=
 =?gb2312?B?c0prOElERGY0UkRiYkdnUjJ6dmhEcEp1c1ZjZGR3WEZobm13WFdXRUxCUzNx?=
 =?gb2312?B?OG1nYmhBQUZEWU16aDFLUHhLa2NMRFpSUFQzN2lIY0NvMHhYZjJIQ1BueWRz?=
 =?gb2312?B?R21DVE1YQWt0QW5yV1VUd0dsVGZ6Q25USDd3M1BaWE9LVWhHQ25FU1E0a2J5?=
 =?gb2312?Q?Frp/6o0SjR8t0WTQxnjrfJubRlj0raxgTJwfNHW?=
x-ms-exchange-transport-forked: True
Content-ID: <5F9FDC4151BA9546B5B275D649303CF3@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6371.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f134b54-9b86-4f70-30e8-08d8f3529bd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2021 08:05:39.9707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T4ZzQ+CQHKSO6bxEIWjmQiCLVQKGOkR+esuKFNdMmsFT8KCEDCq4FW1UwToDgFRh571aI+pPq/8lpBo8dNPuGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4231
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] min_kver: Add kernel version requestions
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

Hi Zhongyi,

Do you get any issue here?

It is unncessary to add version check because LTP has check the support 
of  preadv2/pwritev2:
1) Call preadv2/pwritev2 directly if glibc provides it.
2) Call syscall(__NR_preadv2/__NR_pwritev2) if glibc doesn't provides 
preadv2/pwritev.
3) Report TCONF if kernel doesn't support __NR_preadv2/__NR_pwritev2.

Please reference "include/lapi/preadv2.h"

Best Regards,
Xiao Yang
On 2021/3/30 15:44, Zhao Gongyi wrote:
> We need add kernel version requestions sinc preadv2() and pwritev2()
> first appeared in Linux 4.6.
>
> For those:
> 	testcases/kernel/syscalls/preadv2/preadv201.c
> 	testcases/kernel/syscalls/pwritev2/pwritev201.c
>
> Signed-off-by: Zhao Gongyi<zhaogongyi@huawei.com>
> ---
>   testcases/kernel/syscalls/preadv2/preadv201.c   | 1 +
>   testcases/kernel/syscalls/pwritev2/pwritev201.c | 1 +
>   2 files changed, 2 insertions(+)
>
> diff --git a/testcases/kernel/syscalls/preadv2/preadv201.c b/testcases/kernel/syscalls/preadv2/preadv201.c
> index 91e2b9889..e8220f94c 100644
> --- a/testcases/kernel/syscalls/preadv2/preadv201.c
> +++ b/testcases/kernel/syscalls/preadv2/preadv201.c
> @@ -111,6 +111,7 @@ static void cleanup(void)
>   }
>
>   static struct tst_test test = {
> +	.min_kver = "4.6",
>   	.tcnt = ARRAY_SIZE(tcases),
>   	.setup = setup,
>   	.cleanup = cleanup,
> diff --git a/testcases/kernel/syscalls/pwritev2/pwritev201.c b/testcases/kernel/syscalls/pwritev2/pwritev201.c
> index eba45b7d3..a8273e59d 100644
> --- a/testcases/kernel/syscalls/pwritev2/pwritev201.c
> +++ b/testcases/kernel/syscalls/pwritev2/pwritev201.c
> @@ -111,6 +111,7 @@ static void cleanup(void)
>   }
>
>   static struct tst_test test = {
> +	.min_kver = "4.6",
>   	.tcnt = ARRAY_SIZE(tcases),
>   	.setup = setup,
>   	.cleanup = cleanup,
> --
> 2.17.1
>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
