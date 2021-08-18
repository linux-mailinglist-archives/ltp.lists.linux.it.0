Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD6C3F0113
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:57:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9F0093C5649
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:57:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 32AFA3C5567
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:57:16 +0200 (CEST)
Received: from esa6.fujitsucc.c3s2.iphmx.com (esa6.fujitsucc.c3s2.iphmx.com
 [68.232.159.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A74C31A0067D
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:57:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1629280635; x=1660816635;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=6FuwYipfYS8BaQ3Tsma0sKrEm/Cyoxon35cuVha2jBk=;
 b=lFvtPSJufo1FGhisX2jIsUps6imtJEmhYFSOTgvnIxXVAJawFqaq+gUr
 NJ+Ib1LzNjnLxGGMfdQAG5xUbQEbRKbmpIie34SF4YuIB2/KWO9gJus28
 +u5bGjGHhaA3K9tTu3OjYRChGVLpVyRM4uLoiMAxo2vcHWWXLtlawCv5s
 Jd4CTtg0yE8wGjl5FNYvBEmj1/NwxPXeDygjOg8+befxwQyFRg5XWqn2r
 hsIQIBCKI7l3o+80JieezPquXceg9jPNTbXZSEy1yOj7jQ48xP1Af6Syp
 qS17aKUZ9wg/spiG7JxbhWOBHHfdxjJlEY9GcHYjiVMbdO+A2N239IHYW A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="37013656"
X-IronPort-AV: E=Sophos;i="5.84,330,1620658800"; d="scan'208";a="37013656"
Received: from mail-hk2apc01lp2050.outbound.protection.outlook.com (HELO
 APC01-HK2-obe.outbound.protection.outlook.com) ([104.47.124.50])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 18:57:13 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1zJBSg9N8dqKW0j/iZscpBS+gfpfr6evW0cJ1Q1RzJAERCTeOiZVkPjzFxmEZ+ggmlVtSzfVjQrYoua/BL4S9LImeK/VgX+CKyqzX1KuoztU5AbYcqxcIfei500H+iGxW/0t94uAvf8Y2rvd7SEVy3bJU141NN5gJXXgiNGcXERPDjIIwLIabhQYESKJcVghH//9IJHpMgSKNS0BKUinAvzkhlRfU2//RNyZAjAkdKpWTWTzgLwdkTacs6Fg5b9frLijb+8WAiBFkQlguTGjwe2fiSbCBwfE0Day4JXryr3fkwPqixvh2qIUzW+/LDGuHUW6+gePFi/oIlt2Lmnzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FuwYipfYS8BaQ3Tsma0sKrEm/Cyoxon35cuVha2jBk=;
 b=hfRG8z0+0+sjCzMgqc6KGQpcPMAoicBOp2r/IeeAcL2pm/yzCzvUzAWQpUC9N8/GmvdgO9scz8jqqgMcA/IwdtU1FWgoZ72udaDIH8bsWtglDum9gBEz+PzAeSKY1o7vLjfs8eF5E+C+sqS53NgKt+/GKW1RjUFAK9FJ6k7JyBI0LtJNxZw6fe9CkdNQM6qyTOhN4N1t+XrmlKy+9n+Qs5EWITRoAFnJ+OVn0tqd3KGiyABlxvNx+B+He1lO9uB1HOuU1KSHdGDhKTH4rVTjjyjkuYA9l+OWdVDlKHax0fprQsWGJgWHaWwDFXK61/vO1cWEMOgOTw9RNmv2wdVt4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FuwYipfYS8BaQ3Tsma0sKrEm/Cyoxon35cuVha2jBk=;
 b=RH8r7e9JEY7AAzIhlZ40r/oR9xMkM1HLaHFbJQriVPjlI7uyiDXCbXBIMzxsTxeRz/jAuO/c6s+qqhzLrhj0tBMKytCold4Jz3tWvxVs+As5RyehU3h+K2F1O4PJ7zYwJE2rfM9h1JndMrdfSZ52mwwnVPUxQSPwF/RDGXWxwzk=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB4203.jpnprd01.prod.outlook.com (2603:1096:404:db::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Wed, 18 Aug
 2021 09:57:09 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2062:692:9cfe:3f79]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2062:692:9cfe:3f79%3]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 09:57:09 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [PATCH] userns/userns08.c: Enable userns in max_user_namespaces
 file
Thread-Index: AQHXk9oIkQJYKCiRIU2gaINj5a0vnqt5By4A
Date: Wed, 18 Aug 2021 09:57:09 +0000
Message-ID: <611CD984.4080706@fujitsu.com>
References: <1628144855-5924-1-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1628144855-5924-1-git-send-email-xuyang2018.jy@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none; lists.linux.it; dmarc=none action=none header.from=fujitsu.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71664bf3-de36-476b-7c17-08d9622e8b6f
x-ms-traffictypediagnostic: TY2PR01MB4203:
x-microsoft-antispam-prvs: <TY2PR01MB4203C8AFBF6995C842479EC4FDFF9@TY2PR01MB4203.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1sCdW99L9nKEFBU9oke6bH/54SoSzFvUsY6owpfyX7yreQOUuVOrGw2a9GRO+3QsfhZXXPSQ0M2RXFqeiSVEgTM58S+kLc7XRjy4Cea6mLQc6pIn8f8d3iv0FxOvCxJ/HFyQeeF8FPnrU3z4BcOqtlOSbw5FA0wE7UDO+zg5Q+O9WUy5UKx04EHiI12yUdYinSUkPg3sfDJFOdZ/XefVnQ+ILH7ncZLpHgdIBFIEGxk9BMBiA5e6yd5cSyd1K7296QohA7zwPtXqtEMhoK7KDwaDl+sC5TYs/eNAw7BHMUeoq+bAzXEOQen4bouGuLD2OfSNp2kVqvl5oIjjAac/oOGqrgZTaFmkJw1Fv8XlrXA07zq/E6umu1DXVfZVH2GjeFLkkm6WJlrV8YGnBEPN0GLKYJDYB5WX/t8FZ1LOS/8SonsoX8BCo82OCmdO6Y4vowbAH6NKOk3W7OMRtT8/FAf9VoKCKNiqkmeiAf4wQdEyevcIXxp5KJWmblZVmrxtvZywiUZ6CDEVZogdleibSTEV3jxLse2rBzdan8Gj4FJ++uS9nMPs/NYn48/gL2HLxn/41aGu/u6Fe/YF07pIlZSFPg7xMpyp44xhatl3XPM1a60FFr20SkYehvp+gfW+yaV4epHRXp0OnaNpmbX089YzJpepZQWa29eEzhmWYyN+lFzOtjMlyZjZHJ9RdgNTYWiD2JdwS7bUlqtWvhGwOQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(86362001)(478600001)(5660300002)(85182001)(66446008)(83380400001)(33656002)(8936002)(26005)(38100700002)(186003)(2616005)(6486002)(36756003)(122000001)(2906002)(316002)(66476007)(8676002)(38070700005)(6512007)(87266011)(6506007)(76116006)(91956017)(66556008)(66946007)(71200400001)(6916009)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?TWFkZCtMK2pIRWFlV1pIMjg2enVlZW9tN1MwVTg4QlRTTFIreUxNRGMzeC9O?=
 =?gb2312?B?WGx2WkswVjl1ZFFRcVhndlJqbnJvUzloM0pkUks5cnpMVkE2S0s1VnIyc1ox?=
 =?gb2312?B?VURwT0NXak9nQ1hwUmZGZHBkRDM0TEE2blZkZXlqZ2VIamVPa044bU1wcE5y?=
 =?gb2312?B?L0lBYndIeUIwUllnZVkxT29mdHA1Q3UvSE1QU0VPR2I5b3k5TFVsU0M3SFdJ?=
 =?gb2312?B?VFdaMm8rTVh3Z2FUTU1qZjFUZnc1NDVtVmxYQkh0TmR3S0E4L2krYUdxODZ5?=
 =?gb2312?B?Zzl2czBsajVKbUFTZjZPSnJDUGhVcHYvSUFWalVEOERIVnljZFkwZE5HR1Vu?=
 =?gb2312?B?anB1dWZDSzJZRk1YUi9jWTdDbytjZ3A3VTZwcUd6T0lNbFlsWEoyNmJKY1RE?=
 =?gb2312?B?bGN3K01LLzZDdGxBUXU0cFFiR2NWeWlmU0J5VWxQMDlIMkt0d2l5d2ZScFVy?=
 =?gb2312?B?SWJhb0NDSDlCTGlEbVpmNkdkSnhaQmJqRGpyWnRSUXArTHdveXVicTc5VzdW?=
 =?gb2312?B?cTJ2bXlLbXRJU1I5bUE2eFk5NSs5MzBtUEUxcHpOVWZkUGR3aDNzRUozcURR?=
 =?gb2312?B?c1dJNmh3c0VZWW96cktIWXZNWFByR3ZxVHZzNGlnaWhxMXhkWE9iV00yRGtl?=
 =?gb2312?B?LzFtL2wzQ0tYZzAzQWdmSVlqU1lJU2xWTStkSGttWHdoaEUvRWg1WWJhZTgz?=
 =?gb2312?B?dzYyMzNiTE5RSDVRTXJkQUxTdEliWnk3a3hkWjdWY0w4bGVPSEczczh1QWJH?=
 =?gb2312?B?T2NhUmMyOEZWbDhndmt2N0lsZmg1Wkh0ZFl5ZEFMTTRBdW4xL0RhbXl0NUhP?=
 =?gb2312?B?MkpkbGJHU1FKTFpaNFBqamNIQWJCZVJpWjc1djVoVnNzSStWdkwxT1FLVWJN?=
 =?gb2312?B?cmdyYlVWNUJrN3NWYlZrU0R2cWIwQVhJaWxlVnM4M1BNLzFLTS9tenVxQ1ZH?=
 =?gb2312?B?TjQ3blFXb1ZWVEVUSURrcjZ2MDkzbkVlNUl0c05hZ3IxRWVySXRaaTEyWGkw?=
 =?gb2312?B?dkJiNFZkeTM4VE5yTjRnRjNRRDY2V3NNTWZ4NlJvalFFRWNEL2laaW1UdE5J?=
 =?gb2312?B?M253N1M3Y20zZDV6UG82MFRkMG5ybzNMUVRORjdzQkp0S2srTjZkSFdKUjl5?=
 =?gb2312?B?ZU1GZVJRTGt6ZS9JRUt3NUhCR0pKVWY5RGFaN2RWUDJVMGx3NkpvYk5PTG5O?=
 =?gb2312?B?WUJTaG83MEFFWmNIYjVrU3F4bEY2WGF2SUJNVGVhd3RVTTluZXRDOXJub2ky?=
 =?gb2312?B?UEVoa1BpZnhCK285am5LeUZTdklRMjU1K0ROdEFmTlVJdXU2MDFYcEx4RXYw?=
 =?gb2312?B?MDh5RGZJNXkxeHRkc21raHY0SE43dVhRdWRNMXM2am1IWXZTTHB1ekhDRVdX?=
 =?gb2312?B?a0xZMkRGVG1rMnpESk1paStVeFRHL3doaVdZa01teXhLL09CTnJublNvbEhl?=
 =?gb2312?B?Z09yaStFRXVhM1dtOFhYR0JTaXROZzZCa1VSL0RtQmY3YXR1K1lDbzVFR2lE?=
 =?gb2312?B?WVBSTHhlay9lRTRKbXQxUTVjRWVOWlB4eGZ3b3dwNG5INFR2WHRzUlBtTTJC?=
 =?gb2312?B?bVArckZYMGxjMnBYc2xnK2VWa3Q2YkhRNXBPVmR0QjVDWkRkZkZiNzlXaW9u?=
 =?gb2312?B?c21ON21HTHhhMlN3UmZUb0NrdTRPVVJtRVJnQU4wbE9CUEdKOFZwUG1oZU12?=
 =?gb2312?B?NGdobkhHek1yK3BJc1pEZDZ4Wk8vVTI2SEgzRlBnYkY2bkxGRlRiTTRCRktB?=
 =?gb2312?Q?vcw6CsE4+FdSvyDIIzFmKOS00b0KZNsJQe0sLOI?=
x-ms-exchange-transport-forked: True
Content-ID: <37927E8FB020114580D966E856383659@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71664bf3-de36-476b-7c17-08d9622e8b6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2021 09:57:09.6086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GhNhht9/G9pZjpklFRNopU/ssC7C0qQMff9gaCURjA/pOV4gIANhVDNKhoLuLKylNBHB9r/IOGJGjeRtOH+A16ns049kibxNjIwh6UFgwMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4203
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] userns/userns08.c: Enable userns in
 max_user_namespaces file
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!

