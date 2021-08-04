Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DDA3DF95A
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 03:45:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E71383C87E7
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 03:45:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8E12F3C1882
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 03:45:39 +0200 (CEST)
Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com
 [68.232.159.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9B5F21400439
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 03:45:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1628041539; x=1659577539;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sXJ/UTPJ3AWyghvPJ5O7K2k7xsc9u6dBFjBS0QN75AY=;
 b=DVfDzJbUGpH794gXeJOPkKgeRFOO5UK9sAC4w3XWYqO904zCexRRXE4n
 vrDVf/qQBKGSIdY3YqgR8OKDTxbCYaqP2BucrTRe5sk1f1KXoJ6QN+t5m
 X8vPwNL1EHdh+UelW6y9zNG8p0uEcWarVHJnSrC1QVu5qz3aPvFmgcy+k
 4gAx5Kb1BXFmz+C6YgpSfOEUbsMeFfJZUW9rYby/5aKma1qhpZTBSnqse
 TSH6PullDQlYjKmdzh9O/lz1dJfr/vbQV1DJLzsW2cUVjqentegxoiWTx
 sWWjaNrOEeC/ZKKYNMSbojGkLYrOGf6CCNTxAffNArVaNcoumHVgBlfg4 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="36046521"
X-IronPort-AV: E=Sophos;i="5.84,293,1620658800"; d="scan'208";a="36046521"
Received: from mail-pu1apc01lp2057.outbound.protection.outlook.com (HELO
 APC01-PU1-obe.outbound.protection.outlook.com) ([104.47.126.57])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2021 10:45:37 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrVH9+h/xDWYNZl7nj4u+BFIt1ochgaxAJfi1S89bZqPXmKASKB8iaGR/PUP2zmw/hHMkb1rATICtCIx0az4s/Res1CU0aVOvBv2XroDz82PSgj7dbynPa2FdJtbLgNo/Po9nFSTDQbMNioetW2Tmll0oYDSXgWsalk/yfgXu3efZdzKSi2Aq/uBt0A5LZRqEGnd1W1a1O22ywgUQdXTPayDl21ECz0KECiCxCCLgY/wsAcqd5dTFKhYGVLxKQsHsSkwVBQvQCLYhxvyy+svOslw/ryaIvVu5FTuJzzLXVRmjKsa09ojOay6vMIqQWiZIi/WSCsDc0OhyO4MO99sEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXJ/UTPJ3AWyghvPJ5O7K2k7xsc9u6dBFjBS0QN75AY=;
 b=R5GWZavh2C9TEVYk3PdI1IQR/oOlw9V0aJtIZhAAXS0zJpaMipIZhe/vhkxvIwrOApnq1r1AB04kT9GL3mJaolrgg+4SUfqRCXH0Mc1nqej4waxo4qXvLz5MlJ1oedvgVlcxss2Y3ClKoqMHhqdxO4ZroVLRUJQ5GA9XgrXwSWb3YWP3O7KQZ1OnS9POCcKom08ptSmxaI5Mc74cEiJYUPm8tPPW6XhbMh9gNsI90bPEWQWaNQjFL08h6kemNbIKT4Iab6o5lQIUDogFTm/oM3xXbXmBr88XNHfGmu3rlqc6p92shJrAjD8iE6anf44jnedPCRGRzKoT3gVwwUeXQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXJ/UTPJ3AWyghvPJ5O7K2k7xsc9u6dBFjBS0QN75AY=;
 b=aCbJo0hkNqi5Un5vkEXA5Q+OUmVFtiOC/23cktPTvJaWa6GrZTKTvrb82KfOTBs7Z9rwnUTCiWJZBNn+uO+WC8TxYRa/V+prj8yoUf+kCyCa6O8xlIPTO2CnUsrGxYet1JNcGg1u18RTa3g2wNG4dVsl9PqroVEpRvUOGzLhS+w=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB2682.jpnprd01.prod.outlook.com (2603:1096:404:78::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 01:45:32 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%4]) with mapi id 15.20.4373.027; Wed, 4 Aug 2021
 01:45:32 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>, Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH v2 2/2] msgget03: don't depend on existed shared
 resources
