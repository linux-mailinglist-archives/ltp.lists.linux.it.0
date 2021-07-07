Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7853BE0AB
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 03:50:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C8AEC3C955A
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 03:50:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1A4823C2F26
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 03:50:51 +0200 (CEST)
Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com
 [68.232.156.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5C6781000DF0
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 03:50:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1625622650; x=1657158650;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FExXLPe50s9RqRmQWDxZkASEHVGKhs8MXxs0EfLl35g=;
 b=jRYawwu2X0jOOyPVgOU8JTt1V6//fTHOkXyW0o+GNkd9KFw9+FU7CJD/
 bnV68DPUYl0f63jeGiCO6veCtvBEem3xgyDSjLdBvmNayoknxxc4aTNhX
 5P5a/J/PIlwdLuna0496Urd3tyHxY51yuBwhQJz6xuZfU3dgLQo2zD9rj
 LTlFqn6jK2AK77md3n8EP9Ba+i9VOpMomgvgvsXEbPbsHdcexJ0BH652I
 Q0yL2z43kZ6Cie/2w9cKZjMqNV81NttLqEOhdUmjwrfqLTB2vL0Ye2/o9
 gn8nRf15lq5TM24oMLg18V8IgJoO8FDTjF1B0qeoM/a8PnCQzvjHR8Bhi w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="34368461"
X-IronPort-AV: E=Sophos;i="5.83,330,1616425200"; d="scan'208";a="34368461"
Received: from mail-os2jpn01lp2058.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 10:50:47 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bk6G3hobm75iswHUEO5GRdU7sG9mCf9cDsIvY4tiWZ75q9z4yGVRNvrbq3nbXLUyBXT+8EV6lNn6ANHpxnjkHDBXfj3t73QLZpA5O6AmXIJNa3JLurhszyKG3GRNz80n6lio+TpkJaRCzkGurDGVdssTQf+q+tpW+IMMUm71s7BSCQk16rcKnbbLx9K41VQTKoq3d83Vv+F5oEgadzK/I2I2FrR8J8V1/wgz+DtyzpdR6Yp7904OLNMVxQ+pKJLTDzA9s2Ljh52USFVop9lPDdYySpv+Zyj2kesIGuPoCIn3rYkT77yZd/HU6ElwZmGHZB5mMHawsD2NvB8K8elHWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FExXLPe50s9RqRmQWDxZkASEHVGKhs8MXxs0EfLl35g=;
 b=RjWFIFQwxBepQ2K8U8mejFpexB0zUdk8ieyJ+VUEXQZ04ppFTp27gWZPmpH76vbwPyDipMy7LsspYiBjZJ9oXpDIsYto8GPfTFNAzQHgcWn37sy7qvGFADImHfq30NSdUkCo8weHuz/N2gqmZB/mhVUZSYk/lbkJck8076IRWJc+4jBp9JFLLTI1L4MSZk+s5iaPinmVv8R5i/m5tNlqkFoxui/A3XOdxztf+5MSkgmKAPk1ov549aNYjQRDSSQNSWzZREOK17/QoGzEwljks2l0sOYq51/yyPHj8BvXq+oQjCW4Mx2IN5TNHoD5x+UDY912/zmafB7qHQQ5fXViWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FExXLPe50s9RqRmQWDxZkASEHVGKhs8MXxs0EfLl35g=;
 b=YI9nYRcmnPeA3B4gagVicSLlO/xwRVB4UjGortyeBdY2jLgt/cVGKA5cEwUKsvsX1wDKTkUykTdQ/5Yw9mKs38VHzBV0hMp7uFPKRzbth5fus0RLcgIi1qJtXn9Ovk72H0YaBZ4dJ/P7wq2C5XuHogM8j8P23LF/ZSscaFAFEXU=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYXPR01MB1822.jpnprd01.prod.outlook.com (2603:1096:403:f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Wed, 7 Jul
 2021 01:50:43 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 01:50:43 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>, Li Wang <liwang@redhat.com>
Thread-Topic: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
Thread-Index: AQHXclX8FtNVc6CAyUCt+wJTvZ4uTKs15fuAgAAPCoCAAAnXAIAAwZgA
Date: Wed, 7 Jul 2021 01:50:43 +0000
Message-ID: <60E50890.9040903@fujitsu.com>
References: <20210706105758.43220-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cOm+1BMWE7oWVFttXNOeQsYk9veXePS+ctxAABk2rCWQ@mail.gmail.com>
 <c2c7ff46-df28-c7b6-49dd-c891d9655d00@bell-sw.com>
 <381b8420-3dba-d7c1-027c-e2e2adc719de@bell-sw.com>
In-Reply-To: <381b8420-3dba-d7c1-027c-e2e2adc719de@bell-sw.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bell-sw.com; dkim=none (message not signed)
 header.d=none;bell-sw.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6013ad6c-b735-4e0e-d09e-08d940e9a207
x-ms-traffictypediagnostic: TYXPR01MB1822:
x-microsoft-antispam-prvs: <TYXPR01MB1822A68BBC30FF24733FA336FD1A9@TYXPR01MB1822.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DmD2UxMPb2aJdtibsln5zHvN4cMY0dKCcFPDcosqJRCyRjzA+68dJyXal+AmNdAly0uswZzZEc1i1wbYJrOqNMuuSZYlHupjmrd1mPlj1Bhz+g5RHASxa85oHoJzo+3ovi/6d44HCRx+gMUNFSc/WrsjpOP+gTPCfVI6po2GqV3v3QPfDPn5Gu+W+aH9BMXBynyF9deCQ3I1f+nmcfYJpsL+06k33fFT6tAHPjA0LFBpLYvFk2BiuHL+gFNoHh/ASSoNDO8aCruy0OQsZLgtAELk9Zd84tL7oCMF0slaY2Yw7OaNriV+Jdxd7VzVz1mpAaCjNJqrG6zoXNs3LnDfyBJh2l3f3B6kk9+2Lhb/H1QRMdAcqRmu73ZmN7HwYOm/Utqxl/XxNybHWci4dXchUZDbFfnApOk4YbgGtmAP40n2LhNQTndSe0idQPmqqCsxUMUJoL48tOfJYYbi/l6vTqddvUIG9zxhhj/U71lAgG5N0o46Vj3hXaB+qLX9Z4I48c5t9zF5654/DaJlhBW2532hLWhVX321uuWJEs6zHMhINo9Gra2rcOf2trhJTooDDaOxbyzf3kG00430q3ae8RrnzHh+dJijsCTDVAr6HcAtU97NdeJjJdDP7sUvbri5DVJSns8joqhOVYVS0Ev8zX9oEL7Hwx3adcjwnEfayxR0txUGeMpwVFD5QwXvwIdwenFOiP4jlYZlz7XKPlWkgFgazkWzpiIANQHbK4aQszg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(66476007)(66556008)(6512007)(110136005)(76116006)(2616005)(66446008)(66946007)(5660300002)(2906002)(91956017)(26005)(87266011)(6506007)(53546011)(4326008)(54906003)(71200400001)(122000001)(38100700002)(316002)(64756008)(83380400001)(186003)(478600001)(33656002)(8676002)(6486002)(8936002)(86362001)(966005)(85182001)(36756003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHdhdFgxRHVhd3g3M1ZOaDNTOUJpTTB2WGFDNno5TTNYaCsxZ05TSmlRSlBO?=
 =?utf-8?B?bk9kVlZ1YVd1UzVkbHpwMlRvaEd0R2htWjFvTkJmNWRZanJaTnlKdnJNdlpx?=
 =?utf-8?B?Y0NRcU1XcUplMmt6ZTRMT0hWVWpIRmVRKzZkUjh6RWJBRlJScVpVeHBMSmpk?=
 =?utf-8?B?bHFrUWdMTDY4SGloYTViRTA3YjJpVXFuV203ZUtBYzZkYkRtVUpSMkl5QzJI?=
 =?utf-8?B?MWlJVEdsTVNxNHJJWjZJS0ljS1NaSHNDT1VYM0pBekZ0UEFCTElLNWRLR1o2?=
 =?utf-8?B?dXh2VWV0R3pyK0p0WnhtZ05KRHlEN05zSUZVZzZSMHJGNmtSdERJbmppZk5B?=
 =?utf-8?B?NGFMSEVtSFVtV0RLQlhpNnRERTdVdThScElnYzBSUzVyamFpZ3pTL2xYdVB0?=
 =?utf-8?B?YW1tWldpcG4xT3c2UGxIMnZiRUliTm9Ha0dRWWVrenFLM2lPbXF6cm9iWHNj?=
 =?utf-8?B?NmhEZWhIdStDRlZkUkcwMnhIakdjbE5yWFdPNHpBcmYxYThMRXRsdy9aSVU1?=
 =?utf-8?B?dnMyM2h5NFFmZDdLMTdBWk5vUWxjclZrcEhDaDkvYUI1dGk5VWtyKzhWU1pn?=
 =?utf-8?B?VG00aHBIRWRmWVVLZkx2UlU1S3J2TXdnTGp2M0dtMnQ1alJBeSt4N3RvZ0xs?=
 =?utf-8?B?Vzc2cDhobU9sVHJHRHIweEdaZ0RjdHdUYloyL3NJUnp6MEhNNkZmVEw4NnR2?=
 =?utf-8?B?b0dHV2tsYXQ2QStKdElVOEtTYU9JOE5aS1N0VUxYczNTemo5MWRTcHZlN2Rk?=
 =?utf-8?B?S0VwNy9HWVZaRDB2VXNIVmV3WXRGZndmVVdORVVWclM2cUZ6TnkwdTJacXRp?=
 =?utf-8?B?Zkh6dC82c3FNUXNGR1RIL04zelUxWVVRckdjaUF0NHBtYld0SVFjUGFVeUc5?=
 =?utf-8?B?RFlDaWI2NDJaaENRZDZaTnpWd1gwQW1OMDFnaGd1THg2UnpuQUUydlBXK2FJ?=
 =?utf-8?B?TzJDTk9Qb1UyWUlHR1ZtckZuWDNnRk5uK3RTOFlVa2sweXdPZ3E0anFaaEJt?=
 =?utf-8?B?eGVSSnFtWW1JL29nN2ZIR0NXZXF1UU9NU0J3cG1UYkdjZFlRZjlhRnBIUFZV?=
 =?utf-8?B?VlhGYlRBQ1RHeTl0dFFncnY5cFlkejh5aEs0OFhDQzhOeStjeUNBNUsySEdQ?=
 =?utf-8?B?cVpvTWd1NStsYWd0OTZiWGI1ekI5SE5HMXVCa2RiZ3VnMm1WajJ0OS9kdW0w?=
 =?utf-8?B?SXVOL244NVd0ZytQNVdlUElRMmErcXFsUWNGMllGbFd4RVhwODA4Q3BwQXpR?=
 =?utf-8?B?SEpzUnYyOXBuVWsyYUhwM1RKRys0QlBvSjBsWTl3QWU3YkNuN1ZJaHJqbVVN?=
 =?utf-8?B?WjBNQ0pKOU1pTGxGVHYrZ1dRNktjanEzcHhVTlBmNDRHQS9qNHpxVUJPb044?=
 =?utf-8?B?bjlBcVlOSU1zYVQvdngvemFvMXFIdDFXUHczcmkxaHZ4bGtOa0RHc3pjN0JI?=
 =?utf-8?B?V0dDbnM3TXJhTUhlL2JTaS9yNFFETzBuMzFUNEhvOVVJY1Mrem45U3duMXUr?=
 =?utf-8?B?WHRkTHNCUDFpZmtkQWN0c1lTRkxVUzJDNlplaTBlbjY4UkRkNjc5cFBPeG94?=
 =?utf-8?B?eFpWSkJra2NZZmFwRnNiZkpRbERjdUNhS2F0Y3NkOWdrcjBuQ2VPcXFsU3Bo?=
 =?utf-8?B?c2VMTWVFamhaNWdXK01rNkp5c3JJQ0RRTTd2LzRNR2MxMnRzbS9zcUhVVkxQ?=
 =?utf-8?B?Vi82ZW9UYWhtTWJ4R2dweUVqcWJKU24ydDJ0VmkvZW5mRlp3WFIwbHlCZEor?=
 =?utf-8?Q?/sDYRThofFR3tRLh4MWJOGaKsI/s88vv9pCGTpI?=
x-ms-exchange-transport-forked: True
Content-ID: <3A1F26C4396D1C4DB8507862D8BD4FCC@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6013ad6c-b735-4e0e-d09e-08d940e9a207
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 01:50:43.9156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zo8RxFX+XbuQoW82/hPUJ2szOR/FGGGEuHCmohcr63clqtK9iLWjBRFyom2y0Uyv5weHYDSmerg03YLcWhtZPndKmcuCsrGK/8zXguofD8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1822
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
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
Cc: LTP List <ltp@lists.linux.it>, Huanian Li <huanli@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alexey,Li
> On 06.07.2021 16:43, Alexey Kodanev wrote:
>> Hi Li,
>> On 06.07.2021 15:49, Li Wang wrote:
>>> Hi Alexey,
>>>
>>> On Tue, Jul 6, 2021 at 6:59 PM Alexey Kodanev<aleksei.kodanev@bell-sw.com<mailto:aleksei.kodanev@bell-sw.com>>  wrote:
>>>
>>>      It's unlikely, but still possible that some of them could be
>>>      created during the test as well, so the patch only checks
>>>      errno.
>>>
>>>
>>> Thanks for fixing this, seems the msgget03 has this problem as well.
>>> https://github.com/linux-test-project/ltp/issues/842<https://github.com/linux-test-project/ltp/issues/842>
>>
>> Yes, it is the same, it can be easily reproduced:
>>
>> $ ./msgget03
>> tst_test.c:1311: TINFO: Timeout per run is 0h 05m 00s
>> msgget03.c:50: TINFO: The maximum number of message queues (32000) reached
>> msgget03.c:29: TPASS: msgget(1627491660, 1536) : ENOSPC (28)
>>
>> $ ipcmk -Q
>> Message queue id: 32768
>>
>> $ ./msgget03
>> tst_test.c:1311: TINFO: Timeout per run is 0h 05m 00s
>> msgget03.c:46: TBROK: msgget failed unexpectedly: ENOSPC (28)
>>
>>
>> We can fix it similarly.
>>
>
> It's also possible that some resources will be freed during
> the tests... perhaps, moving the loop to verify_*() is the
> better option?
>
> diff --git a/testcases/kernel/syscalls/ipc/msgget/msgget03.c b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
> index 76cf82cd3..5b760b1d6 100644
> --- a/testcases/kernel/syscalls/ipc/msgget/msgget03.c
> +++ b/testcases/kernel/syscalls/ipc/msgget/msgget03.c
> @@ -26,29 +26,29 @@ static key_t msgkey;
>
>   static void verify_msgget(void)
>   {
> -       TST_EXP_FAIL2(msgget(msgkey + maxmsgs, IPC_CREAT | IPC_EXCL), ENOSPC,
> -               "msgget(%i, %i)", msgkey + maxmsgs, IPC_CREAT | IPC_EXCL);
> +       int num, res;
> +
> +       for (num = 0; num<= maxmsgs; ++num) {
> +               res = msgget(msgkey + num, IPC_CREAT | IPC_EXCL);
> +               if (res == -1) {
> +                       if (errno == ENOSPC) {
> +                               tst_res(TPASS | TERRNO, "created queues %d", num);
> +                               return;
> +                       }
> +                       tst_brk(TFAIL | TERRNO,
> +                               "msgget failed unexpectedly, num %d", num);
> +               }
> +               queues[queue_cnt++] = res;
> +       }
>   }
If we use this old format, then we can not ensure whether we trigger the 
ENOSPC errer correctly when reaching the expected nums.

So to avoid the existed memory segments error, I think we should alter 
get_used_queus api to count the existed  memory segments by adding a 
file argument.

ps:get_used_queus seems never be used.

code maybe as below:

diff --git a/include/libnewipc.h b/include/libnewipc.h
index 075364f85..76de70fee 100644
--- a/include/libnewipc.h
+++ b/include/libnewipc.h
@@ -49,9 +49,9 @@ key_t getipckey(const char *file, const int lineno);
  #define GETIPCKEY() \
         getipckey(__FILE__, __LINE__)

-int get_used_queues(const char *file, const int lineno);
-#define GET_USED_QUEUES() \
-       get_used_queues(__FILE__, __LINE__)
+int get_used_queues(const char *file, const int lineno, const char 
*proc_file);
+#define GET_USED_QUEUES(proc_file) \
+       get_used_queues(__FILE__, __LINE__, proc_file)

  void *probe_free_addr(const char *file, const int lineno);
  #define PROBE_FREE_ADDR() \
diff --git a/libs/libltpnewipc/libnewipc.c b/libs/libltpnewipc/libnewipc.c
index d0974bbe0..533a21140 100644
--- a/libs/libltpnewipc/libnewipc.c
+++ b/libs/libltpnewipc/libnewipc.c
@@ -48,13 +48,13 @@ key_t getipckey(const char *file, const int lineno)
         return key;
  }

-int get_used_queues(const char *file, const int lineno)
+int get_used_queues(const char *file, const int lineno, const char 
*proc_file )
  {
         FILE *fp;
         int used_queues = -1;
         char buf[BUFSIZE];

-       fp = safe_fopen(file, lineno, NULL, "/proc/sysvipc/msg", "r");
+       fp = safe_fopen(file, lineno, NULL, proc_file, "r");

         while (fgets(buf, BUFSIZE, fp) != NULL)
                 used_queues++;
@@ -62,8 +62,8 @@ int get_used_queues(const char *file, const int lineno)
         fclose(fp);

         if (used_queues < 0) {
-               tst_brk(TBROK, "can't read /proc/sysvipc/msg to get "
-                       "used message queues at %s:%d", file, lineno);
+               tst_brk(TBROK, "can't read %s to get used message queues "
+                       "at %s:%d", proc_file, file, lineno);
         }


--- a/testcases/kernel/syscalls/ipc/shmget/shmget03.c
+++ b/testcases/kernel/syscalls/ipc/shmget/shmget03.c
@@ -22,7 +22,7 @@
  #include "libnewipc.h"

  static int *queues;
-static int maxshms, queue_cnt;
+static int maxshms, queue_cnt, existed_cnt;
  static key_t shmkey;

  static void verify_shmget(void)
@@ -36,11 +36,14 @@ static void setup(void)
         int res, num;

         shmkey = GETIPCKEY();
+       existed_cnt = GET_USED_QUEUES("/proc/sysvipc/shm");

+       tst_res(TINFO, "Current environment has %d existed shared emory 
segments",
+               existed_cnt);
         SAFE_FILE_SCANF("/proc/sys/kernel/shmmni", "%i", &maxshms);

-       queues = SAFE_MALLOC(maxshms * sizeof(int));
-       for (num = 0; num < maxshms; num++) {
+       queues = SAFE_MALLOC((maxshms - existed_cnt) * sizeof(int));
+       for (num = 0; num < maxshms - existed_cnt; num++) {
                 res = shmget(shmkey + num, SHM_SIZE, IPC_CREAT | 
IPC_EXCL | SHM_RW);
                 if (res == -1)
                         tst_brk(TBROK | TERRNO, "shmget failed 
unexpectedly");


Best Regards
Yang Xu

> ...

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
