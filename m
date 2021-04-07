Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BED356901
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 12:07:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 856683C73F6
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Apr 2021 12:07:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 55A583C1DE5
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 12:07:08 +0200 (CEST)
Received: from esa11.fujitsucc.c3s2.iphmx.com (esa11.fujitsucc.c3s2.iphmx.com
 [216.71.156.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B20871A0089D
 for <ltp@lists.linux.it>; Wed,  7 Apr 2021 12:07:06 +0200 (CEST)
IronPort-SDR: aLrFordL8aa6IKgrASjpUH5BrLa/CTQ7RQXCUyIy65gXSx73NZ8JcRUFwQ0PAReMhuffupaZ7n
 q8ld9aL4Qsg/ywPd4Ed46gNIzGxURXCpbYRLjXoYaptcBaRdCJbHOBc+aECJN3gVm3hTiDAZ2v
 rclyD5XSW0kSBe/NSLXGatKvTe6TVybcNiBf/s20a3IDSgBRsXkBgCVOzILkRUuQz4XlPGww8D
 HkFIlStZh4u1hcI5QskGMnlgzuIAlN7E4uW6RTyu7JnBt+ISneG8IioixcmVftHgIt9xZA+/pK
 PAM=
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="29350896"
X-IronPort-AV: E=Sophos;i="5.82,203,1613401200"; d="scan'208";a="29350896"
Received: from mail-ty1jpn01lp2053.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 19:07:05 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VX/tuzJ/T3W4xJbMXRdlUiq/Z5YmCe3lDUMZdx7s0Im+DLRAFWD1AbehBRFdlEPOZT0rxCrh5pvyLTuJNhxHQi0C+d+p38r0dVp2IvSG6ZCxV3JQbkExUKW9bFqi+OsATOEldNXcmRh5q2v+eXKF2iUXX2sHPMjv1YdTZqOj5/dsVuJ3gjDbgU83mKh+YNqKXVFXzn8esd6CJkI+llZmgWx46LPcMIvBq3BAQXXVdqBl+i3fG/a3jdwQD3bPq6CWHPbfY0/zL9zhFTIz9xMLIOpp8TmZeySM3eBFRHz6Ctj+K1bCEPiYrWhfnh/4aeE5Z9k2iU7iUr33WlqpXClu+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4BJFPgzF91gpH9R2+ygSfMnP2CicNOR5FdcWNkBhsU=;
 b=jrSt0ZOvRV5JooK6b8dP81vGJ4wAfww0BnjXqYbqzQj2qQTentu2sUKp0pSpfdyjTudUdTDOEZvvQzHo2umxzjUTiEFXx72cChtQWiP0SffDt3XxecoCR+TmxIaSfwwqKqKQPulZ+d/b4Pok7D3JLREqvLi4ziT7cPg80tTH5BEbXB8keg6bjH0VFLoIrImgj3Bc9cZHVBvu8AiR/qp9EQjabzB5KENjqgrDULiS9r+8F6YyzeVI6GPJfVIrgvSEYNjNQZ9sSf227raFwdKt0yKj14AzXN/Hi+ZgREHZsqdaBMQb32KuePo8nb61l3CkSLi25lM2x3Ml4iHWLTt3yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4BJFPgzF91gpH9R2+ygSfMnP2CicNOR5FdcWNkBhsU=;
 b=Rv5LaE/LvvlECa29op0DyVhhsctoopMbCim4L+VRfqvy7wYCER3/ClB+ui3ZV7HreXy4eidJfoK6Tu+sqFrbzH4gs3wo9ygR5E9YXCqUlmkVHQrmBDpizepXFaUyagCo77FsO7IfYBOpN/Lel8Ci2IAvI/igWYoUVOsEKjjFz5Y=
Received: from OS3PR01MB6535.jpnprd01.prod.outlook.com (2603:1096:604:100::7)
 by OS0PR01MB5860.jpnprd01.prod.outlook.com (2603:1096:604:bc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Wed, 7 Apr
 2021 10:07:02 +0000
Received: from OS3PR01MB6535.jpnprd01.prod.outlook.com
 ([fe80::f8b0:51e2:dd00:6dfd]) by OS3PR01MB6535.jpnprd01.prod.outlook.com
 ([fe80::f8b0:51e2:dd00:6dfd%6]) with mapi id 15.20.4020.017; Wed, 7 Apr 2021
 10:07:02 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>
Thread-Topic: [LTP] [PATCH v2] Makefile: Use M to build extern kernel module
 instead of SUBDIRS
Thread-Index: AQHXK4SyyDo8cRhw80uezyjRlwY1y6qouYAAgAArx4A=
Date: Wed, 7 Apr 2021 10:07:02 +0000
Message-ID: <606D925F.2080306@fujitsu.com>
References: <606D5E48.1060307@fujitsu.com>
 <1617786257-6032-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <606D6D9A.3020102@fujitsu.com>
In-Reply-To: <606D6D9A.3020102@fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45ebddb2-9a67-4209-c435-08d8f9ace3a6
x-ms-traffictypediagnostic: OS0PR01MB5860:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS0PR01MB5860FB3CD3E59EAE5FA1C839FD759@OS0PR01MB5860.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iMPoqLJRtSCJI1+M7L0/0vDVM80mNbCDrokgRWulFHX7TY4mzzVst6aKY/277+QpKKMNzqkh4qyXFQJlWLCrdowj7z6fBj/bwOXTR/I5zEj0q2uMPSrkYn6GCvryJfd+eFKbrf7r0J/mTLSOwYXAnSd7CjckT67f+x4gPzPBwQRrkJG3owuvhVeeZ6vffidr1dSDCsEj4TYljTNlyj7QPArvy1ICqptJ7k9vN3jijiGAT+lRIB9i88QqfweJD50BckQD60b6McuAIQbiJjjogbkSoCIC4K+I6eYzzuuD7zzUMNAEatxEKFi1CIGx1mO163T3wuy+AVDiQzgi++TLxr3sc1n93mOd6XR8SdveDpX1//Peuc2E9uQgVF9ScjY1MjzdFdEM04rWGTT8GQJo8Jct8D0T1aLE+9V9rcO4Vapx8qY5wAUBCwggG9bBM8yPXwRUdlsEv41yfkKkYuy+2EvWC+N9RUA4io8cvSS5Pm94BJ3VVpmCzQdWpDe1rpnKzVi75nJCQgKpPG0fzAilp3Gx+pRSOZilaiFKzhNZHgnOGrt3lLkXOVgAbGV4BTIImS/E4dKyFE7aOTWJwUl4y30sk0t0MYkhWkooTqpaZZlIGnfn53cvTJcdNXJ4jBLcbiEpK5nxPTqh9RSdB00ks0HMzQ9SEgTHE8neYUqlM5pbuufAbGCqB07e59TpPOPO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB6535.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(87266011)(6636002)(8936002)(4326008)(26005)(83380400001)(478600001)(86362001)(66946007)(71200400001)(316002)(37006003)(76116006)(33656002)(6512007)(91956017)(5660300002)(85182001)(66476007)(64756008)(66446008)(2616005)(53546011)(6506007)(38100700001)(6862004)(6486002)(2906002)(66556008)(186003)(36756003)(8676002)(3076002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?TjBIMWF6MURtS2FpanF1bkFTampiK2wrOGl6U1kreVduSGY4QkUyRHdVV0Zy?=
 =?gb2312?B?UWtrV3dPbC9tNkpBWk0rM0gzaEs4N1JqaWNydHRTbmU4d2VoM2pxamk3ak9x?=
 =?gb2312?B?cVBROWNBd0l2RlZKT1lJdlpBR0MrWWxhVTFjN1d5U1ljTWpCNmZFcGYzdC9s?=
 =?gb2312?B?MUNDcnA2bXBEZWlLUElOS2FsaFVQY1ViVzhhRGc1UisxRit6ZGNYMnY4YWQ2?=
 =?gb2312?B?ZjIrQ1ZNeDFVTWNhYVYxRFp4NzlQdU9saW85ZmZkd0pTSVFlSkRGeHY2Qnpi?=
 =?gb2312?B?NHBqcGdMQWdUdHlrNmdDbGF3QzBESDhLMk5MZjRVT0o2SERWS0VCYm9mcWpr?=
 =?gb2312?B?Q21ibTBucEFFcHE2Z0cwNHZ0YlZLTEFkMDFMZlh1UEVEZHBzODJIYWx0K1E5?=
 =?gb2312?B?S0hESUl4ekVXQ2o5b1dEMENESFdaTkxCWGJUUkwybnM4Mk9VOVkyVldjeHBL?=
 =?gb2312?B?WG1EMmRKUGJnbHRtdDYyM0lxc3IrOUdZRjhlUHMwQy9qMFlreC9rOU9DSVpy?=
 =?gb2312?B?cGFXRVZETm83WmErSXBuMWZZRnlZWWhnV2szWHQ2T0JrSFlETmJCdGdhWVht?=
 =?gb2312?B?aFJRaVJ0c3hkVnhJY1d3WmpKZ21nQ3NONW1JZWlqUTRKaTB0ai92Q1htblZn?=
 =?gb2312?B?KzJ6aFdQa2xMcmU4Q0k4dUF4UGZISHVIWUp1dkZISnU1Vi9pd3R0ekM4M1FC?=
 =?gb2312?B?KzBGczZ0VnhtUzBBQzRBWjRVMjNRbFVXOGVOQ1FHSWEyMlRtcjAzNEFIby9y?=
 =?gb2312?B?aXRzTFVUaXY3bHUxZTVEbE92WC9Ra3hyQ0ltdjFRc2c4WGNjY2QrQUkyZVRr?=
 =?gb2312?B?RVZyLzBNUlZUNzNuS282WEIzaU9YU2tKakZoSE1rdmxLWVBhSzZLRmZlRFZW?=
 =?gb2312?B?bklud0daUXpGVzJlb0RabWxCMVNTR0lmWHZ5clBCa0xoYXJGMGJxYkRuY3NK?=
 =?gb2312?B?RHAwRGVKTzJMSHF0NERwS3kxWEtZc1NXeUMzNDJzRC9vU2o0MHMwNWlOaU52?=
 =?gb2312?B?ZXJ1a2NzRXZRRXRxVjRzRHFkb3BQdmROQ1d0UXJsdzZFbjRiYVlua0toY0E4?=
 =?gb2312?B?ZFFOUGdXbXZSbFp4ZjVISC9FTW8rZ1BpQWpzNXRaY3gzYTJuZEhLemdyc0g0?=
 =?gb2312?B?OG94cS9CQktFSEpqZ2Z5ZDJKQVNuMHpNK3R6WHNtSXJoVndJZXYrVmZ2dEQv?=
 =?gb2312?B?clZINGszMFJCYzRXL3ZVWmlhcDdJa3ZYS0tQS3RkUUxmVnowSnYxd1UvSXp3?=
 =?gb2312?B?bnBwdjBzS25qM1ptQnVjNkF4VmV2dHUvbHZTVDhjaXFYZ01nU0d2TEg2R1hp?=
 =?gb2312?B?UHRNbzJzSTdLNGpETWgwWFEwNWJ6SlZacFdNUmZLSU1ETGRvRkhkUjdXbjAz?=
 =?gb2312?B?SUVYQTZnNjlOUlZZK3JRdXd0S0RFNDFFRmRNV000aGVIYmhEVmloK0F4WWhU?=
 =?gb2312?B?NG0vY3BZbTBUcXNvd0k4L3hrdXFwOVl0Ynl0Ujk0dElDbjRQNmNOeUVCWXUz?=
 =?gb2312?B?amhVWHduWFE1ZFV1THdBNzIrcWNpOVFib3NFS0lIY2tndTNRZm9pOGhHcmRt?=
 =?gb2312?B?TXZRQ1V0YkkyMjZrbzhPLzF0bmdYT1lNSWFhS2lOcUx0V3haS2liM25rQkVM?=
 =?gb2312?B?N0JiMk1LTnJMbjc4M0VTb25VTXk4QkNyT0t1UFlNaGN5Mmc1RFNFTnZKRzB6?=
 =?gb2312?B?TE5yU1BGelRpYTZiOVpoM3hBbWp3SG82a254WDh5djAyZW1RZlhWNWk0T1p1?=
 =?gb2312?Q?5cdYsLRR7r1qcsm1qnjOeEdEup4eAO6GAme5mBK?=
Content-ID: <1C832C3A3D34A643823312FD19009958@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6535.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ebddb2-9a67-4209-c435-08d8f9ace3a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 10:07:02.0992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GuWVlAEBBr5DLEz8PULTpWHknwsDoE+MJJz03mUB4KjP6qLsOHhBS2/W2C98kFT8ryWsisa6BIIFOAo5qEuoWNq8lr5bXXWg14YlV5OV4TY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5860
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Makefile: Use M to build extern kernel module
 instead of SUBDIRS
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

Hi Xiao
> On 2021/4/7 17:04, Yang Xu wrote:
>> Since 5.3 kernel commit 7e35b42591c0 ("kbuild: remove SUBDIRS support"),
>> SUBDIRS has been removed. We can only use make M=dir or set the environment
>> variable KBUILD_EXTMOD to specify the directory of external module to build.
>>
> Hi,
> 
> LGTM.
> Reviewed-by: Xiao Yang<yangx.jy@fujitsu.com>
Thanks for your review, I have merged this patch.

Best Regards
Yang Xu
> 
> Best Regards,
> Xiao Yang
>> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
>> ---
>> v1->v2:
>> add mssing .../dev_sim_framework/kernel_space/Makefile
>>    .../kernel/device-drivers/agp/kernel_space/Makefile    |  4 ++--
>>    testcases/kernel/device-drivers/base/tbase/Makefile    |  4 ++--
>>    .../dev_sim_framework/kernel_space/Makefile            |  4 ++--
>>    .../kernel/device-drivers/drm/kernel_space/Makefile    |  2 +-
>>    testcases/kernel/device-drivers/include/Makefile       |  4 ++--
>>    .../misc_modules/per_cpu_allocator_module/Makefile     |  8 ++++----
>>    testcases/kernel/device-drivers/nls/Makefile           |  6 +++---
>>    testcases/kernel/device-drivers/usb/tusb/Makefile      | 10 +++++-----
>>    .../kernel/device-drivers/v4l/kernel_space/Makefile    |  8 ++++----
>>    testcases/kernel/fs/scsi/ltpfs/Makefile                |  4 ++--
>>    10 files changed, 27 insertions(+), 27 deletions(-)
>>
>> diff --git a/testcases/kernel/device-drivers/agp/kernel_space/Makefile b/testcases/kernel/device-drivers/agp/kernel_space/Makefile
>> index 5357c135e..5a10064f0 100644
>> --- a/testcases/kernel/device-drivers/agp/kernel_space/Makefile
>> +++ b/testcases/kernel/device-drivers/agp/kernel_space/Makefile
>> @@ -14,8 +14,8 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
>>    PWD	:= $(shell pwd)
>>
>>    default:
>> -	$(MAKE) -C $(KDIR)  SUBDIRS=$(PWD) modules
>> -#	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) modules
>> +	$(MAKE) -C $(KDIR) M=$(PWD) modules
>> +#	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
>>    endif
>>
>>    clean:
>> diff --git a/testcases/kernel/device-drivers/base/tbase/Makefile b/testcases/kernel/device-drivers/base/tbase/Makefile
>> index 6f7e5e2c1..5e5a40e61 100644
>> --- a/testcases/kernel/device-drivers/base/tbase/Makefile
>> +++ b/testcases/kernel/device-drivers/base/tbase/Makefile
>> @@ -13,8 +13,8 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
>>    PWD	:= $(shell pwd)
>>
>>    default:
>> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
>> -#	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) modules
>> +	$(MAKE) -C $(KDIR) M=$(PWD) modules
>> +#	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
>>    endif
>>
>>    clean:
>> diff --git a/testcases/kernel/device-drivers/dev_sim_framework/kernel_space/Makefile b/testcases/kernel/device-drivers/dev_sim_framework/kernel_space/Makefile
>> index e7e7be607..ccaf3f9ac 100644
>> --- a/testcases/kernel/device-drivers/dev_sim_framework/kernel_space/Makefile
>> +++ b/testcases/kernel/device-drivers/dev_sim_framework/kernel_space/Makefile
>> @@ -13,8 +13,8 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
>>    PWD	:= $(shell pwd)
>>
>>    default:
>> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
>> -#	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) modules
>> +	$(MAKE) -C $(KDIR) M=$(PWD) modules
>> +#	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
>>    endif
>>
>>    clean:
>> diff --git a/testcases/kernel/device-drivers/drm/kernel_space/Makefile b/testcases/kernel/device-drivers/drm/kernel_space/Makefile
>> index 11e54d9be..24b768d76 100644
>> --- a/testcases/kernel/device-drivers/drm/kernel_space/Makefile
>> +++ b/testcases/kernel/device-drivers/drm/kernel_space/Makefile
>> @@ -11,7 +11,7 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
>>    PWD	:= $(shell pwd)
>>
>>    default:
>> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD)  modules
>> +	$(MAKE) -C $(KDIR) M=$(PWD)  modules
>>    endif
>>
>>    clean:
>> diff --git a/testcases/kernel/device-drivers/include/Makefile b/testcases/kernel/device-drivers/include/Makefile
>> index c9810ba5e..72d7293c2 100644
>> --- a/testcases/kernel/device-drivers/include/Makefile
>> +++ b/testcases/kernel/device-drivers/include/Makefile
>> @@ -13,9 +13,9 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
>>    PWD	:= $(shell pwd)
>>
>>    default:
>> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
>> +	$(MAKE) -C $(KDIR) M=$(PWD) modules
>>    	${CC} -Wall -o userBlockInclude userBlockInclude.c
>> -#	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) modules
>> +#	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
>>    endif
>>
>>    clean:
>> diff --git a/testcases/kernel/device-drivers/misc_modules/per_cpu_allocator_module/Makefile b/testcases/kernel/device-drivers/misc_modules/per_cpu_allocator_module/Makefile
>> index 3bc274dad..ae802f77c 100644
>> --- a/testcases/kernel/device-drivers/misc_modules/per_cpu_allocator_module/Makefile
>> +++ b/testcases/kernel/device-drivers/misc_modules/per_cpu_allocator_module/Makefile
>> @@ -9,16 +9,16 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
>>    PWD	:= $(shell pwd)
>>
>>    modules:
>> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
>> +	$(MAKE) -C $(KDIR) M=$(PWD) modules
>>
>>    clean:
>> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean
>> +	$(MAKE) -C $(KDIR) M=$(PWD) clean
>>    	rm -f modules.order
>>
>>    help:
>> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) help
>> +	$(MAKE) -C $(KDIR) M=$(PWD) help
>>
>>    modules_install:
>> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules_install
>> +	$(MAKE) -C $(KDIR) M=$(PWD) modules_install
>>
>>    endif
>> diff --git a/testcases/kernel/device-drivers/nls/Makefile b/testcases/kernel/device-drivers/nls/Makefile
>> index 172510fe8..a1fab20f8 100644
>> --- a/testcases/kernel/device-drivers/nls/Makefile
>> +++ b/testcases/kernel/device-drivers/nls/Makefile
>> @@ -12,12 +12,12 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
>>    PWD	:= $(shell pwd)
>>
>>    default:
>> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
>> +	$(MAKE) -C $(KDIR) M=$(PWD) modules
>>    	${CC} $(EXTRA_CFLAGS) -o userBlockNLS userBlockNLS.c
>> -#	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) modules
>> +#	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
>>
>>    clean:
>> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean
>> +	$(MAKE) -C $(KDIR) M=$(PWD) clean
>>    	rm -f modules.order
>>    	rm -f userBlockNLS
>>
>> diff --git a/testcases/kernel/device-drivers/usb/tusb/Makefile b/testcases/kernel/device-drivers/usb/tusb/Makefile
>> index 9488cd563..4dcbca36c 100644
>> --- a/testcases/kernel/device-drivers/usb/tusb/Makefile
>> +++ b/testcases/kernel/device-drivers/usb/tusb/Makefile
>> @@ -13,17 +13,17 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
>>    PWD	:= $(shell pwd)
>>
>>    default:
>> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
>> -#	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) modules
>> +	$(MAKE) -C $(KDIR) M=$(PWD) modules
>> +#	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
>>
>>    clean:
>> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean
>> +	$(MAKE) -C $(KDIR) M=$(PWD) clean
>>    	rm -f modules.order
>>
>>    help:
>> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) help
>> +	$(MAKE) -C $(KDIR) M=$(PWD) help
>>
>>    modules_install:
>> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules_install
>> +	$(MAKE) -C $(KDIR) M=$(PWD) modules_install
>>
>>    endif
>> diff --git a/testcases/kernel/device-drivers/v4l/kernel_space/Makefile b/testcases/kernel/device-drivers/v4l/kernel_space/Makefile
>> index 56e255b04..549c37d5c 100644
>> --- a/testcases/kernel/device-drivers/v4l/kernel_space/Makefile
>> +++ b/testcases/kernel/device-drivers/v4l/kernel_space/Makefile
>> @@ -9,16 +9,16 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
>>    PWD	:= $(shell pwd)
>>
>>    modules:
>> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
>> +	$(MAKE) -C $(KDIR) M=$(PWD) modules
>>
>>    clean:
>> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) clean
>> +	$(MAKE) -C $(KDIR) M=$(PWD) clean
>>    	rm -f modules.order
>>
>>    help:
>> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) help
>> +	$(MAKE) -C $(KDIR) M=$(PWD) help
>>
>>    modules_install:
>> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules_install
>> +	$(MAKE) -C $(KDIR) M=$(PWD) modules_install
>>
>>    endif
>> diff --git a/testcases/kernel/fs/scsi/ltpfs/Makefile b/testcases/kernel/fs/scsi/ltpfs/Makefile
>> index 7c46a4c4d..5f4030661 100644
>> --- a/testcases/kernel/fs/scsi/ltpfs/Makefile
>> +++ b/testcases/kernel/fs/scsi/ltpfs/Makefile
>> @@ -14,9 +14,9 @@ KDIR	:= /lib/modules/$(shell uname -r)/build
>>    PWD	:= $(shell pwd)
>>
>>    default:
>> -	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
>> +	$(MAKE) -C $(KDIR) M=$(PWD) modules
>>    	${CC}  $(CFLAGS) -o ltpfstest -lm  main.c
>> -#	$(MAKE) -C $(KERNELDIR) SUBDIRS=$(PWD) modules
>> +#	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules
>>    endif
>>
>>    clean:

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
