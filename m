Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB3333EC19
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 10:02:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 855303C2D4E
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Mar 2021 10:02:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D7AC53C2D04
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 10:02:00 +0100 (CET)
Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com
 [68.232.156.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B4BB21000EDD
 for <ltp@lists.linux.it>; Wed, 17 Mar 2021 10:01:59 +0100 (CET)
IronPort-SDR: IW1c9G9928fEumD2rXCVYyttH+1/VpticLTuQaqIvWG9WLoPS52G21g4YkBWesNIOdFmjuzhJp
 bN8ygtdrEU01l0P/QqjgIb17jsaPaMOlrqqhf4lDcIQaLlqDlSb2J/Na3PUNPlR9btLeNzdP4k
 1G5HfWBV7bUKQIQZRBMGubn/Mybkql/eZZ27imYxjykj//brQvUZOS/q//wiRQSG4l20rxwgiX
 6dhoWCZOKr2SNdqUxDpG+XG/mPOuhWVsZvxFHHJRfTwV6b9qw7qzQB78mgs1GaSp2mQJZoKelj
 sTE=
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="27922360"
X-IronPort-AV: E=Sophos;i="5.81,255,1610377200"; d="scan'208";a="27922360"
Received: from mail-ty1jpn01lp2057.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.57])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 18:01:58 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdxOGyzdkyHT94JRA8QdMNVjkjquVCgEhDtRGNN7DpGFXHrcOZAEgyLO52VXblecqxi8JF9ToPHtb+VlSJiWyC8Qxf/nzpW540ogzoW1/nwRvjoMSK8jAuvPH3w0YoKjSM+i8uAhuYs6E6ipNAD7H5ZoeXC7e6DsCcHxg4dMuDDtuENVARLgM/7sbSSM5ykI46SFU4eYYvD1t5MG7CIcvPZu9efZrsWSDg+jl9cCCAjWj0KklejCeVb9PBjuljT8bukpkJbxmLcZ/0jIgxwfiWicQ/AkxiMSdg1p4WgZnGRswg07vFeTgup/Q1ZN+7RfwDLOLkbint+7pZuu7OSAww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqPKZdLaMloUiH4Kpy65TWj+LHQ69PnYlDNVA0i7DYo=;
 b=N6LqTqfVq0UBd7Tohqy5Nr/0i69P2fB6g8KSe0FnS9oF4xvm4p2mwdcZytJhW+9WOFDMUQWvia0w1ETEP4lpN7m4prb+o0ZDreA+yLXkA9n+U9Usn/MZ/mrFQePiwE/9rI7oSINalchVR8QnmWXODmNlpGKxifdTIUDBLuV7lCqG+1VD1krVlbx9lOxFIzFgUKgCiKOv2jDo+R/wIqg3+3lhHrbUl17YnJzH6TPiUTuYtU+Il4g8aqtTn8kV3TxEp0eIO7MAX2287vPgLQSxv8QUZOFjSR77wOH1qEv999JR9Fi9k36+TKBsQNwfUP/+lcFZjZrT62S5JUSz7hrOOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqPKZdLaMloUiH4Kpy65TWj+LHQ69PnYlDNVA0i7DYo=;
 b=W7px9BUzVJ2yfiUw0NHyHVPdNV3yiGpaGStc9DNXX89MGd8z60srfAqEOvFmEk2iWmuia8gmpwkyqqdlX63YeMpHgUOtzVlvgTEosabNQ+APD4K5GXdV1DgUSiG7wFPYyFR9Z1cPkY8kFh171/Yx30eqGY/Cx+gxjG0Vv4Z3YVo=
