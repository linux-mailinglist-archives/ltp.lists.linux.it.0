Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B4737F0C1
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 03:04:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EA9A23C8A99
	for <lists+linux-ltp@lfdr.de>; Thu, 13 May 2021 03:04:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 20B033C2526
 for <ltp@lists.linux.it>; Thu, 13 May 2021 03:04:21 +0200 (CEST)
Received: from esa9.fujitsucc.c3s2.iphmx.com (esa9.fujitsucc.c3s2.iphmx.com
 [68.232.159.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8870B600209
 for <ltp@lists.linux.it>; Thu, 13 May 2021 03:04:19 +0200 (CEST)
IronPort-SDR: lcfq/eviNQDunQWzKG9IBp2r6kGCJcANd9LXOHYAi1E/+MI4pqaZvi8YkOCtAHTTZj7LgZxeX/
 etnC11YP8eereadQWWodhkj1McPfWyFRtNmu8dOIGKaB8Wtg3MXAQHhaN0qKdDmFOgXT9HYe1v
 aTZFNzoFKajo7whbRCr7ZAR/UWF0u6cIO078dXBfpTiKVv9kOD1fi9zilGmyBOM0HGpEeE1x9O
 oCLUb/pySIAvQ0U8fbtWhRJ9w4+9NoQzhSPiDX5LigaJck99AoGeoGz7k9oL5ijvzwFaQ20sHo
 It4=
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="31275550"
X-IronPort-AV: E=Sophos;i="5.82,295,1613401200"; d="scan'208";a="31275550"
Received: from mail-os2jpn01lp2056.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 10:04:09 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HX8ohXZd65DmMUGjPfR94a+h50c9wAJMjPQeZcYmxL6Elj0NWI1KxllUd8dC+0AuaFN2JdO10sZsfsu30IVT4GaxUF5mHOqUdBS5iC/e7D2xDHzfII5zY3yCa/Tli2sCsWg+MPy/7OvvBkf6M1ncpvvAxP5LV01KJVlxgPnFYlrb0a7LSW9ZaaJRQRX/yJ+gyQ3It3ZFUmo5V6rPpnk6iMdrzla5imNEBlHQoevCgQ7q/ITiHEWmQRt2IYkpDv9N5QQWksbMfnC7ArnBkld/xqVpwidExDJK+gsbzhYb1ybqF5qIuKwKCUZD6J8rhCyGj7hgeA8xPYBHB4B4pL2KxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qz9ctpbXiH8TplVQX74v5KXW9xUTqnbwT2mdDrKocCA=;
 b=khFCCoAsG/rF9QZ/qd81y+3gK1gjQ214Cf9XuEd81S+LR/nLRb3aeG6oZ7HimAGdHzopNYpt2KyRqrUx1voSiHpOZpnz+PVP3SKpovlCymCPglGCH8w88vaVHWbA7s2gZ8AynNVO7Y6cKV62GO0SqFzcxXf6UgskMpyl2cY9zBwDaANahCb53aCwQbIm7dc0DE+VdsqDIp+So7F5nPoR42i1b/h1avhsEbSApr4ip65q2rew4X7AX21Xc2TnASVHdVHDbmx6b6bQZDdjJlBvpUAQK3EXI96xwPxD76hKT/DKFP5T9Taglbxzj0pbSoo5dkXsVPvA7egseKMCHYvRdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qz9ctpbXiH8TplVQX74v5KXW9xUTqnbwT2mdDrKocCA=;
 b=CIcPUSD0x97JWAx3dlN3mdOX41AFEnZ0SgXsF5wqsI3ZXVDNl4nN7OmXW95SlEmbdV2njhjaB5FYESHkmy4YZli3++4G/V4kXL0AvCNQSKwdn5fUZ0MlMFT203NynCmKHXwBRhPNX3nPIotal2NtS4dfPWDCnQYSWti7W6s+Eps=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYAPR01MB5564.jpnprd01.prod.outlook.com (2603:1096:404:8035::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 13 May
 2021 01:04:06 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::31b3:92cf:6a2b:3531%6]) with mapi id 15.20.4129.026; Thu, 13 May 2021
 01:04:06 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] RFC remove README.kernel_config
