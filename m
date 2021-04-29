Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8BA36E7FB
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 11:29:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A5633C613F
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 11:29:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DD2C03C2B9F
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 11:29:11 +0200 (CEST)
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com
 [68.232.159.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E1BE41001280
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 11:29:10 +0200 (CEST)
IronPort-SDR: Co3AC8NnV4p4kFA1CIYycfnVH1sfwxxZpDkgV0kwhrbHbNLhNXHC6FB3kax23clS1+pEDUqD3S
 4qCd66j0RHHC9wOJwOKRXv2/ssl3QXQ2QgKgWLINu6uUtMJ1Hccmt9AAD0Q+U7Q1jAfFASn2nv
 jmnfZ2W7iiYrN0/jn3we6bnNoG2sqx1gmucgN9TyqBy6LACHDxXTcwFaCe89KE1qC8ItpuPshp
 ShaSB2r9fRhw1zXjY/DthN+tgzrMGq+1tQLLrX0pBdbiwOn+Em5T+nTI0UgLXZq2azxhlZy//n
 RFQ=
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="30614427"
X-IronPort-AV: E=Sophos;i="5.82,258,1613401200"; d="scan'208";a="30614427"
Received: from mail-ty1jpn01lp2058.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 18:29:10 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQeY8WayccSSrvgkBmYKYtL9f5FSQbkKwxx1c883We6po4VKdgla6xf041S3JSoTnAOMOyefAlqTbIF781WflnwO/Ov5WVbS1lowQDFTzEHMs5IyUYPwqceIIwre7LmQ1SRqGc+TvY+N4X9obKnPTeoavPkkd0OegzaQVqGZ5b3t3NEr3N/tiAm8jVhg7eQtNYC7Lc8mUCnYSe6FNXWTjmwm0H+LGUyvkuQpWYpLCipFAq2QRKFk84BCeDIG6kceWB92FKHE/PoHXG+aJDHKp3bzPNYcGNSJ9AZZUdYQ+jqDRyE12dU6K39WwRRRZu74Z8bPNNZyfr8pRrdgVzWaBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLGsFWRoZqlVa5l7lNqdpRjV9XBamgpb8VQDthcjM3w=;
 b=iM94tOAy/4E1+qhbcQd/YHbS7CVE9u3biVq2zqEtOJDwSl8kSgmZo9ckviZFt7Gv7HzZv7F9KiLZ1JCr3LxGM9woNeEnyqny4dP2eNaV6hKQtDHNQxIapQg3gfCZvRlBdgaLLyQlIl+QGoc6UkmzZSmD0JQV828wz3DyzA9FoIrhJRqb56SzSaFuL98/IkhuBDpVlW04OYSCByffmZG1qDaH1Xzv+ki83E4/q1G4WD9H1SHgPVU5Hmc+oPgJdjc4+PnhsWItEB/Q4w2ZHtOXoGkuq9L8D5i7fwbhGLdwOL4s5A0NktMgb4fQopJnZDIkrhUoEhseacUeYQ9Cqld9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLGsFWRoZqlVa5l7lNqdpRjV9XBamgpb8VQDthcjM3w=;
 b=WRlRBH7fVrNbOT5+u7c2UYP5UBduWjFl47IiQpmEanYeqjZPG1LGDpXxTjE87DqmJbBriihao06Lmh0eDdEACx4m+50Rkr6/ECY0zDw2zzCUc1ukF20j6T9OC1TjBuaIc1ZFL20QDRduNpkxBm9ZSFx7EHvDXHadW1AHNKqGoTw=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB4623.jpnprd01.prod.outlook.com (2603:1096:404:129::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Thu, 29 Apr
 2021 09:29:06 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.4087.026; Thu, 29 Apr 2021
 09:29:06 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: "huangjh.jy@fujitsu.com" <huangjh.jy@fujitsu.com>
Thread-Topic: [LTP] [PATCH] syscalls/chown03.c: Remove the redundant pass
 information
Thread-Index: AQHXPAWyxIVwKK3ohk6CGE0eVFc1UarJnDGAgAGgGgA=
Date: Thu, 29 Apr 2021 09:29:06 +0000
Message-ID: <608A7C80.6060708@fujitsu.com>
References: <1619597275-12846-1-git-send-email-huangjh.jy@cn.fujitsu.com>
 <60891F73.7020608@fujitsu.com>
In-Reply-To: <60891F73.7020608@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d66912b9-a485-4b09-255d-08d90af13c42
x-ms-traffictypediagnostic: TYAPR01MB4623:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB46238BABF0013E7F2E8B56B2FD5F9@TYAPR01MB4623.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ftFgTrlPjPo27M3PM/zC1yxwsK0rHEo5J1/2M6yQ42CaR3XmozxdR3WzI/mNIOiNtS6KiiOQFwfLr4Piv2Uv9hMyDR8TstKEM1zv4FCNoXD4VLYt3Sl01u03zLxa8a7d4sV1sX+rvI4D+FbXq/IXLdCB7PD1vgWuYSlvAXF/jCQBK3BmBMypYEgiTqAWJI6Dq6UZXI4YqbbsHPuw1bJAzrzW2QKWJ5BoJRYH1gx0PnOidMm2xjEeYSM4Qqb/HUlSTR0KQXwxVoIc5mcFqnrbdMUno5eRm2r5qe+O952+zuQmTWxVb1hLE8WoaYeKrbYbjoZ9f8oc9EvILYn4TK5+KMqFB40/kkz7nWI/V3Ep0R5QypXBXNHBpgcn8bcbwIb9pTOw+sPcRsgLx8ZWJ/JEy32gVi2S9BDS4v+Q7YoY5iatGgFsXSYZeG7ckXoLp/PkGSrKSJ0jR6VY/xvcoqR+jrcpso8kTQ2/6NX0dPUWgOvWnlBF1F1aea7Vla4M8Idn4t9XMPN2pskAD1I3jBNfj10Cp+IvjMMnfq/0dUtrx3SZoz50J7u/Hd/3yRcZ70W5HQ815SYxwmi7XK9SaBQMPGAMPV+rVPDNZYcqcMZJn0Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(6506007)(6636002)(6862004)(64756008)(91956017)(66946007)(76116006)(66476007)(6486002)(122000001)(71200400001)(66446008)(2616005)(4326008)(66556008)(316002)(8936002)(33656002)(478600001)(186003)(6512007)(26005)(83380400001)(87266011)(38100700002)(2906002)(36756003)(8676002)(86362001)(37006003)(85182001)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?TkdUVWxjM0ZoejhCdFp1ei9ObXJ2bXJOdWN0NXZ0TUV0T25KVmptU0toZVNr?=
 =?gb2312?B?S016VWJ4N2FQajd3QWI0UUNSODNJUVhaN01RQWhnTGNoRmtXVmQ3RnA5Qlhn?=
 =?gb2312?B?VU9ETG1UL2xtTFNiWWJyd1M2VkRNSHBsWVNPUmdTdGxTVVFEWGhaS2hJUkdQ?=
 =?gb2312?B?WEl6K1FZV1NBeWIxZHo0eXVjOW00TWhsZjVpV2tHQWUyNmU5L3FxQVN0Y3Ru?=
 =?gb2312?B?WFhka2s3ZUxYNmF4SEdER0t6dzBNaDdLWWpsTERrc3VkNi9lRHF4Mit0T2xu?=
 =?gb2312?B?NVdXTVpqb2ZZM0hEYTZxdk5UcUkyeEtDY1h4ck4zL3dzbEs1R0ZzZWRrYzlh?=
 =?gb2312?B?alNCaDAxNTBqUGZvc0FlTXNSakNqNGJkSk1IV3hsdTJ6K1JBcnBwY0RDT2o4?=
 =?gb2312?B?UWJxNDhIbXFHSWhrZjlPNmtyN2FadG9BUWtSTU9BR1lPaWdyeW9xZ2srNkY3?=
 =?gb2312?B?eHhhZm80WnJPY1libzRwWmMyeDNtc2p1dDVHVW1tVzIxNk13NEd3ZkxKaFYx?=
 =?gb2312?B?VmVtcHMyTFBTVWxOVWQ5L0dRWlNMczJTR2VrdzlTRFpqaWFUaW9iNUVzZ3RG?=
 =?gb2312?B?ZXE0VVNiNDl0bjNrZUdLblQrNkZ0SEFDaCtDYVVZM2V6a090YWlSSnhRV21s?=
 =?gb2312?B?Z2FoRnpVNjlzelZqM0t0cVI2OE1YMVVyUU9QWUhXZU02SlAvMHovaUR3REJK?=
 =?gb2312?B?S3J3VUZwNHhjZXo0Tm00ZDZvTXRZd3Y4TVlDeXpQTVU0Rmg4SjJFbU1jeHhv?=
 =?gb2312?B?NE5najBoS1dXbVZnT1dKUlpzUUdma3JCV005T0pJZUNPaFpSdFBNKzNXS1BP?=
 =?gb2312?B?Y29ZSzQ0TWR4Q3V1U3p5TitRa2tWSTA2RHBtV1ljL3Jld1VTbHBzcW5tQk1l?=
 =?gb2312?B?VU8wdWlQZ2R0aTdaSVF0TGhtUllFeE9mR2QwVnIvK2RuenpaSi9wNUJCNXFn?=
 =?gb2312?B?R28vTVZsSnN0Q3pFMnhPSW5PbXhlQUxvYXQ3L21RS01tV2gyalVkNGp3YXBG?=
 =?gb2312?B?N251TUdscElmd0xVUXpaemluN0dEVHF1ZnJZQU91cnF3clgxbjJCNGdVeTRj?=
 =?gb2312?B?YStOTU12YndXWlhXeS9ETlRwU3VWYlB5MDV6c3Q1Y0lod3dVQ05BNzE5T0pQ?=
 =?gb2312?B?UTc2QjFSbU9yQ3JDczZtTjF6TGp1TFVoZE1vVDdUdEtLQ0VDVHVLQ2Y1cUhC?=
 =?gb2312?B?d0hSdW9nUmI1cmRTUGY0bURWd0hrd1phemtOdFVKTUdzWU9vUlNxRTRBSk9Q?=
 =?gb2312?B?SGJGN3BrVG1qaG9uQ2VFQ0o0anU5WUhJclpwL3J2TXY0UGlrakZxekt6K2Zo?=
 =?gb2312?B?TjMxcitFTk5adEdvclNac010eTBwdVRQUWF5R3VwT01PTGNRZ1R6aWJidjZ5?=
 =?gb2312?B?T0t2eE12NEZGVXN4V2ZoRmtyWVUvUGdIT1c5UW1TQU1zRFYvODdUWlRMVVEx?=
 =?gb2312?B?dThjcU1uZG9WQzhWSXRhODlFdU9TNHBPYlZqb2lXNDJrL00rZGZxdTFpTFJk?=
 =?gb2312?B?eUtkSi93eGZ5RFkrMUNBbWxBNEZYRVhYV3NhSFhNWlFGb1NUbmRMZEw5K280?=
 =?gb2312?B?Qkw5R0FqM0ppeUF4Vm16bGVSMFRtVENsTm1xUDBlbjQ0YzN0VXlqWElwRmkz?=
 =?gb2312?B?WVd1UTU3TkcxUWhhWXBhdXdLQmc4SUZweDJkeTdqV1FJNVlZYUk3a2VnZGdM?=
 =?gb2312?B?L2FMMC9DZVNHOUhGd3RCU3RpeU84dGxnT3hIMzFmbG9PMzA5UHI5NUJrVkpZ?=
 =?gb2312?Q?tQCWR/zK/grbjLgaJ1Z74dwewwWATTXg8LKSEvG?=
Content-ID: <4026CAF5EED26D4A9684321791012EDF@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d66912b9-a485-4b09-255d-08d90af13c42
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 09:29:06.3263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nC01XYidEpV1K4as8Le9tRPwqde96U21h3TAdGjThyuvnwnHR5ZllY1mTfBF8bmgez5xd4HZifd7/yK/TC/kjyt5Gy+co62HlOM0JYxrQ3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4623
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/chown03.c: Remove the redundant pass
 information
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

Hi Jinhui
Thanks, merged!

Best Regards
Yang Xu
> Hi Jinhui
>
> Sound reasonable,
> Reviewed-by: Yang Xu<xuyang2018.jy@fujitsu.com>
>
> Best Regards
> Yang Xu
>> When executing testcase chown03_16, the system will report pass information
>> even if 16-bit version of chown() is not supported, for example:
>> --------------------------------------------------------------------------
>> tst_test.c:1313: TINFO: Timeout per run is 0h 05m 00s
>> chown03.c:48: TPASS: chown03_testfile: expected owner set to (uid=99, gid=0)
>> chown03.c:58: TPASS: chown03_testfile: expected mode permissions 0106770
>> /root/ltp/testcases/kernel/syscalls/chown/../utils/compat_tst_16.h:153: TCONF: 16-bit version of chown() is not supported on your platform
>>
>> Summary:
>> passed   2
>> failed   0
>> broken   0
>> skipped  1
>> warnings 0
>> --------------------------------------------------------------------------
>>
>> The redundant pass information may mislead testers, so we should remove them.
>>
>> Signed-off-by: Jinhui Huang<huangjh.jy@cn.fujitsu.com>
>> ---
>>    testcases/kernel/syscalls/chown/chown03.c | 6 ------
>>    1 file changed, 6 deletions(-)
>>
>> diff --git a/testcases/kernel/syscalls/chown/chown03.c b/testcases/kernel/syscalls/chown/chown03.c
>> index 8ff2602..ff6e904 100644
>> --- a/testcases/kernel/syscalls/chown/chown03.c
>> +++ b/testcases/kernel/syscalls/chown/chown03.c
>> @@ -43,9 +43,6 @@ static void check_owner(struct stat *s, uid_t exp_uid, gid_t exp_gid)
>>    		tst_res(TFAIL, "%s: wrong owner set to (uid=%d, gid=%d),"
>>    			       " expected (uid=%d, gid=%d)",
>>    			FILENAME, s->st_uid, s->st_gid, exp_uid, exp_gid);
>> -	else
>> -		tst_res(TPASS, "%s: expected owner set to (uid=%d, gid=%d)",
>> -			FILENAME, exp_uid, exp_gid);
>>    }
>>
>>    static void check_mode(struct stat *s, mode_t exp_mode)
>> @@ -53,9 +50,6 @@ static void check_mode(struct stat *s, mode_t exp_mode)
>>    	if (s->st_mode != exp_mode)
>>    	      tst_res(TFAIL, "%s: wrong mode permissions %#o, expected %#o",
>>    		      FILENAME, s->st_mode, exp_mode);
>> -	else
>> -	      tst_res(TPASS, "%s: expected mode permissions %#o",
>> -		      FILENAME, s->st_mode);
>>    }
>>
>>    static void run(void)
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
