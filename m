Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 252493AB1EE
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 13:07:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C35953C88E6
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 13:07:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E2EF73C30EA
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 13:07:16 +0200 (CEST)
Received: from esa12.fujitsucc.c3s2.iphmx.com (esa12.fujitsucc.c3s2.iphmx.com
 [216.71.156.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 91DBA10007FD
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 13:07:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1623928035; x=1655464035;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iiANva0vWY5u493lYTL8v1qzJAsv1uXNV7+klTaL2tg=;
 b=v4xRQ2WhubzwYcz2NBPHYyH++9OGYrPhl1fBU+cjsnJwDCJag3+czcJa
 xoDxMxX7rfFWIfnRFMKCpwYKdQ2iUbHPxnEOpU4ADv9O9Zkgkceg3XemI
 sVr7cqdWXKEwg/sgrVT02tSpUjqC3tKkaXkXP+O7mMZ+MTZU6ptaI63dA
 cahxO8f7jpPckUv9Ce6sFoMz4Xsb5KilwKNc6j1CGvhoZzBv7gfKlBHt4
 Udcl0y3/mPTY8p5+ivEjtTj5h2uzRTrq+7m1UnefdLLWMNkyFgAD8qjUZ
 tuo1/V9dwC9Dc1v+hNI1RG9ms+Ue4EXrxE4gv6ZNE0X46pR2G8OevrCsF Q==;
IronPort-SDR: jogPIYP0/6+NTSUvStzSvRDyrof0nPNqAt4Gspl0Cav7PLPRLrmnVeZoqF/4y5gRkdh2TIt3cR
 vk/rKMKWLqjz/773wEnxkX8BtfrlnTfQBTFK5BV+SU4Buo7Z7Hx3GubPl90nMH/YrgEXtiSs2t
 xmDGhdWc/USOUigyyoVmxAKzgWni2BulSeN1TCfDzecnkgdIX1AtIeY+3AdijCtSei/pUf02JU
 yLNUDBGdhMOd06zF4qhPUWZ9nEFVHegUNnwU459QesT5vRsOYuoxyP4vSfy8dow07TPnnQ69qc
 cOY=
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="33333623"
X-IronPort-AV: E=Sophos;i="5.83,280,1616425200"; d="scan'208";a="33333623"
Received: from mail-ty1jpn01lp2051.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2021 20:07:13 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NK3VS6BB/OcwY5vzIecLfv+S9ZyGwh6ZLK2wboEDXg63It6H5ac0JLsqip+rGb42Zvzbewv1sAspZMN3xkVWHOxdPbZaKV/rsbJSXHhL0FO2oxPw9Ztv0w1EQBsLAgffbdB3Q+dxNLC8iw0sGS1ViJyvOqOedlsTQr+hlg041yQyTuPeJODtxRoupL5Zcmu8tm0z8ouvNjU0c89k+a+M5sR6e28zHyUDohcMGv4hDBb3RFSwci3Y8Gp3GyrBylxXffcKZbU2kz7SzSx9SZDqiP38CdEii3alWclJm2UDJsLJOUm7drW+ZypIatQn4cqaz4eTMqiCyoZL+WLR59feQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiANva0vWY5u493lYTL8v1qzJAsv1uXNV7+klTaL2tg=;
 b=LTGLiivEeQq+U5GzqO9y2KRXamHtBGumCQaBQ82MAQZRNAjlqc1ioHTL8dAJAdcjHNl6/17klH7MgjX/kUgkzsu/0C6i/7FTQa/2tEp3xjH/mcMIERpfb0absNlGjCswCAmBU0ys2GlfS9VtTVD9LKyURRPXW2ZLR36hvW8oWoozWxx1KOKCl96q4jsHdVrWyB8H2GGKCHa2H7/bA5wZhsFtKaGWhSNjl6MiAtRtRBUEFzXmKWFWG6d0VUs2K7jjmU0dawYRkJuZ5V+YH3QYp7x6ZbpucHr9B4KgARvj/2khcqtxQsCrIleuWbZdFYvJ0LHnqi23GoFShEiTemopVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiANva0vWY5u493lYTL8v1qzJAsv1uXNV7+klTaL2tg=;
 b=nLYNhXh6mLVubKXJrwtJ3Nhh1fJpwghvjeqQsVOkXXs7inwqEAM3hZNxWPXUCfnWbGk/z7jckYEKKqmGuYN7O7j8iQPtdH0OhNAetX2thJC81AD96wJOWf9BXmkLhnfOITcPcevYsC77ncmnx6iJQfalRhvlLUx6q4AAnVJRspU=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYBPR01MB5424.jpnprd01.prod.outlook.com (2603:1096:404:8029::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Thu, 17 Jun
 2021 11:07:10 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4%9]) with mapi id 15.20.4242.016; Thu, 17 Jun 2021
 11:07:10 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Samuel Zou <zou_wei@huawei.com>, "zou_wei@huawei.com" <zou_wei@huawei.com>
Thread-Topic: [LTP] [PATCH] cpuset_hotplug_test/cpuset_hotplug: Fix bug for
 obtaining task_cpus value in root_cpu_hotplug_test
Thread-Index: AQHXKsS1AK42sgBV30i3Y9nkmdkef6rHtZSAgFDG1wA=
Date: Thu, 17 Jun 2021 11:07:10 +0000
Message-ID: <60CB2CF8.6090108@fujitsu.com>
References: <1617701249-62196-1-git-send-email-zou_wei@huawei.com>
 <437bb60b-4f97-4884-8713-c7b619dab211@huawei.com>
In-Reply-To: <437bb60b-4f97-4884-8713-c7b619dab211@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a36f511-13e6-47aa-ddd8-08d931800de4
x-ms-traffictypediagnostic: TYBPR01MB5424:
x-microsoft-antispam-prvs: <TYBPR01MB5424FE050CE07DEEC2796E55FD0E9@TYBPR01MB5424.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aZz4eXvvfRrsX1SeMIvXJNDzg5tvVGiOOHcB+5JRV7r26WUrHxOoREeTH9vkL9QktJTULrvHJ7GRRNMWSrAV+yAMoF3tBYXmHwBOGeC2VStcg1jYlqMtYnvwYljcdi7RUemEkEYcPEMlaRewka8FfTpVGxc+7ranA+BcfUhDxYVHFLuJvjrMlKNJe/fX7EOgMla2qjAt8ziywIih9nHzN4y4CtMg/uyZ62G6ckVJl4YXLLbh/rvEMGC2X2tNAPMypWPKRLs9R07OG3I5MPLuevsSNGymB/jEiGgClXt5wbDCCrxVIuinvt+MdxFVE972qRFyFH7+71HiGqlvI3kQmiBFMVRu+ZrymebENdzN4Kzn2MCspYp6RbKhQomDJBB/qEaToR3bcfoAB/oNLP6q3aVPBGoEAjJEp7z7He9UuRgQ73fy6kW9ceFwizyj0rDnSZtI6g97r3uF1Al/in3ZN0oXeqfuPwLY5v2sYFF/RCbHZO7R5z8Jf8QvHtyc0N/onTzyUFIHF4qVlPqkmaZUuqds+PIDZ+0Bg/C1uX50AKcpWJ2Z1JftRhahifpg4D80SPspGYHQpTHe+PPOHj5ayA8rL/smwxvnwY51i58bJKutri/QNO8/W+8pjMHyFE2RWS2AwdhlgWYK/4mZ258kyracm3NHZd1BPekV9a3OVpwepsbcQ20gqZuXuGuRbZq6CAJXoEEp2XkFs/QZtOSGLq6Tp46XJgMFkctZ6ru6LRCIG93oQG0LEcv99dZd9IiJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(8676002)(2616005)(5660300002)(86362001)(8936002)(186003)(26005)(83380400001)(6512007)(122000001)(478600001)(33656002)(6486002)(38100700002)(87266011)(36756003)(85182001)(110136005)(316002)(4326008)(2906002)(76116006)(91956017)(71200400001)(64756008)(6506007)(53546011)(66556008)(966005)(66946007)(66476007)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?RktHZ3JFbFpwZjkxR0g5MHVpVkdJODhITVo4M3d4L2lIWHBsN1ZQWFBjWmFE?=
 =?gb2312?B?YTIycUdOdjRvRnBteDNYVXVST2xCa3BJejhKRUhWWFVKdHFtMW5sUGlWcS95?=
 =?gb2312?B?ZDN3MkhVUklzV09qamRXVWRPVlM4cXVqdTh4RnhXR1R2M1NiME96cUYyc3BW?=
 =?gb2312?B?ZVFXTjIvRFZIeFZJSVIrbkYwVlRYUjlPWmU5Z1pJMlNtMmJsMW1JUW51cjNN?=
 =?gb2312?B?TmRCZkFlTkV6bGswdW5DNlhPZkRCVzA1ZUF6b1NRb3VjUmduRDA0TTQ1YVpR?=
 =?gb2312?B?S0oySWVUdXVqUGg0b2ViRlZuNDZ6c0N3dXQvSFcyWFR2b3FZUnpJeE45Zk9O?=
 =?gb2312?B?QksyWEFmNWxQNkRWV0xRRS8wdm5sdWJjNkxNU3lNZDZWNk1sMlZNTG8vbXd5?=
 =?gb2312?B?L2lZNkNBYUJ4MXdJV3B4TUlVM3M5RmtoeWFkV0k2SUdsNnRFL3RCcHd6TWkx?=
 =?gb2312?B?UE9yemVZWU83cG8xc3V0Ri8rVWdIK2p0UkF0a0x4YW5NS1dOc3NGMnBaTFZa?=
 =?gb2312?B?bHpWSGRIZmFoQjRwaWdtZjF3b0RHS2JiVW5VZmZlTmkxUDN4V092bklXcjNo?=
 =?gb2312?B?alNqY2ZlK3R6bmRiWENXUGFWUmQ2NWNmMHp0aGd4M01aMzZGSCtERmtvaDkr?=
 =?gb2312?B?N1hMeDFLZ2M1MlRXY3F1NnlYVGliQVJadTZSVXFYVmVvam5TZG14RzVRQ2FT?=
 =?gb2312?B?SUZhVHFLMzBvbkY2MHY1dTJuQlNCeW1pZXMxOTVzUDIxMDE2cEhMd0dtbzFh?=
 =?gb2312?B?Y0p5TXRud04raDlTYXV4a3JrMTkvVmNGVHpsODRxQ1hrWVdvcUh2Z0R0eHZK?=
 =?gb2312?B?NXJ3alYvUFNkdkJadlBmNUpSRW45SUZBdlhrT1RBcWJPYkR6UkhyUmFGUjJz?=
 =?gb2312?B?b29iL3BOckNrdmtTUEhaR245TXRaTHJjMEVGc2M4VTNqdWZGTm02SEVwbG41?=
 =?gb2312?B?UUljZmlUdEdKTHJmVWVGQ0FyTVRORDd4QnVpWnJVWDhvZG5oSHFNTGlEcmpQ?=
 =?gb2312?B?K2VpOXR0WCtNZlhKN2xXbkd6YVg1SmRWMUgzTlQyWDNSZkh1VW1pZjd5aTl4?=
 =?gb2312?B?UE5zZHo3SFBQbmxkenJQYVdLMUIzSXllVWVuc0I0dmFyQlBJN1A3ODMxSElj?=
 =?gb2312?B?cndtZGdoZGZsRTlscXZwenVLTUhJWDJreEZTb1N1bmFiUSszak9YMTRDayt4?=
 =?gb2312?B?T29xM0JITlg4WmJpZURhc01DWTd2MnZBZ0IwU2tVeU1DNEtjRjZLV3VINXYy?=
 =?gb2312?B?VURoZ0Zaand6U3ZWeUJET2grYnNNYWZGUmxlS2FHRXpVeHpvbzh0VXR5dFMr?=
 =?gb2312?B?M1p4RzYxWVNRSVBzZ0VrZnpVNDl1ZXN1a1FQSXA5VmFBY3QvaXdPWHkyVUNu?=
 =?gb2312?B?RHEvQm9FUkNvdm1oUTNzV0VicHAwTGpYamR2SHY5ZllPS3VsZ3hsT29iWDVC?=
 =?gb2312?B?cHp2d09BUGJHUVdqazJkZVJrTndicFRjZzlHbXc0ZW01dDFlTVVpcG5zQlBr?=
 =?gb2312?B?SmFacGwxbjNRRFpsK3hZdXg0NUNqandVSEFtYWtuWU1YTHZVY0l2NUFEM0lv?=
 =?gb2312?B?aElGaXJTaU1KemZSSGpFblNHajBCb0o3eTE2eE4wait6TFY3S3JQdmFaSkdE?=
 =?gb2312?B?L1dDeTRGai84YURzeldEZmo1M3ZHR21ZUGc3Ujc2T011Tjc4dlNCM3NOenQy?=
 =?gb2312?B?MjN6djVuM1VWdERVS2U3ejdWVkhsS2U0UUtmSnJmUWd2c3ovZmdYQjFSbStQ?=
 =?gb2312?Q?kqTa+GOge9TTUyzJx6jirfOnTy566Te46gNlDFz?=
x-ms-exchange-transport-forked: True
Content-ID: <D81128B9CD1E844C8F64BEC2C2A9ECAC@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a36f511-13e6-47aa-ddd8-08d931800de4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 11:07:10.7437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8Vks+OsAnwdb1udWPrNnXQFbF8S5KZoqfM/RzLXeRwvxAFGRi0v5LtOEmgjPScrfPHDZL3weQUgRNAwTxhHpWCfkDeqlaDTUNhCg7YGT9Qo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5424
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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

Hi Samuel, Zou
> Hi,
>
> A friendly reminder for the two patchs in:
>
> https://patchwork.ozlabs.org/project/ltp/patch/1617707717-63693-1-git-send-email-zou_wei@huawei.com/
>
>
> https://patchwork.ozlabs.org/project/ltp/patch/1617701249-62196-1-git-send-email-zou_wei@huawei.com/
>
>
> Can someone please review the patchs, comment, and if appropriate commit
> them?
>
> Regards,
> Zou Wei
>
> On 2021/4/6 17:27, Zou Wei wrote:
>> --------------------------
>>
>> 1. The method of obtaining $task_cpus from root_cpu_hotplug_test is
>> incorrect, because the value of Cpus_allowed_list is related
>> to /sys/devices/system/cpu/possible and
>> /sys/devices/system/cpu/isolated.
>>
>> 2. If isolcpus is configured in cmdline, the value of
>> Cpus_allowed_list is equal to /sys/devices/system/cpu/possible minus
>> /sys/devices/system/cpu/isolated. In this case, $task_cpus is
>> inconsistent
>> with $expect_task_cpus, test will be failed.
>>
>> 3. Need to change the method of obtaining $task_cpu
>> from /sys/devices/system/cpu/present.
Thanks for your patch, I also met the same problem when 
/sys/devices/system/cpu/possible is not equal 
to/sys/devices/system/cpu/possible/present  .
Cpus_allowed_list:      0-511
but my present cpu is 0-103

Then I use possible_cpus==104 in /etc/defaut/grub, cpu_hotplug case then 
pass.

According to kernel documentation[1] and kernel fs/proc/array code[2](It 
just print cpu mask instead of present cpu), So using 
/sys/devices/system/cpu/present is right instead of getting cpu_allow_list.

possible: cpus that have been allocated resources and can be
		brought online if they are present.

present: cpus that have been identified as being present in
		the system.


Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>

[1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu
[2]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/proc/array.c#n418

ps:
Also find a kernel documentation problem and have sent a patch to remove 
non-existed cpu-hotplug.txt in admin-guide/cputopology.rst.


Best Regards
Yang Xu
>>
>> 4. The description of cpu_present_mask:
>> Bitmap of CPUs currently present in the system.
>> Not all of them may be online. When physical hotplug is processed
>> by the relevant subsystem (e.g ACPI) can change and new bit either be
>> added or removed from the map depending on the event is
>> hot-add/hot-remove. There are currently no locking rules as of now.
>> Typical usage is to init topology during boot,
>> at which time hotplug is disabled.
>>
>> Signed-off-by: Zou Wei <zou_wei@huawei.com>
>> ---
>> .../controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh | 3 +--
>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git
>> a/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>> b/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>
>> index 155e536..2c6993a 100755
>> ---
>> a/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>
>> +++
>> b/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>
>> @@ -93,8 +93,7 @@ root_cpu_hotplug_test()
>> root_cpus="`cat $CPUSET/cpuset.cpus`"
>> - task_cpus="`cat /proc/$tst_pid/status | grep Cpus_allowed_list`"
>> - task_cpus="`echo $task_cpus | sed -e 's/Cpus_allowed_list: //'`"
>> + task_cpus="`cat /sys/devices/system/cpu/present`"
>> check_result "$root_cpus" "$expect_cpus"
>> ret=$?
>>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
