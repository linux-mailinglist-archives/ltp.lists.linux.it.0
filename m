Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8563E399E10
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 11:49:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E654F3C8F1F
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 11:49:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D0E283C281C
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 11:49:41 +0200 (CEST)
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com
 [68.232.159.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 90C9163B7DC
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 11:49:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1622713780; x=1654249780;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=1z1nlGgtkdwUIOS9CGy2ZkAO4/M24IB4wZrUTWdrpFE=;
 b=NpwSminsC0b1P6wIt82ptwfVtzahc3m16V7TmO+WRphyPmBcP31pgkE1
 Y1+DqZjNn9HeVsUA+lG1B5RbUtbx91Hsj4hIdNDt1vTnsx0gpx0I99MQi
 g5G/jIYqOF5iTjJawXUW/2KHVuvTfJWsuCheBOPafLO4qLGDl2K2RnBE7
 OOyhF06Fam0CLnpMe8ijiowZksCRK2G3S7FJwxR1YtNZoXgdiRUB042sB
 pa+vUfbEuqH3gyughQp+z9me5g8KqpCxN44txHmbwbtGFrzK9c9/FBqD9
 GzdmEi7wxS0ZiwOTZZwSwYc+RF7VhNvGYRIJpZ709vHZZbxRkSvnqKEwM w==;
IronPort-SDR: SHA6PeybZzgEFv3Y7knoiZ2lW9dNeY2gESM+DGrNtkrJon0WNZAMEFeWKPh7EgOTfeKVGbx5Yl
 JVBUMMhpLYYBgCX6cue57aJf6vf6Dy9tSFns6sCToF2mvQRBAORmjMrD/+Mq8TCOJcZtaYchLO
 7cvR+dL+K+Prj6KiQSIPewZSkdbGYMNL+AmU6vFiiV+Q3IopHu08xZ9OktXdDispgdVHPzh8lm
 aGSLIUzWuh6RkVylkvUYYMgwLPhVa4iWk18ndC19binQ0VHG8aQbQhiFxQLcB2lAkmWfPWXB0t
 T/k=
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="32456985"
X-IronPort-AV: E=Sophos;i="5.83,244,1616425200"; d="scan'208";a="32456985"
Received: from mail-sg2apc01lp2057.outbound.protection.outlook.com (HELO
 APC01-SG2-obe.outbound.protection.outlook.com) ([104.47.125.57])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 18:49:39 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSs5D8oGo3Wn8JRVJ6/7sm2vZE8oLIbjnmXtTxWHe1W0EE+bUQPGlheVyU0R1XSQTTZFhpYkNvQ44xWS4hGIgHpmzoe6RekrVfdaSfDQ3B1JhoXK0KuEXirT91eDHHv4u6G4QLEB5r05rwpHEdWBYOImwaNbd1ODtAAc9vybW8kSsxq30lbptWYp/3ql9fWpIz51jRsinXgKWNlnhExseGcQKkpgEEThh5gIbmsvvycePhDjC1rB5EsymbMSTQPSBe8LNfFq2nHY/abjJyOzvE3bWjP9c0abr9V5tY8BtnVq7ob2AT2n8CqIxT1vBB+0b84MzHuO/MTUINNBv47gmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1z1nlGgtkdwUIOS9CGy2ZkAO4/M24IB4wZrUTWdrpFE=;
 b=SDi07gDLAqUrM+1SGjbLJqzL1ZpokcQI6H0dqFT/ucNmjwUqCaQR/c2EdO7Ro4jFbdRjwoDkOfBNps9HpHbsiJeAKngvOm9CobSnu0aILAJjwortOXb5fa2VUtMPStjx3QNfr54gBK7GJNdL93XlNU/95MB1OI5wfktN/jwuHVkn4DoiiikTbNAeaV9SLvhuOpyujDvQFFatz9nQETDgcN+Bs6+OaHnqhk2l8Eoxy4PHD2+IMbl6oiTP4M1lh7mQmvt1/5me+M1F6NuHhjx3OLIhSes3Jf3kH5zKGMM5wl2s+YEJGJAuRrvqXEPeRwcXRHGIEx/PhY2k+GX5YKjYhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1z1nlGgtkdwUIOS9CGy2ZkAO4/M24IB4wZrUTWdrpFE=;
 b=Te2tm0TyfDNAhCG24OHPcmDLRDe0hI0QCg0iEQMQ9L2Q+1xOtCah5tr6Zt4izDj1vunc/f54RUwim1CQBM5bzyAapc+YeL6bd+UChbNcw9jCor+GC2cnVr6hPqv344PhvIuG5pPPaYdFL5Q4fmUvXGVMiXEJxSlGoIcbIlUAHUM=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB2188.jpnprd01.prod.outlook.com (2603:1096:404:b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Thu, 3 Jun
 2021 09:49:36 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531%6]) with mapi id 15.20.4195.022; Thu, 3 Jun 2021
 09:49:36 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [PATCH v1 2/4] syscalls/shmget*: Convert into new api
