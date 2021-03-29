Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B3B34C224
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 05:11:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 955C33C8DB6
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Mar 2021 05:11:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1EF393C1B7B
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 05:11:07 +0200 (CEST)
Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com
 [68.232.159.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D13421A0080C
 for <ltp@lists.linux.it>; Mon, 29 Mar 2021 05:11:06 +0200 (CEST)
IronPort-SDR: ZWrzzRGvF08IhXWfNPCg5Mlb9tLGUpMnwhYAxj0v4n4IiTNpGgQrQ5z5Nl35dZRU8ehvQNsMlh
 TbVOz4v1XNXVqDPcCzSWVOYn5ojg56uTt3KmPKVg8BQOd6OBjBgLEcvOOz6iYxBoRbklPHveC8
 qH5iXCUGZjzWcn2mJ34/R1/8M2YBsh6cHNVsPSlv3VGWCfxJlMIOVmcbX7wzQ1FJLG7y/GrV2X
 mxKoOBIy+iop0QPkjNFAGqG7NBJmO7Z7DbmccUDHgKtPRFDm1rPW5cfcTS0o5/NgLd2Tr4jU0z
 JNw=
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="28622853"
X-IronPort-AV: E=Sophos;i="5.81,285,1610377200"; d="scan'208";a="28622853"
Received: from mail-os2jpn01lp2056.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 12:11:05 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCm4eMNUy2BbVVEDfULFzlK+5AFgW37Jojl9nep2Guf7G5Qkhopi+ssE9YSWJHumEGJ0TrioVb5XVhtKCAFnIGkdfzM5fXO3T9BWC7pKHz8fXKgvq3SpUpN4tzz/XXhn9uik7wrwpNDHch84x04SKq4bkUhX+TwPzI94WQsr56lrvUfX0D09k7ggAjw5At6OEm1pADsarc+71O8Y5TCtfcUg6I1IK3YbnJlFMPoVTvI/aI2Hn7gBurhPmIW5ln+CQgDZ+64flC0OXashxSjHO266kKl2BH+aLWzuTi/mrT5r+r/EhFqW497ExFRTinG/iK2yRoTk/q6lX6GBxoVubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4+ASeNTTYg4XN/Zv3Hire7LMh9eGrET4P/fb3cVy8I=;
 b=kDdUzNQcpyX8zF++oY7YHasjvMg9X1XbA/zSviW2JsvNbCUNaRZLQm0+w1ywZhx13RCq6Jc3Zn3O1QaLVpTOcbz9pssr9+lNk1/mHuDrNisim33FqDMTSI2sikzlNo1k2s3Gw7uk1SdH+8BAxMhd0mMfWMr3p3rzBHvF4cSgZ9oc+gBo4xmAmLLSbJr33z4HzvyEBoo6BKj+HHTflaC92C5KFTSo+rbxpHb8GD8CTgN16LyHm+fRmw6Sh7/POVhO5TwusGs8VpsHoMVk2SvASFjmxXG2X81AXjeCmI/jVdf7z9Eq/5HMXuL4k/6C3Y2Q66Bd1TkmyL2f/+cCWUFN9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4+ASeNTTYg4XN/Zv3Hire7LMh9eGrET4P/fb3cVy8I=;
 b=ipUZPuqSxjKtv6ZYh0kpQ5TuwHuSvVW8VL3kxXnoJFLfJQFr+LO+9hQYgD2p0sdUfWbqQdbkGb9vg/UurQVnvhkn29zq+ST0FDbDOh/32SymuAsk0uvofLN2DdHwh6esFZ70GvdsTwXIGJ4RBSlm1hKx+MxDLUcKFLsdGUrMfVA=
Received: from OS0PR01MB6371.jpnprd01.prod.outlook.com (2603:1096:604:104::9)
 by OS0PR01MB6082.jpnprd01.prod.outlook.com (2603:1096:604:cb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Mon, 29 Mar
 2021 03:11:01 +0000
Received: from OS0PR01MB6371.jpnprd01.prod.outlook.com
 ([fe80::d890:a1e4:ea0a:15c0]) by OS0PR01MB6371.jpnprd01.prod.outlook.com
 ([fe80::d890:a1e4:ea0a:15c0%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 03:11:01 +0000
From: "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>
To: "ruansy.fnst@fujitsu.com" <ruansy.fnst@fujitsu.com>
Thread-Topic: [LTP] [PATCH 2/2] syscalls/chmod0{3, 4}: Cleanup and Convert to
 the new API.
Thread-Index: AQHXFw0nofi8Ipuiq02LQXNWhpbTtKqaYE6AgAAD4QA=
Date: Mon, 29 Mar 2021 03:11:01 +0000
Message-ID: <60614544.908@fujitsu.com>
References: <20210312065757.380144-1-ruansy.fnst@fujitsu.com>
 <20210312065757.380144-2-ruansy.fnst@fujitsu.com>
 <60614203.1070904@fujitsu.com>
In-Reply-To: <60614203.1070904@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82e71c28-228f-4cb2-beb0-08d8f2604877
x-ms-traffictypediagnostic: OS0PR01MB6082:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS0PR01MB6082F61A13F461ED1D9216CC837E9@OS0PR01MB6082.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:12;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8HMFIcYGIg2GjhJQQCZY2PTLCPPjunbi8nh1Wvy+/6C6OT/eCnnzR8ri0buP325AsTl8W40nxB+ZvX0Wvk+HDuZ7RN5gQbBcDdM3fkNRtUdSnlAcytrTp5aeO9mXNTlmGZ+t1l5dGQ0wLdWwgBxHzIhbkKy47BHQM/bcvbcbTOdkUzMM6W7wS36i2SFkthSIKMFb57vvEDhx6dSyonApOTP9vhLFCx3DGiVY6Xm/f/dtpBOPNeCTePlQfbXlYr7Q7oT6OYsFkkeMXU+960dyDyefF+T1naTgQ72YtfOfkKDta0W/40NW8zg1XIWI9jrUZWFp40hniLZ9JvlJE31ARd+udON0tzXmAqWe6Lc5RBdFzkdcMObReSA/2MUIrrc2CM1Dijn7IBqaXA+ujXfnEmYsiE3cHH2IQB+4jySAGPX7TNh2DI/PkwmNZoSbWWZJoPfPYWojHdtqPLTHuvfv9MnOhU1lAYs2Q8Kodvx7RccjtTrRBVjIsSAH281tg6dz6ZypDfiqgV1zR8iAFgn6O/URz6F+joLSLl+EqrYwksWM9v+F9CeS/NZh/N1wqgVWwEIDm5WDxdo0br46ybDwM7bscukQcWLuRSxmMQNiGVgMoYg73i4YBUnhKWfeWS2fP06wljDzj6aTQ12vG+74zKvoXWvD4ZYmFjWghLWxpkl5xw8EU3DU6qavjvxzGRfl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB6371.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(36756003)(86362001)(5660300002)(91956017)(66946007)(6862004)(66476007)(6636002)(71200400001)(64756008)(66446008)(30864003)(85182001)(37006003)(6512007)(83380400001)(38100700001)(6506007)(186003)(76116006)(66556008)(8676002)(53546011)(6486002)(26005)(2906002)(4326008)(8936002)(478600001)(2616005)(316002)(2004002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?ZEtrRjRZTEJ1T01WU3czWW5VbnM0TUlBa09QVDZBVnZRd1lzcmszMUZ1Vkt4?=
 =?gb2312?B?b2xHSjg1SzNYOXBGQzQ5aS9lQmhiTHdXNVd4aks4MmJxSWNxVTl6YWtmeGdT?=
 =?gb2312?B?TmpsbXNNYU1TZVVRbmJRNkVZcVZqdUlZTVRRblpzK0lXeUY2NTQ5bzkrcks1?=
 =?gb2312?B?ZVUrdHM4TWlSemFUNUpoejhBWGw0SFFDQ0xubC9OWmM2UWp1cERzdnBINkNH?=
 =?gb2312?B?dUJjOGM5RHZtcHRsN0czZExTMFo2WnVSY2lSQ2x1ampJOHVrbjRnSlBxQjhK?=
 =?gb2312?B?eXFYLzhnSVFMVk4xV01OV1Vua083K1kyZzlHZ1BtTjB0RkxIbmZwNXppQlkv?=
 =?gb2312?B?NStxb3NPZDMxdHpCV3BXVXoxazkyMDlJTU5XVURZd3h4aUdRQ0lLZ050a0xD?=
 =?gb2312?B?SXJvNGVkcjAydFg2VVNlbnU3U2laTXJ2a3A4YVNvMm1zK1dVZWlnZGpWRHNi?=
 =?gb2312?B?OTNQTG5Ya0VWbTE1MThHc2ZwWTRLM0RpVi9ReHhSdmRWWGZCY2ExYzhzZ1Zz?=
 =?gb2312?B?K2Q0b1I5V0czUG9TMHEvTklEaHF0K09ISjEvQVY5YXYvbkFVZVlZaDJTNmJr?=
 =?gb2312?B?MDVPZVlLUEcwa2pMRkorUHczVTVtS3pXSGRkVjR5L2hJbVcwdk5WVi9LS3pN?=
 =?gb2312?B?MmVFTjRiOGlKNEpoN05hUHFqU2pUdnd2cnBjeVczZ2FQYmprcGFCRHVyaHRX?=
 =?gb2312?B?MXJGYVA4S2d5UkhHNHJtRnhtTTZKTGI4SWtEdUZOcFpzMG1WeVR0SGUwN1BG?=
 =?gb2312?B?MjVyMm1ESk5ob05HRTZ0bmFpRlRlVFcyL3JXRmhTREQ4d2pIM28yZkdZeTZl?=
 =?gb2312?B?cUt2QklMdEpZdGFuL0ZhUXhVbTcvakt6dEJJQzQxSHhMekZzZDA0c1pVekh2?=
 =?gb2312?B?eG1zQ1pCTzI3a2xzZER6OWFqUmpFUktRWVRhS3V5Y0tVbVFoTW5VSWZDWFZO?=
 =?gb2312?B?c0tuaDMvK3ljd25nUWhPNm42bk1VY0Z4RVRKVGZJak5hbzA2RkZzNHl3b1hI?=
 =?gb2312?B?L3Q4TU91QnJweVNtZnlBa2FHcEtPcThVMEVpQzBNRWI4algxSG9ldjdWUmEv?=
 =?gb2312?B?T205cTN1TFZqZXVhdHlrUGhSdWdGdWJ0NVVPclpISEQwVTB3VWFyRm9CdHJk?=
 =?gb2312?B?RGpudTR1cDRVYnJTTTVxM0IxOXJsVjNwdDhpTnpScXNKNklvVlFNZ2xSUXg3?=
 =?gb2312?B?WEQrWDVlT3NRMjExcUNKMGVYVXhLTEo2b0tDdmhHVTJKdDh5N0VsWVFHeU4v?=
 =?gb2312?B?anVBYlF6M1ZBVW1FRU5PaWExeWJFRlU0VDh6RlNGTGVMNWo0dnFMWjNBUGd1?=
 =?gb2312?B?NlhwYnJteUJnZVdhY0dwcDU1VTdCa2dQbEdjQXBTOU4yQUpxUU05aW10ak5M?=
 =?gb2312?B?Qk9vVk1ZdjhBYU5LQ1NDNVowbkFONzRMOWQ0d09pL3ZHRExqWDBubXpRb1dr?=
 =?gb2312?B?MW5rS0NHNEJCa3MxUEFqSjVMQVB4RFpBQlptajhvZXpJVnc3SW1DQndMbnZ2?=
 =?gb2312?B?Njk5MUFYQXU4dWRYMUNTNGNJaHFvRzB2Uk9JWEpSWnlDdXFOWkQ4eVhiYll0?=
 =?gb2312?B?VENOTEdnV01lcWJBYmFQY1RJNTVHOWZKd0NJa0pkM21oQkJlU2JRNkJGMXdL?=
 =?gb2312?B?eVdOQkg4c1BQZTVDakNDSFhsVEFERnp4a0grUDhxVmg5QmJ5TXY4S245ejRq?=
 =?gb2312?B?NnBZdXhaeXp5T1hybFptTmhoVGhELzl6bTZZNGovRi9WbGVCbk5TRHhEejI0?=
 =?gb2312?Q?0zmxzkvFRnv0m7BunNKMIn3sSBz1hSb/tXP4ZhK?=
Content-ID: <AE188827474AA34D9C9D9583DF8E837D@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6371.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e71c28-228f-4cb2-beb0-08d8f2604877
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 03:11:01.8728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ZfjOn/m9i5aEh5r5Z8EflrQ21w2dK/6WdVbnJRuwkHgD5qkEr6m43dSLJpfB9h6p0B6OWi2TyPCnn0WEbBbuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6082
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/chmod0{3,
 4}: Cleanup and Convert to the new API.
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

On 2021/3/29 10:57, yangx.jy@fujitsu.com wrote:
> Hi Ruan,
>
> After looking into the chmod03 and chmod04, I wonder if we can also
> merge chmod03 and chmod04 into chmod01?
> Because of two reasons:
> 1) All of them just set mode by chmod() and check mode by stat().
> 2) Without needs_root =1, we can run them with any users(root or no-root).
Hi Ruan,

In addition:
1) I think we can merge chmod07 into chmod01 as well.
2) You can add a new test to verify the behavior of sticky bit on a 
directory, see the chmod(1)'s manpage.

Best Regards,
Xiao Yang
> Best Regards,
> Xiao Yang
> On 2021/3/12 14:57, Shiyang Ruan wrote:
>> chmod03 and chmod04 test on file and directory with same logic, so
>> combine them together.
>>
>> Signed-off-by: Shiyang Ruan<ruansy.fnst@fujitsu.com>
>> ---
>>    runtest/syscalls                           |   1 -
>>    testcases/kernel/syscalls/chmod/.gitignore |   1 -
>>    testcases/kernel/syscalls/chmod/chmod03.c  | 196 ++++-----------------
>>    testcases/kernel/syscalls/chmod/chmod04.c  | 191 --------------------
>>    4 files changed, 36 insertions(+), 353 deletions(-)
>>    delete mode 100644 testcases/kernel/syscalls/chmod/chmod04.c
>>
>> diff --git a/runtest/syscalls b/runtest/syscalls
>> index 6108d5fdb..2bf870709 100644
>> --- a/runtest/syscalls
>> +++ b/runtest/syscalls
>> @@ -62,7 +62,6 @@ chdir04 chdir04
>>    chmod01 chmod01
>>    chmod01A symlink01 -T chmod01
>>    chmod03 chmod03
>> -chmod04 chmod04
>>    chmod05 chmod05
>>    chmod06 chmod06
>>    chmod07 chmod07
>> diff --git a/testcases/kernel/syscalls/chmod/.gitignore b/testcases/kernel/syscalls/chmod/.gitignore
>> index 072fa5b80..27ddfce16 100644
>> --- a/testcases/kernel/syscalls/chmod/.gitignore
>> +++ b/testcases/kernel/syscalls/chmod/.gitignore
>> @@ -1,6 +1,5 @@
>>    /chmod01
>>    /chmod03
>> -/chmod04
>>    /chmod05
>>    /chmod06
>>    /chmod07
>> diff --git a/testcases/kernel/syscalls/chmod/chmod03.c b/testcases/kernel/syscalls/chmod/chmod03.c
>> index f53e437e4..e451ca65a 100644
>> --- a/testcases/kernel/syscalls/chmod/chmod03.c
>> +++ b/testcases/kernel/syscalls/chmod/chmod03.c
>> @@ -1,183 +1,59 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>    /*
>> - *   Copyright (c) International Business Machines  Corp., 2001
>> - *
>> - *   This program is free software;  you can redistribute it and/or modify
>> - *   it under the terms of the GNU General Public License as published by
>> - *   the Free Software Foundation; either version 2 of the License, or
>> - *   (at your option) any later version.
>> - *
>> - *   This program is distributed in the hope that it will be useful,
>> - *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
>> - *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>> - *   the GNU General Public License for more details.
>> - *
>> - *   You should have received a copy of the GNU General Public License
>> - *   along with this program;  if not, write to the Free Software
>> - *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>> + * Copyright (c) International Business Machines  Corp., 2001
>>     */
>>
>> -/*
>> - * Test Name: chmod03
>> +/*\
>> + * [DESCRIPTION]
>>     *
>> - * Test Description:
>> - *  Verify that, chmod(2) will succeed to change the mode of a file
>> - *  and set the sticky bit on it if invoked by non-root (uid != 0)
>> - *  process with the following constraints,
>> - *	- the process is the owner of the file.
>> + * Verify that, chmod(2) will succeed to change the mode of a file/directory
>> + * and set the sticky bit on it if invoked by non-root (uid != 0) process with
>> + * the following constraints:
>> + *	- the process is the owner of the directory.
>>     *	- the effective group ID or one of the supplementary group ID's of the
>> - *	  process is equal to the group ID of the file.
>> - *
>> - * Expected Result:
>> - *  chmod() should return value 0 on success and succeeds to change
>> - *  the mode of specified file with sticky bit set on it.
>> - *
>> - * Algorithm:
>> - *  Setup:
>> - *   Setup signal handling.
>> - *   Create temporary directory.
>> - *   Pause for SIGUSR1 if option specified.
>> - *
>> - *  Test:
>> - *   Loop if the proper options are given.
>> - *   Execute system call
>> - *   Check return code, if system call failed (return=-1)
>> - *   	Log the errno and Issue a FAIL message.
>> - *   Otherwise,
>> - *   	Verify the Functionality of system call
>> - *      if successful,
>> - *      	Issue Functionality-Pass message.
>> - *      Otherwise,
>> - *		Issue Functionality-Fail message.
>> - *  Cleanup:
>> - *   Print errno log and/or timing stats if options given
>> - *   Delete the temporary directory created.
>> - *
>> - * Usage:<for command-line>
>> - *  chmod03 [-c n] [-e] [-f] [-i n] [-I x] [-p x] [-t]
>> - *     where,  -c n : Run n copies concurrently.
>> - *             -e   : Turn on errno logging.
>> - *             -f   : Turn off functionality Testing.
>> - *	       -i n : Execute test n times.
>> - *	       -I x : Execute test for x seconds.
>> - *	       -P x : Pause for x seconds between iterations.
>> - *	       -t   : Turn on syscall timing.
>> - *
>> - * HISTORY
>> - *	07/2001 Ported by Wayne Boyer
>> - *
>> - * RESTRICTIONS:
>> - *  This test should be run by 'non-super-user' only.
>> - *
>> + *	  process is equal to the group ID of the directory.
>>     */
>>
>> -#include<stdio.h>
>> -#include<sys/types.h>
>> -#include<sys/stat.h>
>> -#include<fcntl.h>
>>    #include<errno.h>
>> -#include<string.h>
>> -#include<signal.h>
>> -#include<pwd.h>
>> -
>> -#include "test.h"
>> -#include "safe_macros.h"
>> -
>> -#define FILE_MODE       S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH
>> -#define PERMS		01777	/*
>> -				 * Mode permissions of test file with sticky
>> -				 * bit set.
>> -				 */
>> -#define TESTFILE	"testfile"
>> +#include<sys/stat.h>
>> +#include "tst_test.h"
>>
>> -char *TCID = "chmod03";
>> -int TST_TOTAL = 1;
>> -char nobody_uid[] = "nobody";
>> -struct passwd *ltpuser;
>> +#define FILE_MODE	(S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH)
>> +#define DIR_MODE	(S_IRWXU | S_IRWXG | S_IRWXO)
>> +/* Mode permissions of test directory with sticky bit set. */
>> +#define PERMS		01777
>>
>> -void setup();			/* Main setup function for the test */
>> -void cleanup();			/* Main cleanup function for the test */
>> +static char *tpaths[] = { "testfile", "testdir" };
>>
>> -int main(int ac, char **av)
>> +static void verify_chmod(unsigned int i)
>>    {
>>    	struct stat stat_buf;
>> -	int lc;
>> -	mode_t file_mode;
>> -
>> -	tst_parse_opts(ac, av, NULL, NULL);
>> -
>> -	setup();
>> +	char *tpath = tpaths[i];
>>
>> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
>> +	TST_EXP_PASS_SILENT(chmod(tpath, PERMS), "chmod(%s, %#o)", tpath, PERMS);
>>
>> -		tst_count = 0;
>> +	if (stat(tpath,&stat_buf)<   0)
>> +		tst_brk(TFAIL | TERRNO, "stat(%s) failed", tpath);
>>
>> -		TEST(chmod(TESTFILE, PERMS));
>> -
>> -		if (TEST_RETURN == -1) {
>> -			tst_resm(TFAIL | TTERRNO, "chmod(%s, %#o) failed",
>> -				 TESTFILE, PERMS);
>> -			continue;
>> -		}
>> -		if (stat(TESTFILE,&stat_buf)<   0) {
>> -			tst_brkm(TFAIL | TERRNO, cleanup,
>> -				 "stat(%s) failed", TESTFILE);
>> -		}
>> -		file_mode = stat_buf.st_mode;
>> -
>> -		/* Verify STICKY BIT set on testfile */
>> -		if ((file_mode&   PERMS) != PERMS) {
>> -			tst_resm(TFAIL, "%s: Incorrect modes 0%3o, "
>> -				 "Expected 0777", TESTFILE, file_mode);
>> -		} else {
>> -			tst_resm(TPASS, "Functionality of "
>> -				 "chmod(%s, %#o) successful",
>> -				 TESTFILE, PERMS);
>> -		}
>> +	/* Verify STICKY BIT SET on file/directory */
>> +	if ((stat_buf.st_mode&   PERMS) == PERMS) {
>> +		tst_res(TPASS, "Functionality of chmod(%s, %#o) successful",
>> +			tpath, PERMS);
>> +	} else {
>> +		tst_res(TFAIL, "%s: Incorrect modes 0%03o, Expected 0%03o",
>> +			tpath, stat_buf.st_mode, PERMS);
>>    	}
>> -
>> -	cleanup();
>> -	tst_exit();
>>    }
>>
>>    void setup(void)
>>    {
>> -	int fd;
>> -
>> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
>> -
>> -	tst_require_root();
>> -	ltpuser = getpwnam(nobody_uid);
>> -	if (ltpuser == NULL)
>> -		tst_brkm(TBROK | TERRNO, NULL, "getpwnam failed");
>> -	SAFE_SETUID(NULL, ltpuser->pw_uid);
>> -
>> -	TEST_PAUSE;
>> -
>> -	tst_tmpdir();
>> -
>> -	/*
>> -	 * Create a test file under temporary directory with specified
>> -	 * mode permissios and set the ownership of the test file to the
>> -	 * uid/gid of guest user.
>> -	 */
>> -	if ((fd = open(TESTFILE, O_RDWR | O_CREAT, FILE_MODE)) == -1) {
>> -		tst_brkm(TBROK | TERRNO, cleanup,
>> -			 "open(%s, O_RDWR|O_CREAT, %#o) failed",
>> -			 TESTFILE, FILE_MODE);
>> -	}
>> -
>> -	SAFE_CLOSE(cleanup, fd);
>> +	SAFE_TOUCH(tpaths[0], FILE_MODE, NULL);
>> +	SAFE_MKDIR(tpaths[1], DIR_MODE);
>>    }
>>
>> -/*
>> - * void
>> - * cleanup() - performs all ONE TIME cleanup for this test at
>> - *		completion or premature exit.
>> - *  Delete the testfile and temporary directory created in setup().
>> - */
>> -void cleanup(void)
>> -{
>> -
>> -	tst_rmdir();
>> -
>> -}
>> +static struct tst_test test = {
>> +	.needs_tmpdir = 1,
>> +	.tcnt = ARRAY_SIZE(tpaths),
>> +	.test = verify_chmod,
>> +	.setup = setup,
>> +};
>> diff --git a/testcases/kernel/syscalls/chmod/chmod04.c b/testcases/kernel/syscalls/chmod/chmod04.c
>> deleted file mode 100644
>> index cbc13cf61..000000000
>> --- a/testcases/kernel/syscalls/chmod/chmod04.c
>> +++ /dev/null
>> @@ -1,191 +0,0 @@
>> -/*
>> - *
>> - *   Copyright (c) International Business Machines  Corp., 2001
>> - *
>> - *   This program is free software;  you can redistribute it and/or modify
>> - *   it under the terms of the GNU General Public License as published by
>> - *   the Free Software Foundation; either version 2 of the License, or
>> - *   (at your option) any later version.
>> - *
>> - *   This program is distributed in the hope that it will be useful,
>> - *   but WITHOUT ANY WARRANTY;  without even the implied warranty of
>> - *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
>> - *   the GNU General Public License for more details.
>> - *
>> - *   You should have received a copy of the GNU General Public License
>> - *   along with this program;  if not, write to the Free Software
>> - *   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
>> - */
>> -
>> -/*
>> - * Test Name: chmod04
>> - *
>> - * Test Description:
>> - *  Verify that, chmod(2) will succeed to change the mode of a directory
>> - *  and set the sticky bit on it if invoked by non-root (uid != 0) process
>> - *  with the following constraints,
>> - *	- the process is the owner of the directory.
>> - *	- the effective group ID or one of the supplementary group ID's of the
>> - *	  process is equal to the group ID of the directory.
>> - *
>> - * Expected Result:
>> - *  chmod() should return value 0 on success and succeeds to set sticky bit
>> - *  on the specified directory.
>> - *
>> - * Algorithm:
>> - *  Setup:
>> - *   Setup signal handling.
>> - *   Create temporary directory.
>> - *   Pause for SIGUSR1 if option specified.
>> - *
>> - *  Test:
>> - *   Loop if the proper options are given.
>> - *   Execute system call
>> - *   Check return code, if system call failed (return=-1)
>> - *   	Log the errno and Issue a FAIL message.
>> - *   Otherwise,
>> - *   	Verify the Functionality of system call
>> - *      if successful,
>> - *      	Issue Functionality-Pass message.
>> - *      Otherwise,
>> - *		Issue Functionality-Fail message.
>> - *  Cleanup:
>> - *   Print errno log and/or timing stats if options given
>> - *   Delete the temporary directory created.
>> - *
>> - * Usage:<for command-line>
>> - *  chmod04 [-c n] [-f] [-i n] [-I x] [-P x] [-t]
>> - *     where,  -c n : Run n copies concurrently.
>> - *             -f   : Turn off functionality Testing.
>> - *	       -i n : Execute test n times.
>> - *	       -I x : Execute test for x seconds.
>> - *	       -P x : Pause for x seconds between iterations.
>> - *	       -t   : Turn on syscall timing.
>> - *
>> - * HISTORY
>> - *	07/2001 Ported by Wayne Boyer
>> - *
>> - * RESTRICTIONS:
>> - *  This test should be run by 'non-super-user' only.
>> - *
>> - */
>> -
>> -#include<stdio.h>
>> -#include<sys/types.h>
>> -#include<sys/stat.h>
>> -#include<fcntl.h>
>> -#include<errno.h>
>> -#include<string.h>
>> -#include<signal.h>
>> -#include<pwd.h>
>> -
>> -#include "test.h"
>> -#include "safe_macros.h"
>> -
>> -#define DIR_MODE 	S_IRWXU | S_IRWXG | S_IRWXO
>> -#define PERMS		01777	/*
>> -				 * Mode permissions of test directory with
>> -				 * sticky bit set.
>> -				 */
>> -#define TESTDIR		"testdir_4"
>> -
>> -char *TCID = "chmod04";
>> -int TST_TOTAL = 1;
>> -char nobody_uid[] = "nobody";
>> -struct passwd *ltpuser;
>> -
>> -void setup();
>> -void cleanup();
>> -
>> -int main(int ac, char **av)
>> -{
>> -	struct stat stat_buf;	/* stat struct. */
>> -	int lc;
>> -	mode_t dir_mode;	/* mode permissions set on testdirectory */
>> -
>> -	tst_parse_opts(ac, av, NULL, NULL);
>> -
>> -	setup();
>> -
>> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
>> -
>> -		tst_count = 0;
>> -
>> -		/*
>> -		 * Call chmod(2) with mode argument to
>> -		 * set sticky bit on TESTDIR
>> -		 */
>> -		TEST(chmod(TESTDIR, PERMS));
>> -
>> -		if (TEST_RETURN == -1) {
>> -			tst_resm(TFAIL | TTERRNO, "chmod(%s, %#o) failed",
>> -				 TESTDIR, PERMS);
>> -			continue;
>> -		}
>> -
>> -		/*
>> -		 * Get the file information using
>> -		 * stat(2).
>> -		 */
>> -		if (stat(TESTDIR,&stat_buf)<   0) {
>> -			tst_brkm(TFAIL, cleanup,
>> -				 "stat(2) of %s failed, errno:%d",
>> -				 TESTDIR, TEST_ERRNO);
>> -		}
>> -		dir_mode = stat_buf.st_mode;
>> -
>> -		/* Verify STICKY BIT SET on directory */
>> -		if ((dir_mode&   PERMS) == PERMS) {
>> -			tst_resm(TPASS, "Functionality of "
>> -				 "chmod(%s, %#o) successful",
>> -				 TESTDIR, PERMS);
>> -		} else {
>> -			tst_resm(TFAIL, "%s: Incorrect modes 0%03o, "
>> -				 "Expected 0%03o",
>> -				 TESTDIR, dir_mode, PERMS);
>> -		}
>> -	}
>> -
>> -	cleanup();
>> -	tst_exit();
>> -}
>> -
>> -/*
>> - * void
>> - * setup() - performs all ONE TIME setup for this test.
>> - *  Create a temporary directory and cd to it.
>> - *  Create another test directory under temporary directory.
>> - */
>> -void setup(void)
>> -{
>> -
>> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
>> -
>> -	tst_require_root();
>> -	ltpuser = getpwnam(nobody_uid);
>> -	if (setuid(ltpuser->pw_uid) == -1)
>> -		tst_resm(TINFO | TERRNO, "setuid(%u) failed", ltpuser->pw_uid);
>> -
>> -	TEST_PAUSE;
>> -
>> -	tst_tmpdir();
>> -
>> -	/*
>> -	 * Create a test directory under temporary directory with specified
>> -	 * mode permissios.
>> -	 */
>> -	SAFE_MKDIR(cleanup, TESTDIR, DIR_MODE);
>> -}
>> -
>> -/*
>> - * void
>> - * cleanup() - performs all ONE TIME cleanup for this test at
>> - *		completion or premature exit.
>> - *  Remove the test directory and temporary directory created in setup().
>> - */
>> -void cleanup(void)
>> -{
>> -
>> -	tst_rmdir();
>> -
>> -}

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
