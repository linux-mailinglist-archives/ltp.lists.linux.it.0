Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 766F7DA820
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 11:16:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24EC13C2348
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Oct 2019 11:16:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 1D3D43C13E0
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 20:10:34 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140083.outbound.protection.outlook.com [40.107.14.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2B16D2447BAB
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 20:10:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJp46p0f5fJQPqXbt6g6dsfoqdzyfoq/X6SEsIkmATA=;
 b=iqhwmsAEn6BjhbFn0Bhtv5t/Hia/U9CUp/2xjIWB9pitfTOr7OQitNMu88nGrioLwPLoReO3ujbW72R8Pdi5IC1aJBT7AwfkzJxv9QKY899kTOUI8eUOlH4oTgZLmsBQtzDhn1J4H421dM4kpurMkaZHTi+lTff2QiMgMvjLYHo=
Received: from VI1PR0802CA0016.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::26) by AM5PR0801MB1730.eurprd08.prod.outlook.com
 (2603:10a6:203:38::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Wed, 16 Oct
 2019 18:10:28 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::206) by VI1PR0802CA0016.outlook.office365.com
 (2603:10a6:800:aa::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 16 Oct 2019 18:10:27 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.linux.it; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.linux.it; dmarc=none action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 16 Oct 2019 18:10:26 +0000
Received: ("Tessian outbound 3fba803f6da3:v33");
 Wed, 16 Oct 2019 18:10:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8535bf5ecf38a98f
X-CR-MTA-TID: 64aa7808
Received: from 2d84bdfe6c83.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.5.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 74817124-14AA-49D4-98AC-7AC886397444.1; 
 Wed, 16 Oct 2019 18:10:19 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2d84bdfe6c83.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Oct 2019 18:10:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MX/vAb86QcFctRwA333L1GA+ixvwuKIjWwShgK+fL9d5dsU/3kjE58GMI5f2FRAeeBEJFXHvSK+/5ix9ueCvoPH2LR683XA1911W7uRYaID3RzrtGfn/G2tOmEWMqJYgoMsPsj8kv9KRplIDQ1nwTPevYNhRDZcdBFi87nlggp7RD1FIoHjnsKZWWQJltbOkWgDHQSYhcUQ9hpMPDHDY/0YTzCN55z++SyV1bu1iTzFK10yJJUQwxvKAQo1mODPOt/JOHjnFOradyKeMAIzsPCwu/dnOkCV3p/uZQkeFR0/dIE9ZllGSLNjNN3KaZjHpHp4BqdRrPP7s6DyzQoE56A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJp46p0f5fJQPqXbt6g6dsfoqdzyfoq/X6SEsIkmATA=;
 b=DsyXQXONp7EN52Q58+kIurTEh/NnXIqsIwuNXGBWjPjP8nBeemhMaomZ26pa/wJDXrOfH3Fv9CAcNQIXTtfAn91fV8xJQ3Ms3kmb9pvVp3k0hwqTrFuAPqFmsVDokyBkOYaxOI1P/VXp2405m+WmQDEC6W2lju2PAsH0AvXWYw0t5pTuidHQHwfdU/KvN9Z/JVHvHdCs+wxw6dBEC1VT9geY0WygkWNHcdNaPqgQe0dFwfo3T762KIEKnEipxTFwqI/NUZE/LH2iNtPyMO7UIVF7xdpulhHxm+Lcndz44syPEP9rpUzdy9/sUj8YKWXsrLb/wwiNY0y+Oho/0E4SJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJp46p0f5fJQPqXbt6g6dsfoqdzyfoq/X6SEsIkmATA=;
 b=iqhwmsAEn6BjhbFn0Bhtv5t/Hia/U9CUp/2xjIWB9pitfTOr7OQitNMu88nGrioLwPLoReO3ujbW72R8Pdi5IC1aJBT7AwfkzJxv9QKY899kTOUI8eUOlH4oTgZLmsBQtzDhn1J4H421dM4kpurMkaZHTi+lTff2QiMgMvjLYHo=
Received: from DB7PR08MB3292.eurprd08.prod.outlook.com (52.134.111.30) by
 DB7PR08MB3098.eurprd08.prod.outlook.com (52.134.110.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Wed, 16 Oct 2019 18:10:16 +0000
Received: from DB7PR08MB3292.eurprd08.prod.outlook.com
 ([fe80::bc69:7a3a:d0f6:b45d]) by DB7PR08MB3292.eurprd08.prod.outlook.com
 ([fe80::bc69:7a3a:d0f6:b45d%7]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 18:10:16 +0000
From: Szabolcs Nagy <Szabolcs.Nagy@arm.com>
To: Dave P Martin <Dave.Martin@arm.com>, Catalin Marinas
 <Catalin.Marinas@arm.com>
Thread-Topic: ? FAIL: Test report for kernel 5.4.0-rc2-d6c2c23.cki
 (stable-next)
Thread-Index: AQHVhDBBmd5Q9VIuyUmhlKanBAeRAaddWlQAgAAcvICAABp4gA==
Date: Wed, 16 Oct 2019 18:10:16 +0000
Message-ID: <ecf22341-bad2-e20b-f12c-cc80ebafda2a@arm.com>
References: <cki.B4A567748F.PFM8G4WKXI@redhat.com>
 <805988176.6044584.1571038139105.JavaMail.zimbra@redhat.com>
 <CAAeHK+zxFWvCOgTYrMuD-oHJAFMn5DVYmQ6-RvU8NrapSz01mQ@mail.gmail.com>
 <20191014162651.GF19200@arrakis.emea.arm.com>
 <20191014213332.mmq7narumxtkqumt@willie-the-truck>
 <20191015152651.GG13874@arrakis.emea.arm.com>
 <20191015161453.lllrp2gfwa5evd46@willie-the-truck>
 <20191016042933.bemrrurjbghuiw73@willie-the-truck>
 <20191016144422.GZ27757@arm.com>
 <20191016145238.GL49619@arrakis.emea.arm.com>
 <20191016163528.GA27757@arm.com>
In-Reply-To: <20191016163528.GA27757@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [217.140.106.54]
x-clientproxiedby: AM0PR05CA0052.eurprd05.prod.outlook.com
 (2603:10a6:208:be::29) To DB7PR08MB3292.eurprd08.prod.outlook.com
 (2603:10a6:5:1f::30)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Szabolcs.Nagy@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8c14e5d5-dda2-4734-d0a2-08d752641ef4
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: DB7PR08MB3098:|DB7PR08MB3098:|AM5PR0801MB1730:
X-MS-Exchange-PUrlCount: 2
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1730BEB96548A7AD06BC05F5ED920@AM5PR0801MB1730.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5797;
x-forefront-prvs: 0192E812EC
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(199004)(189003)(54906003)(486006)(2616005)(58126008)(478600001)(6512007)(6486002)(65956001)(110136005)(64756008)(66446008)(66556008)(66946007)(66476007)(66066001)(86362001)(6436002)(65806001)(229853002)(44832011)(36756003)(6306002)(31696002)(446003)(7736002)(476003)(305945005)(11346002)(26005)(256004)(14444005)(81166006)(14454004)(6246003)(386003)(102836004)(186003)(316002)(99286004)(6636002)(81156014)(6506007)(31686004)(25786009)(6116002)(71200400001)(71190400001)(3846002)(8676002)(4326008)(966005)(76176011)(8936002)(52116002)(5660300002)(53546011)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR08MB3098;
 H:DB7PR08MB3292.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: w1PCdmiy6MbfIy2LnjW+ZvOyxbNZevzen2ZtH2PzpAkirm3PjREr8mPtL8lh37iP96Mnng9nKmasgthwCeULZg3wKt/Ts4h7pYZrnTaRU61eb692zUfVoIK7srYjK2j+n6pgnwbohJNsp3JDbmJFcb9q9XF06kFrWJLkxLJZTVftifwo/3Hk9fR+7n3BrHHKaQEGi3PTyDXWtsrpNiS2WEV+D0ge9sEMPZLbZBZ2K5+6BX084Yg+sk/8HIQ+uRsZGLAkB/mogfOthpynWjuFnag1gyHOA3AoGSKSBb7uJjXmXYFOUpkRshlHoSR0gu5RXgvtfm9BCNJNw3dkBvJs+wE+sYw3WeHMig04OYUQ6pR+lIOPzyIu+N7HhfVhGHiOYmQE7h67oy1jMGqO2kSOCrhvK7Xwk15DUnZ9iuDuZTzQr98itCWTZqIz3P/hXAiUcBJA8dTf4kUfI+6/ruj5FA==
Content-ID: <4B836C5DA58C494A8B551AAC4B997B2B@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3098
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Szabolcs.Nagy@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(39860400002)(346002)(199004)(189003)(76130400001)(25786009)(5660300002)(6506007)(23676004)(81166006)(47776003)(50466002)(8936002)(76176011)(81156014)(8676002)(31686004)(186003)(31696002)(99286004)(26826003)(966005)(65956001)(66066001)(14454004)(54906003)(65806001)(102836004)(110136005)(58126008)(53546011)(386003)(26005)(86362001)(316002)(356004)(2486003)(478600001)(336012)(11346002)(6116002)(476003)(126002)(7736002)(2906002)(305945005)(63350400001)(70206006)(436003)(446003)(3846002)(6636002)(2616005)(22756006)(6306002)(36756003)(4326008)(486006)(70586007)(107886003)(6246003)(6512007)(6486002)(14444005)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0801MB1730;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: e9f0aa8e-3cde-472c-4891-08d7526418bd
NoDisclaimer: True
X-Forefront-PRVS: 0192E812EC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3bc6Y+bZq4e9Xw8+lZdjHLm++fLSztR1+SmVkhU7dKZevWq0zPDl9jXTX/5jXzklkV4MHdKs+MHVVLiRv316iHoq4yQH15kCoFEHm6+rTZQH6Q9SeLR5PYVmPYwBegpCKdfNH08bMXOunn1JX2YuwdJZ+OV3ng46QcRxSZkh2tnKgP5UNFU5VkpQ4Ou60IovAypfaak7j95jyddhxnaWo20WImwJ1XEHfzBGWS8+HqKwkXE9+DauUGFblqLbPcrBMOtcd1N3M1TpvqvR0g0w6Mw8k135VnIBHHgS/CUy8TY43Xv1aPlPvUlAl4p4+T4q+JTZYVJPez+aWbEjRVRhDL83W9Nyllh4sstKl85X8jdIvNNuQ8SfXTkRa7yriZrX5oOkEF+fr2RyuNaNAdiuKTv4creajBNX/dm39r9vk/ZEzLQX2rWoz5aT0D7RM0CAFlUp4Ofulf84zw7dQB+Blg==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 18:10:26.5151 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c14e5d5-dda2-4734-d0a2-08d752641ef4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1730
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 17 Oct 2019 11:16:02 +0200
Subject: Re: [LTP] ? FAIL: Test report for kernel 5.4.0-rc2-d6c2c23.cki
 (stable-next)
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
Cc: nd <nd@arm.com>, Andrey Konovalov <andreyknvl@google.com>,
 Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>,
 CKI Project <cki-project@redhat.com>,
 Vincenzo Frascino <Vincenzo.Frascino@arm.com>, Will Deacon <will@kernel.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 16/10/2019 17:35, Dave Martin wrote:
> On Wed, Oct 16, 2019 at 03:52:38PM +0100, Catalin Marinas wrote:
>> On Wed, Oct 16, 2019 at 03:44:25PM +0100, Dave P Martin wrote:
>>> On Wed, Oct 16, 2019 at 05:29:33AM +0100, Will Deacon wrote:
>>>> diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
>>>> index b61b50bf68b1..c23c47360664 100644
>>>> --- a/arch/arm64/include/asm/memory.h
>>>> +++ b/arch/arm64/include/asm/memory.h
>>>> @@ -215,12 +215,18 @@ static inline unsigned long kaslr_offset(void)
>>>>   * up with a tagged userland pointer. Clear the tag to get a sane pointer to
>>>>   * pass on to access_ok(), for instance.
>>>>   */
>>>> -#define untagged_addr(addr)	\
>>>> +#define __untagged_addr(addr)	\
>>>>  	((__force __typeof__(addr))sign_extend64((__force u64)(addr), 55))
>>>>  
>>>> +#define untagged_addr(addr)	({					\
>>>
>>> Having the same informal name ("untagged") for two different address
>>> representations seems like a recipe for confusion.  Can we rename one of
>>> them?  (Say, untagged_address_if_user()?)
>>
>> I agree it's confusing. We can rename the __* one but the other is
>> spread around the kernel (it can be done, though as a subsequent
>> exercise; untagged_uaddr?).
>>
>>>> +	__addr &= __untagged_addr(__addr);				\
>>>> +	(__force __typeof__(addr))__addr;				\
>>>> +})
>>>
>>> Is there any reason why we can't just have
>>>
>>> #define untagged_addr ((__force __typeof__(addr))(	\
>>> 	(__force u64)(addr) & GENMASK_ULL(63, 56)))
>>
>> I guess you meant ~GENMASK_ULL(63,56) or GENMASK_ULL(55,0).
>>
>> This changes the overflow case for mlock() which would return -ENOMEM
>> instead of -EINVAL (not sure we have a test for it though). Does it
>> matter?
> 
> It looks like SUSv7 has m{,un}local() and mprotect() aligned with one
> another regarding ENOMEM versus EINVAL:
> 
> https://pubs.opengroup.org/onlinepubs/9699919799/functions/mprotect.html
> https://pubs.opengroup.org/onlinepubs/9699919799/functions/mlock.html
> 
> So whatever we do, it should probably have the same effect on both
> calls.
> 
> 
> There's another wrinkle that occurrs to me though.  Rounding "kernel"
> addresses up can spuriously change ENOMEM to EINVAL -- but the fix for
> userspace addresses (i.e., rounding down) can likewise spuriously change
> EINVAL to ENOMEM.

well this was the point of the bit 55 check, to avoid both.
(with the assumption that getting EINVAL is not important if
overflow happens with len > 2^55 and 0 bit 55)

as far as i can tell the EINVAL for overflow is linux specific.

i think returning ENOMEM for invalid addr,len pairs should be
fine, i.e. zero extension is ok.

i think this is consistent with posix requirements, and arguably
even with current linux manual which documents EINVAL for overflow
in mlock, but also ENOMEM for unmapped pages in the range, so both
errors are ok on overflow.

so the bit 55 check only matters if something somewhere relies
on the error code in a significant way when calling syscalls with
nonsensical arguments.

> > Maybe this is OK -- the SUSv7 wording doesn't seem to call out address
> wraparound as a special case, and therefore supposedly doesn't require
> EINVAL to be returned for it.
> 
> The asymmetry is concerning though, and a bit ugly.
> 
> Cheers
> ---Dave
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
