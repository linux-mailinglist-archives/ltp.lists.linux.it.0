Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 430E8399E6D
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 12:05:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BE5213C53BD
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 12:05:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5DE4C3C28E3
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 12:05:00 +0200 (CEST)
Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com
 [68.232.159.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4DFE01400E14
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 12:04:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1622714699; x=1654250699;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Q1Bxin/6KBDLlAe8kKRRZclI9QXf2wSY37WYW/37HU0=;
 b=AzXpN82TjsOmni37MqzUmeQ9uflyzaEYRxmhuLWIjAOY+YvtQIjF9AdG
 B5k9IlNAdJhRHhx2WygHT3hKXfJjK7AVB1KiROCdKPq1OM0NpDHL/8GGh
 AdrW3lilBk6zOEhGJRdBvb44f4oyKmFrC37inSSwrWsACCj0O4d3aSTU1
 1JKdaTBoG7Sc2xUaA9gJaPGMJxS676YoqljvSIhlscrRZrM51qUTHicZu
 Dj4uRqm6gsiN51aMOOzFjuX0l0hmzadRjU8gPCwAQtlQjUACOlNheE2yY
 v9PGm51+THMGApPcU2kjYBobEeWhtMpconESaA1MeBWb+qjAE2Z9CILEZ Q==;
IronPort-SDR: t+qGb3EtGrCmlaBnQB70VuA1AspRzzLj/oCOq66Pcj5uxpatIq5Z6Dm+vDSU97grlhJd0zqnfc
 mfOMDOZ1bCJQqI+qrFz5ui0EJ/eoio16h/CNkZ7w8QedNTjkOS6R+m6207VOpnaFE7+hyKFfUP
 TkH8C+KiD7yU+KM6FFmKJyNLlb7zq02yy8yH2PSiCWsJvohmszyg1z6Jg1eRaGuXtrxNO6uuO0
 IWG4r+uAKbw8xov6NpB9GBqdCpqz0QT+skVq0Bx72fx+FcFMO3WCHd8wBQsQZISxBXB1HqXzBM
 CQo=
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="32459823"
X-IronPort-AV: E=Sophos;i="5.83,244,1616425200"; d="scan'208";a="32459823"
Received: from mail-os2jpn01lp2057.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.57])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 19:04:56 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzAPz6hym9p5cR5VNQUZ35/29OZmerLVHPLmHZsdU8EZ8K9by0htofQaaiKUUVVC/59VFoc5NJRrwxUE3omFCnZsc2rFl2bBE15IoBf44YBuNl+77I/OUV9QDqdAAqOKth9s55sTkv041hKj4MkGyEmY6Ef1aHpWk7xa1L2BrWsRjPxGXyUP/q/qzc6tHGydrb46UW1u6IICuRy9feN+PUA+SSQifI2w/7A9tUh0+6T/V+rUhcIP5dISqeW7BTIrYAYKnzDeAoIGo/SU6o+DNk0etkLlhVXqkaS03LEHnw98PsJ1pHDR6Mm5Clqy+lrzK2NwxH6442MnL66fos6HAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1Bxin/6KBDLlAe8kKRRZclI9QXf2wSY37WYW/37HU0=;
 b=V4eJhn7pvanp697r+oKOt4sFijjTtNrCvp0aWj4F+gUbUexV7QBRHKQi3mJRuZDrS7ZCWi5OcJpyhtrckkgk7JC0yhYgeA60RKpHGTx2QZskELvmHhTycugeWccC5Ce/YnMPNQd9G4efTyMpRQ005KPWLqvjXVwljAEpbwYwuJ4zzM5w35DKQwL2nykW34Wrz53ltRkdQJE79HdOXVSUWa8D/YXl4BL2V3U1o33F5W4j9SFXNEqgruAPj95sbMEm+Ef3sXpOu5q/5hPTPzmOpBwLppGWRmNYLvg3gcwlwmu5kVb2q4JWiPMX+3I1dPC5HPDWCPqsbyYxy/a4q/MP1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1Bxin/6KBDLlAe8kKRRZclI9QXf2wSY37WYW/37HU0=;
 b=Cqk8XrZAhrJxab3vlzP7PQq8Ur/5F32R0ZL2MDUe4yUPSZCdUrg7wBtGA8RGtVMMBt1xRJx2i/Mk1ENpXaoL3TfUxrjwsTZQsLNH4MPstJKOs0gh8s2+2IWJJPGERDtWm4q9kjPNrRpy3ETNe6jm7uiom7oSstPLT6xifJfl5eE=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB4624.jpnprd01.prod.outlook.com (2603:1096:404:125::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Thu, 3 Jun
 2021 10:04:54 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531%6]) with mapi id 15.20.4195.022; Thu, 3 Jun 2021
 10:04:54 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: dongshijiang <dongshijiang@inspur.com>