Thread-Index: AQHXR0SWScecaOLWzUiGCOL2lj8lUKrgmVsA
Date: Thu, 13 May 2021 01:04:06 +0000
Message-ID: <609C7B26.7060605@fujitsu.com>
References: <YJv12RslhxorXEf2@pevik>
In-Reply-To: <YJv12RslhxorXEf2@pevik>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e53b13c5-25c7-4826-1464-08d915ab01cc
x-ms-traffictypediagnostic: TYAPR01MB5564:
x-microsoft-antispam-prvs: <TYAPR01MB556436EB8591DE2BFEE40506FD519@TYAPR01MB5564.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rvw2ZmTQosz+oHjkAPOO+7+SEqNUJI3KA4Ip+2BkR/UtBDgjpdu+5fm3Y9GzVt1F2I3/llRFbLpJNIyJVIS01FClGPzjKfp/VFhDiw3wRiFDLWGeEwONmFQGP79t9f4zuN2MNsUURnj5N02zC+WPAXzphb4CX3nJbBX1eQy1O6nqrTTmhF6BcEbWOW/FgqpUyi6bsq5AvN9JHSpPMIogr8NNrlQnyrGnCxUthHFZ4kg+zctanycTfZzYgvfgz3wnImZxJt8WwVV5x3AiQcWAxEygb1lfvIj4Z7xYN79JGT/pTgRFtecDmA3p1vuMPQSamtUXOcOz5f4qNzWmDkaYtWO7kkNlcPRdTrdiPdSHvNQ8Kq+f9p8Ch6gm3L6umAEdadgB0lLBNQ+sKrMoWq0Aj6nae7c6rCUwCBNmK6MpPPfUnWMjvYxHqvYcXoFsdkWjvSEEXu3gBbtFmZ9pcaM874DezoR3qAzjRtPCpZhDv1r+4iOZYlhOnpZeF6LVQ+0IFb6SBAgIt7e6los1JQpsrGopW21xVOmL5r0JXxy7bAMjI6h50xP9RATFs70o3fRRRr46oaLvT+j89/w8v4W+baVUICz99to2WAhtEOVSjx4jlTa22MbMD7gJfU01cLkh+7OG8oyin6R5iNllJFUhOSRMGCB2Rq8y5nJU7/Og/QbomaTQLZc4CW+XIVRaA0Zz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(36756003)(316002)(2906002)(33656002)(2616005)(122000001)(66946007)(8676002)(6512007)(66476007)(66556008)(66446008)(64756008)(85182001)(87266011)(4744005)(5660300002)(26005)(186003)(6506007)(38100700002)(966005)(83380400001)(91956017)(76116006)(86362001)(8936002)(71200400001)(6486002)(6916009)(478600001)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?Y3lEelBMeVBlalJBY1doRWh6aytGRm9YaDhSY21qMnorTlcwQTkycDZ6TXF4?=
 =?gb2312?B?bmJxMW9KL1NiMjJJazE4b3lXOHdLUS9Ic1BnKzJySTFXcCtnMXkyeHg2N2hJ?=
 =?gb2312?B?aHY4M1FqRG8yemRlaTIvTHpGUUg1UVAxRjdidWlob2NhZTJwNmNBclB0em91?=
 =?gb2312?B?S21IMEJycVdXYzBhODVOTjVNTUJHY2RoY3paQVc3cWtETEpGZHZrR1ZQVDJF?=
 =?gb2312?B?OVAySzdEckgxVm5GUDNKWHZ0NUV6STF0bDg2ZTdLcXZ6UGV0OHo0OWcwdXNj?=
 =?gb2312?B?OVF0Qy9TaVVlTnVPSE9vLzFuZHNnd3RsSHVrRlBNYVRsZHNCT2lxWHAyMlg4?=
 =?gb2312?B?c0w5ZTRnd2lTRkxTSUkxeVVXbVZHWGdIR2wrbjBTOHhsT1d3dmpSR1dnQk9j?=
 =?gb2312?B?SXNPR2F1MUEwMXNPanpPaEVHR0g1R3ZmNkoxUm0xVVJrbVRreG1xVzVKYm5P?=
 =?gb2312?B?aVNLMExEUDcyWHVUczZWV2RmSnUzdzNKdmZjazFtaXdqMW0vZndvaTdBR29Z?=
 =?gb2312?B?WDNKS0tFb3oxYVZwRitPRkJzci9GelVPQmMvQVQybWF5OU1FTTRnUVNrbnZr?=
 =?gb2312?B?TmNVVnBwK1ZSN1hwNVhWNStNOWI5cnZ1RFBkNE43YU1KVkZRenEzNk4vU1hX?=
 =?gb2312?B?OWFaUWVvWE1RZGEwZ2ZEWHRSUHpOOFdveWs0Y1dhTHVWdkVmWFprelB5UkNk?=
 =?gb2312?B?NXl6QUlBdDVCcEdGbjBlOTBKNzFMejg5clRIWXNrd2pPb1IvWUlCZzk5NWov?=
 =?gb2312?B?bmcxR0ZiRERDM0dmODcrSVpSSjBKV01JUGc4RkpkMWhlL2JtMzNjdjB3WXhD?=
 =?gb2312?B?VVRLTm1uQkNBTGxZTFVVOEhPb00xcnZSMmFIamRxQldDTCtGcEdwSWdSRC9k?=
 =?gb2312?B?eU5QbE5NSEtjalI4bnJlVUxmTDhMYlhCMVI0VE5kMkY3Sm1TaFhka3poM1RG?=
 =?gb2312?B?eDh5cWp0SUErUHNLSVhPc0tKcm5yaEFyemd3anEwTkZzcllZRFRKS3h6SWti?=
 =?gb2312?B?MjhiV0daZnp1MWl3cGpBbmJZbGJPSzhXWnl0T2Q0TnZScGEyaFA5OHhmd0pD?=
 =?gb2312?B?M1dBOWNCK1E0VFkydU13MXh5MHl3TnUwTEx1Y0Y3dDIvQzZGVEcxZWFKV2VO?=
 =?gb2312?B?S3lHWjFGa3ZNc2M5QkZxSUpoNHlHK1NQVjljYml2dUNNdzIrWE1XYXJpYmE0?=
 =?gb2312?B?Yk5IVURGQTh6QkdSOVdSQjRCWU5PRThpTWZHQ2VRemFReXVJTW1yUnhvZncz?=
 =?gb2312?B?SHBmZUxrb05TaW90WGZOQzcyWktybDJ1VTlxMDI0NU9uYXRTamZCNlNmY3RB?=
 =?gb2312?B?WEtxYW1PRUNERmxPNXVLZXNESzN4QnFxRGhmNFdRZG5RN1Z4SHozK3lmT0VJ?=
 =?gb2312?B?V21pbU1vOUVLSjU0VVVwUnp3MHJKYit4Ky9KSHpoK2FhTDU0VGM4UmkyMVgy?=
 =?gb2312?B?Sy9SYnpGTFhqcUtLSGZuWjRCRW1YVnAyVThoM3NYeGJtQWtZR1EyNzdSR3lP?=
 =?gb2312?B?ZlVGSGRUSFZlNU4rZVBoZDF5L3RnMWg3M3FITDBiNlFuSG13Nyt4aWFYbFpp?=
 =?gb2312?B?dDNqZGFyNU5sc1F6WndoTTd2aTRwNXFMVE9mcVlNM0tJaW53ODg5eDhFOEsx?=
 =?gb2312?B?WW1ER0VYVU9kODd6QkdjbjVJWDJ5NnV0aGZzeDRsQTNLUHhwbWVzSXY1K3RM?=
 =?gb2312?B?RFBuYU45MHRIZlY1MFRiMncvdm9jVG1VK1pHZkRMeUZBSjFpVmpIK01Jalhq?=
 =?gb2312?B?NnB5cXhGejU1cFh3ekR4R2dyZ2hhUWZtY0tBSG5Ld0VXZ0Q5NEppWm1CTFpy?=
 =?gb2312?B?M0pjQmZ2SE9pVC82T0VWdz09?=
x-ms-exchange-transport-forked: True
Content-ID: <A4C4A3A325147046B605142FC215DBBF@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e53b13c5-25c7-4826-1464-08d915ab01cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2021 01:04:06.2651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2wiiEgvY4WE57I4UnsNlQfNbHpEzMz2XHwoUcWbZk390qWdwnKgXzXsJzcR37xklWZjg4dalMv5bg+o1ZeGOsBa7PfTH+X9LM3vLQprFm5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5564
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] RFC remove README.kernel_config
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

Hi Petr
I am fine with removing it.
> Hi,
>
> does anybody use README.kernel_config? Is it useful for anybody?
> There is a patch [1] which enhances it, but I'd prefer to delete it and replaces
> the content with .needs_kconfigs setup [2].
>
> Kind regards,
> Petr
>
> [1] https://patchwork.ozlabs.org/project/ltp/patch/20210302073248.10204-1-pankaj.joshi347@gmail.com/
> [2] https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#2228-parsing-kernel-config
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
