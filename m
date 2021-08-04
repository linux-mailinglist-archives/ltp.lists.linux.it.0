Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D94B3DF937
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 03:23:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 589193C87F0
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 03:23:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E7A903C4DD1
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 03:23:19 +0200 (CEST)
Received: from esa4.fujitsucc.c3s2.iphmx.com (esa4.fujitsucc.c3s2.iphmx.com
 [68.232.151.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0C9551A00804
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 03:23:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1628040199; x=1659576199;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mS+bPCf3X+uPihvbvYIXL8MTFJOCFoyqU62r20Pzqeo=;
 b=tHU0d+eVBVRC24lazZ3cYP/chpPOslYuQCOvZhvpofIa/FhKLSCnnNwY
 vESFRRDGTECsfY9uJJFonbuSzlBVS0z4KB3UcULYjIIe41Hq3GDyjxYug
 Y69pA1bK6LKzmSIK4f2whw/HcsrS7ByXy+7qTVXpag8gZk85/v1Wtqvfl
 QLcy4+JYZ3bExDNEgWGqslYHyESZ947bD1jJnc2kpTKr51ec41xYPOiC5
 93ByRksBP04ClBdpcS5Ad6lsFDLAWJ6SLhp00bh6TcUfveXdF1d+4SpHV
 qxDml0rLiIRfEvcA4WbGHtz0OKLTKr8MiMuLQZEubwmedfffXB9rPJR9A g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="44006182"
X-IronPort-AV: E=Sophos;i="5.84,293,1620658800"; d="scan'208";a="44006182"
Received: from mail-hk2apc01lp2057.outbound.protection.outlook.com (HELO
 APC01-HK2-obe.outbound.protection.outlook.com) ([104.47.124.57])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2021 10:23:16 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBDZzoQXazxrcI5/UX/Zh6H/E24slWs2bIJzT/OWpDf5jH3GyFWv/Mb4XGoEHnvSCJItRoU9MWp+mR8W7oV8swOmAmaSR3rbzK1kzNRusBNqcmS9D835S2VM+vY5hj6kKMMmdy6yGWEgvMvM7PS7yr9YSqDBYATfkRMDtYiRBsfG9Pm1a9rEty6NtEwCB9+LmzJu62lFmB87FAhqeG0HwCt4AINxRBSesG1iohLQ4KB0SSyb6tR+WjMSBM5HHzw9or57yU8EaLkBDiQqhE0c0JWmGVLNWj0HBgXiXG6JPA3MVZSD4ZJteJYgU3exV+6aOlX8MewKs4yq3b6A7zlLlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mS+bPCf3X+uPihvbvYIXL8MTFJOCFoyqU62r20Pzqeo=;
 b=j0HujjLVf/+/ApoWeQ/m3HXp6HZRsB15jdW70EBUXbqXMW9iNfOXyLdxdIyNPN9bGBtZTiJBVSJmq1RTSQ0EwZlVspY7rFTmt29KGFhh3T3aYbC1ttF8D509P+BJuOJfvDZggi/aPFtHLLuJFsSmAbZWZh011CdxouoTV0lwRJ88XwSlkGAMD0Exr1OgmC9jBKsGRNc7eDZFa5boeizEZ/BQ3VW/4N1zpKR2VmJmNAczFJgTyRlzBiywEOH5rGwPs2GZP+eP6Eh/a8hrHDof4dpJ+SqeqitgglmHug9TjStNG7YnvykU3lC1uPvq4WcFXazhgHCGY0lBFMnrcYpLJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mS+bPCf3X+uPihvbvYIXL8MTFJOCFoyqU62r20Pzqeo=;
 b=i6Xc5Lh0j6yaNRk7kIPU+LlzN0r9g51fOrGbSOw3PwVJXWfZsS5ZPv8t5N/cv1zTwBMoKLzxIL4Cde+pQ+oYUcW8fCOm3mebvfgNTCSFKfAmCslo3HKpKtGFY7UoUP9ntlurMfELMiGffEKRV0vxCOqaBBbPL0WfN4Kyzlazl0c=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB4940.jpnprd01.prod.outlook.com (2603:1096:404:117::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 01:23:12 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%4]) with mapi id 15.20.4373.027; Wed, 4 Aug 2021
 01:23:12 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] syscalls/madvise06: Add madvise WILLNEED
 performance problem tag
