Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FFD359BEF
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 12:25:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 159B03C7E84
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 12:25:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 60DBC3C1D85
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 12:25:13 +0200 (CEST)
Received: from esa9.fujitsucc.c3s2.iphmx.com (esa9.fujitsucc.c3s2.iphmx.com
 [68.232.159.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 42BC01A01149
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 12:25:11 +0200 (CEST)
IronPort-SDR: iHPfxLkwQWTA0V5quajWbO/UkLjJu9dVIpnlGT9RYsMTh+p7btrYorl2LLZQbfLfNH1PIKDXbp
 WT8NF8E00ZPa72BRlenj8YOEb236AcUBQRq0SdLCoN2tHSRUQtR7FZuj88MHF2yLgMA6qdUkyY
 6krpA9xBJqE+jYxOZ56FzUUy34ZgjY3isu0VwCu6o7tZl9YCJPdlQWLiV37gb/quS96TB9IM2F
 qHe1bBM3pQ+RszdtMO1FtzYQ0IuhACwIZeQCNfbIY4+jDsatRYAs6M/o/BHh9NgLwI2rWfShvw
 9LU=
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="29421772"
X-IronPort-AV: E=Sophos;i="5.82,209,1613401200"; d="scan'208";a="29421772"
Received: from mail-ty1jpn01lp2050.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.50])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 19:25:10 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxdZjFXdbsQDDC/4hjSNTG4hG4NpMpjULU45o5eXz/QVbD/vABAfgDfJIUgxiGoliYbXwwRejQjP68equm3vK7YSOwfDi4vsGyEsiEm2gSVuk9qEPjZngOazTfQN/EvVAungsdVeX+husi4k8Zm+hM11aGFnYU4SI9LPwG0UhMC6vYgpVFYiZmgIR5xZ3KSHkzljMNpaluYUeWP6OijZhgROcN0lCSkqwV0U1ssjw6nY8ieMnG7HPuNvy8Cb8lOzKI3LJ0AM1U/ILOxjhwD1KWUYCIwECQDm/KOvUJxrK+EAJcJwKNYWq9ZcbMaLeOvXtPg54FFpBZ/vbU/em7t2oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bp+CO1uF9TkXD+rP+49/SYcgwPdzCfjN2QJY+icYHC4=;
 b=IB8lSjE73ayvvd5CeGH/9kOUZjBeQses1ItpnqDDr8bl9HsUdAn6oYTFulyZ7Al34mNg35gemwvwJ7yFcKYAFGElmnuIL9DScNV18Sab4oKY6HcK+3BdAlQs1ck9DLPGGv2CvYns7QN1qkusohue3n5HRNzz90+CJ/BO6VANI6sxYdjA4ocAjww6tl3pKbI4xO6BkIhihcgnzltu4RcAN1Ri+4bSNm3pU5tt4Re98Ti0JdyTYP4LVXxBqhry7jATyPB0+PMnJfqB2yXCdsbiqBognxe83QFAIq3uN1Lk/q5Spp0BDJjGaJk4IoUERF0vBXWy0HdaFmPMGtli+F0HzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bp+CO1uF9TkXD+rP+49/SYcgwPdzCfjN2QJY+icYHC4=;
 b=LQsSuwD+maN8p9lESYBZvwveVovscHtniYclG/6ruhZXRVySS7Nux86YxhUZoAviPoJ+TabXbcMQtKwiQVZTsouHpeaVRxfZ//0dRmWMimFOXAxbeDKzKc+xTVcXOE0xMSLVClWRKd1QnrJLtsHRj4mbzPEXteTriH+lu8XD6S4=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY1PR01MB1564.jpnprd01.prod.outlook.com (2603:1096:403:4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Fri, 9 Apr
 2021 10:25:07 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.4020.018; Fri, 9 Apr 2021
 10:25:07 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH 3/3] syscalls/semctl01: Convert into new api
Thread-Index: AQHXH9Ndhz7aaDhWMkm01hZD+qhM2qqpaIEAgACfOgCAAH3UgIABeCeAgAAT+wCAABS2AA==
Date: Fri, 9 Apr 2021 10:25:07 +0000
Message-ID: <607039A2.3010705@fujitsu.com>
References: <1616497037-19158-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1616497037-19158-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <46e7a46a-f3d2-078d-1126-5a8679cea7be@oracle.com>
 <606E7268.8000603@fujitsu.com> <YG7b9c8b9DBpz3QS@yuki>
 <6070177F.8060404@fujitsu.com> <YHAoQooWArsl2rgD@yuki>
