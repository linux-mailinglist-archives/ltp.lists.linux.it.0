Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 032263BE0BE
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 04:00:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FD2B3C9559
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 04:00:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 408993C2F26
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 03:59:56 +0200 (CEST)
Received: from esa17.fujitsucc.c3s2.iphmx.com (esa17.fujitsucc.c3s2.iphmx.com
 [216.71.158.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2058A1000EB4
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 03:59:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1625623195; x=1657159195;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=krcEObk5x0KYfdWk9QD86G2myhpxFG4l+a8rCEK2o+E=;
 b=JSVN4N+UM2km1D1crbH+mZNjYplyM5MJmQvjcb5eDtvnhhwgkC94364M
 TyGoOBwwl4+eltmZY2ZRjve2zQH7AwywxsTuqHdiYLV2bw4mmxD/ceZmu
 K8MubhUiAP+QhGGEZFYeb2eZQffksJJo1qNOlBtPDJOe2CAZupGb9rjFj
 YvZbVeGiAgol1tr9Q5nGionEBXqXfANkdHmfqtZ08v1lrPlLVAYFnl67x
 RjqrLPqbLFj4VN2vO68s1tsmNiDf1oh3vig7C+0Q6BdIGOEJ+WAj5rJlf
 tt7XTHH86Ct/8/UjJES3sZrl+oY1n9LszdPjFIWYn0kdvzwYtuTWdAd/A w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="34324525"
X-IronPort-AV: E=Sophos;i="5.83,330,1616425200"; d="scan'208";a="34324525"
Received: from mail-ty1jpn01lp2053.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 10:59:52 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCUsKJ/ypc3+3dPUVcYwKPd5RQXwHXzeB0dmknDwof5jlZO0yxcm94wkhG3NZ3vphOLylumPxCJArqXh1+w+9aCD1Gt4cIq9g2zwuKmWht7NLtGUV0jsp74uRgG7VqOEJyNpGDqy9DEId9Cqrtz+NKKvsAL8HRTpNYld36aJi1TLm4m6l3pLFvp2cO020IWNAOA8eGq+GeSxuTGOWkiLYMQfBHXcLTvWIosMxQBRcFwJYfBlx8d056iGenSuBm63frpCeURDLEQWNdWZbDP5hCK0iXHJnz7zll+31zqTUOLENjK6xFPXg17/bmjaiAUW4HZXeViMNSy0XfzxiJ+c+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krcEObk5x0KYfdWk9QD86G2myhpxFG4l+a8rCEK2o+E=;
 b=TORbMwFofesXrEw8/2dw1Y9bUdONNZ7M8CfnixHntpy18dyf+G89x2sgMxma53/Z+VBHhvKB2zUzzSXTkMn1EtNujXHHEq0WuZf3DvmhdND7XTcZFd2s9i/7OZwjk/LZa46JRPO3hjwa+tGZMYL70TWAlFhEkY8Ww2oBju6iP9xAafoTgqgYDm2AqSbxJi1QtICcsnBbHkdclSWJF9XO8e57On5LwE33DZhGmX39+oMraAKHBnhfS04cyDiFqvLsQvh9fzQ0Ebkz/r5TUTftS0z/q5Yq/kOO3X2Y8rgn6vHrliM2xWXFm/5jmSa/oYi6lMLg58ClD/IrmDrne3MoLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krcEObk5x0KYfdWk9QD86G2myhpxFG4l+a8rCEK2o+E=;
 b=HAhWCVEoDjskAlGAqEGG3A+5lKUuI8tzqBuMwthiZtFHqJnYbbVMYO+L3v1TRTwKrZfa1Ysa0/v1ziDNqat+cVAS23EiROInCca8yfYhjTOYp98j8uu+Sowe4/ugL76ZVFgtVeEk3tSFJOJJn/DeS0JKS01EEp+aOhcdlz9lGzA=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYYPR01MB6745.jpnprd01.prod.outlook.com (2603:1096:400:cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 01:59:50 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 01:59:50 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Li Wang <liwang@redhat.com>, Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Thread-Topic: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
Thread-Index: AQHXclX8FtNVc6CAyUCt+wJTvZ4uTKs15fuAgAAPCoCAAAnXAIAAupwAgAAJiQA=
Date: Wed, 7 Jul 2021 01:59:49 +0000
Message-ID: <60E50AB4.7050404@fujitsu.com>
References: <20210706105758.43220-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cOm+1BMWE7oWVFttXNOeQsYk9veXePS+ctxAABk2rCWQ@mail.gmail.com>
 <c2c7ff46-df28-c7b6-49dd-c891d9655d00@bell-sw.com>
 <381b8420-3dba-d7c1-027c-e2e2adc719de@bell-sw.com>
 <CAEemH2fcubrbMpeoeSJJoZtD+xaiRrs_upG_+KQXB_8C9m3eQg@mail.gmail.com>
In-Reply-To: <CAEemH2fcubrbMpeoeSJJoZtD+xaiRrs_upG_+KQXB_8C9m3eQg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38999e1e-8b06-49bd-816d-08d940eae78f
x-ms-traffictypediagnostic: TYYPR01MB6745:
x-microsoft-antispam-prvs: <TYYPR01MB6745EEA9E944F578714AB83AFD1A9@TYYPR01MB6745.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3xxoPCqtyPn6vyLbiN8HZOnGaGB3fmUAn89NOCFtWK8O4isc9wo1+97TCidXXWI5buP/sZgzPfqlLpdnc0MznjF3T/HAaUVR8ZQ89VSD5TgUlE3tGeza5vU9/QGe8+9DN7fncEoMkQ2NTl2+/Y2vnFl1qxh44+oaDI641Y2T5Rw+RY/w7A4DAg57g4hjFJTnLUEvohw4KrM1ozp3DO/r3HgObNo3PQPHdmw3GvnTpOTjZ2zAL3kKV5I6K28JLGGQghJCkFBzH64HL1Miq4ksQ2hucgxrNOIpTnsEFzKNzrn9176opTsi8is94almHQVL0DktDSpUIEXJloC1csagj9jKfCFNR3a3TLWdj8OiKnGnNdpNnbS31aZ6JVs5RYbMnXrl8ampY2rRFpYTKb+V0Ay7gmbtSJDpl30pOeHhu9t4VF2Z5Wp4o4saYX+odSaZfD+B7tXmTsh8wGdBms8YkspNhkxgZGifBDLMdCa53kDc0KaqzrUsokjKfTW6g6XyF3pYW3Kqc8sPC5+W1pCpyypOs7hoYMzDj3h4vUp9d0lvMvet/hxA68lg7y/Dr3zy/s76rI9wGZH1djTak0DnIPw1gSpk7WYks3cIQ/0pCwY6VxnUlebhU+zvx+JSVa1tzQb9X809r1DEwp9p22jZsg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(6506007)(33656002)(91956017)(6486002)(316002)(36756003)(66446008)(64756008)(76116006)(26005)(2616005)(66476007)(5660300002)(8676002)(478600001)(71200400001)(6512007)(186003)(38100700002)(2906002)(4744005)(8936002)(54906003)(122000001)(83380400001)(86362001)(66556008)(110136005)(85182001)(4326008)(87266011)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SUQzVFZrZE9lcUN4dzR2OFFSSjNBQU1TcW1sLzRuQVAvMmRUMWYxaWVjWGJ5?=
 =?utf-8?B?dEIxUDhPM0FWZW5OcmlPS3NqQWg0SDlLU1dnWW11ZzBPOTNZQzRsTzNoZnR2?=
 =?utf-8?B?STVEQ0Fhd010WnZDUXYvQkFNaGRxRllnaHloVEExbUpkTWJwbmFCdG11dUo1?=
 =?utf-8?B?NHR6cHk5ZWUwMTd6RWxJNU5pYjlHZVZseFBXcGZBcktLRjFaM3JPT2VNeUdR?=
 =?utf-8?B?Zi84aTJWYk1aVXFyb2V0L3o4NFB3L1dUR3VXM1RPTjU5NW9HOGxBa2hYMitX?=
 =?utf-8?B?NTJIQnRhNEhsTmFtRzBqOFpWVGRHZU02RzBZbVlqQmR0MzJpQXlSZkxjR1Uv?=
 =?utf-8?B?Mk0ram9GMENudHBBSmlvSTI0YWU0VyszZWE4V2NITTl5dFp0UUJHWFhFTHhH?=
 =?utf-8?B?QzhYSkF5NWxwa2lBWS9QSkdjd0NMUm1kRm9tOWZnRWExbUhLV3B4WHRwMCt6?=
 =?utf-8?B?VzJuRkZVWlZnOG1Ud2UrbWMybHQrak5IdzNWMTk2Vy9pTnRwMXAwdVlBSllV?=
 =?utf-8?B?cWJiSkpuUVBqZHBuMGtoVk1ZOHVWUHdZZWpYTUl5dXBudm9YeDhkVjJISVRP?=
 =?utf-8?B?TTJ4M05NaFowc21tWlJxN2t5OWVyTjhoZVF5TjZYWWg3Q29BcDBVL1NKamhw?=
 =?utf-8?B?eVY4L0k5ZVJ1dzk4MjhJN1dwZ01FdUVEdjZEOEsxbHlsMjZCMlIzTm5PRXdx?=
 =?utf-8?B?SWtZczY3ZC9aS2NGeWxVekpqSDVxam5OSGJrNmpvMWZIUDR5QlpJZExIWTJa?=
 =?utf-8?B?TnhXSFU0MU5iNldJcFp0MFdVUkhteE5yaWtnYy9Ga2dTd3JadHNucG9COEFv?=
 =?utf-8?B?VjRhYVlmVnZFVnJFTWhnOTRsOVZJeHBhTjBQSlhOSEN4QXVreXhLVHBBUmhH?=
 =?utf-8?B?ZGxFSm1ncmoyd1dDVVQ0bzBUSXlPdE5MMWlEWGZoY1pKRzRuZFRmTjBwK0I1?=
 =?utf-8?B?anYwa3hRYmprZWZOSnpyOUVsM1Nod1ZmbFJoaGZBT1czQmFsYjlVTjBzOVZl?=
 =?utf-8?B?T1AyZ2tFT3RBazF2a2dDZ0ovKzFVMTArN09mRDltVUJCNUpwWFM4SWw4NHVt?=
 =?utf-8?B?YkJza3YxUGorT3RiU2lZbXl3cGZMRURNUmdrSU9Ib2FkN1AwUTJWS21pdGph?=
 =?utf-8?B?dUNRR2txN1hwNlpkNXRRK1ZaU0pTdG80cFQrNFRTWDFUS1hjdHNnNno1VUJD?=
 =?utf-8?B?ZngzejZtbWxLYS9Rbjg2ekxJS24xWDBtVWVoeGdEeVV6eFdXNlg4UUFzcGJu?=
 =?utf-8?B?a0poYmttR3M1bTlEREVOcElvWnNUTWVoTTY4VzhVRG1IOFNUaS9iZDhXRVZ5?=
 =?utf-8?B?bTdQbkdnZkN5alh2d3Nrd2JvVVpucUUxeXhPUU82V0owMlVmeGJGTzcrK3lY?=
 =?utf-8?B?LzFVUUN1R3d2R0NIR0c4MzRBV1M5RkJsK0d4YWFUY1Vaa0s0ODJsTkgyUjQv?=
 =?utf-8?B?WmhFbXNnNjNSOUwzbmRNZ1RmYkpUaEkzelFTZXh6M0M4VmRJOVVEYSs2aVpY?=
 =?utf-8?B?c0E1WTNsKzRpdnQzSHQ0MVo4L1dIcGNtNGNGcTZDQ1dtbXAxUHpMNGdmL256?=
 =?utf-8?B?WnZWZFM1YXhMa1JnMGhvZ1I1bjlhTm94Y0dTUG5wU3Y0SDBueWRaM25Wd2pT?=
 =?utf-8?B?bWMwb2o1TnVJUStqK25PSWxRNmltdHMvdmlJYTJib1NoYm5yWXdmZ1VRYkd2?=
 =?utf-8?B?UmRMdGJQaUh2VzFEazJmVEJrOHp3dlhDL3RWdzV1MVZUR0YrTTZkT3dyVkpO?=
 =?utf-8?Q?8y4PejV7Vph1G70Vqo4C/jHDh3/La9JN3/bsX5B?=
x-ms-exchange-transport-forked: True
Content-ID: <C43F3EE7BE04FF4B8AB143EB4A48D406@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38999e1e-8b06-49bd-816d-08d940eae78f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 01:59:49.9808 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FHymkOaCTyCoH9Us7nuiUu0AurGviFrfSuEpwUwAUNYhIuSBRgQoH9EvUo5mTKiPZPYdIT5el4sGCdzjDvAAwQv6ABqcGBAfFmJs6KSs0UQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6745
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
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

Hi Li, Alexey
> Alexey Kodanev <aleksei.kodanev@bell-sw.com
> <mailto:aleksei.kodanev@bell-sw.com>> wrote:
>
>
>     It's also possible that some resources will be freed during
>     the tests... perhaps, moving the loop to verify_*() is the
>     better option?
>
>
> Yes, good point, that would be more precise for ENOSPC testing.
AFAIK, ltp doesn't support parallel test now. I think parallel test 
maybe a future plan that is why we use docparase to collect each case's 
used resources(so we can convert many groups, like pid, memory, disk 
space..., then we can run pid group and memory groups test case parallelly).

This is my understanding. If wrong, please correct me.

Best Regards
Yang Xu
>
>
> --
> Regards,
> Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
