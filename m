Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A9D359702
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 09:59:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2B6FA3C7350
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Apr 2021 09:59:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E381C3C1DA6
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 09:59:49 +0200 (CEST)
Received: from esa9.fujitsucc.c3s2.iphmx.com (esa9.fujitsucc.c3s2.iphmx.com
 [68.232.159.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id ABF37200B28
 for <ltp@lists.linux.it>; Fri,  9 Apr 2021 09:59:47 +0200 (CEST)
IronPort-SDR: ECLmY3PV4iEMIQOkgs6dIKcY6JAwph4ZviQGN5rl5Tl1glIyjzzMZ+m3k5RBunlPgyqo1zAAwG
 wh+aF+iEH/1uxJNOh9A2sLuHlfcnJG8J4iYUA5QFc5QCmSPAXE3iZ6NpX5Khstpe5VtqfZ5TYW
 /e+N8IniEmg7Jq1SLaLr0+LuZfAUdaPhuL1kIS10bL6VjVWVf3HNs3qYTqeG7XGGmpk2bIIdDh
 BmRpab7Eo947x1X+XS0gEQ2a3j4MYK2TQgHaDM7SkgWRinxCBnAct0TpUYA6deSEPASxrEQi34
 vG4=
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="29410246"
X-IronPort-AV: E=Sophos;i="5.82,208,1613401200"; d="scan'208";a="29410246"
Received: from mail-ty1jpn01lp2053.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 16:59:46 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QN19zSU4BlkWnlOZaAGuAoQ5E9lfDE3dYjcnqJ0NPbsgZZ5fyJFJ5H48LlgKcajzB9rtfGHB+9wKBblDEqmri6uKAU2dEYKncpIUd2XEVx6opfWz3sP9pM6/yTPEaHgAd1ma4gHrMYFt2YEw0C7fyADTGVK7PT33FYOdhmzaq0wgve3eF4lrWjkffe/vER1IZA7dAhy9M+gT0Q/wmdZ/xCrdbFdksypTXooHaBI0x0IhIiExePLo8tHSOBZV5/icIc4zOCnyof7k/1De0y8hBaCpgVnsTNe/ZmAzWngp/Jwu8qjZRq2w6flkrg5FCUBHj4cu0xXjbUh80v/zr2Kx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJX7JTi9ONrFRFj/8nz91fHfygPInjlXrAVa8EaXYvo=;
 b=NuRsjY5VX79b0AdaYBq6qN9ZwAf09Yibo900SPp34aJ8LQPjZmDrZWwktpL+/l0zdPQpBFcPmTTmKA3UMO3bssVjlN/bsYHaElYN+ehf2iXCbuAYOwatsM6M3HfGg74IaQqBr1ikVbqRR2xnyO2AEXLRA+1OaWM5gY6AUI4QjSVUMiS9pVc4q2dC/iE/fjZW6DWgXN8Z5n5Z3f9zO9ftRqL6CEjQEHLDxkhySDG3ZgoDFAxLKeYBzCS/s/6L5z5/xZM1gOApRmLQWYnYNSE3mFJYbE1PGI0oVx4XJDju75IJEl7ctqkg/FfHek88jjAPq59t8Zb7tPNslahTfUUsfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJX7JTi9ONrFRFj/8nz91fHfygPInjlXrAVa8EaXYvo=;
 b=a/8ztMjy+OeG3386bIabt1DFSZ0vEGyjSr7W8Lj9OmjHExM1N8vScACfl0Fp97YgVgqm7WdoPPGvqPxz3kc3L190A3xRlUBIJ6RJyKPEliAVki77f0t+4g3PNaIBFTw8ejtOLnr1wdZHT31Vt/R7DkMl3t+Sg6R7omaAtxQlBVo=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB6282.jpnprd01.prod.outlook.com (2603:1096:402:3f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Fri, 9 Apr
 2021 07:59:41 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.4020.018; Fri, 9 Apr 2021
 07:59:41 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>, Alexey Kodanev <alexey.kodanev@oracle.com>
Thread-Topic: [LTP] [PATCH 3/3] syscalls/semctl01: Convert into new api
Thread-Index: AQHXH9Ndhz7aaDhWMkm01hZD+qhM2qqpaIEAgACfOgCAAH3UgIABeCeA
Date: Fri, 9 Apr 2021 07:59:41 +0000
Message-ID: <6070177F.8060404@fujitsu.com>
References: <1616497037-19158-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1616497037-19158-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <46e7a46a-f3d2-078d-1126-5a8679cea7be@oracle.com>
 <606E7268.8000603@fujitsu.com> <YG7b9c8b9DBpz3QS@yuki>
In-Reply-To: <YG7b9c8b9DBpz3QS@yuki>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c1c8760-4417-4a3c-df3e-08d8fb2d6e38
x-ms-traffictypediagnostic: TYAPR01MB6282:
x-microsoft-antispam-prvs: <TYAPR01MB628204D064BC15F687653160FD739@TYAPR01MB6282.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LA6ffNeqJ8WEawheMFBMOK8FcFxteomu2AhtNwbSnCqHyQt+WlJPcesgXkm1Ty2wK4Vsx3XiMdoA/q1W4yfnqDVdmAeT0ztHr8AQQilBGBDasjfxHxB/Atl9Ja5yAWM8g3l+JSgXx9ZF23pIGH1pkDOFAglTXO66MC2ebPigEDe0h6+yoK8HMLDAhKMI7DkWkFtr/nEU4HKaXfkTFBKKCpgd0CwWMGg14REYLdtFLbyAFPtnecBUMsYAhe1ym+0dV4L7FywZFbPK6dIIcAv4+pnFIdgpEwHbs139m3/TLo9d7SAOPfUz5ddp2iIiNx3+jB3wBqUiUjnkAx2DxjHfg9Ca0fjbTiL4n1wzLTZBVYL1fL83C7V3oqGSTz8isPTx9Ed6tfRbBL+/tgSTgfB8BBa/5EQf0ne3YQJRgUdeNd/Phk0AGKoq9XJpqfvkDJ7TATxoFhJXvWD3QgKU74i92SV0juGjq7jZyoIF6hGLoankYmyytdOzq+ZNZPqaTtGh3G1Z4pOzR+AuTXtsXEgFtSPyFfMEGRg9Z3FV6AYsWXJzixQmGE2d/eI+z+6PrcVHeSm9kJMQwqnvIw0BK68QPC1Hdn5moK/MEJ8aFM4ZuhXPBw/oSTBo8wGAxJlise96JwUfNxdqnvhpNxGVl/MFLKbA2yVuFY7qiVscYHJTFYA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(6512007)(33656002)(36756003)(5660300002)(6486002)(2616005)(4326008)(87266011)(26005)(316002)(38100700001)(85182001)(478600001)(83380400001)(2906002)(86362001)(76116006)(8936002)(66946007)(71200400001)(91956017)(8676002)(66476007)(186003)(6506007)(66446008)(64756008)(110136005)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?UEJnVFZBRGUrUU1Cc3NRK1g3NWNRbzNyWUFKY1EyRUVCaWZaYzFVTS9ORXdS?=
 =?gb2312?B?eXRGaUhpY1FSQnRrazhRSWROd1pCYkIveG9qMnhIMHpuMW1rQXBqVlBFQ1ND?=
 =?gb2312?B?QWxQVzVDaGtkUGhueFNLNHpubDB1S291Zm1mR1hSWG02RDRrczVsWm1RakZm?=
 =?gb2312?B?Y1BsZ3diNmxEMkRFc0JXVzFKcDhJM3JocStsZWpRaEFIV0JuTmFFVVI2cm01?=
 =?gb2312?B?elpaQVBjUzBtWUNMUHIwSXRkSzl6MnNRT2kzNEVEVFpOY08wcWNsNzJqWHRT?=
 =?gb2312?B?d0hoWnRrelFGVUpYNnBldmN6bTNQZGJSRXBRNE5mbmxqZENGbmFiUFNDT1pH?=
 =?gb2312?B?MnhTQ3E5VTREVUtmSUJhMFcxTDdhZmx2ODFkUlpFNU9melVPa09IWkxDekt4?=
 =?gb2312?B?SERBNjkyejk4YlJQNThobGkwQ2hVRUxuajlwNzFQR2dDYnAzYzZIVVRpYmt1?=
 =?gb2312?B?Qm50Z0tsK1FLS25EeGh0NXprd2FEZ1d3MU1yekhrKysvMDkwWmlDaWN1UmFq?=
 =?gb2312?B?bVY3d24xcW5VaG5HMlNzT01kTkJnR242UGF2azRpeFgrUkE0OUVDMGJ5VHNx?=
 =?gb2312?B?aWxIbDFhK2FpL0hldDZOWEpwSUwvV1NPNTk4aFkyOFkzTWQ0Z1gvMjhJUWNw?=
 =?gb2312?B?c21ITjBZNWNNMkQzcWgvV2JUbUpjOEdHcmtDTXhwOUZ6QS8rbVkyb0dSbGcz?=
 =?gb2312?B?czRlYlMvcC9FLzNLNEQ5UC9BSGtsa2kydmtEd0lXczYyUVJKcmx2d0xLVXRw?=
 =?gb2312?B?cXlMZlhtNzIyODhoelBBVFJoMUhpRzNHOGNPMytaRkQ5b3hUdjlwbTFQejUv?=
 =?gb2312?B?R05Lb2tHUVRYMDdicmRSOG9mcXBZdm4xRGNEZEtlcERFQjJlYmFlWEF6d3Jo?=
 =?gb2312?B?dE9iQzVyaEdGbTZzYzRNeWx0TjFWWTlSUGlsWGlKUHQ1aFI2ekhJNXlpQ1F4?=
 =?gb2312?B?KzZTUDI0YkI4NHRxYnpTRlJva2tJekVSTi9MREtiNytSaEZwMXNZenhwZXBG?=
 =?gb2312?B?eWZYc2YwaExLVU5hZVlpdk54cWs1VkVxZTl6RmRaRHBWNjFOcUVYSm5HUkZV?=
 =?gb2312?B?ZlpxQTUzUzZOcDE2d1B4bW9DT2xwOTZaaVQxR3hUY1FRZHNLOW1pdk5teVFB?=
 =?gb2312?B?bHcrajBua1lDSjRKcGdYdjJmNi8rNVdLc1IxdkJmejlNc2M4TzVMNk9rZ1Ju?=
 =?gb2312?B?bCtMbFJPYTUyWTZGYUFYUGg3b05JNG05VDFzVmIyWE1nUE12K2dHOEtveFBj?=
 =?gb2312?B?UlBFWVdwdHY2MWR1eFZlZGhFa2ttZ0xHaVgybWtONzFHT2U3NkxwUXJmcmh5?=
 =?gb2312?B?NUx0Y0VkSlp4OEQxRVFwQ2doWGxTOWdUVWtISlR0VTVERkpjMnVjazJuR3Fi?=
 =?gb2312?B?MnZRUXN2cGQ3UWp0dVlhdG90RmlBcGNmSHBaNTV1TzEvbEgxL2wydW9mVERw?=
 =?gb2312?B?a2ttZ0FJODA2S1BKNFU5QStUSzlyM2puWmxRd01tMFZKcW5CNHZkblRla080?=
 =?gb2312?B?VWUvN2NRaC9IcGpaTlVwNmkrTnZUYmtPVCtveHhLMlNOWmpOcFRDcGdITEZl?=
 =?gb2312?B?R0xQOWpJQTEzbzdPRVhTaEpId0RWc1VMVHRINlRxT0ppQ0pBQ05QYXhUdEFI?=
 =?gb2312?B?WWFmR1hQUGo2WklDeVdCVnRiY1BlTmV0YVhsNnRHZVptOVd2QTlKUzFXZDQ5?=
 =?gb2312?B?b0VTcDNEdnlBbkVTRndCRUtXUS8vVm85T2pNNUdpenRoVU1nSk5CTTd6Zk9X?=
 =?gb2312?Q?Fv7nNV4KEEq1uDLlCDm/BijNeJSZU97TH6t+qx4?=
x-ms-exchange-transport-forked: True
Content-ID: <7F6E59497318F54F94AFF130B174049E@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1c8760-4417-4a3c-df3e-08d8fb2d6e38
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 07:59:41.3320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Db+5zaptjm73KOYrwxcc7aWuz++LA/H8+xrCciqIx5Qk+OUbnTH7Uqpiwn0CRrpRx6k9HNWhHSbHlASBi7faopsqlwWc45PI8eF8kChipcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6282
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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

Hi Cyril, Alexey
> Hi!
>>> Does it really require root?
>> See ftok(3) manpage, it said "The  ftok()  function uses the identity of
>> the file named by the given pathname (which must refer to an existing,
>> accessible file)".
>> ftok source code
>> key_t
>> ftok (const char *pathname, int proj_id)
>> {
>>     struct stat64 st;
>>     key_t key;
>>
>>     if (__stat64 (pathname,&st)<  0)
>>       return (key_t) -1;
>>
>>     key = ((st.st_ino&  0xffff) | ((st.st_dev&  0xff)<<  16)
>>            | ((proj_id&  0xff)<<  24));
>>
>>     return key;
>> }
>>
>> To ensure ftok succeed, we must require root. Or, modify GETIPCKEY api,
>> we can use tmp directory. Anyhow, I will send a v2 to remove useless
>> funtion declartion firstly.
>
> Unless we are sharing the semaphore with a process that wasn't worked
> from the test process we can also pass IPC_PRIVATE instead of the key.

My ltp working directory is /root/ltp, then run "su xuyang" to run 
semctl01 case under /root/ltp/testcases/kernel/syscalls/ipc/semctl, then 
I got ftok failure as below:

[xuyang@localhost semctl]$ ./semctl01
tst_test.c:1289: TINFO: Timeout per run is 0h 05m 00s
libnewipc.c:44: TBROK: ftok() failed at semctl01.c:308: EACCES (13)

I guess this situation maybe meaningless(Usually, user has access 
privilege for their ltp directory or install directory ). So needs_root 
is useless.

I guess maintainers can remove this directly instead of sending a v3.

Best Regards
Yang Xu
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