In-Reply-To: <YHAoQooWArsl2rgD@yuki>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4671958f-01dc-4d88-4be1-08d8fb41bf9d
x-ms-traffictypediagnostic: TY1PR01MB1564:
x-microsoft-antispam-prvs: <TY1PR01MB1564DFEEB2A45F45885D603AFD739@TY1PR01MB1564.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FPx6qyh83fW4IPBJehQVGtWn2CMqimaq1pnD44LCoFjUajEvs8fmeOHFZ+0DacUy6XIQJRzNFcvQK7JVZeoEgDXqYEn7iVnxklK5q6PBDII1XHEVVYSGYSQs2v/7W4TCZarM1RgtoWSObi3JABo+CQg3ViW7Sl68j7Sjh3uDO/IN1BnzUHxJWFvNua9PbN+9XT8LrWohqLY9lPpA0w9VTq5Uv5Ei02MZEqAs+9WaT/YmZdlJjq1w1SUlLTZdTIR5HF9k1koOIaSZ4910i6IMv8442b1Jn6TKc9qgNfpIFHA4DnirnmPVknfHnT1fkSO4zXn4LrRLVMfU+LLpG39x+XcSMptl4bgsiZs7QCiQciLbkgl2eLGuUuK4/2T0e7gREilZNhkRvyTn6luhVyQ39FjLThPalDFWlnIFQptRXTgmgI1QWEKAL3w/vvIUbxQJOZLaMjsOVKcMd3n6kQun3wIaC/Qc5ODvkN0kcH3jxQoCkj4oLKz+Wt0v8osswFdXw6CvgsmqNievydlZv0xJXQBGZZko5wScNEcfCphAdXBp2HKdZuOsWRxS0dseyWeN2MoA3+WqPFj2WtGnkASN9yszmOOZnqxKqT6eJunQraybhtA7Qz8WLhAMh1T5YtJN9IU7z2j8/74Bm108JKSp5YFuTr11IHZWAu3+etFHg7Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(6512007)(316002)(71200400001)(6486002)(36756003)(87266011)(66556008)(478600001)(66446008)(6916009)(64756008)(83380400001)(86362001)(66946007)(8676002)(2906002)(54906003)(5660300002)(66476007)(2616005)(4326008)(6506007)(186003)(91956017)(33656002)(76116006)(38100700001)(8936002)(85182001)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?WC8zb1hwcmc0b1hDVFVocFRKWG1mMzNUemM0cEE3d204VjB5NWhmVzBPRVRl?=
 =?gb2312?B?OGRUcGwxYkk4VjBNUyszRnVhMWtIS3lMTWNjc1lqV2FMZGF4QmpLaDlRekRG?=
 =?gb2312?B?MnFpaW9vM0c5b3dkUDYyMVp5MmVvRlpyNjlGRzZ0dVkvc3lOKzBseHJkb3Nq?=
 =?gb2312?B?bittWlk2c0hlN1daWlpGeUU0VHBIK0Erak9TVWRuVEhPTE56d2ptNm8vVzRT?=
 =?gb2312?B?bGl1NHN0OGJUMnRwczRNSUpPNFFoRnBoeTc2MjJTQVFVdVN5YWtxSXN4MTdn?=
 =?gb2312?B?MjZHK3UrbzlBZEliNEp0RHA2d0ZyZDFiZXhjYzZTbzdkQldOa2I1SU50ekJl?=
 =?gb2312?B?SllianI1ZjBCVkhRRVA4NmJpajhVd3cydy9aYjYzcExhVHFJaExUWWtuNkJj?=
 =?gb2312?B?U0I2MUkxREFvb3lLbzNRVElLUzZBRzMvYk8yNlRXMjNuRmJiQ3AvOGw1SEZo?=
 =?gb2312?B?ZHFxVHZaVmVYVCtIM2FhM1FCZ3lpanlsY1hCVE8zWFlxTC9oMVhYOFZsWXpi?=
 =?gb2312?B?RXRtai9yVDI0Wm9JUittOEFLZjJPTGluZWhBYXp6M2pSU1haWHJFQlFMZXVp?=
 =?gb2312?B?MUtiNU5lOGxXZVU5N3dLVHF1NU9Oek9uV1pmZExZeitVVTVOcTZXZ2FRWE9E?=
 =?gb2312?B?R2NHakRCNGpPbG9SQWZHTS84aVVGVEVZSGlXUHY0aWtNbEFVRTRhaWE1b3Nt?=
 =?gb2312?B?Yi9GOGF5UWt1MEtIbnZmSG81Y2FmTXQxRXNHQlFvVkdlbVZTTmxzN3FkMHFI?=
 =?gb2312?B?UUJ0ZEl4aXpuTWdZWHplWlcvRlB4SkZ6M2JaMHFKUXQ1OURZU0J5VXd2cUhG?=
 =?gb2312?B?MXNjSXg3TUVwRnZqSjZWMWMwaEpWUGJXeThLbkMyVGphanlxMU1uVzJXZDNy?=
 =?gb2312?B?Wm5yZFd1WGlTdWZpeDdraVBrMGpEMUVUYktNM0d0R0I0U1J0aG9CL1dnbUJO?=
 =?gb2312?B?UzVndlU5cVNCSXowU0NpV1ZGc05aYW4zYUl4U0JpRWFCdGE2Z0lKb0IrOFBR?=
 =?gb2312?B?UnYyNUNvL2Q1d3IwaUZXcm53dWcxTVFrMUdnVzJmVXgxSzhYVDlmMnVrYjhH?=
 =?gb2312?B?NFZlVDJlbUtPcHVWWWRENDZLVG9udjY1Zzg3ZmxBOGJEdnY4bVM4aGlpZnNT?=
 =?gb2312?B?TUdrek5SSUdQTlkwWlY0bFZDUEpZVDZUQyt3eUxCM1JOWktPQjdwZ1VacG5j?=
 =?gb2312?B?dlN2WTI5UFRjdXV0Qng1alovWUtzcnhFVXBDRUZWUENiVVUvK2pWSXVxV2N2?=
 =?gb2312?B?dXZBcHduS2ppWE5NRDFQcjc2MzhpL0p1WExFd0xGS2p3ZVRTSjk5OTY3amla?=
 =?gb2312?B?R0tRZy9haFRrKzRsNXhDSC9naE53aGNWdElpNWt3aVVPR3RRWitzblZaU1VD?=
 =?gb2312?B?REpVMU1xMFUxRHBRSDlKSklrTWlCWVpYb3RWdlNndURwem1HdmUwcnRJMTk5?=
 =?gb2312?B?WG5sZGd6RDNnOExFQTNnOFFiUHY0TmlLdUMyTXNHaUZFVU5sMzZXVDFYTndq?=
 =?gb2312?B?WXhFaGQzZXIvZzJwYU1mbEgwY3dUUGkxZ1RvV3FRWDdvOW5aTHVvQm5kN0R4?=
 =?gb2312?B?RS9NbTdFRzYyaEQwWkRQT3E0Ykh0clIwNk04MmVpMUN3YTJHOVVBdEV6ekpF?=
 =?gb2312?B?eTRTMnorR09wNStPd3lEZzZKLzdoWDVOb2lRK3FUOWJONW1GbDZFdWt1TWNu?=
 =?gb2312?B?c2RXcG1QLzFnczJ4a3BwaDdvTEJQa2t3Ry9xa2Z3alhwNDdMU0RqSDdhTGpD?=
 =?gb2312?Q?1/MHqaWA0m5yE1duItCvRbP0PlhbwIg5oWGpEre?=
