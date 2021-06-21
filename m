Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA76F3AE683
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 11:53:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 68F963C96EE
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 11:53:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6C3943C2192
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 11:53:35 +0200 (CEST)
Received: from esa11.fujitsucc.c3s2.iphmx.com (esa11.fujitsucc.c3s2.iphmx.com
 [216.71.156.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 968121A00923
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 11:53:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1624269214; x=1655805214;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VUV1lkx1jrsufcO2Ei6mIimD7lbeATO/+pib80WcX04=;
 b=if43F8WBn7nYECkDYmfS9meSHNbJG3FcPa34zcPtD6Q85e9LV0zeTidz
 ABNsG3t9rC6WPzdGMZ8w5dR1z/UayyB8UtqijaQlff5UIJbjQpukREtYI
 75LgP8+5PyM7v4JqOXB3vmaJORikTpgDEelwuILkA6ll4oqTjkJqYO3NG
 0/H5/vnObeY5HRGjpyJnt0JeNk+1zWwBxJJh+ITpLlPbDPbgl5rcZgfO7
 FUUc7OTq6cCmVR7RtviVXfjwJbQiV33+MzuCO9VU12UkfUsq6/pYfR8jh
 FVtqZtY4JBZOcIwOfO+9cZnIywaYQToTXn2m4F+jCAQVrI7W1Lr6u8C1J g==;
IronPort-SDR: ke7YNhQT+K7cHIjf5/qFa0OJ9AoGcexGIDe+/0rlGPPwN0f4PCbe6+GhirxCjT7owY4e8RTAaI
 a5Xg5R/osDZRnbHTQ/2yC9PnbMMzcGlOJVqUneXXLsPjKRDQ/ztGU7pmgkSi2dhDdJW1ChaYao
 5gxBWS2Cq/jBvcw0vvNiFGIfYmmTK1dOyuUgvh14TQHEQeUno7DPi2jaHWxQUpgqZuVy9Iu6qq
 s6puZzAWm74IRQ4WH/NWq/Cg/01pMB640osj4VXtgBX2eZDxMIfo9XxJQVJ56/Tv0iJSwBRN3e
 o7Y=
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="33588011"
X-IronPort-AV: E=Sophos;i="5.83,289,1616425200"; d="scan'208";a="33588011"
Received: from mail-ty1jpn01lp2058.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2021 18:53:32 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hq9T0tPHVDwRj85rGEwBUsYWa/xKzPudp7FsjIaGejFzecyvUN/4JI/Ms53DHU7UDkwU5Bc1T/K0LfaJrGW1Wv81RgveanDcEvLOnlPn1grNsHH3LvJjBsyV77YNW1tkBd2l7H/2faVKLmOkYUW5U0zmjXrPQbYj7pdg3kz9WYAvfotgQ7qJX/4WGNJxJUVa0nI/WcKjznca/iERL3wb5DUaYc6xorGUQ+opVeUvDfyIdQG2TEph4sfHv+0jqD72i6yFHp1hvitceChmq0FyX4o8oFS4vnOHgIy3+ySQWSrZAO4foRMtjwDhm0nt8130QPMo47/l9nuastDkzwjtWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUV1lkx1jrsufcO2Ei6mIimD7lbeATO/+pib80WcX04=;
 b=IX/w8wkz4jnAxiiIWz/1YZK8fldBJHFUuh0xXyAr4vM0nsOJYAWmiLGN3mKrCIV+GpX977/6c38GGKF6kbqfBBvpXd+/iLNqJaeNuPSMzWc5k5Tm2v5Ska0ZjjdsN9GBogq7FjhrDHFFmhIGt4qHjTo4e3Ea07ZKckLPtwnr6ILRXjYbFVjeo8uKyFmtoT1q4C8MoFIWJhzFClNX8NW7je6Go7C3OUuZjCOVizM9VccGnc/QR4QOSIGw0oNfZA8YjogZs3YrGl3oN+nnQbKb/Ue1LW02V7Cdrj8niGPuX+npO4MsnA5pFoSBTpp6fZLMBRNomN1km5o1g2Rj5gMw8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VUV1lkx1jrsufcO2Ei6mIimD7lbeATO/+pib80WcX04=;
 b=c5Hs/+bCcFDGp/XfP9R4SvzuJW/OCnzcNI7+Te0f0/yhIoABrDfywceUl8nWIg2hTpbCoTyPApX8WohtfZFbXzYf7yAJL5Wyw84Mr9Dv6t5GJQH4u5BODdN56z/EYxSo0PAg8/bbwspw9no9mg0aX/diZ388wNfaZ1AXVKaC5SU=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYCPR01MB7011.jpnprd01.prod.outlook.com (2603:1096:400:be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Mon, 21 Jun
 2021 09:53:29 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::f84c:9ac2:ee90:c6d4%9]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 09:53:29 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Samuel Zou <zou_wei@huawei.com>
Thread-Topic: [LTP] [PATCH] cpuset_hotplug_test/cpuset_hotplug: Fix bug for
 obtaining task_cpus value in root_cpu_hotplug_test
Thread-Index: AQHXKsS1AK42sgBV30i3Y9nkmdkef6rHtZSAgFDG1wCABiTbAIAABhiAgAAJ0YA=
Date: Mon, 21 Jun 2021 09:53:29 +0000
Message-ID: <60D061B9.9070904@fujitsu.com>
References: <1617701249-62196-1-git-send-email-zou_wei@huawei.com>
 <437bb60b-4f97-4884-8713-c7b619dab211@huawei.com>
 <60CB2CF8.6090108@fujitsu.com> <60D05460.5060903@fujitsu.com>
 <91f24077-493e-dcad-e537-6b8559222439@huawei.com>
In-Reply-To: <91f24077-493e-dcad-e537-6b8559222439@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad0057e4-8ed9-473f-9de0-08d9349a6c4f
x-ms-traffictypediagnostic: TYCPR01MB7011:
x-microsoft-antispam-prvs: <TYCPR01MB7011D283607B01652A15D49FFD0A9@TYCPR01MB7011.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /drSwI3Wf5h4aI8HFriks828Nx+oHaRupf45W8ufeEZy7zrOCQ2B6RdVERLD3UotuNWsv0lO/lSY9ruZtFAGir86iLSajx7+6TVXsMtt4gLqQi0ddk+UTztEefkkA9v8fOuwwOm03MqX+/150hxUy9wIxyEPxaGQ8Hw5I0QqZwjQstMSWTcPxZJKR+wGOb8tLLoH5xwa62sGYPBBgkRigj/ysZLvxAYGuVQbsWS1ElrLxU1l0qmU+ycPXoQmyKUv1Hmmy9kkelyVYkfPQ/af1HefoQ1/p4kxHIH2l2pTXzkf3GUQQFa8IPZEzpBSmkbSzObEhH+2McI0HlNsfEjpDUkoqcAskY5GqiH27qkasxJ0VwmKwOXyHyej7ISCfU0QSx7OXOUWEvaEVqcalZsvD/ZcpWPuPXOhWbp5U7uatYwHENDm4H+3eyxl9pU+ZIyeloYE25sAnAD0X/FKYux5rH9Gvc76EGHx9NSxMusGtrA3Kd7RmpffMi1A+DtkiCg+ZbQ7Ben2tDfcGX3GcdacGh50mBDsFOltWBUEiZjToA7PQ6kNA4qgN3QYJr2W7M004oWGrup7Ne7XlfqCWKH6EkH1+QWw9qv4U5FlIsBMU8DFE8J0/IVyOOCPhSppLnVqmwoZw7SuE0e2bc4SMKmhLGWRxkB92TZuYzz7IMHvKpcPtKPvAT9iJLlqOTtu9lozILWj5jxg+bsmpSb8YHB1zs5DrsCeTR9ffzq3/jYh7CHE3MFvlSvY9MSnJOik60jqd4Jjnd2xrEoxM0dZL4VlMg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(6916009)(2906002)(6486002)(478600001)(76116006)(122000001)(53546011)(91956017)(66556008)(66446008)(316002)(38100700002)(8936002)(186003)(64756008)(5660300002)(66476007)(36756003)(83380400001)(66946007)(86362001)(4326008)(6512007)(6506007)(2616005)(966005)(85182001)(33656002)(8676002)(71200400001)(87266011)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?RGtIOHdYZkFCc050bGFaM3k1ZWV1SEYzVDlHNmxRUGIyWjc4ZDIwaittaURv?=
 =?gb2312?B?SVBXRGRadVJOaURqQk0rTFJ3VFZydmFaeE5pbkJYNzJHdTFEbVprNmpNdWZF?=
 =?gb2312?B?Z3Nxai9HQ2JmcTdLenZNZmxETDFDM09IdE4zcC94NEhQYXI3dG0zTjJHYStL?=
 =?gb2312?B?Mjh5SVdkMlZOYndpS2hmNTBMYTJuaWpXc3lEdE9QbE1yT2ZJdDB2U0J1TTBI?=
 =?gb2312?B?VUZNSzlINnhWS1hlYStoNG9NeEx5VXRGaWpaWW5OQUYrRFlCSDRkTFR6dHQ4?=
 =?gb2312?B?MkQ3SlczY3QxeEJWMzAxQnNiK1BPNnhHaHlrU0dPWU5BTTkvNm5sSHJLcmpk?=
 =?gb2312?B?all6anNaSy9teHdzWm11bzd2NDBGVytmVXNyOG9GWmpNbzBXT1JuOEJ0T0Rr?=
 =?gb2312?B?aTJkZEVwQWhYOXNTWTdKcXZyeHVkaTF6aTJ5djFhQ2pjSEVvNUgrL2xDRW4w?=
 =?gb2312?B?V0Q0RTFTdW1UczhsKzh6dmQvUHFCUGY0MXUwbG91TGExTExNM3YzZy9JN3U5?=
 =?gb2312?B?ejhRQU1vQy96QUJ3M2lPcjFlTTJNS2x3SmNPUkRRTThkU0kwYzAyL2d4ZjZs?=
 =?gb2312?B?cm82NWk2L2YyWnpCMkd1ZUhhamh5dXAyNzhLeHAyUmlXQ2Q4SU9XT0Q5UUVm?=
 =?gb2312?B?VzZ5WG4zM1ZUSzY0NnYzN0NlaHhiNUZSWVpiUWU5ZUo1YmRCRFBhZGduMG5F?=
 =?gb2312?B?Z25DdTh4TFVtdjZhUWlrTWZDaUJISWZWVDkzQStOQ2NoTVZvcEpQdjFVOGpi?=
 =?gb2312?B?WGttVWRSS3BtSHRyZWZiYjZ3VUprK0FJVTAweldJZ0p1SGFNcnpNeXpsd21r?=
 =?gb2312?B?THE5ZndnQVZ3L1NsQndMSzNzSFc1SldFdXVTOGdUdWJ6OXh0TGNXNnhlU2FO?=
 =?gb2312?B?ZWZPRk1DUDExb3Rtbi9nWmdqUkpjanRvZUVqdXFEcUVpSGhIMGxiYUVFS3hF?=
 =?gb2312?B?Y0w5S2ZQZlZodEFMb3VPUzYza2dpRnZFUDBOcGNjVmhPMkVHR1FTSy9yaUN5?=
 =?gb2312?B?WjkxS2NEemloK2twNWt3OE5vV25DOFhwWENxY1A4Q2Rkbzk0ZEJaSDBIYm5j?=
 =?gb2312?B?WFFTZUNHa3VwUzRab1Y1eXRTVGViaWtJMnZmdUdUV2lISm9aRTl6NXY2eG1Q?=
 =?gb2312?B?YjFMdFljQmY5Sm1TazJvOTcvQ2NkeVozMU5PWHFSR3N4LzBrYWZlcHVMZ2px?=
 =?gb2312?B?YXVuWG5VLzZtbXlGUk9jQTNFWW92VTVHdityNGh1L052VHlyb1hwRmhsVXh3?=
 =?gb2312?B?Qk9TbnVkN1RZNkZISDFqeENTTmtISi9HVk10ZWtQb0VBRnFCdHlNTnFBZUZz?=
 =?gb2312?B?K215c3BJRFlQdUQ3OHoySUkvd3NocjRTeTFtWDIyYjJMenBMdlFDTTY4RUxZ?=
 =?gb2312?B?eUFtcExoRFpRa2FxVkcvSElrMFdTVVhJQXpaWi9Nb2VUeWJWdUVJSW53emIx?=
 =?gb2312?B?ZFY2b3g2U2JTQUtLOVBmMWF4c1gvT2NLZ1kwWGlWMzY3SXRsNFh1WWFFWlVK?=
 =?gb2312?B?Tlc3aTE1bGZuditSSW1JdWFlS09iYW1zN3NxTTZCUXkyNENMZ21qUXMxcEI5?=
 =?gb2312?B?cDB6a0llc2svczYrVFVHeEJ5VWtzaVBrVGFGUEVWUlRJVTkxTkMxTzdxUGZl?=
 =?gb2312?B?Rk0wbGVaWkJEMTFudHM0RlRuSldPNitIdVczUG0renZ6ZVRaY0lwT014SFRW?=
 =?gb2312?B?VkpmQVNZU29PTjNJMzlWZVVSekZZa3h5QjJRbU9IUGJiN2Y0T2dURUtMNnUy?=
 =?gb2312?B?MnR5dVpXZzJzNnlQMGszSGZRSHJlTGxtS1pYTnh2YXdGM2JKUTJNdkg0aDVU?=
 =?gb2312?B?R1Bya3ZzOWJheHJQVFpadz09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0057e4-8ed9-473f-9de0-08d9349a6c4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 09:53:29.5863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TipWaq53gIPhd/kZbED7GmACD49UJBp8dfjd396EisRWSPqfZkaXyJctrUoTyUC0XmB2KAfUqq4g8kj/lHHNTnhPnwx9lHDvwJsjdC0rxoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7011
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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
Do you want to send a v2 patch? Or I modify this patch and push it directly.

Best Regards
Yang Xu
> Hi Xu,
>
> You'are right, I miss to get task_cpus value in general_cpu_hotplug_test().
> Thanks for your review and agree with your modification.
>
>
> On 2021/6/21 16:56, xuyang2018.jy@fujitsu.com wrote:
>> Hi Zou
>>
>> It looks like this patch also miss to get task_cpus value
>> intgeneric_cpu_hotplug_test when expect cpu value is EMPTY.
>>
>> I can reproduce this easily by increasing the possible_cpus value in
>> cmdline. Merge your patch, this case still fails as below:
>> cpuset_hotplug 1 TINFO: CPUs are numbered continuously starting at 0
>> (0-3)
>> cpuset_hotplug 1 TINFO: Nodes are numbered continuously starting at 0
>> (0-3)
>> /opt/ltp/testcases/bin/cpuset_funcs.sh: line 179: 5676 Killed
>> /bin/cat /dev/zero > /dev/null 2>&1
>> cpuset_hotplug 1 TPASS: Cpuset vs CPU hotplug test succeeded.
>> /opt/ltp/testcases/bin/cpuset_funcs.sh: line 179: 5714 Killed
>> /bin/cat /dev/zero > /dev/null 2>&1
>> cpuset_hotplug 3 TPASS: Cpuset vs CPU hotplug test succeeded.
>> /opt/ltp/testcases/bin/cpuset_funcs.sh: line 179: 5750 Killed
>> /bin/cat /dev/zero > /dev/null 2>&1
>> cpuset_hotplug 5 TPASS: Cpuset vs CPU hotplug test succeeded.
>> cpuset_hotplug 7 TFAIL: task's cpu present list isn't expected(Result:
>> 0-7, Expect: 0-3).
>> /opt/ltp/testcases/bin/cpuset_funcs.sh: line 179: 5795 Killed
>> /bin/cat /dev/zero > /dev/null 2>&1
>> /opt/ltp/testcases/bin/cpuset_funcs.sh: line 179: 5846 Killed
>> /bin/cat /dev/zero > /dev/null 2>&1
>> cpuset_hotplug 9 TPASS: Cpuset vs CPU hotplug test succeeded.
>> /opt/ltp/testcases/bin/cpuset_funcs.sh: line 179: 5894 Killed
>> /bin/cat /dev/zero > /dev/null 2>&1
>> cpuset_hotplug 11 TPASS: Cpuset vs CPU hotplug test succeeded.
>>
>>
>> Also since we have use present value, we shoud adjust output to match
>> it. I modify this patch as below, What do you think about it?
>>
>> ---
>> a/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>
>> +++
>> b/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>
>> @@ -93,9 +93,7 @@ root_cpu_hotplug_test()
>>
>> root_cpus="`cat $CPUSET/cpuset.cpus`"
>>
>> - task_cpus="`cat /proc/$tst_pid/status | grep Cpus_allowed_list`"
>> - task_cpus="`echo $task_cpus | sed -e 's/Cpus_allowed_list: //'`"
>> -
>> + task_cpus="`cat /sys/devices/system/cpu/present`"
>> check_result "$root_cpus" "$expect_cpus"
>> ret=$?
>> if [ $ret -eq 0 ]
>> @@ -103,7 +101,7 @@ root_cpu_hotplug_test()
>> check_result "$task_cpus" "$expect_task_cpus"
>> ret=$?
>> if [ $ret -ne 0 ]; then
>> - tst_resm TFAIL "task's allowed list isn't
>> expected.(Result: $task_cpus, Expect: $expect_task_cpus)"
>> + tst_resm TFAIL "task's present list isn't
>> expected.(Result: $task_cpus, Expect: $expect_task_cpus)"
>> fi
>> else
>> tst_resm TFAIL "root group's cpus isn't
>> expected(Result: $root_cpus, Expect: $expect_cpus)."
>> @@ -166,7 +164,6 @@ general_cpu_hotplug_test()
>> sleep 1
>>
>> cpus="`cat $path/cpuset.cpus`"
>> -
>> task_cpus="`cat /proc/$tst_pid/status | grep Cpus_allowed_list`"
>> task_cpus="`echo $task_cpus | sed -e 's/Cpus_allowed_list: //'`"
>>
>> @@ -186,6 +183,7 @@ general_cpu_hotplug_test()
>> /bin/kill -s SIGKILL $tst_pid
>> return 1
>> fi
>> + task_cpus="`cat /sys/devices/system/cpu/present`"
>> fi
>>
>> check_result "$cpus" "$expect_cpus"
>> @@ -194,7 +192,7 @@ general_cpu_hotplug_test()
>> check_result $task_cpus $expect_task_cpus
>> ret=$?
>> if [ $ret -ne 0 ]; then
>> - tst_resm TFAIL "task's cpu allowed list isn't
>> expected(Result: $task_cpus, Expect: $expect_task_cpus)."
>> + tst_resm TFAIL "task's cpu present list isn't
>> expected(Result: $task_cpus, Expect: $expect_task_cpus)."
>> fi
>> else
>> if [ "$cpus" = "" ]; then
>>
>>
>> Best Regards
>> Yang XU
>>> Hi Samuel, Zou
>>>> Hi,
>>>>
>>>> A friendly reminder for the two patchs in:
>>>>
>>>> https://patchwork.ozlabs.org/project/ltp/patch/1617707717-63693-1-git-send-email-zou_wei@huawei.com/
>>>>
>>>>
>>>>
>>>>
>>>> https://patchwork.ozlabs.org/project/ltp/patch/1617701249-62196-1-git-send-email-zou_wei@huawei.com/
>>>>
>>>>
>>>>
>>>>
>>>> Can someone please review the patchs, comment, and if appropriate
>>>> commit
>>>> them?
>>>>
>>>> Regards,
>>>> Zou Wei
>>>>
>>>> On 2021/4/6 17:27, Zou Wei wrote:
>>>>> --------------------------
>>>>>
>>>>> 1. The method of obtaining $task_cpus from root_cpu_hotplug_test is
>>>>> incorrect, because the value of Cpus_allowed_list is related
>>>>> to /sys/devices/system/cpu/possible and
>>>>> /sys/devices/system/cpu/isolated.
>>>>>
>>>>> 2. If isolcpus is configured in cmdline, the value of
>>>>> Cpus_allowed_list is equal to /sys/devices/system/cpu/possible minus
>>>>> /sys/devices/system/cpu/isolated. In this case, $task_cpus is
>>>>> inconsistent
>>>>> with $expect_task_cpus, test will be failed.
>>>>>
>>>>> 3. Need to change the method of obtaining $task_cpu
>>>>> from /sys/devices/system/cpu/present.
>>> Thanks for your patch, I also met the same problem when
>>> /sys/devices/system/cpu/possible is not equal
>>> to/sys/devices/system/cpu/possible/present .
>>> Cpus_allowed_list: 0-511
>>> but my present cpu is 0-103
>>>
>>> Then I use possible_cpus==104 in /etc/defaut/grub, cpu_hotplug case then
>>> pass.
>>>
>>> According to kernel documentation[1] and kernel fs/proc/array code[2](It
>>> just print cpu mask instead of present cpu), So using
>>> /sys/devices/system/cpu/present is right instead of getting
>>> cpu_allow_list.
>>>
>>> possible: cpus that have been allocated resources and can be
>>> brought online if they are present.
>>>
>>> present: cpus that have been identified as being present in
>>> the system.
>>>
>>>
>>> Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>
>>>
>>> [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu
>>>
>>>
>>> [2]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/proc/array.c#n418
>>>
>>>
>>>
>>> ps:
>>> Also find a kernel documentation problem and have sent a patch to remove
>>> non-existed cpu-hotplug.txt in admin-guide/cputopology.rst.
>>>
>>>
>>> Best Regards
>>> Yang Xu
>>>>>
>>>>> 4. The description of cpu_present_mask:
>>>>> Bitmap of CPUs currently present in the system.
>>>>> Not all of them may be online. When physical hotplug is processed
>>>>> by the relevant subsystem (e.g ACPI) can change and new bit either be
>>>>> added or removed from the map depending on the event is
>>>>> hot-add/hot-remove. There are currently no locking rules as of now.
>>>>> Typical usage is to init topology during boot,
>>>>> at which time hotplug is disabled.
>>>>>
>>>>> Signed-off-by: Zou Wei <zou_wei@huawei.com>
>>>>> ---
>>>>> .../controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh | 3
>>>>> +--
>>>>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>>>>
>>>>> diff --git
>>>>> a/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>>>>
>>>>>
>>>>> b/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>>>>
>>>>>
>>>>>
>>>>> index 155e536..2c6993a 100755
>>>>> ---
>>>>> a/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>>>>
>>>>>
>>>>>
>>>>> +++
>>>>> b/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
>>>>>
>>>>>
>>>>>
>>>>> @@ -93,8 +93,7 @@ root_cpu_hotplug_test()
>>>>> root_cpus="`cat $CPUSET/cpuset.cpus`"
>>>>> - task_cpus="`cat /proc/$tst_pid/status | grep Cpus_allowed_list`"
>>>>> - task_cpus="`echo $task_cpus | sed -e 's/Cpus_allowed_list: //'`"
>>>>> + task_cpus="`cat /sys/devices/system/cpu/present`"
>>>>> check_result "$root_cpus" "$expect_cpus"
>>>>> ret=$?
>>>>>
>>>>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