Received: from OSBPR01MB2920.jpnprd01.prod.outlook.com (2603:1096:604:18::16)
 by OSBPR01MB2919.jpnprd01.prod.outlook.com (2603:1096:604:15::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 09:01:55 +0000
Received: from OSBPR01MB2920.jpnprd01.prod.outlook.com
 ([fe80::6978:444d:b74:e04e]) by OSBPR01MB2920.jpnprd01.prod.outlook.com
 ([fe80::6978:444d:b74:e04e%4]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 09:01:54 +0000
From: "ruansy.fnst@fujitsu.com" <ruansy.fnst@fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH 2/2] syscalls/getppid02: Convert to the new API
Thread-Index: AQHXEJwBTRUbxurwdky0Ggswso+0O6qG5NsAgAEQ8tA=
Date: Wed, 17 Mar 2021 09:01:54 +0000
Message-ID: <OSBPR01MB2920359890156471406C642EF46A9@OSBPR01MB2920.jpnprd01.prod.outlook.com>
References: <20210304021304.1126635-1-ruansy.fnst@fujitsu.com>
 <20210304021304.1126635-2-ruansy.fnst@fujitsu.com> <YFDfbrziEwXgxpOS@pevik>
In-Reply-To: <YFDfbrziEwXgxpOS@pevik>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ef964c2-1467-422c-6b31-08d8e9235019
x-ms-traffictypediagnostic: OSBPR01MB2919:
x-microsoft-antispam-prvs: <OSBPR01MB2919DF3C85A2E759561E3C0EF46A9@OSBPR01MB2919.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NBGZFu5QE0+RyWqAbuLB8WyNlo8dXP5iUHbjLhi7Enm8AWoMg08W4qJpm9U+zNZvshSXXh3QMdnEQAIa1eJqKE+DyUA4Zd5fEFOrXI3CE6bgNnfS3ClyXoCcUzARyicetWXAShT75U00+taPy6zPv43/4HMYYMoXJiOhQnBbeQ+CHmqEglotkEOVIecSqmBc1NqIcn3v+KNFWVYxFd2qujVNmfGBNWhG8sbhspNzeMt5xMsQkt13dPHlJ6SIjciX2AVhjefH6IZL/oWjAS/3Orx8BYRbnOZgyxcIfVFFUuT2JLWoCdOiPH2UPvGI30aAJHN/qCHG7v55YnCkIHbugATFXOVtvLofl59ZFrndblodCaO38E2O54qHzioClBuXlrg679nL+n05FAKxYRTE4gH5g1cLYMFbfu3jKIQA6to5Z31y9bOLyXOvcfIWx5iOfVbl91I2m9Ay78lGdNTT5FK8GKUkVqb6ZBjD2zgmWvmPCbETBB3+7+1+9xEM3x7vRD6SgqnP5Fr8YBandcNHaHoXaHBvBPrDxvMVw8jS5y+GUpknZTj6BBtBeJbV00kM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSBPR01MB2920.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(33656002)(86362001)(316002)(4326008)(83380400001)(55016002)(52536014)(26005)(66556008)(8936002)(85182001)(186003)(71200400001)(8676002)(9686003)(76116006)(6916009)(6506007)(66446008)(7696005)(66946007)(66476007)(64756008)(4744005)(478600001)(2906002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?bGlvSlpmS2hhWEJieWZjZkxzWmxSSy9vZ1ppejIxRVZwa1dxTlVieEhNSTRl?=
 =?gb2312?B?Tnk0VVVZdE1vUEd4aHdPUURoUTRoamw5VHFPdnE2bm5LcTFteDhxSU9RRytB?=
 =?gb2312?B?MWNVbmFxcG9tMWlYL3dBcjJTU09GQVcxUEkwMHJTZ2VNN2lJaDFnZ2ZnWUg4?=
 =?gb2312?B?K01naEViWDZuUEd4SXhVV0RHdi8xYTNJNTJpejN6aGRaTFEzejVoaTdWU2sr?=
 =?gb2312?B?WDJIeTJJMEhtYmFvbjdWdGZ6U012eEh0VFNwcnZhbUJtYkFYZmU5Z2p6Z29m?=
 =?gb2312?B?SHovZ1pUUktIR3FPVFJsVnVRelF4OWZmbWd2bEpqcW9KeEJOS2NkWGIrdDM0?=
 =?gb2312?B?K3MxMk9iTEtzTmNqMGI3TStHa3phYnpSaHlnNWc2Q2hPa2lHdGxybXJSVS9T?=
 =?gb2312?B?bVI3Z2dRK081SzBteGN4TkxFZ05pM2tHMDZzS2hKbVhncTNocHc2K250Ymhu?=
 =?gb2312?B?SFpIaUFGVVdvcnB0YXo3Z21wdVVDVE1YeC9WNzVNN3RYSHJVdEh1U0Z3WTZW?=
 =?gb2312?B?RGx1b25OTTdFcWxSeXVNNzZmOXRFZ1h0ZFBKT2tVQUk5MDd0K1dhYitFUHRR?=
 =?gb2312?B?eGtjTjVzazlFMUQ5V2VVMEt5L2ZTNzBXUVVqT1EweEQ3dTB2RVgyUTd6TVhN?=
 =?gb2312?B?bVRZdDdpUjJwOXQvakZNQXZYSlBTK3VwM1NIaDBhVHFUeEoyMjBlT2lYTW5H?=
 =?gb2312?B?M2JLdDJPcnlQQWFBK2QvL00xcm0xWitaa1ZxakFwSXRMT2NHb2RsUjIxd1NP?=
 =?gb2312?B?WHE0N2duTjRzK3R3bzdWeXR1NlQrQUdLQkp5QUREQS9VSm9uYW5seTdMR0lt?=
 =?gb2312?B?d01RdjJGYW82amJ5OFRPY3ZUNFpqL0tKV0FYY29BOHB1RnZaaTdlSmVNUStu?=
 =?gb2312?B?NGpjM3JkSmJ4VVArTUNhMVJNNE53TThLZWhoNVlkbVpMR0ZUdXRFNVdnWkR3?=
 =?gb2312?B?Ykt5QnRVYW40WGFjd1lQakJyLyt5SWwwMjl4VS9xMCsrVTIydlZTZTUzeHNv?=
 =?gb2312?B?NnFVRjMzaktxb2RvSVpkRlFBNXFlb3NtREloYmVLcTNXQVBnTGhQSXp3ZTRs?=
 =?gb2312?B?dnBTSmpJUlRuM3JJa1M2ZVNKWGMvdHl6Z3dIKzlBZm1lMmZJODhDK245VjhJ?=
 =?gb2312?B?eE5tbzRkc0YvWWtxRW5mV1lSWnNGNXV6dmcwcUFIUVRJdkhWelZrZ2V4VU9m?=
 =?gb2312?B?WVQ3TGt3ajBaUmEyd0IyUXZtaHdWOEtEWXN2VlRCR3QwUmR3YVREUzM4TGJF?=
 =?gb2312?B?Q2NLZlZENnp4eFU3MWx4TVduWkg1LzFKbm1lOGs2LzExUXRINHhMVVlPY0tN?=
 =?gb2312?B?R2hvVHA3TXU0Mmgrc2Y1T1o3M3M1K0lwN1Bnc29xd2FvQ2JzandMQU40M2Fu?=
 =?gb2312?B?Z2tuZjVUQlBaeFdpOWtzOEFNM09zNjNpakFoQUFFN0wyS0NKRytpWHp6ZlYz?=
 =?gb2312?B?eWlwYUkxa0pnVnJUelFwNnB4MFBKdmdZSUxCdjB3VXk5ZEhDN1gxZ2NvU1pG?=
 =?gb2312?B?V0JvM2hpV0NBWDRYNXRNQ2MwQTRucmlkMHRLMjV3ZDVVY1BuaWFJNFdaSjQv?=
 =?gb2312?B?TnllTWU3VFRENUVDd2w5VGVtNk9zeTlrMEhFSVZYdEpBSHJ1U1R6bTg0UWZm?=
 =?gb2312?B?UThtVjRkdFFOMHF4YnBvUmlIRUlsTERndHpBMkI1Y1BGRzlQeVlXeUJSNk9W?=
 =?gb2312?B?SURKUm5nTzltMnZKb2pUNlVtd2NDV0ZWT3dSZFMyK1M3VXFpaUxsL1pmSFo3?=
 =?gb2312?Q?zckDM9cEPAdJv79nl0nESVxAAjV9VJMNTeV/D8s?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB2920.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef964c2-1467-422c-6b31-08d8e9235019
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2021 09:01:54.8736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0mYseLBUmPZkztWLm0H9MeNiPYQTtuXXwlUS54ddWTIxttyEo48h0OUFH8NhLmcxklGD9ZbDOHJHbnJX3jmuhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2919
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/getppid02: Convert to the new API
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



> -----Original Message-----
> From: Petr Vorel <pvorel@suse.cz>
> Subject: Re: [LTP] [PATCH 2/2] syscalls/getppid02: Convert to the new API
> 
> Hi Ruan,
> 
> > +/*\
> > + * [DESCRIPTION]
> >   *
> > + * Check that getppid() in child returns the same pid as getpid() in parent.
> > +\*/
> nit: this should be merged as */ only (drop leading \, see 96e964f97 ("docparse:
> Use C standard comment end").
> 

Hi Petr,

Do I need to send a v2 to fix this?


--
Thanks,
Ruan Shiyang.

> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
