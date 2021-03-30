Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEDD34DDF8
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 04:05:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 398A73C8CFD
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 04:05:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2237F3C0CB5
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 04:05:55 +0200 (CEST)
Received: from esa11.fujitsucc.c3s2.iphmx.com (esa11.fujitsucc.c3s2.iphmx.com
 [216.71.156.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6FC9A60047C
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 04:05:54 +0200 (CEST)
IronPort-SDR: eqKdOERIL5NWS9HbBFMHZVs0GAWFDwbHVlD93Y6VoDFJTrw2EPJ/BcrfKT5FjQb4fvOpFV/ajo
 JjYtp+SfQurZKN4UAM9EdXCiDkGBNyZ501jbf8WmslwqDna4RqlXTyjFmm71WVbWTJm+u4h5VG
 SoNbaclI/H3iUESTx2wxYkhZcTvxrCaFy5fhUmOe4pB/bSsXbshv9cDXIS62XDNe1+LLhvgd20
 /02qKpKaZE2pUOusaDYlbfawCI5Rjbu39TbHq1YwN8ftiw89LWPRuVdv/39vfj0iINwvfgZ2Sk
 M8s=
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="28867553"
X-IronPort-AV: E=Sophos;i="5.81,289,1610377200"; d="scan'208";a="28867553"
Received: from mail-pu1apc01lp2059.outbound.protection.outlook.com (HELO
 APC01-PU1-obe.outbound.protection.outlook.com) ([104.47.126.59])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 11:05:52 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWhy1Pqe8Z9C1ywzG6zefoUcYyAa2bu0xg2YkYb8QDY5Ac4dMkXX+b/xlhyTiO+zNs31c6gUDZXhAYN2tQqHQ9PRkEayi0a8NwjXSaayDE5DrVOISmgemZ8wkpvFy+LRqY9UriB/C7S0s2OycfYqXkdhcG18kvkMAZaj+RMwLdrVeJcUhxahdjt9J1/PRDftg6inepT5Bnufj8EMUjQri0t8uAdwmcTlB992zs1dL5FGeZ6f30VfWS0S02xgQglD/bClfX6XIQFnq/TcfAW3HuCnemaZaLCBDZTMjih75m5iiqbgJvXH5pGZsrm5CGrHtoI6vJSCbeaS5vrQ2QbRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaHlOHBtP61gxuSLeMy4/TEld4fNOf4pp0rKq39Ie9A=;
 b=cCHKlPPGxN6vDQgjEoeW3bF3quw0xai7uMXh7fDljr13vQe3mjU5fPxyzph2c9cbHLSEEXOdAUmGZAzx5Sngqkzs4TOlPIvJao4cDjA6Xg4+oxD730euQGQjjMZIgFwtiRLrcUvQf6UncZXLuRqrdaKQO6EWhGx6h9oF79c/5nG6vwerOzhIMBoRvGbcxoP4aMxeubBpWfGvwENkjhltQO+daZ2vRjVhrrE7eT3D+VEB8aF1Ci0/nIlVPPu3r8ktqpOQtObR2o/LROIFrMTDn+XINbiFX8EQakM5pgMOVAmOD9j71RwjYiU6bL1x43EPAUjBuRLDR1WPWRu5TtVIXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaHlOHBtP61gxuSLeMy4/TEld4fNOf4pp0rKq39Ie9A=;
 b=d6mbq3LInbqRfsSTXGqHD7tlbOCxVK67bA4s/wsLA/DfU4TyU3sEQdyYAJiVAivnYhD7ZDghgqS5xq3BJfuICN59p6h4LVqHG14J5fQJ1qA6GxcMqVjJ83kqAF6pTACrtPbsirAZDoagsq8V32d2U3t/VBnRQrzuII+CplvdIkE=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB4203.jpnprd01.prod.outlook.com (2603:1096:404:db::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Tue, 30 Mar
 2021 02:05:48 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 02:05:48 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: zhaogongyi <zhaogongyi@huawei.com>
Thread-Topic: [LTP] [PATCH] syscalls/shmctl04: Add kernel version requestions
Thread-Index: AdclCByf6oZyis7MRiGNj+RIFBjtDAAARxCA
Date: Tue, 30 Mar 2021 02:05:48 +0000
Message-ID: <60628785.7050102@fujitsu.com>
References: <F3D3F6AC3820BB4C9FCA340DB5C32CB40389E550@dggeml531-mbx.china.huawei.com>
In-Reply-To: <F3D3F6AC3820BB4C9FCA340DB5C32CB40389E550@dggeml531-mbx.china.huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 139a8225-3515-46ff-1a0a-08d8f320567e
x-ms-traffictypediagnostic: TY2PR01MB4203:
x-microsoft-antispam-prvs: <TY2PR01MB4203D373FAD8646EEF6DB915FD7D9@TY2PR01MB4203.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /K0nONgmEsqzOPZ18OVHH1DfUoeRaaOMZRMZahJT89TijJmZTgaCyGFwaQYMFjj41euE2QNb2P9MaistJFkmd567vX4r1BfAywb8ZtFSCdNR0LDgsQ+F3hcY+bKZvGcQFiG/5ff3DNeZ7Xv7UIudzZrzYH9ki4Pn8ctW1lrUwiZBHZcQiwVhQz9pjshLKU32C4ygb2PAecYIe4tVDa1warVLU2sgBPyIH9fawVE0c7nI9jasN/TL/019kju8NvcJStCpaHwSnrzul/nrZWhkfDNTdt8A85gjsWrbYe1Feinc6+zN5XuPN4LutmyXTruqsroyeq6eYtBZrM1wUJBs1dssYL4YSzYyEThQpqBmtDKP6UN0jC9g6lqqLr8IaV4K3Q5D2l6xVdzyp3JWuxEOOAZa41FZvjPoWmJ1iXaxTep2moa8Xl+lQ5SPMRXiD+Uljc1aCnL7kFqpNm8hKIvUOt6JT810VeB3KqYTHiccJX5E0CfMl3X3txQq0a7kE4H16KlNtA48QhQITXyWTmht7xkdJ6SNVVDG0vQ6CMeg8/QApuDhdyQbxlW6H3aHss2RnaePktVLFSsWuppwJE/9oticvouVAutpo5zuXjSLcevLQjy5DbYPTx4VcfyxAxHEJnQmLBPcD9Wm0A2KXi2gehDld7UENGsMH+bJPdm+5vh4nu7jUbaQwUFSpgdZuMZT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(83380400001)(8936002)(38100700001)(4326008)(478600001)(316002)(6512007)(2906002)(2616005)(8676002)(85182001)(6506007)(71200400001)(87266011)(26005)(36756003)(86362001)(5660300002)(66556008)(6486002)(64756008)(66446008)(91956017)(76116006)(6916009)(66946007)(66476007)(186003)(62816006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?RjRUdGJUbEZVV1JqeWs5UCtPTmFpcS9EZ1l6UjNVWXIyZHFBS3JBdHR2TDA2?=
 =?gb2312?B?YlJBNzRpZWpBcDVqUDROcE9uRHE3dHczdm5ISlkyOFl6cFBnWStGQk4rMXRr?=
 =?gb2312?B?Z0cvU1VaSVFXVGJqakU5RTRxT3lBcHdvS0JOeFJ5UlVrSHArbEtnUnpsTExj?=
 =?gb2312?B?MW1WKzlFTVZDK1RSRTEzbU5MdWhmYTNKYUx0ZjZNQTRHVnRxeVhncnF5L2Mx?=
 =?gb2312?B?bkNhK01tdVh2TmFyVllnT29oV3IxNDNCQmdldnVhTXIwVnNMV2JyaFFJUitr?=
 =?gb2312?B?K1ZNNmM3a0dlMk42dXlGNEVYcW16bkovVzlMM0dRWFI1SmZ4YnZxR1hPQWJC?=
 =?gb2312?B?VTFJY04wWDI2b0Z2T25nOS9ibVRpRy8zWEpueHV0Z3FMTUJITy8xMGVyeHcv?=
 =?gb2312?B?NHdDNDVBck01dFUxMmZFR2c5eHVmR0F4dklXM0U5WS9mOUgvKzZxcmN4Yk9K?=
 =?gb2312?B?cUQ2QUZXMmlrRU1lTGtXTCtDMzlEdDFrOEN2YXBvOG45V3l1cThSYUx5ZWdw?=
 =?gb2312?B?UTMySm5VRklFak1PWXRuWHBvcTJYQXRrK2w1UVZFaU5SL09keDI5aFVSUDNG?=
 =?gb2312?B?YXp5ekhwYnZvR05lWW9CNk1ub2p6cXcxNjlYaFVKRkpZbHZ4S0dmYWVkeWFX?=
 =?gb2312?B?enZXQXF4c0k0MEFJWTYxUWtiTTl3TDR1di9SSXdNV3FlQVExZ2RWcnNVbXQx?=
 =?gb2312?B?TjhvYmQxNGJXUjQra01VRmdVSFdXSEp6OEdBTDdEb1d6a1dLRzdZWGFtY1dP?=
 =?gb2312?B?dWhvdCtJcGtKZUViL2NldEd5eGU5MTgvZVlob3Brd0cvTWlZVFdub25hSk5h?=
 =?gb2312?B?L2pDUzFkRm9salY2Ti9uMG5RcHdXMXYyYzEzTk5YelVmM2VEYm9sVVdrUSt3?=
 =?gb2312?B?V2IrelZFbEtvTmRSakdiV3FGbHJiUklLMENMUUxvMzNOdDFPL091RzgzZWhH?=
 =?gb2312?B?SkhVdkMrZWV6UTVUVndVbGdMbkV0ejhYWDVTUGlDU1hTSDdUOUZsSHZqamhh?=
 =?gb2312?B?c3hsaWhKTUpxbEJFWlVGMk1vbGZmblFWVk5RTjFITlJUeUNWWE9rZzZWa3J5?=
 =?gb2312?B?d2I1c3VkM21WV1RsZEt2QVd0V1cyTEFBYzhqYjdLeDF4OGdFcTI4NnZKRHAx?=
 =?gb2312?B?Z0l2L2FsQkNjM2V4Q2xLb0cxdnRRLytBUHVDS0JqcmNXNnA5cFJOT21aOXpv?=
 =?gb2312?B?QytuRWEvTVBmSG43dVFNQmpDQkMzOG44S1pGai9JMWUwZHU5cm1vaHBlK3NL?=
 =?gb2312?B?ZUJZdXk4a0xDU2MvQS93TWxoMDUvRlZkMDZlaWxLaUlzcVFrU0tJa25idWxW?=
 =?gb2312?B?Rjk2VmNFZVg2NVI2UTRpL0pJeVhaaVRJRVRKcGxSZWwrNTVRQUxTV0d2K05v?=
 =?gb2312?B?ZVc2M2tFekE0VlZqMjZOakJ0RW1TbWZlN09xcFhBN1JGbEdBYXFFZm1KeUIv?=
 =?gb2312?B?eU9QdHBKVW5ySFJYdkN6cUZYQWZDUWlsSkszWDhlWDk5dDdrbERtUEV6ZEFq?=
 =?gb2312?B?cnZ1LzdOcEMxaThxdzFXN3haS2xvQmRBcUozdXhPNDdZUTg3ZVNxQ2s3eGs0?=
 =?gb2312?B?UDhmV1QvdjdjSnhvNjRBWGRPb1Y3bG9iVWlqWmFvcktaN3Rud0hYa2VMRVoz?=
 =?gb2312?B?MkNqMzJ5ZUoxZzB0QUVzMk1wZGo0aWxMMVhvR0puUDlmYkJoTUZBNVluRmps?=
 =?gb2312?B?eHg4SHc5bTFwUW1TRUdMc05BUUd3d0ZmSi95dzNNc3RxeXpDRENQUm0yVllh?=
 =?gb2312?Q?PBvxtKtCYssIuzIttUbabIUzxJHdfJKrf3JxeUt?=
x-ms-exchange-transport-forked: True
Content-ID: <9CA5B8E00FF9664AA098C22B3660867C@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 139a8225-3515-46ff-1a0a-08d8f320567e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2021 02:05:48.7686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BIT0fnIYydaf3rYIO2nv6EUGnhwcpZSeywGHnzpr84KKztBfbJ8rry/HqUAc8iPcSJDpQ1VjV1K62z+AO+BAI3SLQPT6sFclGheaON9ac8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4203
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
> Hi Xu,
>
> It looks good to me.
>
> On the other hand, msgctl06.c, semctl09.c have the same problem for MSG_STAT_ANY and SEM_STAT_ANY,  we can also fix them similarly?
Yes. We can fix them similarly.
>
> Thanks!
>
> Best Regards,
> Gongyi
>
>>
>> Hi Gongyi
>>> SHM_STAT_ANY is imported to linux in v4.17.
>>>
>>> Signed-off-by: Zhao Gongyi<zhaogongyi@huawei.com>
>>> ---
>>>    testcases/kernel/syscalls/ipc/shmctl/shmctl04.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
>>> b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
>>> index 9e8ec4199..18ac8ba0a 100644
>>> --- a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
>>> +++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
>>> @@ -168,6 +168,7 @@ static void cleanup(void)
>>>    }
>>>
>>>    static struct tst_test test = {
>>> +	.min_kver = "4.17",
>> Some linux distribution such as centos7.8 has backported this feature, so
>> we should call SHM_STAT_ANY directly to detect whether kernel supports
>> SHM_STAT_ANY instead of using min_kver.
>>
>> code as below:
>> --- a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
>> +++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
>> @@ -155,10 +155,19 @@ static void verify_shminfo(unsigned int n)
>>    static void setup(void)
>>    {
>>           struct passwd *ltpuser = SAFE_GETPWNAM("nobody");
>> +       struct shmid_ds temp_ds;
>>           nobody_uid = ltpuser->pw_uid;
>>           root_uid = 0;
>>
>>           shm_id = SAFE_SHMGET(IPC_PRIVATE, SHM_SIZE, IPC_CREAT |
>> SHM_RW);
>> +       TEST(shmctl(shm_id, SHM_STAT_ANY,&temp_ds));
>> +       if (TST_RET == -1) {
>> +               if (TST_ERR == EINVAL)
>> +                       tst_brk(TCONF, "kernel doesn't support
>> SHM_STAT_ANY");
>> +               else
>> +                       tst_brk(TBROK | TTERRNO,
>> +                               "Current environment doesn't permit
>> SHM_STAT_ANY");
>> +       }
>>    }
>>
>>
>> Also, On your environment, does semctl09.c/msgctl06.c have the same
>> problem?
>>
>>>    	.setup = setup,
>>>    	.cleanup = cleanup,
>>>    	.test = verify_shminfo,
>>> --
>>> 2.17.1
>>>
>>>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
