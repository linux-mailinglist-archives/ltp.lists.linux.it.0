Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 722BE37F528
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 12:00:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 98AEE3C335B
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 12:00:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3892F3C335B
 for <ltp@lists.linux.it>; Thu, 13 May 2021 12:00:36 +0200 (CEST)
Received: from esa6.fujitsucc.c3s2.iphmx.com (esa6.fujitsucc.c3s2.iphmx.com
 [68.232.159.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 448BD1A002E7
 for <ltp@lists.linux.it>; Thu, 13 May 2021 12:00:35 +0200 (CEST)
IronPort-SDR: Wq+cpVZW+Rs5pjrc3qhU6pXl2whyZFLAMaUWWvgRBdZnS6/+IFLy6pLefwr+N3KDHShen2olgE
 r8u1qLv3tAI/kUuIlgLLIB9VqWk+G4eiIyc3V3ERqoPZF3wOVmSm6EEoqgLJZAp0kdvbTa23rH
 5bMUC32emr65/VCKDiHnwnS5v8Yiz3k9JpVqKPj7Wz+3+YbbRL5aWG08M9PB8VpOIw0XKiw/Kw
 k++2N9fUUMIy/M8JTaefC+IOUBcws1op60PqNqOixfJVqMblSm8i655x+ztPx16Rs6j022sQxY
 ogU=
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="31381772"
X-IronPort-AV: E=Sophos;i="5.82,296,1613401200"; d="scan'208";a="31381772"
Received: from mail-os2jpn01lp2058.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 19:00:35 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWPNWly1yIB0pLo3mPo2a20KxISfMM6Vor8j1E8mrHNa8rG36m/CvI0cossdk6YBT6Fpyg6aVewJHHWu2UsNUa2lTIlr7sPT5DdsuaAy8fWg5ER1naX6OQB4D3HBIdRrCfSs2kdxV98ai+3jGf2ne7+lcBWkqKMv8qgN79SlAUFMIIZc/QGiOY6JkJ2ueVKs4CpLwNZXm7kXT9rG1mJX7hUTvZiOwpNGt0F1eFW4n6vAVUVZV3EwQjJWQeNpgdM73jYxZlcObd5a2cfBn5y02lO6MgJ8cd8w6uNLfNRCiyAM/ugXy/qQyDH4xpZmXO1zKLpoVAfJEIu+E3/RmJKLqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVtVmYG6yRihOwyQd32TtxedSmb19iWsEvTKIAgkwHY=;
 b=KJJRTmiYF+v3mHP2X5/MhZtvlzwoL99rOILS/RHXXNT9JY8Xog4GUFThycwdUnTwM39lrrygw5YEvOiib8JqqYBgPSxznXvg2OWcXGAo95GLQVo4lQEn2qSlREEHBDBEt2UHFxKypjDAXkvfNG1TJw1SpoHu13KqPQR23PAisLOxzPqmkV3fZTD3BvEG4xJF3YRfNZcEX9vQ76Lj49ZIoWo/7XXHQZ04pD0ihbL3GaZNWDvn/0J0V2b2aWiq0aKMPvvYyMgbROUwHUBKzpFUYq7Jt2uZZ5R/pYFIimuY8vakCFgmgNY9huZs43kx7iFn0Z8hs62rR+ItV/z5501ooA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVtVmYG6yRihOwyQd32TtxedSmb19iWsEvTKIAgkwHY=;
 b=MW7j7LOHGYyk3s8ZzeXmSQygoNMznlP0pSJ0JA+sGUDNohIBM4cB5rwN3duGFpX2zIdrnQjwExduvVI1MB0TkzBjCaQskRxnjUX/6O6Xx0z6tj8+xOUaBzCCAwtf6umHuRWz2+wEFkPOlmnc9m+el6Az1Om8sBW3pwWLW4psMbw=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB2943.jpnprd01.prod.outlook.com (2603:1096:404:80::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 13 May
 2021 10:00:31 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531%6]) with mapi id 15.20.4129.026; Thu, 13 May 2021
 10:00:31 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Martin Doucha <mdoucha@suse.cz>
Thread-Topic: [PATCH] syscalls/mallinfo01: Disable free fastbin blocks
Thread-Index: AQHXR9WT1jupSZB3yUWKoqkdu0VAtqrhHp8AgAAPegA=
Date: Thu, 13 May 2021 10:00:31 +0000
Message-ID: <609CF8E0.2030408@fujitsu.com>
References: <1620896054-26151-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <96c15b88-4251-5794-03e0-12bcc048fa5e@suse.cz>
In-Reply-To: <96c15b88-4251-5794-03e0-12bcc048fa5e@suse.cz>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fecd5391-62e9-4614-09bc-08d915f5f1ba
x-ms-traffictypediagnostic: TYAPR01MB2943:
x-microsoft-antispam-prvs: <TYAPR01MB2943D3AAA1394A6E18E61C7DFD519@TYAPR01MB2943.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YBkESgiGbfjZI9/krE721M0uuhuo7i+xUZKBn7ZCyQQga7oDeXdJsK7oMf72hahihlo47cPR5KiCY1EgS6lL6XOO7DUEJp+v41X+ARBDCgZOYgW8w3gMy7VglAwapN/ocI9zvyqHK/gWEr45APWD9Z834+mmSO8Q8bIf/15tzrKTqbJxPAAqjrMSiBTHdbd71ge035eGIiGn5qsI0e1x4A0LitTnS377MuyLXLthuiSnRwddYjlklYIn4WzRl5FfYJg4E61gdpC2omWeIfF4+zh7dJv+lUTf2RHnAC0DnRcSFxMJDUnruMHkH24BsNf3+egx4U41dWh3dhbVNYqlsoVbbwJyH4QaUY7xl12RpL302CFTZug0NV7/NeWAJI7LaWeIMGk8zfwYaUvRe6bWuoQMGJcI0gREVwir+ouHHZ/qxZnAFZ9ELxepyrc8Hr4QPQiFfiSzR0NZ6ALvJF9qtvvbOvOG+LCiQV/JSu723tMQQ/Z9TOqVFB02ZAbb0Hp0UrhWv2Urybj6BrNl2QUU/5OI03AR/dLJen5dYaXp4B66d67a3+sohXbv+mRS71657W5wFs4k5EImWMlP7NJ0NKe4Wgh0jqSkAf+mwLfCFMw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(66476007)(64756008)(66946007)(91956017)(66446008)(66556008)(316002)(54906003)(478600001)(186003)(71200400001)(38100700002)(6512007)(85182001)(36756003)(8936002)(87266011)(33656002)(4326008)(8676002)(83380400001)(6506007)(2616005)(86362001)(2906002)(26005)(122000001)(6916009)(5660300002)(76116006)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WHgzK1pjbVpWNXlnSXg3QjhKSkRxNTFjVENqR2JkWVZXKzdFRWU2anVsQ3dB?=
 =?utf-8?B?c0dYaTk5dk1iUFEwUXZLM1VNYjR1TnI5clk4WjkzZ3VTSTVlZThkSUNPMkVh?=
 =?utf-8?B?M25ZeFVEU2toU2J5NFRBYTBkZ3dQMVRWdTd3aXgwNlpoOERWUUFFRDZQWmx2?=
 =?utf-8?B?R1l0U1J5WGUxbzJ1R2V0MHZWS2JJNzNyVGloUWlOQitDN3JjclNQV25Wbk1E?=
 =?utf-8?B?N09mUVFWT1V0QU9ReEVmNGQxMHMyb1FlUHZxaTlhUFliaUp2d21tU0tKbXhw?=
 =?utf-8?B?bGM0REVNbW1FdWRnT0JDdWFJMmQ1WTc4ek0xbXB6YzRJOExWREZvaDR1NEZa?=
 =?utf-8?B?aGFPNlc0dDJpdmgxQ0h2SDJSV09Fam1nTDVRM2N1am56K2hzSEhhVnBBZ2t2?=
 =?utf-8?B?dGd5Q21WWkR1dWU1UkJhcjA1NExqV1NyTThLMHNoUVVMMDRxQnRDMnNYWDhh?=
 =?utf-8?B?Z0ROQ1FabWFJV3FQZ3ZqVTlvOXoxYVQvdzh5Y2J6ckp6eXJ3bFZnOERTKzZz?=
 =?utf-8?B?cjFTU1RrUkx3MGpWcmt2bG5xYTd1V0Z3K1NFaUJyREpJV0VNeUl3VGhDYWNI?=
 =?utf-8?B?Z04xSnpwNU9ta2dEbHU3b01SNjJsOG9ITFF5RXFnb01sQUdqaWE2bG5ka3NS?=
 =?utf-8?B?b0RvQ3JIVTlERldlR1d6TEhERzZXemZsSmRsdEdKSEZsTklCVlc1aVpPV3ln?=
 =?utf-8?B?eHhRNU8zZjNiNmpKSGpnaEhoZWNPQWgwZ2dhcXpDaGlnQS9aMFFDL0Q4YTkx?=
 =?utf-8?B?WXBZSWt4UDRuMWVYSXVGd3JYY3QwcjNraFB1Ujh4VmIzTGNYVTNZaUtreTBh?=
 =?utf-8?B?eitUeVkxcHNIMVY2SEdaNk1ZM3VCMkFDYVFRQVVDNzA4VEJXWFNpWU9yOXc4?=
 =?utf-8?B?YnJ5OU9wWUxRbk14andGVkI4d0ZRbG02bmY5ZjMxRlJ5Rlh0bytScHN5RVVU?=
 =?utf-8?B?Sm1SWVhERzBHc2dsa2tQZTZHVnhidkV4d1lZWlc5VjBmYjE1ZnMrWnQrMlBH?=
 =?utf-8?B?Ti84QWxuQTdiNXpuNXZNVElELzVOTlJCMllhcnBldW01VDBob21GUjZMSEIw?=
 =?utf-8?B?YnVlWSszVDV1dzZWRkN3cE9PYW1iNklBNlJjNlhxNmJmS3ZPRUlUeVRiT0h3?=
 =?utf-8?B?UDhNKys0RUM4VG9pVHpKRUFiQkpjY1hDMWYwWWVtS20yWEsvZ3FrQzd1SkZO?=
 =?utf-8?B?bmRpbkx6UkpCa3NyTEhuZDdMc3V4cElXSXRlcFp6bjM4UnNDTit1dERwdEdX?=
 =?utf-8?B?eVU5c1h6RVVSQ1MrTVZtOHJHZjFjMnFrTm93WmJCRzhFQkVncExWVGV1aEJn?=
 =?utf-8?B?UUdiYnF5MTBwQVJEbmxQNnNCV1hCZGY5cmxyQzdFWlMzeEErUU9QZjhVWUp1?=
 =?utf-8?B?cDd2QUNHRUVmS2taYjM3OVYwSmJ6YnF1V2x3K1dPSWVSbXlSaklNeHdnU2s1?=
 =?utf-8?B?ZUJ3OFUyMWFDa3RKQ05MYkdSSnFIbUJvZk0wODFacDhNTEp0bnF0eHBqaWNj?=
 =?utf-8?B?cWczNTg3SHhBSzZzbzU0ZUFtZjRCQXhEQ29nK215VEdGOHBQUlpvNkRJZTRK?=
 =?utf-8?B?S3VUbnVEaVgzMDJMemtpdnFKNjkvSlBMNC82N0VpUmxTY2Y1UWxkSzJRSGth?=
 =?utf-8?B?b1JUQTZ3bks1TW1KMk0yclFXQlMyKzdjK2RzUldFSW0wakJLbDNXZE8zUUs0?=
 =?utf-8?B?TGVPVDZnQTEveTdlZDlVYnE2WENza1J4TDg3UzdPcTlDWVB6ZysxTFdudG1M?=
 =?utf-8?Q?CkoXHYeaP9QJsdrc0PDDTyXUOh41Ltc/82h2/LO?=
x-ms-exchange-transport-forked: True
Content-ID: <A1B7459ECCEFFE4AB7EFBC2AE0907398@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fecd5391-62e9-4614-09bc-08d915f5f1ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2021 10:00:31.5162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wnHVm0ZHSHs8Wye/gIvm0ePNuQjqFCQJDrwO6+yKD8eeuNYsqx9Nm8K+1nF0tPGMHe0VmJoBoMp2cDYjBlBxLyMmjxmRz728XWsT7rJ8QUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2943
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/mallinfo01: Disable free fastbin blocks
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

Hi Martin
  I don't have a proper fix. So you can remove it from runtest file.

Best Regards
Yang Xu
> Hello,
>
> On 13. 05. 21 10:54, Yang Xu wrote:
>> When using malloc to allocate small space, it will use fastbin block firstly if
>> we have free fastbin free blocks, it is more quickly.
>> In here, we just test oldblks free chunks, it is the number of ordinary
>> (i.e. non-fastbin) free blocks. So use mallopt(M_MXFAST, 0) to disable
>> free fastbin block.
>>
>> Signed-off-by: Yang Xu<xuyang2018.jy@fujitsu.com>
>> ---
>>   testcases/kernel/syscalls/mallinfo/mallinfo01.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/testcases/kernel/syscalls/mallinfo/mallinfo01.c b/testcases/kernel/syscalls/mallinfo/mallinfo01.c
>> index 48fce0132..4e10e352e 100644
>> --- a/testcases/kernel/syscalls/mallinfo/mallinfo01.c
>> +++ b/testcases/kernel/syscalls/mallinfo/mallinfo01.c
>> @@ -64,6 +64,8 @@ static void setup(void)
>>   {
>>   	if (sizeof(info1.arena) != sizeof(int))
>>   		tst_res(TFAIL, "The member of mallinfo struct is not int");
>> +	if (mallopt(M_MXFAST, 0) == 0)
>> +		tst_res(TFAIL, "mallopt(M_MXFAST, 0) failed");
>>
>>   	info1 = mallinfo();
>>   	print_mallinfo("Start",&info1);
>>
>
> Sorry but this does not fix the problem. The failing subtest assumes that:
> - malloc() will never increase ordblks
> - free() will allways increase ordblks
>
> mallinfo01 is failing because both of these assumptions are wrong.
> Disabling fastbin block usage will not fix the failure.
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
