Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF5534DDCA
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 03:51:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F2ED3C8CFD
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 03:51:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 463783C25B5
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 03:51:21 +0200 (CEST)
Received: from esa18.fujitsucc.c3s2.iphmx.com (esa18.fujitsucc.c3s2.iphmx.com
 [216.71.158.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A957E10009FB
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 03:51:19 +0200 (CEST)
IronPort-SDR: v+rmghCfvPGpklAHS1vO+i3h4YNUINLJXTYUXrU0HylSX5HzUKKyaFbGFaCObVNltrjjxb12TO
 Nd3eu0VGul9H0E/qVY2LgqBqTkjDrlYRS5qtCqK9BmnptKURIpkaBKIxbEWkT/gFqJUQcoqZnG
 r3uveX9zmBxYAj30EUl6df3/H+qLAyqwZRMLrvGXKrs2RKc1S2OqDmDqdCykYbCqrmkndVhEgw
 oB89kqUEIKrJcm648lBkAGuIQ8IEtU1Qm74drl+E33xdJcihNIEDE5bne/6pe+IkA+8vwVYIPA
 usE=
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="29113187"
X-IronPort-AV: E=Sophos;i="5.81,289,1610377200"; d="scan'208";a="29113187"
Received: from mail-ty1jpn01lp2050.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.50])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 10:51:16 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCPHWw0BZQ0DFX9lMelinBlUZsfG7Hbkel8f6R8ZcjvXsnTLNDGv+ZCYeElAt702nxn6D5tenu6eCkEIh3g2TPI3AIZpEBj9u3QyPVgsd4BDC3NC746UPbcXBpIEpw4lWK7rRPVnsGlVwcA3n+bsrhPUgFyCMJr4tlXiTVrzRD9gCi9U+23BP9XlVaCAla2MCksjggS8+XGm0yw27bIuHcNWQQ5wTedYiqI/8IaImC9e9CXmTpqa1AUk+6+OunYqmpEr2vikr156vRyRXa1QRfDGTfe1eH3hzRKWTonkooCR5gHjmmvoGYsocpKh6+I82+AbxibMJ4MgHjr03DZIFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60Jj6xReOFhvDu/vTZmphc4GUVPn8DTyXF4D/9DYHlg=;
 b=hOCEtq0B8jcsNw22v6B58i1Q/PfCL8bDlglAEi09HZYdm9RCioRO63nzA1EpfGY2/kvfipBJwW3hrJFbyyobmtfs+8/7azKW2GbeNKt/vWBG3yGW8MPIzqayRWrIwqjfR8uR74oE5w0+QwAVJy0iHY2PaR9Pfe9GYU7EO809I3EPcL9vUFJZOJPe/hNL2G2o8g1hjwHAy+TICpnhtrChRjoAFvl27ZKVgec/2bghElkG/bsySBCHVNP39uD0MhwnRqO1JbBtmW2JLr6Oug9IGlZ4pH9WwfzjfpRcTJEX3o2E6YUKubOl6w7vIer4309qaLlQSmdW3fMbSMNd09q7DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60Jj6xReOFhvDu/vTZmphc4GUVPn8DTyXF4D/9DYHlg=;
 b=PFZHszdBSb/7V5W7/mfpWSA2pR+NUF2+ayDsPMkwXRHMPlEWvCMoRwCAvEMG3peaCM8GNYWXb28IfRCOw920kYZPNjE7KuC2O3PG7K0B1LleWQfvV+ivzxSi9REU6DA7qVMw27jimcP17GHr2dObc8FHGgNLVKUcRwxUkdce3tw=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB2446.jpnprd01.prod.outlook.com (2603:1096:404:8b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Tue, 30 Mar
 2021 01:51:14 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 01:51:14 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Thread-Topic: [LTP] [PATCH] syscalls/shmctl04: Add kernel version requestions
Thread-Index: AQHXJKIKzDDQKAaaSE+Nn66LpGM9XqqbxRuA
Date: Tue, 30 Mar 2021 01:51:14 +0000
Message-ID: <6062841B.6030302@fujitsu.com>
References: <20210329134647.27740-1-zhaogongyi@huawei.com>
In-Reply-To: <20210329134647.27740-1-zhaogongyi@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a93fc67-4e98-43dc-f198-08d8f31e4d46
x-ms-traffictypediagnostic: TYAPR01MB2446:
x-microsoft-antispam-prvs: <TYAPR01MB2446B9D10FA77C1CA2534B8CFD7D9@TYAPR01MB2446.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sNQCe+SuX27rfjSEI/woXU8/vZxCCsD+mwJJAK//2AxMVaXaoQprlH/yOuXFxTPBLOO7y5bmq6kh83WMLyslL3zhL3JT9oJqZNvvJGe/1o0z5RbIjs1kjgfTg/xWQuiKMrv1XpVrCmjuWU/ocobHvIHDlgMTXmXbZtn2khQkWfuh72DxrcOyC1vOgbhl97EBeriC4/Haag8+u9FaIZD6x1V+18Ge5eS203bhltdqHUPSn72ZBvMiwNdB0f90tSRaoP9S61uv/kF+zvNUlY3Btmhm8+jQTaSHeZv9gkceQcdKTrgbPJB85Y/9UJclGTtk3oyMYc8iuGMJyoMP6s2y9G5hrAHkwvW0tUjOS/NJW128O7/3Nt2tSPDMJ4+dhNGPuHwZJE7FfJb0cvBEOorM8IY1W+JBaZWYpq9lXFXmXeh/6dtf5yfEBm0fj8vxu8vN4rUSQPhjfzue6FaLaUPymAuWnv/RCFvPXHHRQ0lV0y/LLH63mtX48w5kDnmzx0ixmvkYSPszlyb267MVglnzHchHSq7XZVR0uMQ11fEhFKEZ4HqGMV3+ulDoPUCgZ6kTzFZJOcUzQFijMcS56xwqVgH38YaZMUvmVfDGWCKI+qGZHUDNn2CKtvKVHVAUL7LB/SGx4iur+3vWP+V10UwTkazos1nXAeM++C/QHtBdFZg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(87266011)(85182001)(6506007)(36756003)(66946007)(2906002)(26005)(478600001)(66556008)(66476007)(71200400001)(66446008)(38100700001)(83380400001)(33656002)(6916009)(2616005)(5660300002)(316002)(6486002)(86362001)(6512007)(8936002)(186003)(8676002)(4326008)(91956017)(76116006)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?WnJnWThhVjVqZEF2VWJJc2FMUlM2SG10WkdnZWthc1ZRR04zWkgrNXI1Rmtk?=
 =?gb2312?B?dU1HWjF2ZlZnSXhRUDEvamdlZ0NaaDZQeTE5dVVxQkJNVko3VStHa29talR6?=
 =?gb2312?B?RmdVdDJNMFNLWlZieC9Tb2RuSnhwcXRmRnUyTnA1U3kxRlNmUWNsUTFIUmlL?=
 =?gb2312?B?N2VZSFNVdHROU0o0RW5KVFNSbkZCZXNzT0JOWi8rcG1ZQXlSR1hPWmMrcU5B?=
 =?gb2312?B?VnpDY1pwTFZJQ29OVlptOEVUOVE3MUczd2hBYWZBSm8wdElzMzVtSzRwVmpo?=
 =?gb2312?B?RTAvOVJYN1NqZmFML2grRUkvRzAzVkp3eGNSUjdKQU9iQmFxcUhqWHBXZlR2?=
 =?gb2312?B?eXRSK2Z0dXMwcUFiaGxGR3BEUHlsSmhnWXBYa0hTd2oraWp1STBpZnRlMGh4?=
 =?gb2312?B?MElRSzdKc0lvc04rTG1OV1d2dndlb2sxY3hWeUFFZ1ViUXNyOGlwdksySTUx?=
 =?gb2312?B?Ni9SWmh6UzN6OEpic3oycUoxM3I3NFFHb3VqMHZVdURyT2RvRVZKSVNLUjNq?=
 =?gb2312?B?RDhQRVVQaWIxNVZjSUdQeFpRMVZNT21kVllya0dGaCs5dU9BeWJ1R054REh6?=
 =?gb2312?B?eENrR0QyTTc5cE9QYU9TKzF2UXNmYlEzclp5cG5Md2J0dUw5TFI3TGNJY2d4?=
 =?gb2312?B?Tms4U3YrQVdaN3dQSTd5WmRiS3Y4aW1SSU51UThKOFVmRVFQc0ZSRXlpMm8w?=
 =?gb2312?B?eFdUaWdCbW1zdUh6MW9wV0h4K3ZPOHFYVFNmMkFKNm1kNnRHM0ZFbTUwcUpw?=
 =?gb2312?B?UXRPeXJHbmFYU2Y5dmd6dHFWM2tqUC9DeGMzNDlPd2FGTlVLNGY0T1JJR3Bs?=
 =?gb2312?B?SHZVUzBHK1Rqc0g1Q3lOK0JPN0JsZDZreXVqVjZUdEVjSTVnNzdLRjluVTlx?=
 =?gb2312?B?Q1RKUmZERjNCT1E0SU9sL3dTc0c3b1p2bjdZTjBVK3ZFcFFZbVlBd1dhcnd1?=
 =?gb2312?B?NENCY2VpZTZFenkwaUp0NjdUZjZGMW1pN2J5R3gwNk0wcXo2eEtlNlB0YUUv?=
 =?gb2312?B?SnlzSVFRYjI0b1grMVBBUlVYRk9lOXBHSzYvNXlqeEl2RzBRWmFEZUVyM3Rk?=
 =?gb2312?B?U2lzRXVKaEZ2Mk5KRjcrRzl2c09XREZrVkZnZEhRQVZHUzk3clZmZEVuVDJU?=
 =?gb2312?B?UHZDM3kwR0xZL1ZMZWVOcSt2VlFmOGFKVmg0REcwTTlmOC9URkU2WncxVHN6?=
 =?gb2312?B?QXE1d1dBaEoyZ1FHa1VUaVZtN1U2c2swcHhEOWNOM2E4NTJId1dQazdaQS8y?=
 =?gb2312?B?YTkyU2ZPSDczaXIrQXFUM3pOQlNnWUFjaWRPOFAwWjhlbjlMUFZFWklTcStq?=
 =?gb2312?B?cHg2VkJZSjd1VFcyZDFIVGF1SXl6KzJ6dU1RSlEybkIrdUU0VzdSelpuTEg3?=
 =?gb2312?B?OGVZMG5xUm4rVlUxb2xkaFNNQzVxSm9BOVRXQlBQWG9IbSs4dXlWcXZjcGti?=
 =?gb2312?B?cE5FR2ttRmRjc01oQ2lEdUVRQ1h1eElaUnY1MG5UTURJRW1JNWtPb2x2SGli?=
 =?gb2312?B?S1VUSkJ0VWVjY2lxaDR1YWVKYm1iSXhCWGxDYjZsUTg3UXczU1ZGVnRtVXJ4?=
 =?gb2312?B?VVBURDViZWJvWmZHallsZVcxUkZ3K1FKN2dCQjZsazlwQjdCVDNSTEN5d1o3?=
 =?gb2312?B?MUNrQmMwM1lQUi9PdDF3M3VjcmVWNm9ZbE9QYk9Wc05zVVlwdG5HVmVoWGV4?=
 =?gb2312?B?dFl0QWpIby9wSVRaeEk2Q3ZQTTk5SFBZUEZOZUtycEczMkNxWFhEa2tCMTRZ?=
 =?gb2312?Q?lSANLm5Cc/olClo8s2C8NVe0+vI+1feJJZM+Cmf?=
x-ms-exchange-transport-forked: True
Content-ID: <9AEDE9C151345246952A3E8AC33E9E49@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a93fc67-4e98-43dc-f198-08d8f31e4d46
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2021 01:51:14.3142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V7+0TLB9uJPMBFmsmOek3ZQ0GxnNPRCQswCYQkxvxha3lbAAW06GLq7IZJicwJXwR1/+rrpPU/hlFP4lm7PSUlG9wK7me3vWLrDI2g54pzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2446
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/shmctl04: Add kernel version requestions
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

Hi Gongyi
> SHM_STAT_ANY is imported to linux in v4.17.
>
> Signed-off-by: Zhao Gongyi<zhaogongyi@huawei.com>
> ---
>   testcases/kernel/syscalls/ipc/shmctl/shmctl04.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
> index 9e8ec4199..18ac8ba0a 100644
> --- a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
> +++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
> @@ -168,6 +168,7 @@ static void cleanup(void)
>   }
>
>   static struct tst_test test = {
> +	.min_kver = "4.17",
Some linux distribution such as centos7.8 has backported this feature, 
so we should call SHM_STAT_ANY directly to detect whether kernel 
supports SHM_STAT_ANY instead of using min_kver.

code as below:
--- a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
+++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
@@ -155,10 +155,19 @@ static void verify_shminfo(unsigned int n)
  static void setup(void)
  {
         struct passwd *ltpuser = SAFE_GETPWNAM("nobody");
+       struct shmid_ds temp_ds;
         nobody_uid = ltpuser->pw_uid;
         root_uid = 0;

         shm_id = SAFE_SHMGET(IPC_PRIVATE, SHM_SIZE, IPC_CREAT | SHM_RW);
+       TEST(shmctl(shm_id, SHM_STAT_ANY, &temp_ds));
+       if (TST_RET == -1) {
+               if (TST_ERR == EINVAL)
+                       tst_brk(TCONF, "kernel doesn't support 
SHM_STAT_ANY");
+               else
+                       tst_brk(TBROK | TTERRNO,
+                               "Current environment doesn't permit 
SHM_STAT_ANY");
+       }
  }


Also, On your environment, does semctl09.c/msgctl06.c have the same problem?

>   	.setup = setup,
>   	.cleanup = cleanup,
>   	.test = verify_shminfo,
> --
> 2.17.1
>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