Thread-Index: AQHXRwwpzyqY+A1+/kSsod3vd4wLYKrfqYeAgCKEFAA=
Date: Thu, 3 Jun 2021 09:49:36 +0000
Message-ID: <60B8A5D6.1080308@fujitsu.com>
References: <1620809541-6891-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1620809541-6891-2-git-send-email-xuyang2018.jy@fujitsu.com>
 <609BB199.5040409@fujitsu.com>
In-Reply-To: <609BB199.5040409@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.linux.it; dkim=none (message not signed)
 header.d=none; lists.linux.it; dmarc=none action=none header.from=fujitsu.com; 
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21ede1c5-3e44-4fbf-0370-08d92674e609
x-ms-traffictypediagnostic: TY2PR01MB2188:
x-microsoft-antispam-prvs: <TY2PR01MB2188BD624A65AD52DEF256CAFD3C9@TY2PR01MB2188.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hsK5Rw8z+9TtpOPV4drp/tAl5pffbp2AS2KYODzNHYAhfUmNnUdy9dvDZvRCYD6tMmtSpicVKIf9ah4SBPXl56El5R44sltEu3/vMlbAcGNittpkynCrxxAWg3v7Ty+G/lIO+OaZDq0JhbfBSQLXtFHDBFbJcD9E33BTih/n8lzcka2NL1ZivPztAaeVXhfWAAZRAVMYSAc20GfDvtn25J9T2w8qQDaffWINoRjBvaxCiDOpqJiwIpiP3P61jO6R/iyB0H98MwDzbgF1mfCBgJtRWcAx/DnTtSpAu63FYLaRV5HTqTDyg2fG66wCY+Z8SK2+oY1ZWHeNs79iNhTS0myTpNzKM4ofRLSxEFh3KaLMkyhEbv7W2ljAevB8Gqtop/DmWSPSO/NYYpJQ/GkjQeK4Uw8mwYJ22cYjzcgT/7h7lGg9L/DE4YUaak0H7qNgg8NByoFUORJfJ0Jd5yrd7/wblzIDMM9+YvsheCAqVXfMcvnoEBVYJ4E7P44x80Pffs8odYWgrW41akwuUGtpb7Zsx1L2ugOLsLy5JHTzZzc6DRpHB4XYAl0moBmoyqapF65WkqtAVO35wnrBg0TbllPfdmJIotYpMWQ8s8PV1UPPuUui0pFkmJmlM5v0x741PyNrITKthhpzN9D2vUm/B0u3WWXISTBIrkDe6PjNqe2lg83yrNI94sCZ7aQ4mHf3HyBbF2Eyrt3Aazs7fkJO6r7c9Mn71LDftwYEYTfKzpc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(38100700002)(2616005)(122000001)(8676002)(86362001)(478600001)(8936002)(71200400001)(316002)(186003)(33656002)(87266011)(66446008)(2906002)(64756008)(6916009)(36756003)(66556008)(66476007)(85182001)(6512007)(66946007)(76116006)(26005)(6506007)(6486002)(91956017)(5660300002)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?YU1qZHJxWTdDTEw0UHArQWRHSFdDS0pEc1kvNmhsYW93VGRtSG5leTErYXBJ?=
 =?gb2312?B?VmFUd0dvWEs3b0piWGFreXVBVVg0aEtZYXl2bEJJZHpVUlhQcTd5NlFIdHhl?=
 =?gb2312?B?WXg2RlVDTHp2Ri8wWnhCUll5WWRHYytUYkZoYXlhTGtVWllkakVEWEh6VDl4?=
 =?gb2312?B?bnFETWY3OEx3UmdMVjExOFc1YWRTOEJFYlQyOUU4V2tlVlg5cm5XMERMMmRF?=
 =?gb2312?B?RkdNRGk4L1h3Z2lVUUU1R3BweEFPSW1zckdJWHlTc2JIRmJBNWNoRFh0NzJq?=
 =?gb2312?B?a3IyeGVUL0NGanZ1OWRNMW9kVHgvUmdWZG83VnhKbUhLVzVSMGZVeTNqMWFx?=
 =?gb2312?B?M2VGSGJQZW5IelNaSWhXbmFJU2dHZHNIMUNpVEl1RmRYdjc3SDlIbzhUL1hx?=
 =?gb2312?B?SWZmb2hrNmxQTHM4Zm1oWTJiRWxrQ3RsUHFSTi9iWVRjNXZrTkYvTTRUUlh5?=
 =?gb2312?B?SHltclNUTDVaUGJYMGtCKzZ2V0JqSVhoV0Q4ZUxPbTNZbTJoQ1h4N3piem1n?=
 =?gb2312?B?TkNncHpKVytTMFRYV3dqZ2dCcGtRZGNlbEg3QVNVYStrOXROTlFPMzZKcDFV?=
 =?gb2312?B?MXJ5TmIwT0V6bmRYN1JWNExVZVFFMDJpandsalllZXIycjBDNnZyRXhnMFNM?=
 =?gb2312?B?cGZtNzAvQjQwV3ZiVXR0ZUs5RFF0T2puR0FHMU9CMEdiMHAvU3RqSDVaTFRn?=
 =?gb2312?B?bEduMDBtNUppSnkzaEF6K3Y0cE5QYzNkSzhhclZwcTZHM0FscmdJM3ZTaXpq?=
 =?gb2312?B?YTVydEtpbzV5SmlxSVRGSE1yZ2dTMk9oSVFwZnBvdllnMXhjZEdONFo1V1FR?=
 =?gb2312?B?TVR4Z0NTUjJSMHZRWkNuL3NZTFZCTTJYMFNpMGtwZnpwL2R2VEZuandoR0Mw?=
 =?gb2312?B?c2llOC9McXFtek84cWdnSWxoT3kxalB1QUNYSzZDcE91K0F5TUtsZU1FR01H?=
 =?gb2312?B?NElNQUhFaGM4SHowYVF5eUJCeitpcFU1UVk2TU5hVndIRGE3S0ZhQWlBQnBh?=
 =?gb2312?B?REdLdjU4SWJ6VXM3Rk5EK0lqY1U2S2dZNFIyZGtxYWNIcXFxaXpSMHFRQmtj?=
 =?gb2312?B?SFgrRW9KT2VnVFByYjVRVWduYWRhc2tTdC84ODdRd1RRR05SMC8zVFdia1Qr?=
 =?gb2312?B?VmZVWFp0dTZWQkhLb0p0WTZHZkk4Z0lzOUh2K2o1YWcrUlhtckUybWNuS0tG?=
 =?gb2312?B?Q2RYY0dia1RSSjJndEJvTUdmdGVNNDA0ZE5RUVVCSFF6TU5mbDFMbGdtZDMx?=
 =?gb2312?B?MXdJd2Ria2REY0IrazlNdEIvaEtYMGM5K0JEK1FpZlhtancxRCthZGZrMTlR?=
 =?gb2312?B?Z055THh1QzNyNUdLVk9oeFJVZXNWb1ZJWHNQdStlSHN4eTI2QzR2Q0ZZRDAy?=
 =?gb2312?B?TUdQQUJ0RllGbVVYRjdNQ1pwdldwdWlLTmtZRkFGT3h0MUxYOUJaV3hoUG12?=
 =?gb2312?B?UW5uSXZ4K3gybWhJM21OeFB5RmdlL3BzQW9IRnRIa0l6WThTNDZscEpNMEtC?=
 =?gb2312?B?RFN5Znd0azhLQXhXbVlPa2hueExVUktnOFphRVpnYmhXYWJjTTMvdkprLzZZ?=
 =?gb2312?B?UWtaOTVnY3Avd3h5a3E0am9mU0pvbFRSdWlMNnFTQVRCclJHcGpBTklBSDll?=
 =?gb2312?B?RExyM0dKYVJUcE9vVThNblVQUmYwSUNzSGNHc1J2emNVZUthYlQ4TFhISHpm?=
 =?gb2312?B?QnZOdWhjSVkxMXE3R0I3NTZyblMxaWdYYVFoN1dhOVlKSDhZVkcxa2d5VzFk?=
 =?gb2312?B?LzFtNGk1d1UreW9MRnAwU25QNllnYmJXTldpMzE1empPRjlsTERmdVEwdGtZ?=
 =?gb2312?B?OFg2dHdEeVh2TENlTFFXZz09?=