My machine's time is wrong, so I sent this patch today but the email's
date is 8.5(It may lose your attention).

Best Regards
Yang Xu
> On old distros ie centos7, the default value of max_user_namespaces is set to 0.
> Enable it by increasing this value.
> 
> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
> ---
>   testcases/kernel/containers/userns/userns08.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/testcases/kernel/containers/userns/userns08.c b/testcases/kernel/containers/userns/userns08.c
> index aedfc6c4e..0910ea7d4 100644
> --- a/testcases/kernel/containers/userns/userns08.c
> +++ b/testcases/kernel/containers/userns/userns08.c
> @@ -120,6 +120,11 @@ static void setup(void)
> 
>   	SAFE_WRITE(fd, 1, "\n", 1);
>   	SAFE_CLOSE(fd);
> +
> +	/* The default value of max_user_namespaces is set to 0 on some distros,
> +	 * We need to change the default value to call clone().
> +	 */
> +	SAFE_FILE_PRINTF("/proc/sys/user/max_user_namespaces", "%d", 10);
>   }
> 
>   static struct tst_test test = {
> @@ -133,6 +138,10 @@ static struct tst_test test = {
>   		"CONFIG_USER_NS",
>   		NULL
>   	},
> +	.save_restore = (const char * const[]) {
> +		"?/proc/sys/user/max_user_namespaces",
> +		NULL,
> +	},
>   	.tags = (const struct tst_tag[]) {
>   		{"linux-git", "d2f007dbe7e4"},
>   		{"CVE", "CVE-2018-18955"},

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
