Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 427833A2656
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 10:13:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E47063C31A9
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 10:12:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 211A13C188E
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 10:12:57 +0200 (CEST)
Received: from esa18.fujitsucc.c3s2.iphmx.com (esa18.fujitsucc.c3s2.iphmx.com
 [216.71.158.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 836CC1A01220
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 10:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1623312777; x=1654848777;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=s7yYeN0eJfqS90FXK+EmChNIlRQdaIG7IvLc/H59ko8=;
 b=E9ntQaZVTutVYGf+OfwDrdVhCh0geThee6xVrIktFaaZU3FBhYsAh1AC
 63eurdbSQcTn6Be8X9qRjqd+gmHrMi8C72VPDjFSaWaebGeSnPQSMPCji
 UhrJTHntwDtU4/hjiXxS+SeWwpy+rFTJ1rGQmXdEfsgfytkXE0MnqxoGi
 bsi09o3eDoCBMINZKF4EJg08bhO03aXxHPACbv6LQaer3CIFucCXGvcb2
 dkMwkQ2HUxwWDnIKolCVPjZ04L5/qR3zqDwURqU5zQGhM1FdSgfsKDvTq
 FktGBwZFdH+HJte0m7FwedpsKmOu/am4dKeR4/LlxrUzbg09UKuyE1yBP Q==;
IronPort-SDR: LvC3qNExt+AAPhsR0tqOhZ5x5bSTkpVyydpdu2QVmsPkGkPd60RtEOx/2Xxp6Fzv9cqI6fHfZI
 CYyD7Od6Im47vC4YbU93nkjlMnosJuWsFdYN8TwKrhslYzZxJPbj0Y2LN7p9vQwRBvnqm9OVFR
 v6Ox2hgmelsM4Jr/1x3aypIDE2Rkps7nf2TgI63Tnl6fDvcQHLrYDuJSrYaLbbkIodbqL9UlQ1
 zYpUxcS3DoW+48nPYRPzi1Rmhkeofu5Yj0YIYaHgwuh7GDKvcUbVQd5a9DGZQxlldZp7arLSCD
 img=
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="33358110"
X-IronPort-AV: E=Sophos;i="5.83,263,1616425200"; d="scan'208";a="33358110"
Received: from mail-ty1jpn01lp2056.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 17:12:54 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IX1KnyKGGWQMUQoc3rGolxUpcBSxQaoAf4DpoPcu9a0a+XmImgJrYh9+5flR+rg9/y98IfAPU+O+tAE3nmmTQkt0X/ZBtf39EDthibtMBcKdiKVvRCd3sEVdFZIRNqiEK4Ei2A6XbDnmsMsXMZRlmGYhoDdf515sBwahRMFJmjMFtkhM2FwH9VEvrB11iRmgpIQ7SoOEkdzCHhABwA1NLD7J/B2HX/WZm6EQK5fYo/anHlyKXhKRc0NYUIvEnuuMkNiBYfTyzxbk3SquzBPmNYlQkAf9lB2kqYYdUQGTSLxVR8ULyRVu6L6NZOGKHNpiGZMtrWL7bm6fsRb+6fdA6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7yYeN0eJfqS90FXK+EmChNIlRQdaIG7IvLc/H59ko8=;
 b=j5304/YwSsvntr4yZkj52kmQJtbTTYbX+2FOvKvxG2yTrLiCOPvAM6aZh2RRFGByJdTgikWZmSw7RvpeoqLIeCNa575dunx8YisgtEV0vhaVqpT85iQeAZDGU2hNyRCP4RF2ktPSaV5D7KiAgxYyiibSgTNYgOYMpwZn5h7CQdzaGvb1vn3bN+6zvGTZXj/pjGwJQHNxGulGoKYOlnbYA2mfOCWu0ayzyNdgbGGMpGWlsOFNZ/u10pP5QYWWphv/exaA4oQdKnRcH1nHjKmLEddw46EYiVlcXQEGHEwYZXxfGzjggR60qGVYFbCUXOdXYJrR2z4nhED9uKtF6y3vlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7yYeN0eJfqS90FXK+EmChNIlRQdaIG7IvLc/H59ko8=;
 b=TddTuhpiUdtrucmWPsFipvcPAVeYIjSzRkar36vMueGW8+3Kao5E+GkknjsIyDW8Txw41J0LcQUB/BLMzJPXDhx6YkmefQ5nmalh5GGg3yNdBp5VLQq4zY/5UxkRbVY+37E4cYSnHevqdSpAHAbycpDhCgQ4aYLezfaxb5trh+4=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB5818.jpnprd01.prod.outlook.com (2603:1096:404:8059::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 08:12:51 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531%6]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 08:12:51 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH] lib/tst_virt.c: Add fallback when not using
 Microsoft Hyper-V hypervisor
Thread-Index: AQHXXa1v9ROF9EdHM0ydfqg/uOso7KsM0nYAgAAOygCAAARRgA==
Date: Thu, 10 Jun 2021 08:12:51 +0000
Message-ID: <60C1C99B.6070107@fujitsu.com>
References: <1623297725-3296-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <121d371d-baca-fc43-9938-8d83e360d97b@canonical.com> <YMHF/H7OsORVP606@pevik>
In-Reply-To: <YMHF/H7OsORVP606@pevik>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1f3990e-3095-4c04-3fd1-08d92be78af7
x-ms-traffictypediagnostic: TYAPR01MB5818:
x-microsoft-antispam-prvs: <TYAPR01MB58182E6A65F58F81E0D83520FD359@TYAPR01MB5818.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:935;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UBBjm3/aQ8mbfm5aifhOTbX0M1qGEfPHddaWG6hfZorS6D9tMpw1+1UgzZoNXnEnCrIA5tNPaV+qlRLQXfSwtbo8yO00ZwV73Gqo8Xjesqd8trzYRJ6pxBWx3L6CoTCQi7RwCzm4ZaZ3FybChxCEayqpAHSdZXEmkwOPWb8uMEcfDRMNqsbt7tSubyUuVcfczDQJ/k37HWKrPU4tpQoyEp+xdSIDMkuko6yC+ICoY+cFJd0EhrrXRm2lzCwchDDWT2YHt/I1Y2be0/cJeZ88JLroxKxUNYkBIdCDhXwNTJTSPRchei3io0D2aRkTp0r4OXNBxMm8QlBvbE+mgx5TjKusx0PE3pDAL0w+FutVL3+nhxeEX6Yy76hXk+qGGqAjl+NSLnts+S/k6wH5o5Xpk6JtdLaqHYgzk5Hwnr6yFQ6wdwyawjO3hwnobKyQSdm24ZIGBjHCKpc/FHOz8qQlNduscUCKD+b4Kr5IcFUyfFQl6shGwDFVfNRmvmmPF9tPshliByNOhmWn1DFh4alVQLvyOU4WD0iZq9S15/jOXokmzmCrcnm97TbVECAyR7C+V+ps/c9caLoM9LwgOv2LnT+CEgzipKbXng3tFhLZ/XM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(47530400004)(86362001)(2906002)(83380400001)(2616005)(5660300002)(4326008)(186003)(8936002)(87266011)(76116006)(33656002)(6486002)(8676002)(71200400001)(110136005)(66476007)(64756008)(66556008)(66946007)(91956017)(52230400001)(66446008)(122000001)(316002)(38100700002)(45080400002)(6512007)(4744005)(36756003)(53546011)(6506007)(26005)(85182001)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?bnlJZTc0Z0FGa0hhTWFhWnR6a09XUVNINVdBcm5aQ05oQzBJeUtNRTR0QlZJ?=
 =?gb2312?B?dnlXcUJJcmg5clUvRVNEVFR6ajNqRVNoWHMzRjZWNEZoQk1iWGV6eUZ2cDdG?=
 =?gb2312?B?YVZjVWs0QTZmaWdIay9BaWZwcEk0Mi9Mc2VuVHJYU2lIODJaKzc1c0l5TWJr?=
 =?gb2312?B?VmJScW1ROWtTWWljU0xWcExQaTdFdGxDRjBlRHU3UDhXbHI4bjdNd3hpajl2?=
 =?gb2312?B?WnZZd09vMHFJbUNISjFVSWFNL2FpUURWWGwrU1k4ZlZlUmpud2w2YzU1Myti?=
 =?gb2312?B?Z1hwUFYrbTBnTWNjNkFPTEU3QkpZYmwvQ0o0T0JTQXBHdk9mT2lGVFZ0T2JG?=
 =?gb2312?B?TkZ2RHVFUEpDTURBemoyNzNBMUtNdDhtcjZRZDhuYnhwQTFUdXE3aWNTY1dU?=
 =?gb2312?B?WFFhOWx6bzZ6VTBiZHBybHpxVEUwYlRvK2NKZHJpYnY3SzZVQ2hSWE1sTzda?=
 =?gb2312?B?YkppcTRLWmhDWGNySUdaRlJmU0EvWXNzeVEwTXZoZlJycHZvU2JRZXIrMmFs?=
 =?gb2312?B?eXVMdFlIUHpkQ0d6UHMzTnpEQTlyd2pUSG9MclRUNXRsNlNoNE5zOFBzdFdZ?=
 =?gb2312?B?U3ZjckhyK25EL01XOExiL0pwb3dHcy85ZzBDWGJxTytxYjdxWkRXYmdWdlFN?=
 =?gb2312?B?M2pjVUh5NkxJS2hlbGZwYjR1bHlpbWNDcC94V25IdVlyL1UvUEdndGd5TWNs?=
 =?gb2312?B?eVV4bWo1Zlorc3RoTE5zbjZQa2JoUDRwVnF3VjY2aUtZUHlyUjRUU1lxZzFp?=
 =?gb2312?B?NFJtaWg0ZmgyczJqRElYSndsVHhkUzZRYzVEbFE1WkxTOHk1RjlTcHFFN09y?=
 =?gb2312?B?MWw3VzhickgzRCtSOTMvUDBUbGluVFZPWVhHMlg4NmlnSVNTSVQyL2xTamRR?=
 =?gb2312?B?VE5PRFNSbkp1a1dPK0hHU3Nkd1FST0lyeHBMSW5ndmI4eGhpdTlZT1hMRGJS?=
 =?gb2312?B?K29tcmxOV0RtN0dQcWdtemZnN2oyTFhQYTNTZFI5OUlCWWpUVm1TOXdWUVRx?=
 =?gb2312?B?WGtVczB6YXBMM1hTMi80SExzaFJWVG44UWFpRGhEcmtBc3ZkNTNBT2diQ0lY?=
 =?gb2312?B?YmRLWjg1bXR6YUQzYlp0NnhqYitlbjdGYWtOdlNRM1Jub2FBZUNzZ2ZXaExJ?=
 =?gb2312?B?MUhMaHJVdjJ4RHRCdlg2U2x1NGZsUnpPZVVUdzBsYWR2bG5nd2h1emM3c0sy?=
 =?gb2312?B?a2RxMlJreXNWVE9penlmbG16MnNGSW8xRDcwelJEZWpITVY2Qkh4NkExVW9M?=
 =?gb2312?B?MDNWTnliYlVRRVdYanJFM2JtR1JFNDRNenk0MG5VNjRhOVRoK0RibjltVVRS?=
 =?gb2312?B?ZXNQVDMwVStZRU5Cb0RyQUlMT0hEVnpoRXV0aTZTVTlNS3ExZkJtY2lFcnJJ?=
 =?gb2312?B?aXYwVDNxTnVtNDI4WGRvWXMzRHhkOUZPMkZ3K0YwUVhNWEZMQjJBZVZVNEla?=
 =?gb2312?B?ZnU0OXVIWlZjdWl3MVZTaEVvanJhV2RNeHJNazA3NUk4UHI4QklwVnE0OWhJ?=
 =?gb2312?B?M2RkNzlDejdscGI4aWNwSG5EaTBzSEVGZW1FQjdSMi9YVktlUUlFRmFvQWFj?=
 =?gb2312?B?RFBENHNSaVdGREZOS3E3aEk5TW9JakRBVkxCQ1R2Q1dxV3JyU1drY1pSLzYr?=
 =?gb2312?B?T0drWWxIdmNuRXdsUGYraitlelVyNktDbEp2U2hYaDAwelMrQ0NFemlYaHow?=
 =?gb2312?B?eHUvUDBkSE5TQkpMaGlLbzVxcVdKR01oZ0lYNlF2dSszTDJzVFhkQitVb0JY?=
 =?gb2312?Q?682x9GeRcICBxW12MTZ88+dIAK99n/Ws4VgadTy?=
x-ms-exchange-transport-forked: True
Content-ID: <E054818D2B4828458D2DA56FBEB2CEC5@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f3990e-3095-4c04-3fd1-08d92be78af7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 08:12:51.7604 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e+b1dRdpjuQqPOu8Z3CybGy+vEVr19bZRwF6gYHnktvvc6gUwuVxIsLf3sGJRuD8/RHZ1mWca7eL4D3F0/vIeXHOpb3Erjr4oWfeG93r7VA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5818
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_virt.c: Add fallback when not using
 Microsoft Hyper-V hypervisor
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

Hi All
Thanks for your review. I have merged this patch with correcting two typos.

Best Regards
Yang Xu
> Hi all,
>
>> On 10/06/2021 06:02, Yang Xu wrote:
>>> If we don't use Microsoft Hyper-V hypervisorm, getrusage04 will report the
>
>> s/hypervisorm/hypervisor/
> +1
>
>>> following error:
>>> getrusage04    1  TBROK  :  tst_virt.c:175: invalid virt_type flag: 6
>>> getrusage04    2  TBROK  :  tst_virt.c:175: Remaining cases broken
>
>>> We should add is_hyperv() function when try_systemd_detect_virt returns -1.
>>> But it is a bit complexd according to systemd-detect-virt implementation[1].
>
>> s/complexd/complex/
> +1
>
> Thanks!
>
> Reviewed-by: Petr Vorel<pvorel@suse.cz>
>
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