Thread-Index: AQHXiEE9dKmyFU+DlES/v2wLI7n1n6thpoIAgADnsIA=
Date: Wed, 4 Aug 2021 01:23:12 +0000
Message-ID: <6109EC1B.1040502@fujitsu.com>
References: <1627979166-967-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <YQkpwAieJwTCzK+c@yuki>
In-Reply-To: <YQkpwAieJwTCzK+c@yuki>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2589e3cb-5477-4d83-8d69-08d956e66d23
x-ms-traffictypediagnostic: TY2PR01MB4940:
x-microsoft-antispam-prvs: <TY2PR01MB494075291C0BC90EF1777D0AFDF19@TY2PR01MB4940.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8FdPzG+6ukYUi7O37vH80A4A3WA36DN7ySVxHv0rvKUZe1tPqlOkwehySNXykV0DZlhEf1RcD3RsMK1slmUmcMS7rWeOg/2FBLiwhjSRhWKkOF8cIBqa1rmEHoXmfNt+H4OJDc3lQcrjhr/nk+aHe+I9Ajy/BtHHfKeAqNBXUk9Js9vjE6xmPXkXtN4Q9VvlcEZD/nP/wjKMIEqYRQeG61+kd/ZjJjq+4sYbPcV+dI7MVyf8ZtGczHTcGrlD29H4N1JoYhx2pYwL39gw+xOtZUlOCfp6XC8U3wiZTizBR3OmE+GnqTQvqU1hMQVLiu00BIB6W5hFp9+NarV5ugjI8xo/OGcv36PcTcvEpl/vlmKmL9NtTsa4jztrUOWOMozrUOS49XRv3jN/IAQjUNpIupqr0g0iUQ+OjA7H760kg85Q80+jQLqn44cU3IAKVCzhptWOOzzqP9Q9/Fpd6OAFpqHDXoerfaenF/IEfRO4e0xyOoJZIIsycCGnOd56099N87e12IWAjMdjLa/wxxkBk2Cdi7nn7PCIHxyiVEEfvpJQMgE4ANa6NnNsKUXBk2kib2VzjkPu8vOkAEOz5eKL4rBTv7oYmolLXtf3m4FTlRQJCuclejVJ2SXyVbB0chfhsezbWPlGbwpFK14hu5Ridh91OlykUWz5Kc58y17Qtm1RHLrrp4DcindIGdGQ+HCXZR2nzoQItmsiDobcoCvhc72zYq6+Zv0S6mo9j0/MfBRFY1ag1R23Q/DWus7g/Ccbnm/a6/CoES5vrUekf5ucCS7msmDTo7Tva5Fi0+vYTrc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(6506007)(87266011)(122000001)(38100700002)(33656002)(71200400001)(186003)(26005)(6512007)(85182001)(86362001)(6486002)(83380400001)(316002)(36756003)(478600001)(4326008)(38070700005)(5660300002)(6916009)(66946007)(66476007)(66556008)(91956017)(76116006)(2616005)(66446008)(64756008)(966005)(2906002)(8936002)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?V2ZUTThiOWJZVURoU1FxbHE5bjJLSlRhVnArVW44aEN2MmMxVXpmM3VRZEVx?=
 =?gb2312?B?b3NrWGh5YTQvQjRMaXloYkR6SFM5MmQ0UU9ETHVtMDltVjZCS2NKS3pxUnpP?=
 =?gb2312?B?bUI3S0NHbVBzdlpma0RGendkaldYNnlOWFhDdWV3Ky9hejFQUXBUQlZxR3Mv?=
 =?gb2312?B?S3dkZyt1eFN5cXQ5cGRwdWZ2c05SWE5qOWtFQWtuVjF3dUYrL2FJMTNwSXNy?=
 =?gb2312?B?b2ZEVS9DeVE4VVVmSERYQzVQSXhVYm1OcWxPcEg3REQySkl5V1JFQWNzcGhM?=
 =?gb2312?B?bkhtYysrT0JGaUs4NkRDVDh0Rm5TY1BTcDcvQzJjZU4vRXJzTjJLTDBGck9T?=
 =?gb2312?B?MHY2VWQ0SjlBdHJPQkl6S25CQlRCUy9uTmswbDE1WUpGV0lpTjd5NkpuV0o5?=
 =?gb2312?B?eVpieGFSMTZLYkEzSG1zSGhNd3dtbWw1c2l5bSt3TkZyRmM2dWl2WHFDeTA5?=
 =?gb2312?B?Ulk3T0g3UC95UDVxWGhNbWp5NmdIWm04ZjZEdW04MG5icU5obk1rQXFXb3g5?=
 =?gb2312?B?dWduK3ZtazhOMWZsTndsOFI1eWRpN2gzWGtJZldDRXdxNUhaNTV6UmhGV2lE?=
 =?gb2312?B?NzQ2dm8ydVk0a3d1RWIxZ21LcktsY002eWVSS05FSTBTbXFIZVhUZHI4ajdp?=
 =?gb2312?B?MTZDdGpMU1dUUGNXVUZjS3pkQlhGWHRTbWtCdWo5VGpXamtySm9YNWxwUDNh?=
 =?gb2312?B?elBrcDFSRFJUemxDSzdQbW9ZVFhhQTdyWVRubU4zMVdMdWt2bEVKOUxVUjU2?=
 =?gb2312?B?VTk1VU1tVy9JempjcDBGQTFYb0JFeXkxTkIrTXVuODlPQXdyd21JS3J1K1ZF?=
 =?gb2312?B?WllMVUtWSkpMSkFyQUVJWmxTM0xVYWxReFlTQzdPbWg3dGF6aDFiRnFuVk1r?=
 =?gb2312?B?QmJYWUk1YUo5VXFGbjlJRDVkWVRwUmxQVy9EdFhSZFFaYVJ6MEhHSU1WV05l?=
 =?gb2312?B?WldPU3BhbzVvS3IxWWNJelY2NWpqVm56U0NYYm1IcDk5S2RJTDFXWUllS3JZ?=
 =?gb2312?B?NWl4eDJkYkVmWktneVgxM3VzRW9NdWRZaCt4Yms3TUlhcExtb09WMWI1cWsz?=
 =?gb2312?B?VHY0WkpsdGZwWTZJYlNGZTZENm5wNjZmUnFRMWJwdElXV1FLUnRqWGhuOFll?=
 =?gb2312?B?dFNQY0MwR0o0ZGx3VjZoajZhZ29CSGUzbGZuUXM4bWNCVFZyNmowcS90WHlN?=
 =?gb2312?B?MkVWeVJiREhXU2l2enJhajN0Q1czNEtCOXdHRlFaanAwY0NjMzJuTXVmaWQ1?=
 =?gb2312?B?Ui8vWTllNmhLclNDQWlzSVY0TlRlSmlUdGhzWkd3aCtyL2hRRzFBNi9zUmVa?=
 =?gb2312?B?YmRuZVVwODNyV2R4OVVqVnZnRHFva3NhSXRHRll3cExuaHJCQVB6NHVsT085?=
 =?gb2312?B?OWl3NzRYWGZCbk9TWHMwRXdkU2VDK1RlVm1kenVNU3U4K2JCakNBN1B3Y0Jl?=
 =?gb2312?B?NldvMHZvZHV2eEdzUzkwVnd4Q1lzMlVqMkFrRG9UZU11L29SRlN3S2pEek1N?=
 =?gb2312?B?cTlERzBHYmxFZzV5Vm5sOU9lOXNna1N4SysyWnF2bnZSbXdEdXRVcW52dnA0?=
 =?gb2312?B?aDZrRFM0RW1xaVc5ZXhuQ1QvQll4TDJucWs2cHVUSTFEWWFOK1dJZGdQYmV1?=
 =?gb2312?B?b1o1VDdXd3E3eHI3RTVSZ1hhc3QxNy9PYnZVL2NDRUFtRUt1bWczT2p5eU1k?=
 =?gb2312?B?dUZnRDBDVXh3OUNlSlVxb01aakpVQUtqbkd4MzN3aFp6Mm96UzM2WUpjczJu?=
 =?gb2312?Q?Ri3IHUPr4+lthx/Q+5eUGu5+6kpI873MxVHJwHs?=