Thread-Topic: [LTP] [PATCH] ltp-aiodio/dio_append: fix dio_append()
Thread-Index: AQHXWE4kwSGWgslrMka+KJC7F/CvvqsCD10A
Date: Thu, 3 Jun 2021 10:04:54 +0000
Message-ID: <60B8A96C.8080503@fujitsu.com>
References: <20210603075715.23524-1-dongshijiang@inspur.com>
In-Reply-To: <20210603075715.23524-1-dongshijiang@inspur.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: inspur.com; dkim=none (message not signed)
 header.d=none;inspur.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3978570b-5a1a-4154-59a8-08d926770900
x-ms-traffictypediagnostic: TYAPR01MB4624:
x-microsoft-antispam-prvs: <TYAPR01MB4624928F80B89F0941B0BC8FFD3C9@TYAPR01MB4624.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VtdVuvPu15U7hl65OfWsH3D06vyKrva/oHBiEu8cmTIC7+W7+HMOXEMGQB4JAlIj21IQlKRIJBHTVd5ZBJtqHkUoTzLjicdHhbvYBMSelesVqX2C5sG+1hY9qwrYx21SJ4sP2c4pRI9NXu/6NuU8AGhJ7tolf+A1Jy2WyQThsuUglLMrOihycrdieZvAdWZGwVCJTmSfdQ/F4a0BbAkkQbkXbgIBeZ6+o1sV5O9SWKnqw4+XTPFWN6MEUb0t4/ubzAeHs8rgwGjnu8xy1O3iETpGwDG+7kAG67gyaviZAf6+xxEDRFXeFxdnna9aYpEZPe/Suy9dE83LnezCTUsj6YJBHQ2TlKdSsWrcA/iFNPpmg93ynKZtKYP5nQDaEPVnXabTkDJKVaTDkarmMNFCUzLKVhfLVcBIiWNMLc8g2O3X5A3JDs5txOl1cel1b91fkO+GIWbNGRT26+1OlY/WIEaaPYqnroiwI0CQeR51f9PO3zEYkV5JvWMswMf11fKSQl39cbi3tytcJkdfbE9haBnQwHv6kuuLTf2GCyl7rjefTGnDxuoPKtc5sMggiMSa4q2VV5/uFbyrkc1Fh9lhgRl+NTywlTcM35ZPgi0gflQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(122000001)(38100700002)(6916009)(2906002)(66446008)(66556008)(64756008)(66476007)(91956017)(6512007)(6486002)(86362001)(36756003)(186003)(4326008)(85182001)(8676002)(5660300002)(8936002)(33656002)(2616005)(76116006)(66946007)(71200400001)(478600001)(316002)(83380400001)(26005)(87266011)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?b1A4Z2dLck1vMEdUdW5KUVI3VTlIaTlVbisxTCs2ZFpyeXdWVmxIMFg5YWMr?=
 =?gb2312?B?K2tIb1NZSU96UThkV21MRTJBcmFrVnVKaXZydmdmVnRzVUZWNDZIbGhwN2or?=
 =?gb2312?B?YjFESUlMa09BWHpwSjMyMWhlaXc2UmRvbzFhUUNPNjdndEptUU9PY3RHcWZz?=
 =?gb2312?B?Y29KejN6dUx6SWpjenJHc3RFWDlWbXVGYkxsam1iRHlGYy9DRXlYamEveUhV?=
 =?gb2312?B?bmpUR1BQYTYwU1BBQVROVDRhalIxVGVCYXFoSWEycmxDUitUbFlRNGozM1lM?=
 =?gb2312?B?eXk5STRCVVlLcDNTc0t0VUtrWVJDUzdnUXUyYkpJYWY3d3BZSVVyejBYcWto?=
 =?gb2312?B?dVNid3hLcTFrc0dDS1UremdQMXdNYVFRV2JGMlA3MkRPc21ONmcvWWFLNDZL?=
 =?gb2312?B?Wmdudk1YbzRHY1RaZ1ZFVDNTYXhiWHF0bWo1aDJJclZaUEZLdnl4bmRmUmFI?=
 =?gb2312?B?cFpVV3BnOGF4Wm9oSndndEJ1V2kxR0NhT1o2bDM2UDJIbnE4Zlk4RmhZcElt?=
 =?gb2312?B?MDZBQVlyRUMwNGxNVTRrV3dFbVEzaEREeE1hR2J4ekpEMW4rQ0UvTFNQcENl?=
 =?gb2312?B?MFNkZDBMOUlqQmtxNFA2T3ZsRkVMK1FIQUZIdyt4RzNkZ2NtNjl2N1ZsN3A4?=
 =?gb2312?B?M3RuS3JEWXdLWjYxQnYwMDZ1alFTeTFqcmNMWE9NMmdleGdwS2g0ZXFXM0hF?=
 =?gb2312?B?V1dGZkZmL2lEQ2kyNmprSHhBOCtZWE1pejdMbmpERnAyM3lHMkhxeDg5OGNQ?=
 =?gb2312?B?bW9pcysxb1l1ZVpIKzV1OWVHWmlYbzNjdStkL2l4TVUzN0hkeEZtcFVkdHNJ?=
 =?gb2312?B?V2pHNWlrYmdQZUFxVjQ1K1RKS2hFQXJyS2lKQU1IK0FZd1d4elh3enZsbmVJ?=
 =?gb2312?B?aHhKZ2dTQnBoZ0JpMXpzQnlmMzhMN1dEYlJqZlVHTWhoQ0Jtemh4N2xCRG1p?=
 =?gb2312?B?bXd6TGYyYkozWUdhZkNpZ2M1SWk2WnlmZFlyZHdWM0kwNVdrTEk4Njd5VnlU?=
 =?gb2312?B?dnJXV3JzVTVBTk5QV3h2ZjkzcjE1N1dxdFdBV3pmVm9qOUJ4RHFkRjRXckYx?=
 =?gb2312?B?Ly9SNTg2UVg5QXA1a1dlczhVSmI5SXN0eTJacWNoTVE1QmtneDNIeE9JU3N0?=
 =?gb2312?B?UGpFRVVjWllORWJCTk81VllQZzY5bHBRY29mOVpwSFpqand3Z0Vwd3hEVVp3?=
 =?gb2312?B?Y0Qxb012Vi92UUEwZEFvS0R0WTVFVGdFaDlsTUZNM3ZxNVZvckZId3UwOEpQ?=
 =?gb2312?B?clNLblZGTldDYkRLOHhobEQ5bWtsUzFHS2J1d20wcnR6RjJZU2V6UWhrVDY3?=
 =?gb2312?B?Tm9qcVNtQ0M5UGdseUNUT1d6L2dFVlJwem9aSUVTWnAwOWV2ajRSanM3N3la?=
 =?gb2312?B?YkY0QXZ6ZW5oTHRMcGh6OG1TMWhiVlFYRFBJN0VON0VXaGtucndjeUdRRzlM?=
 =?gb2312?B?UklwNENtWTJoVWU3UDVzMHlJWjdDU01UdURBYmx0NXNSMlhJUEhiNWQxQXNj?=
 =?gb2312?B?b1R0M0NBYVkrR1N1VlZNOUhoVUVHQnAzbnNRaklPTGlRRk56bGhNYWdoOWIw?=
 =?gb2312?B?aDh2VkY1T1RxLzhYNnJtbFAyQk9ucUg5bE44c1E0REhDSFNwWUs1dTc4YmJN?=
 =?gb2312?B?V0dad0diTEhCZHJHOThVaTkwS3F3ZE9Tdjg5UWVRL3dmR2ZueTdCSGR6cDlu?=
 =?gb2312?B?TllFRFh0TG92ZGNzN0duRUZGOVo3eTFUZ1E4RDRMNCtITWVid1RQeDE5SVVl?=
 =?gb2312?B?QUxyM0k5ZWlZOEEyVjR4eTZPSjlvaC9LYUV4UW9Rakx1QzhDMHFBREFCdk9N?=
 =?gb2312?B?RDRESXVDZjhHRXVXK2lsZz09?=