Thread-Index: AQHXdvMY8HjeAIx+30uV0khJgLWyVqtOr+6AgABId4CAAA0WgIAAADEAgAFK4QCAADzZgIAF27UAgAxN8AA=
Date: Wed, 4 Aug 2021 01:45:32 +0000
Message-ID: <6109F156.7090002@fujitsu.com>
References: <20210712075223.10682-1-aleksei.kodanev@bell-sw.com>
 <20210712075223.10682-2-aleksei.kodanev@bell-sw.com> <YPkkZ0Zq9DyHKBaT@pevik>
 <YPlhMeRRsNnemT05@yuki> <YPlsK8fsMI8T+H7c@pevik> <YPlsVD2gbIiX8JJk@yuki>
 <60FA81E4.3060709@fujitsu.com> <YPq0749ZnnGsAV2q@pevik>
 <60FF9EFA.308@fujitsu.com>
In-Reply-To: <60FF9EFA.308@fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17c7e896-7441-4f2b-5e30-08d956e98c25
x-ms-traffictypediagnostic: TY2PR01MB2682:
x-microsoft-antispam-prvs: <TY2PR01MB26826B5C2D833AB2004C0878FDF19@TY2PR01MB2682.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4w6PpY2mvwTZQSC+J/frGo2asJfyC/OPBIgRm9cK44QFQE33ZnbvO1q9YzpoHBZ7DdTFsESDBSfRoXGRrs+YJxh8OW3+OL5xBr7zhUuvv1McMSyyb2VWuSSajsVw4FSL+e9D+tGcBQ+ts6G0O+8yCTL7RvF765qGUnSAPeWKgHR/tkrP0f5rJVHfrGV//S4EalaBdipCY3b51J8YhNL40lbgnkamATPBLrARH58kAI9BZZjkjJTymwkDtvkyJopLwcBFRpBoEgbqMmqlPBDnx7KlQFBy3EQK/lVG7i3wPeMzpWIK+zOPinTpU9dPcdvUmnAWRvW1idZ9SB6riv8Kt6XguOybMaTsSNPH3D/cR1n6q0ycIq5R9T+gh0Z5Qw3VrCMFVaKJTbB+K0QMa7OjkurZkGjBYw6nbXo5O75HuYB0KzcBjQ54Gv88TnlD0/O3ToCReZWrO6GQ801lZQ7OooTxQzF3tzIbaDniVzui/0o9pviRqmQOPdt3QUvawgYdK89dGHESGDQSK4cg01HCt7FGzqFSRMzfuiSZNn+elDUVnA3gRAQroTur6d/+RUwrW9ikKKOufx807oXaFuVM0869Tr7HvOzWmEiB/fGUaN9lSd5WT1xZ9J3gXQr+UIzJ11EYPUI2NMjjb6EpxGauzJdOOnYu/CWELw7Y9nD+ssPd0AukkQJB3eRAvZMX4RYfsq9h5Hz3bclqc0THApPP2rtCO9xp1CmsZZ8eGD/ed87SjBbmbDVZ4hXBB3ZMgt4m3viW5wIw8gZwTIt4JhBshNe59N60yR5Xy838S9f5LXaNr7kS9sM6w5w+8APaxkl9tFNgFkfsVXBsuu6jSl8uTw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(186003)(2616005)(85182001)(91956017)(76116006)(316002)(66556008)(66476007)(66946007)(110136005)(2906002)(33656002)(6486002)(4326008)(71200400001)(6512007)(64756008)(66446008)(86362001)(122000001)(6506007)(36756003)(966005)(87266011)(478600001)(38070700005)(26005)(5660300002)(8936002)(38100700002)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?RWplTGRMdGRMbFl1MXlMeFpvTjB2MHVSeHZxdFliQ0w5NnJMZldyTGp5Qmph?=
 =?gb2312?B?TFk1R1VsWDJkSlY1NmUxUE45TVJabU92eVFFamtqaUs0VDJWamQ4Z3RVRThO?=
 =?gb2312?B?aWc3Yzh0WEQrQ0pZa2duMlNWWDBmSnlqZGI3SEdaelk5WGw5VWFKTVZuQ2hJ?=
 =?gb2312?B?QkVDTlNGb3I5Tnh0d05rOWVUYXlCM3R1ZWUyeTV0aTJrblc0c1pyNERTSzlR?=
 =?gb2312?B?UWtwNnp0Y0tRVHRjNitLVDgrbU5GWnRpUDFxb3htd3JscEkwNWtxc3JDZ3Nq?=
 =?gb2312?B?VEN3dXhQYTNOYk03ZkZnSFB1b3FITmorK1hRYVNBd2Z6UmpIMW9uU0plNHF2?=
 =?gb2312?B?VkxIeUh1YWxZOVVLTDlhOFd5ME5Zd1l3TnYxckRWakZXVk40VENyZXhRNkU1?=
 =?gb2312?B?Q3p4UzdHSHRsd1J5dkdGaDhUbTNXSFRhU0pLemJGRjhxLzBQbTdnNW1IMlVG?=
 =?gb2312?B?ZWs2b1RyNERRdzIyaHE4MGY3bC9oaGFldkp4ZEJWRzBFZmZYTVcyQ1d3bFpT?=
 =?gb2312?B?cnhsOHNaQ2NtUGZEZ1QxNDYrTEczcmdteXNTcGwrSFcySFlZdHI3WXBtZ3NE?=
 =?gb2312?B?Nmd2MmZjNW8yc0c3TzJWa1RsNHBpbmdRTkpuMWlpRlRCOVZIR2JseElWNkZN?=
 =?gb2312?B?ZmpqbHZuUGUxVmlBU3B1L3lCVGVRZURJRGEvcVlobWd3eVJNZ1FmZHZMN2Ft?=
 =?gb2312?B?dHIvaGR3eWs2c3hnQUpwU2lmQTNPZzJ2S2pVU1BEVytmTVhzU20yZy9McWc5?=
 =?gb2312?B?VmQ4Q0wyMU42MzVIUjMrTXI5Zi90Y3JPcUN5ckxLZzU5RHdPdjQvbllJK2wy?=
 =?gb2312?B?MzRHRTZ3YTMwRjQzY1pRbG51d0JuUzFZVUhUc01Idk11ZTNkUHptNk5IWWRr?=
 =?gb2312?B?YnVEc2xlRzJVUFV5TWxLSExUOENJa0EzdHdwd1E1QnYrVHdxZkZQenNLcGlu?=
 =?gb2312?B?WElsU3ZWWVN0bnpydVdCVzBVOTNxZVRERk5hQmljS3JwdEowMVZiVi9FN1Zn?=
 =?gb2312?B?ZmI0VkxraXpUQ1daRkpKSHI4MVdmOElFenl5eWpNRzdaYkdoT25uR2ZMalAr?=
 =?gb2312?B?cEJmMkg3MS92ME5SQnpMTGRuWWpjTThkNnJoWTdSaUtrTUEyNGppYTUxTVVY?=
 =?gb2312?B?UmFpZzVRVUtuOWxXUmZTaXBsTHlPOUtoSzkvK1dqcEI5WVh3OUd6RDU5Q05x?=
 =?gb2312?B?UXpsTFpac1plZkM2SzczbnVldnc0dnJjb2NaR01XejdKQ3NrVDVpdk5ndm1w?=
 =?gb2312?B?b3hDakk4QUNMVEtTMFRabTRrRGdLM3duSGZENXBpUnlhYWREakNKeURtL1JJ?=
 =?gb2312?B?N1RDMDJEc2xkVFpIek9uRTh0RGFqUWlWKzVQNmRyeXNUYnhXZTZBdFVlTHRI?=
 =?gb2312?B?VWVWa05Vc2dEMGE4RU5naXdqZ0xlbEFJUXhsUEF6cVBPUWhSK05WMW1wQXBE?=
 =?gb2312?B?SkZwL0VGZEFEait3Q2VIZ0RwR0UybXltbk54VUFBSlFQOVJ6TGdDZzByRE9l?=
 =?gb2312?B?U3B1Ky96bjZsK2kwOFhwK0RiTzdJMW1qQ1RVVHd2dTBJWWdvNTZ2VmM1aVNB?=
 =?gb2312?B?Y0lkc0E5VUVkbjMwOUNhMlFVSkdlenVVbmUvM2M0UmRvVkJiNEpSajl4WDIy?=
 =?gb2312?B?WXFrZkUyYkVRYVl1dmY2QTVaMThtUDhaeTRFK3ZDRTRNNHJZeHROOWQ1QVc2?=
 =?gb2312?B?azJ0eC95c1NMRXZjSitydXBDcXpiZDVTWWsvaFJTZ1IxbWNVeTI2dXZVdmow?=
 =?gb2312?B?azhQZjY2VmtRSmRuby9ldWp6aFdNOWprS2ZJZkdQRWtxVVVtM2RYcXA4NUo3?=
 =?gb2312?B?enhuazM2NkIva1FsZ0I2QT09?=
