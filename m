Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2995C3D3763
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 11:10:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 730FB3C8183
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 11:10:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A5CFF3C58FF
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 11:10:29 +0200 (CEST)
Received: from esa19.fujitsucc.c3s2.iphmx.com (esa19.fujitsucc.c3s2.iphmx.com
 [216.71.158.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 18686100119E
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 11:10:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1627031429; x=1658567429;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yccbKuRmosYZIVK7eg8E8lUHJ2s++NNWGN7s4ljoLSQ=;
 b=TZbkISY06ePx3zocYF84xSH7L0Prt0vUmKcJQ/i343g3VJdeWq3IzsjL
 va6oTO4+J8mvvewn+LCWW2UbDJRviFIwqkGyuvSsz0zleESZmWebkD9kn
 fc4WyqPVDDmCxGcnDch9rcNifXg0cHC3EkK2Mko2NzeLihwAqVVWcsblY
 BXY14HELKOO0eAH1nsYS0TFHjNFSlPPGRGTTAFGL1ekY0GlpgiIsuueEz
 uj0Bm2g85gQLzfOxseTWkzE91uQvUsFZ0o1BjGceW9v3UW5lt5ulHfC+a
 d9YQvgwcxeotxuv8gNkGLCix9L/YcstPSW5PZ2U/KsUhymLOj/Scj9GA3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="35214958"
X-IronPort-AV: E=Sophos;i="5.84,263,1620658800"; d="scan'208";a="35214958"
Received: from mail-sg2apc01lp2054.outbound.protection.outlook.com (HELO
 APC01-SG2-obe.outbound.protection.outlook.com) ([104.47.125.54])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 18:10:27 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nn6vH3QyFadkwWSKCFkzjPEKXmYp2lZCcXe7vn3/UIOl+v4jMIyzsp7U4k9tt6yQeDCPstnYEoXonJq8LEEE2i8YLVAshIfCPMzaiySqul6eZsL+N/27GuA+X2JXereUxDGNj0INv5YmLduvzrCSaT3Q7MfhmcSU4gblnjYZAEuPp3xbPRlHAhQdnrERGSa50Cqg1CFOpWjft2dhCdvjkz8pLTBz4nyCdmlvkk71pI7TKB52XMzGp1GIIzPe5Lf/VFVALzsRfZJQdSFIWImuw4CKEY8BdtjVQCLFq11Q815/Hd/y/VzH80LU85sTPWbv0Jxu7YEjuI8FVWkd/ln2OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yccbKuRmosYZIVK7eg8E8lUHJ2s++NNWGN7s4ljoLSQ=;
 b=E1ayNDc3TNSoZd9+zDZvyeI76L+kAEsEsF0C0fTqhmYVflo7BvsGi2HXERzyGlX7AKsSqxe7oH1R161qlR8VYXSFkItMv6XZtsalsTwDsfXBgnPrDgCaQybmqFWsyLaXq21XxQGbsF3HuFCF6XxzFoRVvcjUeJggqOQCwZEnGgxQWPBtZTHjgNvrOK/JmJsxzBL6rzCl0F5NZnfFPULERA6MKMKI/q3mwGjlUsMe/7oqyHoW/4UOGukvkDoMpSVAFiWlMVNhSTc9tzML1P24rQF9ICEvVtZlEA52VpuxDYVMnqWcGUtMnmzHAH/wzunnbh13KXkVzZcQ9iKDXRuMRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yccbKuRmosYZIVK7eg8E8lUHJ2s++NNWGN7s4ljoLSQ=;
 b=SdsVzCFKUEhe6DzBKWvE6X5G8JzpYq7XhASNok2T5PU/iCni3doBLXCE/eqmTA9kmZihbyL3AkTHSVQIwK6yd8QsBS5V+OXb8z+mKr5ZmrC8zFulW+niYnyEvpSKPZcXkmDYjdDnxMflVfaflCjIJwdFTFLbdWe+Sf8o1kxVLP4=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB4362.jpnprd01.prod.outlook.com (2603:1096:404:110::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Fri, 23 Jul
 2021 09:10:24 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 09:10:24 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH v1 3/4] syscalls/shmget05: Add test for
 /proc/sys/kernel/shm_next_id
Thread-Index: AQHXRwwqjBuInok3lUGSaO72afR8T6tPUfwAgAFlLYA=
Date: Fri, 23 Jul 2021 09:10:24 +0000
Message-ID: <60FA8799.6050900@fujitsu.com>
References: <1620809541-6891-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1620809541-6891-3-git-send-email-xuyang2018.jy@fujitsu.com>
 <YPlb+ogqehyG210l@yuki>
In-Reply-To: <YPlb+ogqehyG210l@yuki>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38d14c3b-ee75-4d3a-7525-08d94db9b4f2
x-ms-traffictypediagnostic: TY2PR01MB4362:
x-microsoft-antispam-prvs: <TY2PR01MB436239A0EE729DCC9CB13DBBFDE59@TY2PR01MB4362.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DcJif0KPqSxTLfXeWnON+dodgiEpb1GjTb8O5wB+1lNOpkkMMwzoafbQ7x/D4xM2VYA7O0Uzoo0v0YeBERgSPI21g9IonBs9G+x1k/gxsiYxMBQNIYjHcdpnz84g/+GuQ7F6gwnLZA0Fd7x97Y960yskFmdXe/nUkOuSlwndNQ9xO8NH4GrsLprY4xN9UHWCiuGylNJm4F8Gixurs9ZScpEPTvmixtpLRYX4Zqeqw22TCqA+WjfN1S+L12VEIo0ZY3Qtd1SbZHt+Uq2LK1EHzRiNl80CLTfdrxcqTN/OaVm1yKnrnrgu6ZM6pxH2BHwneQFyFD81x2Su37FDPi/y3aJpJ6jBOkFmUjYetUpe8qePHiqLDcclx0cIeVuIgRWdfN3HJao2Sb6aJBpl/7dWdenuY54Slt7L1IBh6G242/Y/rPhuTvPjoUdVP0UexIiUzsrdAy9DoGvjx4weTv6gxKK/cn2Uzy+nsOeo/Dwnr0jJjhMTyk6FFDGTrYXTR/iVIob4f2KkIHMA4R4rynukqDxKSCw4TvIFRVFfpfbHA72wSnWgfaCLW2knwrqCWcetZ0odABajBhDvBcCr+kelhpio9FloAztR5h6lpay5acdtDxn7zfRweIH3wzpIGoz0JZUJoP3NPJITNmp5g4mmcz1sur+Hd+8gbkFtLiOiEySOgWmEOs9/pY2ouMjZWBpYAoURkP2NTmyjDidXlrJlwQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(2616005)(26005)(6916009)(186003)(71200400001)(4326008)(86362001)(122000001)(2906002)(8936002)(36756003)(478600001)(33656002)(91956017)(83380400001)(8676002)(66946007)(6506007)(6512007)(76116006)(316002)(38100700002)(5660300002)(87266011)(85182001)(66476007)(66556008)(6486002)(66446008)(64756008)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?ZmV4UWhxZ0RSTitaZUl4aHR5dVNZeVdGUHJ2cWFCQzVXTXlXMFBYa1ZvTXdq?=
 =?gb2312?B?TXFLUS92M3ZVSnFRbUx5QWJ5aGJXdkJESEpzSVJVb3BWM3RYMXNRbVE0amJP?=
 =?gb2312?B?OE8rd1NvNjZDdnFaajVqU2JEcjdNRE9BOCtzcEErVkRwQnpZcnNJeStoN1dV?=
 =?gb2312?B?L0FkMmMvdUZERWdPQU5COW45VkFnNUR6WThaOGJnUlBlbEFVTWErdERaZEkx?=
 =?gb2312?B?bjBSeXhZcnZNaXp4Y1NTd3F1eERRQkZKWDkxRExDejBLQ0x5NEJyVVVnUWph?=
 =?gb2312?B?RWJrWEk3czQwelhEcHRoWnBoU29scHpENzdHU3dMRFVBbThMUngvUmJtMWFZ?=
 =?gb2312?B?NHZhUTJmTXQ1dkYyeU9hVGxubEpuNFB4V0tkL1BFelJWdnFOaHpRU0NQcUM3?=
 =?gb2312?B?aHR2TS9jc1BnTWJWK3lOY3RsVzBwN3NBWTZzM09aNklqYnZmZktERUd1ZlMv?=
 =?gb2312?B?K2JVMHIwclVCbWpBSVA1d1A1OEZPTVYzYk12UlFUZkw3bTVjUElNR0lXTU9q?=
 =?gb2312?B?eU1XN1VzVDJyK1V1Z3FnV3JQME5CdTQzK2NkaytobnNTcENaTWdNMUNuSVY0?=
 =?gb2312?B?MWFFWDBvVksxVUhvTnROVVh4eUJwbFdzSXY2UmRFUFVyS3hUb1ZjMFBZWTRF?=
 =?gb2312?B?QnFZdGdzSFc5Z1IyQnFSS3FJSWFodEhxS2hWR1dKZXJETjFKK2pzMk5rZzFz?=
 =?gb2312?B?dmVjMFNUZmRFa0ZMc0JSdGw5OXB3aC9QTE9UMUhIQ2drU21VSjlnV3NjWlRh?=
 =?gb2312?B?VzNxMEZXY2svSGhNa011K1BXUXdyYlJuSjVYVWoxU1NBcjM2SEE2RHBtK1o0?=
 =?gb2312?B?WDNDL2Y0UnlnWWptckVVblpScU1zWEx3S3JTQ1krUzZFcWxjUXcrOS9ZN2xJ?=
 =?gb2312?B?RXIwVUNqSC9ZZHd5OG5CcGFjZzlNR08yMkc3UlJ2SEp1SnFuT2dMdUpaSmts?=
 =?gb2312?B?YlBTa1VRNldYRG1qU2dvUnJkbkFrRFRQbFNwamZTV0xkcTJEYlgrdDE2cmlV?=
 =?gb2312?B?MmthT2ZnL1hlTFkzWGxWakt3dGRSTHFrQ3lXcWIvN09zWmd2NE5mZTVjcGha?=
 =?gb2312?B?aFhPQUFVaGMxQWZuSGFvQ3Y1QnBnbmh5a1M4b3VEUllxUjB0ZWRzeDB2WU5y?=
 =?gb2312?B?QjY3YURYc0s5NjFBbXNqRTUyTDQ2Umtmai9rcFo3blU0aGszSkxIUzBDY29K?=
 =?gb2312?B?djRmMzR1VWZOQVFUQ1VxUWV0SVNnSFFhSlBldDFFV1M3TFZqblB1TWZTajc4?=
 =?gb2312?B?d0dFeEZLUEVnQjJRTy80V2lsOS90STFkTkNnUW0zcEZtT1dDeEVBRGxRTjli?=
 =?gb2312?B?d0ZCT1ZGUkJUc2tORTQvWnhPVVBiN0daeThZeXlVTmdYT2tzZG96RkZHZU16?=
 =?gb2312?B?bHdweUlUTUNYSW5WU2l3QSs2ZVJDWldvQWxJNXYyYVBjSmROOW5aUlZLakNq?=
 =?gb2312?B?SjlJOEZRZjJkTEhhdW5rNG1tU0Y3ZFdjbjF2ZzRJRVNVWUtHaklIL28rZzkr?=
 =?gb2312?B?azBaYVR1am5oTE93QnJXUkhRTnloQzB4SDZEc29oVDRZNjdIVFo3NjJvK2FJ?=
 =?gb2312?B?WFdrcTJIWG1XZU1pMk9LWHM4enVBay9JTkZEVG1XS2dsY3FSNkZzNnRBSVRP?=
 =?gb2312?B?LzdDR2k1OWlCenpndGhhZUVGdE1WTzVhak5yTnpRVlJ0SWRCcytLR3ZCdFQ0?=
 =?gb2312?B?dzVOUWQzNTJPMjhJSEZFT1BSZTdXOWV6Sm51VmRTTGNaaW9hbUM0RHBMVUVr?=
 =?gb2312?B?TzduRm5XcUFUMVNOQ2o0TmxXRVFtRjBMdjMzSnRXTWVyWlJsWElITkVaaEdQ?=
 =?gb2312?B?N0t3WjJCUGEyUHlwQ1ltQT09?=
x-ms-exchange-transport-forked: True
Content-ID: <291C84D21BCB944A8E084F107CF2A2D6@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d14c3b-ee75-4d3a-7525-08d94db9b4f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2021 09:10:24.8876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fyhtBRWyNqHvMFGS31NjUnc2uElgGCyheMz0iNgCh6ba1YTK7xeb2kh+C03CL6PidgY/cafhZCzaa+NDtPnut7iBrv5Z9o+gGKBP7EtsWgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4362
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 3/4] syscalls/shmget05: Add test for
 /proc/sys/kernel/shm_next_id
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
> First of all, sorry for the late response.
>
>> diff --git a/testcases/kernel/syscalls/ipc/shmget/shmget05.c b/testcases/kernel/syscalls/ipc/shmget/shmget05.c
>> new file mode 100644
>> index 000000000..601609648
>> --- /dev/null
>> +++ b/testcases/kernel/syscalls/ipc/shmget/shmget05.c
>> @@ -0,0 +1,69 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2021 FUJITSU LIMITED. All rights reserved.
>> + * Author: Yang Xu<xuyang2018.jy@fujitsu.com>
>> + */
>> +
>> +/*\
>> + * [Description]
>> + *
>> + * It is a basic test about shm_next_id.
>                             ^
> 			   for
>> + *
>> + * shm_next_id specifies desired id for next allocated IPC shared memory. By
>> + * default they are equal to -1, which means generic allocation logic.
>                ^
> 	      it's instead of 'they are'
>> + * Possible values to set are in range {0..INT_MAX}.
>> + * Toggle with non-default value will be set back to -1 by kernel after
>
> This would probably be better with just: "The value will be set back ..."
>
>> + * successful IPC object allocation.
>> + */
>> +
>> +#include<errno.h>
>> +#include<string.h>
>> +#include<sys/types.h>
>> +#include<sys/ipc.h>
>> +#include<sys/shm.h>
>> +#include "tst_test.h"
>> +#include "tst_safe_sysv_ipc.h"
>> +#include "libnewipc.h"
>> +
>> +#define NEXT_ID_PATH "/proc/sys/kernel/shm_next_id"
>> +static int shm_id, pid;
>> +static key_t shmkey;
>> +
>> +static void verify_shmget(void)
>> +{
>> +	SAFE_FILE_PRINTF(NEXT_ID_PATH, "%d", pid);
>> +
>> +	shm_id = SAFE_SHMGET(shmkey, SHM_SIZE, SHM_RW | IPC_CREAT);
>> +	if (shm_id == pid)
>> +		tst_res(TPASS, "shm_next_id succeeded, shm id %d", pid);
>> +	else
>> +		tst_res(TFAIL, "shm_next_id failed, expected id %d, but got %d", pid, shm_id);
>> +
>> +	TST_ASSERT_INT(NEXT_ID_PATH, -1);
>> +	SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
>> +	pid++;
>> +}
>> +
>> +static void setup(void)
>> +{
>> +	shmkey = GETIPCKEY();
>> +	pid = getpid();
>> +}
>> +
>> +static void cleanup(void)
>> +{
>> +	if (shm_id != -1)
>> +		SAFE_SHMCTL(shm_id, IPC_RMID, NULL);
>> +}
>> +
>> +static struct tst_test test = {
>> +	.needs_tmpdir = 1,
>
> I guess that we want this for the GETIPCKEY() right?
>
Yes.
>> +	.setup = setup,
>> +	.cleanup = cleanup,
>> +	.test_all = verify_shmget,
>> +	.needs_kconfigs = (const char *[]) {
>> +		"CONFIG_CHECKPOINT_RESTORE=y",
>> +		NULL
>> +	},
>> +	.needs_root = 1,
>> +};
>
> Looks good.
>
> With the minor adjustements in the test description:
>
> Reviewed-by: Cyril Hrubis<chrubis@suse.cz>
Thanks for your review. Will send v2.
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