x-ms-exchange-transport-forked: True
Content-ID: <49EAD66646E05847954986E8EAF7B698@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3978570b-5a1a-4154-59a8-08d926770900
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 10:04:54.2691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tpln1kScjwuPjZjpi1tGaPVgyXdwd/tAhZzHkR//pQi2LwjQge7YpFSO0ftLemDOUuP0TyudAeXLExrvSE+/ZCy9Dgu4+4T08m6mTRFxycY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4624
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ltp-aiodio/dio_append: fix dio_append()
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

Hi dong
> When running the dio_append test in the ltp-aiodiio.part4 test item, there was a problem that the file could not be created, but the test result was PASS. To this end, the following operations have been added.
> 1. create the directory where the file is located.
Why need to create directory?
> 2. rewrite the dio_append API. Add relevant return values.
>
> Signed-off-by: dongshijiang<dongshijiang@inspur.com>
> ---
>   testcases/kernel/io/ltp-aiodio/dio_append.c | 26 +++++++++++++++------
>   1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/testcases/kernel/io/ltp-aiodio/dio_append.c b/testcases/kernel/io/ltp-aiodio/dio_append.c
> index 3f0ed29d5..500dfdc31 100644
> --- a/testcases/kernel/io/ltp-aiodio/dio_append.c
> +++ b/testcases/kernel/io/ltp-aiodio/dio_append.c
> @@ -75,7 +75,7 @@ int read_eof(char *filename)
>   	return 0;
>   }
>
> -void dio_append(char *filename)
> +int dio_append(char *filename)
>   {
>   	int fd;
>   	void *bufptr;
> @@ -86,14 +86,14 @@ void dio_append(char *filename)
>
>   	if (fd<  0) {
>   		perror("cannot create file");
> -		return;
> +		return 1;
>   	}
>
>   	TEST(posix_memalign(&bufptr, 4096, 64 * 1024));
>   	if (TEST_RETURN) {
>   		tst_resm(TBROK | TRERRNO, "cannot malloc aligned memory");
>   		close(fd);
> -		return;
> +		return 1;
>   	}
>
>   	memset(bufptr, 0, 64 * 1024);
> @@ -102,17 +102,29 @@ void dio_append(char *filename)
>   			fprintf(stderr, "write %d returned %d\n", i, w);
>   		}
>   	}
> +	return 0;
>   }
>
>   int main(void)
>   {
> -	char filename[PATH_MAX];
> +	char filename[PATH_MAX], filepath[PATH_MAX-5];
>   	int pid[NUM_CHILDREN];
>   	int num_children = 1;
>   	int i;
> +	int ret = -1;
>
> -	snprintf(filename, sizeof(filename), "%s/aiodio/file",
> +	snprintf(filepath, sizeof(filepath), "%s/aiodio",
>   		 getenv("TMP") ? getenv("TMP") : "/tmp");
> +
> +	if (access(filepath, F_OK) == -1) {
> +		char command[PATH_MAX + 10];
> +
> +		snprintf(command, sizeof(command), "mkdir -p %s", filepath);
> +		if (system(command) != 0)
> +			return 1;
just only call mkdir syscall instead of command.
> +	}
> +
> +	snprintf(filename, sizeof(filename), "%s/file", filepath);
>
>   	printf("Begin dio_append test...\n");
>
> @@ -134,10 +146,10 @@ int main(void)
>   	 * Parent appends to end of file using direct i/o
>   	 */
>
> -	dio_append(filename);
> +	ret = dio_append(filename);
>
>   	for (i = 0; i<  num_children; i++) {
>   		kill(pid[i], SIGTERM);
>   	}
> -	return 0;
> +	return ret;
>   }

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