x-ms-exchange-transport-forked: True
Content-ID: <4A405360835A5A4E94EE119674E4862E@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c7e896-7441-4f2b-5e30-08d956e98c25
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2021 01:45:32.7317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qCN2iNljyHiUgQk14Wd/AZeSoaWekgX6CXjECdfmYrazzgaKcF1PolLvw6ldJ5jS6bQHNqMLX4Ke6+p6wabs/xY2ci5PipRW3jxmJ8PzqVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2682
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] msgget03: don't depend on existed shared
 resources
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

Hi Cyril, Petr
> Hi Petr
>> Hi all,
>>
>>> Hi Cyril, Petr
>>>> Hi!
>>>>>> I think that we allready discussed this in another thread:
>>
>>>>>> https://lists.linux.it/pipermail/ltp/2021-July/023831.html
>>
>>>>> Thanks, I forgot this. In that case my approach (not using<=, but
>>>>> count
>>>>> segments in /proc/sysvipc/shm before testing) might be more precise.
>>>>> But no strong feeling about that, both solutions fix the test,
>>>>> let's chose one
>>>>> and merge.
>>
>>>> As I said previously, there are many SysV IPC tests that do expect that
>>>> nobody will add/remove IPC shm/queue/semaphores during the testrun and
>>>> some of the testcases cannot even be implemented without this
>>>> expectation.
>>
>>>> Hence I wouldn't complicate the test here and just count how many
>>>> segments are there at the start and be done with it.
>>> Agree.
>>
>>> A possible solution(alter get_used_queues api in new ipc lib and add
>>> file parametrers, so we can use this api for msgget03) I have mentioned
>>> in the previous email, the url as below:
>>> https://lists.linux.it/pipermail/ltp/2021-July/023653.html
>> LGTM. Or use /proc/sysvipc/shm instead of /proc/sysvipc/msg in
>> get_used_queues()
>> as you noted get_used_queues() has not been used yet.
> I rename get_used_queues to get_used_sysvipc_cnt. see attached patch.
Any idea about the attached patch(it was in previous eamil)?

ps:more and more people sent patch to fix this problme, I don't want to 
see many patches for this problem. Let's choose a solution to fix this 
problem.

Best Regards
Yang Xu
>>
>> BTW searching where get_used_queues() appeared, I see [LTP] [PATCH v3
>> 1/4]
>> syscalls/ipc: add newipc library for new API [1], but if I'm not mistaken
>> get_used_queues() was not used even there, maybe it was in some previous
>> versions.
> Yes, no new api case use GET_USED_QUEUES api.
>>
>> Kind regards,
>> Petr
>>
>> [1] https://lists.linux.it/pipermail/ltp/2016-December/003239.html
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