x-ms-exchange-transport-forked: True
Content-ID: <E9568567C84D734BAA20B5D1CCA6A3C0@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4671958f-01dc-4d88-4be1-08d8fb41bf9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 10:25:07.8281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +dtEW8R3hX5O/7MCN91rjwRiiZ6hp4hTn+DPGJsQejrNgRnXOcVuRgx39j4I50Zd8VcJEhGS3Z+Ypcctk6JwwhD5Ddk31F1puH7CJT/PfNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1564
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] syscalls/semctl01: Convert into new api
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

Hi Cyril
> Hi!
>>>> To ensure ftok succeed, we must require root. Or, modify GETIPCKEY api,
>>>> we can use tmp directory. Anyhow, I will send a v2 to remove useless
>>>> funtion declartion firstly.
>>>
>>> Unless we are sharing the semaphore with a process that wasn't worked
>>> from the test process we can also pass IPC_PRIVATE instead of the key.
>>
>> My ltp working directory is /root/ltp, then run "su xuyang" to run
>> semctl01 case under /root/ltp/testcases/kernel/syscalls/ipc/semctl, then
>> I got ftok failure as below:
>>
>> [xuyang@localhost semctl]$ ./semctl01
>> tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s
>> libnewipc.c:44: TBROK: ftok() failed at semctl01.c:308: EACCES (13)
>>
>> I guess this situation maybe meaningless(Usually, user has access
>> privilege for their ltp directory or install directory ). So needs_root
>> is useless.
>>
>> I guess maintainers can remove this directly instead of sending a v3.
>
> The point I was trying to make is that you can pass IPC_PRIVATE instead
> of the key to semget() and you don't have to use ftok() at all.
Now, I see. Thanks. Will send a v3.
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
