Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4D23E0C29
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 03:43:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AD4613C8111
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 03:43:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4E6203C8081
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 03:43:38 +0200 (CEST)
Received: from esa12.fujitsucc.c3s2.iphmx.com (esa12.fujitsucc.c3s2.iphmx.com
 [216.71.156.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 86C1B1A0115A
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 03:43:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1628127818; x=1659663818;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TPNyFP5mYrnR+OsIpAE/pifk+ho1bS4N9a53koqxDDY=;
 b=rsw8MhptGm2tPXRyxi44h90E5SXM8CAj4z3lybs1wGr/Isr+yJXAdH87
 0Mf7YzSH59r3ZPJvVx6kWQuEBHZ8VzztAH2z+pcI52nqkdaYdLYb4Yn9P
 83+TIEd4GUY7wwMLntyfwhTfv59Qn+7xvAaISZk+Fh4ADyQqi4eAXHAPh
 D8ZxJmDDAUNeXiqfFsWfVqn7i8ySJFzpnunWzR5mZQ/g/tfsv+X/Ncvnk
 HKeOjHQUsfK5wn1vwtPs/iwsis1gIIy2Q1ujUG61WYMgdTpdsAw470YWU
 giQG+DmTqWXzsjhdnEd0cuSL5qU0qarsZb2zxu7qB+yyeejyQWan2C71q w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="36199344"
X-IronPort-AV: E=Sophos;i="5.84,296,1620658800"; d="scan'208";a="36199344"
Received: from mail-hk2apc01lp2053.outbound.protection.outlook.com (HELO
 APC01-HK2-obe.outbound.protection.outlook.com) ([104.47.124.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2021 10:43:34 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+U0BmRNBL/f5VF3H0CTSH6ctm2m4FKthkGPuSjOKHVIwF4Nj8+DXAuQzwnXSIeUpetbdLLeNJMJUMcqd0S+nqiYim9xoD6vftuwdpa6k21paQoL6ANjmsd5LTUX53hLwA1rby8pAsSNOciIuL6DyifbSA07uXMJM0+/rEMVy4UDSFS1bSeCyIpRmUfEvqvLzCrJR80BysbRt/NPl5tr+nmWIVZpAtHYvm0gd5IMqpHX0lLIWHtxSXKpyhM+mzPUXKfSXuRFubP84OHfWAflsVIgcGbeCzOQs5KukArJ58q6qItkDsbopVOgGvEdGJzdMpIkck4udlYiJw223dgMcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPNyFP5mYrnR+OsIpAE/pifk+ho1bS4N9a53koqxDDY=;
 b=VvDOK4DAt5eQYQYc/W8dm/474VY3jCISKJjXwCF0Fde+8sApsqFhaYUDVsC/NVFcDtssWfLuM66Owidy1Dm6htZf9h8ZVkIvaUXp4ZZX2lhVwBuzDPt56NQZrOCjrBd+1f1diAzEP6G/eACdpI4pfDY5C9kHsJSwAOHX9OLRw/zhelEPa8BAIFIn19V7zRad/0a6cWHr/BpcF6kZ/8fLa1A/u6GlDfzMOXa0RKQTAJF7kMP/ng3g/XJdzygOZRTr18GMNeAiOX+X5Aa5fYrlD5YHZJaF4XJ0Eq/Z2nV0MZpHj2en8xAl/nNwkxRkl+9sBq8SN78sH7CBSJX4Cc3lIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPNyFP5mYrnR+OsIpAE/pifk+ho1bS4N9a53koqxDDY=;
 b=mnWAfraEAjJ3krOR5XlrBOG84RsxlxjepHb/4JjsGnBSzV+VBycaSgDSPawyWe+LW1Hrh6nLhUgqcWGgrWHKl+epUFWH4L6kcTZLw92KDGmswpsPnUzyIZyEg0voQ4vRZFrgbY7Whpl5RVwcXhT0+Fulf/R1LM7KPw5xoJ3Xx/Q=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB3658.jpnprd01.prod.outlook.com (2603:1096:404:d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.23; Thu, 5 Aug
 2021 01:43:30 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%4]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 01:43:30 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [PATCH 1/1] doc: Specify linux-stable-git rule
Thread-Index: AQHXiUi4ElBH3kDDJkqVGxcIYgdLbqtkJCaA
Date: Thu, 5 Aug 2021 01:43:30 +0000
Message-ID: <610B425F.3080606@fujitsu.com>
References: <20210715065805.14086-1-pvorel@suse.cz> <YQq3s+33ceaJmvR7@pevik>
In-Reply-To: <YQq3s+33ceaJmvR7@pevik>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47101af9-9481-454a-f9e7-08d957b26dd5
x-ms-traffictypediagnostic: TY2PR01MB3658:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB3658BA0B3C113FC41203ABA5FDF29@TY2PR01MB3658.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:499;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nn5MBr5XDE4IbT8GVFE4Tlm5v2cMPwV2vD+mXG6fru6UvjdS/kbbpZkk6rMFe0WJBjonxndAgLcIifIZCWST2Oe1jYD/Ic0Fm1C8kh6dDpH+P3fF/cHQaI0gIdu8Ur70TjrTfaVxJ/FiAOaWw51n5VH7ERi39Z8n+Eg7+mUxjLgjlgdH3VVwtzrItVsJurSJx4pp09YAY2eyBdbp0F+N0rA/Lx09pqH5D3FkOnzCtILRlGt6TlvSivTRwHE6XUf66CeBva5E4rTEiU9gXXIZBuFMwBznklamGk1dM3k5pkN5yOQPxdvTlePtnWoeDoJWbTtWGmIwd5JKBE+TAPmSnp4E8URRIYW9UgXIY30fIia8IkbE4qDBCGjEILVtgyzjrGxgetvJZxp+tO0ihSsIshbOyIU4vhJSJn01jTHDF4gtSccrlR2L9JEf2NA+o9a61YJhclKGKt7x5I4t962uyZFj5BdsIq9t9UgCaJztJbVaGTeQ8oYfneczQ4SI5skKwQJqoaGh2WQLojDpoF1DgEpkoOGlHu39nznjQlJZqRv1qnT9AeBKkU4+CZsK4PLO9vd81ammBvCvWPftI7ziAdRt5frJWaTcSkdJ9q94lfQQnpCFkRTOo4GDrQc7DNF/Haw2sr3lNiAt8Oyt6Kt2n27NMkdaIw36aYrXpetKr8UG4W2O0WDkxxAMR2J/9AFH9QdR0Zbphw3nwF7Z8dfzEDjIqOYgkyL480ul7uRWxDA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(71200400001)(2906002)(478600001)(8676002)(8936002)(86362001)(26005)(87266011)(4744005)(6486002)(85182001)(33656002)(6916009)(38100700002)(122000001)(6512007)(38070700005)(4326008)(6506007)(2616005)(5660300002)(107886003)(36756003)(66476007)(66446008)(54906003)(91956017)(66556008)(64756008)(76116006)(66946007)(316002)(186003)(3076002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?QVcvMTdpZmk0TjRsSDdGT1k1T3ltQUdVTUJZRW0yUm83YjYzVXVZeGhiR0t2?=
 =?gb2312?B?V05oTm11YUcyVE5pb0FJVzhTRjQ0bUEySkppYVhidjRVVGQ3OGNPWVJaVUxj?=
 =?gb2312?B?UVBaUHdtQmFVTm1CenJUcG9RbVNETDlEWXFGMEVjblU5QXpWMW9NNCsveVU1?=
 =?gb2312?B?OVJ5ZnNFb09RRlpVK0lkSjh2MlpLZGR4YlRObmhxOS9oZ0pyOHhxVnBoaE9X?=
 =?gb2312?B?NERHeGgwNVU2VldvTENFQXBYQ24rZEQ0SDJnSWMwT0wxRnRDaHRZS1BvdS9q?=
 =?gb2312?B?bXFhaEF2TndDbDU0akxTOWJxUWM5a21NS0I5cU1BUFJaZXM5N0daSWFxYi9W?=
 =?gb2312?B?VjhkWVdaR1cxU2JZaWhOTFZGSmtsQVgwellMdHAwQXNDcUtiQzl1eGtvcXdE?=
 =?gb2312?B?dmFKbGlTMVdSOGZrR3Fsc0N6MEdPTThWcGhTNEpyVDF1WWxXUGF1RVNqWWww?=
 =?gb2312?B?VllYc3F0K2NjM0x0T1owRUdUK1dLSklQbUl6M3o3MCtUV2gyenFRRXNIaVVl?=
 =?gb2312?B?alZCYU5vaXNIcTJsNm05OTB4Vkh4S3ljdTdsZDZ1Y0I5SFB4Z3RZbFBCZzdY?=
 =?gb2312?B?a2ZOYVZhd3U4d2JEYXpYVVkyeTB0OXpkeXBORTMyTlBHUmFIUXJRM0xqT3gr?=
 =?gb2312?B?UEFMRmgxY3pjUzhzdGlJOWNpM1UxUDBYN2J2L29oNTBxV05NNkF5NThLcDNp?=
 =?gb2312?B?eGQyOEUvWGtmL1pEWDhhMk1UWFBwRTBvNVlOK3ZveVlTOWRKMm9naGR1L1U2?=
 =?gb2312?B?bGgyYkx0d2dHSHpQWmZrRkNFbGVTZUVQcjJ4OW05OFpnbkZPZnJ6dWl2QW1x?=
 =?gb2312?B?dmtnaG1maGxYSll3Y0h5MzJGdENpZ0duRHRaWkFXUjNPa3JscWV3cXhDczRZ?=
 =?gb2312?B?SUxJWHVRbGFnUjN0WTdqdjZRZDI5NGlkUHpVVWErODVJZlBoYUV6dyt2Uzd3?=
 =?gb2312?B?eTRYODh3Z1cwblB4WTZJb28vdnZoZUc0N3V4OGRMZndZcFVOQS9MZ21EWjBR?=
 =?gb2312?B?WDErVFI5Zkl5Vzc4alpVeG1mM0JaS21zejBXVXhma0VzTnpHUmlpTmxGdHlH?=
 =?gb2312?B?SHNpU3BjbjJPT0FRWlRlMUVyb21KSU1QMDNtbHJXbytDSGJMMlBlbzQyeHdH?=
 =?gb2312?B?MUlQaUJrTHZHS0hpT3plM0dLYWhlVDFIZGpvcmhKREhnb1VNRkpyTHhLZ1dW?=
 =?gb2312?B?ejNvK2lQVkIvOUg3S2hmUUFYVmE2TXRUcS9kUjk2VFREZjkyTUNXaHNDU0Fq?=
 =?gb2312?B?MVFLYzBrVW9Yd1dIMTRmRWJqZ0pjTVpqVkVTY2NJc1NxVWMrQml0Z3BHZDhS?=
 =?gb2312?B?T0hLNDRKVHlrS1h2S0NMKzhxMXo5MnpjdWVxcEVmZzQzbS90UmpLbVFJMTFn?=
 =?gb2312?B?aFpGSUh3SDhjY2VFeURMWXNoVW9TeFUrVkduN09SRDhJeVk5THJ0c2JZeExD?=
 =?gb2312?B?V0cvSFFOUVU4cStMcWtaT1BySkVzdDBqaThBeVFNaEgyTWVYUDlRdTZZSWJm?=
 =?gb2312?B?RmtaQ1hzR1RhZlV3bjIxdExEZEpLMUx3VDBFNUlVbzkrSGlnQVJzWWRSZ1E4?=
 =?gb2312?B?T004STE1RGVKTkpKTmJPdFZuZ0phWkwwZXlyRnVoSzlhRGNScmpubklQNWMr?=
 =?gb2312?B?elFIR0FvcnNUc0RrQkU0MVJFemFCU2JxOGEyOUxGQ2YyWVB0VTFZc1ppenJq?=
 =?gb2312?B?WFljdUxONTNVbklkdXVkbTJqUUlwa2kreEQ0eENGb2RZMFJyM0VXcmU4NFNF?=
 =?gb2312?Q?1E0pAN1Qx/Dcp2ulPKxn0dMTv22OIuitya4X5ad?=
Content-ID: <08E5045FA08BEB4A88B6399F24AC1B78@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47101af9-9481-454a-f9e7-08d957b26dd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 01:43:30.7722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DSII/ksdLCLno4SUNAGbOM9ijBAft5ejbFPiZ9GOexpXAUsNV9dfLYdErSSQfzUYM3ysUg/LJvqgJmSyEU9In6j0/m7hS8k1FtQMGO7wtYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3658
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] doc: Specify linux-stable-git rule
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

Hi Petr
> Hi all,
>
>> Signed-off-by: Petr Vorel<pvorel@suse.cz>
>> ---
>>   doc/c-test-api.txt | 4 ++++
>>   1 file changed, 4 insertions(+)
>
>> diff --git a/doc/c-test-api.txt b/doc/c-test-api.txt
>> index 45784195b..9d26a483d 100644
>> --- a/doc/c-test-api.txt
>> +++ b/doc/c-test-api.txt
>> @@ -2205,6 +2205,10 @@ struct tst_test test = {
>>   };
>>   -------------------------------------------------------------------------------
>
>> +NOTE: We don't track all backports to stable kernel but just those which are
>> +      stable branch specific (unique), i.e. no commit in mainline. Example of
>> +      commits: c4a23c852e80, cac68d12c531.
>> +
>>   Glibc git commit in a regression test for a glibc bug:
>>   [source,c]
>>   -------------------------------------------------------------------------------
> Any comment on this? I should have marked it as [RFC].
Looks fine.
Acked-by: Yang Xu <xuyang2018.jy@fujitsu.com>
>
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
