Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFB23BE21E
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 06:30:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 141253C89BF
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 06:30:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 08A923C1CE5
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 06:30:34 +0200 (CEST)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com
 [68.232.152.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9513F1401147
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 06:30:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1625632234; x=1657168234;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fG/GJFKZnJ/G5odOqtI3IFx4NK29SIgekx73J927VQI=;
 b=otnmKvVj2KyttBJvN2nvNlXX3DqCj9ig1s6j5QVl+qUpGmuK1OwW25T5
 86OHxU2TO7umQUucRONT0nF/GAk7ce14AZegLQ2IlTGJ4QQo7zQPrDWiZ
 1dLo99lzUOENpvj/UGRo2PLeLGq84IRZwtlpaovmMtchu98vWwzxcmFxT
 jd4WP7CWHRjsGykWHZY7UlzTYs6PSz/wOfAsCP55T5o6e/CEmM/b1XglD
 pLblvRQ6HouzjaMTI+CGxCqaUzfnAPphpgTKI6BwkcH/xAnguBKy9UbSc
 YaqVQ/HzVLqarTAtkuucDbcIm9SrYXmhmJdnbeN6bDGPvI1S2RwCPmLqm g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="42637032"
X-IronPort-AV: E=Sophos;i="5.83,330,1616425200"; d="scan'208";a="42637032"
Received: from mail-sg2apc01lp2058.outbound.protection.outlook.com (HELO
 APC01-SG2-obe.outbound.protection.outlook.com) ([104.47.125.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 13:30:27 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAVtUlUQGnZnrDYbEGMW953WiucsHkqLUwUBVORnG8SfpRiyxRZXQ75/qYf0GyP2/W/1kjuXwez8kDrsmnInVPepNyRdmqWdWgn+FCccp8t7rqHh+NQ/c7bWbRoXjWV9kQt4kPsy6NMHSSJsiZ386i/4QnSXBs7ekXdA/3JwBcwEcgnG6B/yoZIGzxlZd0evEUGWFm4RG+bMzimM7XScpFBaoUCCH2CvIhZD5IqCu6B84ACx5Ez07oVuMEHfCIw15PGBGvyHE1ONKvjyHGHOevns89d0S85mfxfsSamirnftfI2Viawtrmv6801JeqVYTPbV8m4u2OZM28yPLn9ivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fG/GJFKZnJ/G5odOqtI3IFx4NK29SIgekx73J927VQI=;
 b=nP6Co+emdYhL/FVl4aORwoV7HzeMCpG89wmTMLuYgZZZ9xNgKBgoCqVyv1H+YYr58xqsy+tWK7i7OZBsZ81vL48ujtEIjaJs4u+teWJiCImEEBMsgyNgf99bMqnpMKpUy2HKC2rZNppPehkLhyYS7kih6vpvCvwT0RGC9OwgUzvqp62BjVU7w32LrcwXe9jDoT7b0EE2eL0ksDS4HHQ41sBoVGSLIHtc6nR1EL0zfSIpNyGhdna0h3C91pCdN5L1Pu0OMRIzGpDwpGF1aKb1zcS5BWBeUzfg5kdvzyv3NK3dDdo2Sn105boGgbgpTM7KiKN2LBeii+t9X76sjlDXNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fG/GJFKZnJ/G5odOqtI3IFx4NK29SIgekx73J927VQI=;
 b=pdhr4dIkSGD6M+92FnEljdWSyXj4KgLwpuIRFwK2VbwgR4pRBxaJcM9RAJchBkywzINj+lcWQDUIsgxPvJEgp16lwCZaLAVjZ/8cZzwSbJ83ORdiJK1ewO7JlGr73nbHIDBjKAfQk5UwFL/DTpNd+7aESJI+AjIR8UHZz7YxKgY=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TY2PR01MB4572.jpnprd01.prod.outlook.com (2603:1096:404:11b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 04:30:23 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 04:30:22 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Li Wang <liwang@redhat.com>
Thread-Topic: [LTP] [PATCH] shmget03: fix test when some shm segments already
 exist
Thread-Index: AQHXclX8FtNVc6CAyUCt+wJTvZ4uTKs15fuAgAAPCoCAAAnXAIAAwZgAgAAIVgCAACRLAA==
Date: Wed, 7 Jul 2021 04:30:22 +0000
Message-ID: <60E52E00.8020105@fujitsu.com>
References: <20210706105758.43220-1-aleksei.kodanev@bell-sw.com>
 <CAEemH2cOm+1BMWE7oWVFttXNOeQsYk9veXePS+ctxAABk2rCWQ@mail.gmail.com>
 <c2c7ff46-df28-c7b6-49dd-c891d9655d00@bell-sw.com>
 <381b8420-3dba-d7c1-027c-e2e2adc719de@bell-sw.com>
 <60E50890.9040903@fujitsu.com>
 <CAEemH2fKXJmgKAr4JXW5y+dcgEwL1taobXLY7OdTWBzLXGVOYg@mail.gmail.com>
In-Reply-To: <CAEemH2fKXJmgKAr4JXW5y+dcgEwL1taobXLY7OdTWBzLXGVOYg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de499415-6302-4018-d858-08d940ffef8f
x-ms-traffictypediagnostic: TY2PR01MB4572:
x-microsoft-antispam-prvs: <TY2PR01MB457272EA8E2265F2A4B900B0FD1A9@TY2PR01MB4572.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YVRRtpmL2rCc6qKtH9VKKxlViFDpFFH2KwtC7+JkL945NBCpVcoTxkaxzpV5Dgtoc3fsFZYrIebV7yuQKjDK7F8gdkuMjFDNhwJb4rweQSgyyGJpJl54QsQLWVd3NHiil8lNLu+Am9ldBZNM+JGfrJwHGbUG14rS9kBJl9RSmJuub4qOXj0GR5TbDqufngx7FBBnE7SV7OoAYuTfvzddjIYPk4Lma9b4Qa9MTNU7OLMv904Hdz5Bqs7Mvegynuvr72EMuwGZluTfSXGHZ7zQXaqpsjFVU2MoW+zVOq1QWLdiyqUAqKHr60qziSW4efMnOsswnSfv2XCgl/qqBz+NiCTjmKHx6OHXC+DdfYrRIK2k6a/u+r656zxRlQv6nxQ4DGS77AOsSPFmMLOrPc2LTnS0DncmAIXu+AmGziMTeag2lGRzmNWJRHwglca+kGW5FauUr6IawGPbElwbxS2F/2NRdVn+Wjb0I8RqrMuDalmAqNKtkkmwC9yofIkxkhe22BC96JyEcYbIJNnJlSTggArGKruUIANtbhgCsK+50abi7vSoh9yVuB4xp5kFRhwpUvRovZVWLsJ9Rezf+Eg3p9FZ3VX3qPcEJTBIiIRpVUR4fm61hkTw77sarf9wRnqIOFFuIEH3e/qwlOv1TvBM6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(87266011)(316002)(66476007)(64756008)(66556008)(83380400001)(54906003)(33656002)(5660300002)(38100700002)(66446008)(4326008)(91956017)(66946007)(6506007)(76116006)(36756003)(6916009)(2616005)(6512007)(86362001)(478600001)(26005)(2906002)(6486002)(85182001)(186003)(122000001)(71200400001)(8936002)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eE13OGJDV3ZwV1NhczhvZWtzUUJ5V2ZaWEh2b2lRUDFGSlUrR2FjMUE3L3Fj?=
 =?utf-8?B?UG8xeElQSEltZ21FOGY0Zy9VQkZFLy9SQ281ZVhNZFpkcmV5bUwycjhyZ3NP?=
 =?utf-8?B?SGFPbkE2VVIrNm9ETklhR2o0NEdnRkltd3dFbzJCeFJvY21ab1o4NUkzVHln?=
 =?utf-8?B?TTAvYkNNSE00QzhiMmJHS05XQ1FBQjdNNGhEcTFacXpTZVBJZ3g5enQ5QkFk?=
 =?utf-8?B?WFN5d3FuZWJsVENQZElFZVB2NXJHam56ZDRKSUF2UzRnTUtuUVUxMDFZaDNX?=
 =?utf-8?B?eXF6VHR4OTVzUlM5V1JCNEI1ajRWZHZ4K2dCS01jcjVyekVIZFlqRzJBM1cx?=
 =?utf-8?B?cW5mczBKZXQ1YUMrL05DT2VtUEk1OW1nYUNFb0RYTzEreHBrU1NsR3hORFdK?=
 =?utf-8?B?UDgzTm9OVUQ3cXNHUC9VbFBBckV5TFFvQklCQnE1L29OU0srUjZTQmFNUWdH?=
 =?utf-8?B?K1BJb0ZUSERGdDNFSmVGcjY3NnA0c2NTQUZaSFptRUkwRDA0THAvbUpJY2ls?=
 =?utf-8?B?L3BiVGhFTzR1blE1SUtQMkpJSUhUVStTNjErSXNFWlRZYlY0K1MyTnUxcGZ5?=
 =?utf-8?B?cTkvMlZha1E5aWEveEdWN2theE51UmhQQnlobkM0TUMzamsxdjAxKy9LYUJo?=
 =?utf-8?B?RzlIbnlWN3FwNG0wVnRqclpKRzNvS0d0TVpSV0VNenVqYU4zNU1WYUVwdCtk?=
 =?utf-8?B?cHNoYXhHSC95Sy8vcmVsQnNwSG5OdDV5UzhvdXpEV2dVYStPQ1k3djJjNWR6?=
 =?utf-8?B?bkhwdTBVZGx0YjE1UGJiWjhaZ3hZY2M0NDd6QzB1SWRFVkpLc1pEWDhxK1RJ?=
 =?utf-8?B?TWErR2NyMUM0dC9WanFqWkFzL1JJdW1qS1hqdmJvbDFqL0Jjb0tLeFZIU0hJ?=
 =?utf-8?B?elA1OXZWNUNHV1pEc1RvOU9uTjVNWGQ4ZTc3TGFoeXh6YnJ2UmdHVCsyR0dT?=
 =?utf-8?B?MzYwaS9VellMRDFBWEpLQXdxanZoa2YyU3F5aXlnbkhnQXNLTElTbzVMVThG?=
 =?utf-8?B?MzhhT3NxT1RQdmxGY0Jzb0dBN1NXV2lVYWxmTmppbU1EWUNzQTY3dUZpdEky?=
 =?utf-8?B?ZktHVDh3NVRENE5HMDdKVjZqbWxXdmhlVVZpN2lTY2Zkb2J1ajA3WEpiVzgx?=
 =?utf-8?B?T2gzR2IwblNaeEh2WTY1Qjc0MkhtYzFOZG8xS00xd1RKOGZ3OUZ4M2NnWHIv?=
 =?utf-8?B?eFdTMGJ0d1FFbGZGMExxQkFKQ29LVEFub3pvSURvQ0xsa0ZsNHkvK3VXb3pZ?=
 =?utf-8?B?MWFmbnVUMTNqUzZIekRXYldyS09uRzAwU2doRzZHenh4TUs4cmE2UkU0SjhH?=
 =?utf-8?B?T0ZXUlEza3hmSi9JaHhGZ3FuWUlmS1BsSUl1N1V0WmIrTWZ2UEtmRERRSjVK?=
 =?utf-8?B?dUduQ09BMzYzRURoZHQ2ZWZncXNadERXeGtIWHpKMWNYU2pmMy9ycDhuNDNi?=
 =?utf-8?B?aTVlRGRZYkFjNzYvWDlkWHRCbzJxZmNxV1JCcEQ0cm5tcXlVU3A2OUc4ZnRa?=
 =?utf-8?B?Z0srOE9Cb0VQUnRoUE5MVUdoUVlFVXQwdjBJajBncXlkTTh2SXg5TnMxcEVQ?=
 =?utf-8?B?ZkltUnM1bDRGVjRJODlpVmx1dnpuNTJZVExDNUN1WEltZ0FBbUtPMnZtaE5V?=
 =?utf-8?B?YWQrSTFSYThTeWxPMFVQWUcwekR1bnJxZms4QTl3V25sWWI5bUZxakl1Tzlq?=
 =?utf-8?B?a0ZucWFDR3l6eHNXRVZIZUdaSmV6b1dBYVdINENCankveXh5TGxHblMzZEQ3?=
 =?utf-8?Q?CVtixcGr8nXTNiqMSByky+JFTvgNlcHtKscqVHi?=
x-ms-exchange-transport-forked: True
Content-ID: <7F8ADD62960EC048A2D83AF548A5C66E@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de499415-6302-4018-d858-08d940ffef8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 04:30:22.8789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QpaFeQYztT69JkND2isKrOT4GA+g8uKoHgXccLyo8Cav+653YQNnRlE9iKddPx5uTI7nbmrXiWfiU9WgQk9C3wtxrhtcemC9EcZrGck7eyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4572
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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

Hi Li
> Hi Xu,
>
> xuyang2018.jy@fujitsu.com <mailto:xuyang2018.jy@fujitsu.com>
> <xuyang2018.jy@fujitsu.com <mailto:xuyang2018.jy@fujitsu.com>> wrote:
>
>     If we use this old format, then we can not ensure whether we trigger
>     the
>     ENOSPC errer correctly when reaching the expected nums.
>
>     So to avoid the existed memory segments error, I think we should alter
>     get_used_queus api to count the existed memory segments by adding a
>     file argument.
>
>
> Just as Alex pointed, if there are some resources be freedafter invoking
> get_used_queus, then the value of existed_cntwill be imprecise, how do
> you think that affects the test result?

We can move this count api and the create phase into verify* function, 
but still exist the chance to free resource after invoking get_used_queues.

We can't avoid it because /proc/sys/kernel/shmmni is designed for all 
user instead of the calling process.

I think it is common in ltp because user also can set a different value 
after we use ltp api to set proc value.

But if we only use for loop to trigger the ENOSPC error, it goes against 
the test's aim(see old shmget03.c, it also does the same thing as I do, 
it doesn't trigger error because it uses a big value than default 4096).

Since this case only wastes a little time when run, I don't think we 
should avoid rare race to give up to test the ENOSPC error when reaching 
the expected num.

Also, Let's listen advise from other maintainers.
@Cyril,Petr

Best Regards
Yang Xu

>
>
> --
> Regards,
> Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