x-ms-exchange-transport-forked: True
Content-ID: <E5D8C2DB05526E489404B1AD6CB1AE5F@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2589e3cb-5477-4d83-8d69-08d956e66d23
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2021 01:23:12.1755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: phHRZuDi7+bWvze3uSaC859w5MnQqIFDR2I9LS6MNw4cj1abZXwzzzynuN3hQMetmY8KulurSUseekArR1n2+6c/tfobgBFTMRjMZdQVZL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4940
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/madvise06: Add madvise WILLNEED
 performance problem tag
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

Hi Cyril
> Hi!
>> diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
>> index 63d8d5452..f2f65ff96 100644
>> --- a/testcases/kernel/syscalls/madvise/madvise06.c
>> +++ b/testcases/kernel/syscalls/madvise/madvise06.c
>> @@ -35,6 +35,12 @@
>>    * faults. Two faults are allowed incase some tasklet or something
>>    * else unexpected, but irrelevant procedure, registers a fault to
>>    * our process.
>> + *
>> + * It also can reproduce the MADV_WILLNEED preformance problem.
>> + * It was introduced since 5.9 kernel with the following commit
>> + *   e6e88712e43b ("mm: optimise madvise WILLNEED")
>> + * and fixed since 5.10-rc5 kernel with the following commit
>> + *   66383800df9c ("mm: fix madvise WILLNEED performance problem").
>>    */
>>
>>   #include<errno.h>
>> @@ -242,6 +248,8 @@ static struct tst_test test = {
>>   	.tags = (const struct tst_tag[]) {
>>   		{"linux-git", "55231e5c898c"},
>>   		{"linux-git", "8de15e920dc8"},
>> +		{"linux-git", "e6e88712e43b"},
>> +		{"linux-git", "66383800df9c"},
>
> We only put patches that fixed the problem into the tags since we use
> these to print failure hints about missing kernel patches.
Oh, yes. Thanks for your review, I merged this patch with removing 
introduced patch tag.

Best Regards
Yang Xu
>
> Other than that it looks fine.
>
>>   		{}
>>   	}
>>   };
>> --
>> 2.23.0
>>
>>
>> --
>> Mailing list info: https://lists.linux.it/listinfo/ltp
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
