Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2193AE7D8
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 13:03:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F162C3C7037
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 13:03:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 501463C2409
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 13:03:57 +0200 (CEST)
Received: from esa11.fujitsucc.c3s2.iphmx.com (esa11.fujitsucc.c3s2.iphmx.com
 [216.71.156.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B984C20076A
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 13:03:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1624273435; x=1655809435;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YE9X2/fNC+hdDOgV4Axwdle4DAPVbyQ9PWY82qC1aIs=;
 b=tU21wFiv9uGhpgf0OCPgXWprJGbRIQumcbKxUU3PuUv4K0RtFqdwDKaR
 GS6RGMYh6dZgfzmGrDZSf+z4RoALkgmxH74GZSuVn5vRVJ5wJuVFvNybJ
 dnO2K8R+eMKr09PQYsVqfsoSlZLJ5+Vml+IzEUKZtBt1mLKVRkr/hGifl
 ixl4a4AiYt1dxQVxGqOKZ668uCJvpDkuxYqqJEw8i6zmXQKtYGm2KqilN
 KPsQrTUAcN5qlUKjmHGSqb//X1avTQilwdDKc2DYjA/I8hoYukweIY/Ji
 epjNqmAbTE1VwpitQKgKZtPOWnrWnG/6BwHu44gJuNBaSbpCrAx3y98eT Q==;
IronPort-SDR: JCQ9Xq/N18oHnNdGQNLQgVXzLhjTeZ6X5Y9ybMTXfvvfv/aWcww1zvAg3vR1GSAkiZypJtG4Mj
 V8K2Gjjmi8u/XpX6BjtsGBD8X4W3cMsGQvXAVay3yjTesFdcFduJVyTZlTCJkcOdtgLj6O8KJn
 /GoNlfROTyqHdE+8QuJ0Jy4os2EtL7b5o3yCZnPmdyHm+Wvah+KqKqk+ujlpmcfzUa7tBzswjC
 90DzhWzD11jGSwuo/tpoh6nxb+oWRadt3WFpqMMD5yBVzBahOGtZdxoEw6VpV4NxHTF3NnCYNV
 r4E=
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="33592941"
X-IronPort-AV: E=Sophos;i="5.83,289,1616425200"; d="scan'208";a="33592941"
Received: from mail-pu1apc01lp2059.outbound.protection.outlook.com (HELO
 APC01-PU1-obe.outbound.protection.outlook.com) ([104.47.126.59])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 20:03:53 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNbtcuzQaSkSUCzrisy3BtWcrJ19rxHHQPYaQ7KTgpgRL0NnE7hcc3pPNMWBb+i9GMX3bY55MRxug3TfBqPWQngE6Autoaz1eD8wOo7cz3NyIexJ5JCYqPkrYCLowevuajrJ0qEY1owrR0OOrHf/T9yX4I4jYGlbateGyCqPP197UqIS85kriQ6NXD4/f+XLPChUQuPMFDbBvhq4ZB9RXnOMLl9I74H98P1Fhh+iveKiugnSzm35rREUK/aKa/vIj/5rxBN/LyDJUCp7rlDrg6XsqYRqTG5to3xsrI5opBNdqwl+uA4RF/Cybi/LSAcCp2GeI/KYxkpjl5ES0NeUzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YE9X2/fNC+hdDOgV4Axwdle4DAPVbyQ9PWY82qC1aIs=;
 b=i1Lp0LHIfMFr+obYuR4+AJtVnRK6avkLF7Gc+TIatYQR85jHB5pX54Vfxk4qqTbP564Nmh0cK664P8Y90rBJyhb4mpAbS4at/eyGCh7XujUDvyM+qo10d9wsVlZnIzgt408p1rfqtFEUxx+HkJsf5J65jETra+0GVcivdu8rin3pq52MR27TJTDR5FGuqf+GI2ZCNfiz8AZd0lwKqjnEy3w79FO1nQYtUfKxO7ElKS4Zk8qMR01zO1U9pQhYoqWv+UkQU0tei8BVK9p9CkudvTPygiLK6spg8Hd8vFXWWPExabxp3JMrEkt1EPSVCaIGz3Nh714Hhg6hMBbXZBInxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YE9X2/fNC+hdDOgV4Axwdle4DAPVbyQ9PWY82qC1aIs=;
 b=IV9ih42kp7F/BdK1JUW+xDtkiPQShG2OxIU75l0B+OxvO5PXYpKgaOUj9c7QwtXW/Pm/HzH9HCcY+u4G2lrCrevcqC6E8qTBHLtULLwC1v3BkPW8+BlyhFQPu9NOl3L7ph7gwb8ULFWqIJ+sICNmO/kCXmqnBu3NoQ8rIZ3igas=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB3660.jpnprd01.prod.outlook.com (2603:1096:404:d2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Mon, 21 Jun
 2021 11:03:50 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4%9]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 11:03:50 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Samuel Zou <zou_wei@huawei.com>
Thread-Topic: [LTP] [PATCH] cpuset_hotplug_test/cpuset_hotplug: Fix bug for
 obtaining task_cpus value in root_cpu_hotplug_test
Thread-Index: AQHXKsS1AK42sgBV30i3Y9nkmdkef6rHtZSAgFDG1wCABiTbAIAABhiAgAAJ0YCAAAsPAIAACJiA
Date: Mon, 21 Jun 2021 11:03:50 +0000
Message-ID: <60D07235.60005@fujitsu.com>
References: <1617701249-62196-1-git-send-email-zou_wei@huawei.com>
 <437bb60b-4f97-4884-8713-c7b619dab211@huawei.com>
 <60CB2CF8.6090108@fujitsu.com> <60D05460.5060903@fujitsu.com>
 <91f24077-493e-dcad-e537-6b8559222439@huawei.com>
 <60D061B9.9070904@fujitsu.com>
 <ab163aab-a045-30ec-2120-94a07b5a610d@huawei.com>
In-Reply-To: <ab163aab-a045-30ec-2120-94a07b5a610d@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6284cba0-0866-4303-29ac-08d934a44028
x-ms-traffictypediagnostic: TY2PR01MB3660:
x-microsoft-antispam-prvs: <TY2PR01MB366071DF878CD6B7ECC852E2FD0A9@TY2PR01MB3660.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 05cGdfJoDlDnxnK7uTaFxq2rrSEV/ltFVYvk9ghB4Y8G5IBZ2H/BDnkGx9nhSqO2KUZTJPSOBj2eXgAGN3jAgU78jFFMcZW9PtziloOZeWALz5f7y4q94A1xOXbAN7MGGCzlYlDj0Jxxl7yQsUihLgxePlhm9U5u/L8XPfMKI49OOg+M+GWtImeLiFDk8UuXV8F4qtf3LXG9io/DuqKAGURyURm97vJ7FkgMDOU0J1TDwzzTaP2WSix62qnIBsqXP8JwIqZQiFqK6i8634f4OrmjJw/igt/SD9fux9Yjd6dEGTe8CGhJyGOPI7dWvQmEAB67zApQ2hX3pXPXuQn7MNAOp3RiYHjUfJlt1vKNaxVFn/IuaRw0HVEfD/O8loJBpd05KB+VLeT7eScdP7PB++XyzS7YlWcg8NU8qgnnQqWoAS8KHdcOaCXzfcA6Iu5/mwaSbZrCrw2E/Vc/3tGcRqE46Yc/N+QDHpgsQ8orC+lxJB9X4LXUM7Ly/lx5YOFtie7mKEdter7ZURxAJV2Uloi+/xK33KKsFzRjB6RzQsBU3ix6xFmlpv/Uftcs3xUxM5XJGv71eZ9d8i54UqYgI+VwyLRsnVlbLpZ+9f0bY5O0YDAXjB7yptVZ7VM5IG4HVuW4UVnHIlh+KmJbWeGOggHC0hD7b7Q1r4VMATpP8+hoXfJ7fM72AoK6IDxFc7ELA+pV7kIhm0YXXiNH5uwijXWK1Lea1Lbpc4BIstqOxzz7OKYWafagEhGnDLXOEU14JVcjGnzznbKh6MgI4jQDCw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(38100700002)(122000001)(186003)(6506007)(66556008)(966005)(26005)(66446008)(6512007)(478600001)(53546011)(8936002)(64756008)(2906002)(5660300002)(86362001)(8676002)(4326008)(36756003)(6486002)(2616005)(71200400001)(6916009)(76116006)(66946007)(66476007)(83380400001)(316002)(85182001)(91956017)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?MlREdWNlUmJ2TlR3aHRDZHA4UXdoYlN1VXFFdzF1MTJaMGlybjFyZG5kZTJO?=
 =?gb2312?B?c1hyeHR1c29vbGRwZ1lYTEtOb2tRbG1TRGliRklmTWRuQ3h5RE0ycnZrdlFB?=
 =?gb2312?B?ZllVZEdUK00rRmg4NllUQk9JanQ0dnBqTjlCN2pKMHBwWWJ0dTNwclNMM1RR?=
 =?gb2312?B?dFAyMjNNcTVJM1NHaDMxUUhhVzNZOVBBQVpSWUhKTmIxMEJJZU5hWGxKVHhZ?=
 =?gb2312?B?YStQYlJ2bGFXQjgxOVJtSnJKNzZlTFlhRVZkdHZEODhGZjRRQ0ZSbDB0NjBz?=
 =?gb2312?B?Wmk0bmpqRUc0b3lROWlBVG1iRzNLM0crL3JBL3RKYVc3bzhHS2pPY21RN0Z1?=
 =?gb2312?B?TDBsYnR4dndpNE1ONERwZjN3bW9wNktLUFI5Nk1QVzB4U0FOSU50S3ZmR2xo?=
 =?gb2312?B?SnFQRHlwOGdaTVQ0a3Mvem1FU1JseUtjWmV0YmRTaE84VU5BQ09DUVdkSzlF?=
 =?gb2312?B?K21iWk9ZcHJXSEFkMkpLRXFQYmNZS0d4dXZlNUdBbVBLZlRCZGx2Zzd4bktY?=
 =?gb2312?B?cURDZVpVdEtvMmgrV3VKN3FqUTIvRzZFUTR6cDdWV2d6eS8yWWs5aGRoU09S?=
 =?gb2312?B?eVBPMVBWdnpmMkNZTCtOU3FLMGoxdTh2VkQzUCtLYjUwcU55N2V0eHJrbDNN?=
 =?gb2312?B?blFNeDY3MWMveXRnL3FkNExFc1lhMGsvQXBSQkIyVFViYk5wTW56VHlVdHBk?=
 =?gb2312?B?dFJqelJKTDNTZXlSVm16K096U1lqUlE3UlIxTjJLYTFVOXRTMTNBWFQ0QmtT?=
 =?gb2312?B?Y2ZLWDlZd2laTUt6Mk95SDZ4L3NZdjRDVDQ4M09kTWgvemtUd0Ywam93Y1lD?=
 =?gb2312?B?YzgzWTRkZ3Nmc2xubmZ0d0pZU1NmcHJMSFh6NTlIUERuamU5NzVDbkRlYjRj?=
 =?gb2312?B?RXd4K0o3aDloYXNwalV2SjQxRENHY05BbWNEMXl5UEpsa3NjMmlVN3JsdGZT?=
 =?gb2312?B?UUFhbXAvVEo0UVJCckdIcEhIZEI4cnAzVE9maDZvWVk2V0FEUy9JUUNnYTA1?=
 =?gb2312?B?cVRRbGIrc3FZRWtXSHdZVFYyc0h4SGtPUHNsUzVHVG5VVlVkYm5Fdk1jNFpp?=
 =?gb2312?B?R1NqVldEQkVtN1NEZHd3ME1WYzhtRXJyOXFsV0d5TXVIUUlJVlZmVFBSaGd0?=
 =?gb2312?B?TjNNRHdwbVlIZ3U5M0VWNGk2bzhVY3ZFdE5GMG0rOXpZbEVBYjVvb002eFRZ?=
 =?gb2312?B?UG5LUlJydXNZN0xoc1hReDA3aUthY21YVXg1U3kvRXphOUQ2MHJuM0JLTlB2?=
 =?gb2312?B?SU1iYnIzam5HT2xZSWJUaDFWVHpraVp2dDcxYnJ6R0R3U2E4d0ZvSnBGSHFz?=
 =?gb2312?B?SnpBczJqbmUyNVJyWjZnak9hY0FHZjB2cGRvZks2Yjllc1FmbUdYZnJyVHFT?=
 =?gb2312?B?ZXd1OTEyckFPZ1pPeVMweXNMdHM4L1Ywb2hUYk1sMjExOGgxVTNkc1FQL1E4?=
 =?gb2312?B?dGZPbi9qNlZnbkZzWm1ZaklmZjJLOG9INDQwdk9hRi9CeFFRdlJxcXhDM0pl?=
 =?gb2312?B?TnVqL3FsbFRLdEZPcVBKQk50Zm40QjR1WXNwdDNZdWVmNTM4Qm9LWU5Da2VM?=
 =?gb2312?B?Yy91UkxPQ25yaDBPMXNzUzUremFCQ2t1YzF6dDBmZGprR0VQL3RjMlVNNml6?=
 =?gb2312?B?d0ZYbnNFSzdZVUdiL2k1NXc4cUhKOEVOL3c5bC9wSUQ4K2QvT1V5SVJIMmJz?=
 =?gb2312?B?YkhNeEM4d3lKSnZBc2xXUXlYYUdHbm1zU2JLWGFEVlMxZFdjNGZSdkFKaEtx?=
 =?gb2312?B?c3ZRWXNtbS95ZDdGS2Y2M0hlSVhVNWtpVTJtL2k4dnViSDJXYjJlSXlpT0Jn?=
 =?gb2312?B?d25hcFNmcnlrRHNvMVNRQT09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6284cba0-0866-4303-29ac-08d934a44028
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 11:03:50.4524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kaWW4x8jHM7CToNdCpC3tYX1gd/YC4KtRBTlerqfdllAd8Tx7ySg9Sf5EPjtT2J1auSxew8ERwa6mZ9moeZIB0JJ17VFUArt0rNUPY0SMEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3660
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpuset_hotplug_test/cpuset_hotplug: Fix bug for
 obtaining task_cpus value in root_cpu_hotplug_test
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

Hi Zou

Thanks for your patch! Merged.

Best Regards
Yang Xu
> Hi Xu,
>
> Please push it directly, thanks a lot :)
>
> On 2021/6/21 17:53, xuyang2018.jy@fujitsu.com wrote:
>> Hi Zou
>> Do you want to send a v2 patch? Or I modify this patch and push it
>> directly.
>>
>> Best Regards
>> Yang Xu
>>> Hi Xu,
>>>
>>> You'are right, I miss to get task_cpus value in
>>> general_cpu_hotplug_test().
>>> Thanks for your review and agree with your modification.
>>>
>>>
>>> On 2021/6/21 16:56, xuyang2018.jy@fujitsu.com wrote:
>>>> Hi Zou
>>>>
>>>> It looks like this patch also miss to get task_cpus value
>>>> intgeneric_cpu_hotplug_test when expect cpu value is EMPTY.
>>>>
>>>> I can reproduce this easily by increasing the possible_cpus value in
>>>> cmdline. Merge your patch, this case still fails as below:
>>>> cpuset_hotplug 1 TINFO: CPUs are numbered continuously starting at 0
>>>> (0-3)
>>>> cpuset_hotplug 1 TINFO: Nodes are numbered continuously starting at 0
>>>> (0-3)
>>>> /opt/ltp/testcases/bin/cpuset_funcs.sh: line 179: 5676 Killed
>>>> /bin/cat /dev/zero > /dev/null 2>&1
>>>> cpuset_hotplug 1 TPASS: Cpuset vs CPU hotplug test succeeded.
>>>> /opt/ltp/testcases/bin/cpuset_funcs.sh: line 179: 5714 Killed
>>>> /bin/cat /dev/zero > /dev/null 2>&1
>>>> cpuset_hotplug 3 TPASS: Cpuset vs CPU hotplug test succeeded.
>>>> /opt/ltp/testcases/bin/cpuset_funcs.sh: line 179: 5750 Killed
>>>> /bin/cat /dev/zero > /dev/null 2>&1
>>>> cpuset_hotplug 5 TPASS: Cpuset vs CPU hotplug test succeeded.
>>>> cpuset_hotplug 7 TFAIL: task's cpu present list isn't expected(Result:
>>>> 0-7, Expect: 0-3).
>>>> /opt/ltp/testcases/bin/cpuset_funcs.sh: line 179: 5795 Killed
>>>> /bin/cat /dev/zero > /dev/null 2>&1
>>>> /opt/ltp/testcases/bin/cpuset_funcs.sh: line 179: 5846 Killed
>>>> /bin/cat /dev/zero > /dev/null 2>&1
>>>> cpuset_hotplug 9 TPASS: Cpuset vs CPU hotplug test succeeded.
>>>> /opt/ltp/testcases/bin/cpuset_funcs.sh: line 179: 5894 Killed
>>>> /bin/cat /dev/zero > /dev/null 2>&1
>>>> cpuset_hotplug 11 TPASS: Cpuset vs CPU hotplug test succeeded.
>>>>
>>>>
>>>> Also since we have use present value, we shoud adjust output to match
>>>> it. I modify this patch as below, What do you think about it?
>>>>
>>>> ---
>>>> a/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>>>
>>>>
>>>> +++
>>>> b/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>>>
>>>>
>>>> @@ -93,9 +93,7 @@ root_cpu_hotplug_test()
>>>>
>>>> root_cpus="`cat $CPUSET/cpuset.cpus`"
>>>>
>>>> - task_cpus="`cat /proc/$tst_pid/status | grep Cpus_allowed_list`"
>>>> - task_cpus="`echo $task_cpus | sed -e 's/Cpus_allowed_list: //'`"
>>>> -
>>>> + task_cpus="`cat /sys/devices/system/cpu/present`"
>>>> check_result "$root_cpus" "$expect_cpus"
>>>> ret=$?
>>>> if [ $ret -eq 0 ]
>>>> @@ -103,7 +101,7 @@ root_cpu_hotplug_test()
>>>> check_result "$task_cpus" "$expect_task_cpus"
>>>> ret=$?
>>>> if [ $ret -ne 0 ]; then
>>>> - tst_resm TFAIL "task's allowed list isn't
>>>> expected.(Result: $task_cpus, Expect: $expect_task_cpus)"
>>>> + tst_resm TFAIL "task's present list isn't
>>>> expected.(Result: $task_cpus, Expect: $expect_task_cpus)"
>>>> fi
>>>> else
>>>> tst_resm TFAIL "root group's cpus isn't
>>>> expected(Result: $root_cpus, Expect: $expect_cpus)."
>>>> @@ -166,7 +164,6 @@ general_cpu_hotplug_test()
>>>> sleep 1
>>>>
>>>> cpus="`cat $path/cpuset.cpus`"
>>>> -
>>>> task_cpus="`cat /proc/$tst_pid/status | grep Cpus_allowed_list`"
>>>> task_cpus="`echo $task_cpus | sed -e 's/Cpus_allowed_list: //'`"
>>>>
>>>> @@ -186,6 +183,7 @@ general_cpu_hotplug_test()
>>>> /bin/kill -s SIGKILL $tst_pid
>>>> return 1
>>>> fi
>>>> + task_cpus="`cat /sys/devices/system/cpu/present`"
>>>> fi
>>>>
>>>> check_result "$cpus" "$expect_cpus"
>>>> @@ -194,7 +192,7 @@ general_cpu_hotplug_test()
>>>> check_result $task_cpus $expect_task_cpus
>>>> ret=$?
>>>> if [ $ret -ne 0 ]; then
>>>> - tst_resm TFAIL "task's cpu allowed list isn't
>>>> expected(Result: $task_cpus, Expect: $expect_task_cpus)."
>>>> + tst_resm TFAIL "task's cpu present list isn't
>>>> expected(Result: $task_cpus, Expect: $expect_task_cpus)."
>>>> fi
>>>> else
>>>> if [ "$cpus" = "" ]; then
>>>>
>>>>
>>>> Best Regards
>>>> Yang XU
>>>>> Hi Samuel, Zou
>>>>>> Hi,
>>>>>>
>>>>>> A friendly reminder for the two patchs in:
>>>>>>
>>>>>> https://patchwork.ozlabs.org/project/ltp/patch/1617707717-63693-1-git-send-email-zou_wei@huawei.com/
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> https://patchwork.ozlabs.org/project/ltp/patch/1617701249-62196-1-git-send-email-zou_wei@huawei.com/
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> Can someone please review the patchs, comment, and if appropriate
>>>>>> commit
>>>>>> them?
>>>>>>
>>>>>> Regards,
>>>>>> Zou Wei
>>>>>>
>>>>>> On 2021/4/6 17:27, Zou Wei wrote:
>>>>>>> --------------------------
>>>>>>>
>>>>>>> 1. The method of obtaining $task_cpus from root_cpu_hotplug_test is
>>>>>>> incorrect, because the value of Cpus_allowed_list is related
>>>>>>> to /sys/devices/system/cpu/possible and
>>>>>>> /sys/devices/system/cpu/isolated.
>>>>>>>
>>>>>>> 2. If isolcpus is configured in cmdline, the value of
>>>>>>> Cpus_allowed_list is equal to /sys/devices/system/cpu/possible minus
>>>>>>> /sys/devices/system/cpu/isolated. In this case, $task_cpus is
>>>>>>> inconsistent
>>>>>>> with $expect_task_cpus, test will be failed.
>>>>>>>
>>>>>>> 3. Need to change the method of obtaining $task_cpu
>>>>>>> from /sys/devices/system/cpu/present.
>>>>> Thanks for your patch, I also met the same problem when
>>>>> /sys/devices/system/cpu/possible is not equal
>>>>> to/sys/devices/system/cpu/possible/present .
>>>>> Cpus_allowed_list: 0-511
>>>>> but my present cpu is 0-103
>>>>>
>>>>> Then I use possible_cpus==104 in /etc/defaut/grub, cpu_hotplug case
>>>>> then
>>>>> pass.
>>>>>
>>>>> According to kernel documentation[1] and kernel fs/proc/array
>>>>> code[2](It
>>>>> just print cpu mask instead of present cpu), So using
>>>>> /sys/devices/system/cpu/present is right instead of getting
>>>>> cpu_allow_list.
>>>>>
>>>>> possible: cpus that have been allocated resources and can be
>>>>> brought online if they are present.
>>>>>
>>>>> present: cpus that have been identified as being present in
>>>>> the system.
>>>>>
>>>>>
>>>>> Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>
>>>>>
>>>>> [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu
>>>>>
>>>>>
>>>>>
>>>>> [2]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/proc/array.c#n418
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> ps:
>>>>> Also find a kernel documentation problem and have sent a patch to
>>>>> remove
>>>>> non-existed cpu-hotplug.txt in admin-guide/cputopology.rst.
>>>>>
>>>>>
>>>>> Best Regards
>>>>> Yang Xu
>>>>>>>
>>>>>>> 4. The description of cpu_present_mask:
>>>>>>> Bitmap of CPUs currently present in the system.
>>>>>>> Not all of them may be online. When physical hotplug is processed
>>>>>>> by the relevant subsystem (e.g ACPI) can change and new bit
>>>>>>> either be
>>>>>>> added or removed from the map depending on the event is
>>>>>>> hot-add/hot-remove. There are currently no locking rules as of now.
>>>>>>> Typical usage is to init topology during boot,
>>>>>>> at which time hotplug is disabled.
>>>>>>>
>>>>>>> Signed-off-by: Zou Wei <zou_wei@huawei.com>
>>>>>>> ---
>>>>>>> .../controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>>>>>> | 3
>>>>>>> +--
>>>>>>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git
>>>>>>> a/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> b/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> index 155e536..2c6993a 100755
>>>>>>> ---
>>>>>>> a/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> +++
>>>>>>> b/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> @@ -93,8 +93,7 @@ root_cpu_hotplug_test()
>>>>>>> root_cpus="`cat $CPUSET/cpuset.cpus`"
>>>>>>> - task_cpus="`cat /proc/$tst_pid/status | grep Cpus_allowed_list`"
>>>>>>> - task_cpus="`echo $task_cpus | sed -e 's/Cpus_allowed_list: //'`"
>>>>>>> + task_cpus="`cat /sys/devices/system/cpu/present`"
>>>>>>> check_result "$root_cpus" "$expect_cpus"
>>>>>>> ret=$?
>>>>>>>
>>>>>>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