x-ms-exchange-transport-forked: True
Content-ID: <34C2A1F09642A24D95ED14646552BF89@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ede1c5-3e44-4fbf-0370-08d92674e609
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 09:49:36.5619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ohBkJyTCoFgaTeUMpj+t6jJrp/pbLMCaa3DONevQ6JkHnrMrP/oY9biA/0BaSVDUZBogxry10+wiVP171G6oRcSMhDt+u4VNdOeNCR/EMFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2188
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 2/4] syscalls/shmget*: Convert into new api
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
Ping. Also add a url[1] for the missing EPRERM error(should see lastest
man-page).

[1]https://github.com/mkerrisk/man-pages/commit/090fdddb4342f92a1dbeba687462f4bcee816232

Best Regards
Yang Xu
> Hi ALL
>> 1) merge shmget05.c into shmget02.c
>> 2) Use SHMMIN -1 and SHMMAX + 1 to trigger EINVAL error
>> 3) Use SHM_RD, SHM_WR, SHM_RW to trigger EACCES error under unpriviledged user
> 
> Sorry for missing EPERM error in shmget02.c(I will add it in v2 when you
> have comment on rest patches)
> 
> diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget02.c
> b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
> index a57904ce9..319d1e972 100644
> --- a/testcases/kernel/syscalls/ipc/shmget/shmget02.c
> +++ b/testcases/kernel/syscalls/ipc/shmget/shmget02.c
> @@ -17,6 +17,9 @@
>    * greater than SHMMAX. Or a segment for the given key exists, but size is
>    * greater than the size of that segment.
>    * EACCES - The user does not have permission to access the shared
> memory segment.
> + * EPERM - The SHM_HUGETLB flag was specified, but the caller was not
> privileged
> + * (did not have the CAP_IPC_LOCK capability). Also the caller's group
> id should
> + * be not in hugetlb_shm_group proc file.
>    */
>   #include<errno.h>
>   #include<sys/types.h>
> @@ -47,6 +50,7 @@ static struct tcase {
>          {&shmkey1, SHMMAX + 1, IPC_CREAT | IPC_EXCL, 0, EINVAL},
>          {&shmkey, SHM_SIZE * 2, IPC_EXCL, 0, EINVAL},
>          {&shmkey, SHM_SIZE, SHM_RD, 1, EACCES},
> +       {&shmkey1, SHM_SIZE, IPC_CREAT | SHM_HUGETLB, 1, EPERM}
>   };
> 
>   static void verify_shmget(struct tcase *tc)
> @@ -91,6 +95,7 @@ static void setup(void)
>          shmkey = GETIPCKEY();
>          shmkey1 = GETIPCKEY();
> 
> +       SAFE_FILE_PRINTF("/proc/sys/vm/hugetlb_shm_group", "1");
>          shm_id = SAFE_SHMGET(shmkey, SHM_SIZE, IPC_CREAT | IPC_EXCL);
>          pw = SAFE_GETPWNAM("nobody");
>          tst_res(TINFO, "%d %d", shmkey, shmkey1);
> @@ -110,4 +115,8 @@ static struct tst_test test = {
>          .cleanup = cleanup,
>          .test = do_test,
>          .tcnt = ARRAY_SIZE(tcases),
> +       .save_restore = (const char * const[]) {
> +                "?/proc/sys/vm/hugetlb_shm_group",
> +               NULL,
> +       }
>   };
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
