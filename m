Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 767D13BF786
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 11:23:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2BA413C89A3
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 11:23:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D09E43C2A8B
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 11:23:05 +0200 (CEST)
Received: from esa2.fujitsucc.c3s2.iphmx.com (esa2.fujitsucc.c3s2.iphmx.com
 [68.232.152.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D33AB60085C
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 11:23:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1625736185; x=1657272185;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bNeglMkK1XeJ0Hk8gb76JKkaWj0UO+RNQLGlKBw3sAU=;
 b=CeX8q0hjO+iu0jamrAOA2ge7k//6kwXI1pJSUqbX0LZJIL9H60jMgThY
 ebGlcbNye5/K+Dyj4tu6drXPHfoGvRhUuk7grxADBfHthQaB963yY1wrF
 nynjxRzF3hQJrfrl3ex7OEUtbbcWcBdiOjyYEFUbvRBiDn5GprGH0kYhc
 b9CtIM22IASG4HGZNE8/Zizs2LpmanhLjjzljJCcNr0RTR6okv9Qb0bjH
 1Ef57io0nS0dC/28jaU5LRk70bAMBgMqEqnOwY4XJ3wodlZBHLXeiI4sl
 LRvJqKMLKAm5LlzVHASAVzwG05Ab1lLfftEyyf53RIMevzCEPztS1EQrw A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="42739492"
X-IronPort-AV: E=Sophos;i="5.84,222,1620658800"; d="scan'208";a="42739492"
Received: from mail-os2jpn01lp2058.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 18:23:03 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HX1vI4D98RWTcGexRqSXDAtAcxLbvKQloDOQdrq+4bseprxnyOlbll07gXXX+Y0owZN/rTSCN92tVhA3g1nPYDpOnMbo8luCn0uvhY0DgDhr1SL5ZJOPCjmZ+Fd/JC4xf/OqwnRdN7yjVol/RUf9RBp1rQG3FaCSg0oyocxBcKEZHr+D/Ti0W7ZFuiL0bGh7BAE5WUG5im72ZvVtoLDcCbd9Jol+DP09oc2WxgLX4wHmSQyDOnUfE+c+bShAnX6t5hrlV30casyTar5BcPXxTFS3nw9Hecz2AckwCSWiOFSB+jWxHeAWeBunTCXdyml+Iv+zZ/pd/VRx1NdEHT42wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNeglMkK1XeJ0Hk8gb76JKkaWj0UO+RNQLGlKBw3sAU=;
 b=ersViGuXMWXA1zbx67CmR1GWDUwSptazmDXp2IFN0d6lZQWsiYzNPzEJXjONW+j5XOqAoRuj1aA6emp1eulXjdMK2BHUa5/clK91hHpB4pS3+vfop3DVoKsZt/U4sLiLrM2Ej2FILwKqh8c6ABeOpyFr965Mfn5Z4OmJHtvVDmEJPqFfXg1ApD25XxAGxZbq7D/y0HwzISEoOfY43NufKYINU7vBoRizAU1wVLGGVSXbfxW6RGKbv9MxVw3RbERpZyUtqZmFaznYuUIyibH+3qk/dOq0KRewUDAsfeRjeU65XW/yCE6R2SlCeJD6vo4EboAxHtQatXnt7WIfeYUXdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNeglMkK1XeJ0Hk8gb76JKkaWj0UO+RNQLGlKBw3sAU=;
 b=P2aVJZnEmMae2LmNx85MnY03OW7V8plu9t+2HlSkA2pJeJMFesZuv/w9xXDIKhanHDopkJNlzpTwsHQHeOXgfBYxwSi4ixXIZleVS9soYaI8rcfc9LPDJFEiwNZKrug6dkRFUx/rISFPoDzgxH7vM03hjFznqKRybuuVt4ADJTM=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYCPR01MB7011.jpnprd01.prod.outlook.com (2603:1096:400:be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Thu, 8 Jul
 2021 09:22:59 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::2da1:e1d8:ba88:a4e0%3]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 09:22:59 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>, Richard Palethorpe <rpalethorpe@suse.com>
Thread-Topic: [LTP] [PATCH v2] kill13, CVE-2018-10124: Reproduce INT_MIN
 negation
Thread-Index: AQHXcx9F52xS8XYqI0KcelO+qdOo0as4xguAgAAJkgA=
Date: Thu, 8 Jul 2021 09:22:59 +0000
Message-ID: <60E6C418.2070701@fujitsu.com>
References: <20210707105954.18182-1-rpalethorpe@suse.com>
 <YOa8EfvOY/Po1FET@yuki>
In-Reply-To: <YOa8EfvOY/Po1FET@yuki>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a4746ab-abad-414a-0f14-08d941f1fabf
x-ms-traffictypediagnostic: TYCPR01MB7011:
x-microsoft-antispam-prvs: <TYCPR01MB7011C68D33F2549E732F3453FD199@TYCPR01MB7011.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KqcCc11nJz9ayCDl0H+ZxDPmbtv8Vxq/wGJZPPiFrxQRTdbB9DGSNg2yaZjISX3qUmQjWfBrf2wm8A8k1qtA5B/y5SKNcSv4qJxzzz17+hPhmptJ/tPZxzKHbWo5DRb8HHl9Yk7XfEykMSU5ayizm1Lf/fxlKS919B+D3SkluOqrgduLscOWL3hiKorFdw35c6wqqJK5tuX+pa+8Zv3YG+jVCPxQ1G6nz1EdJBfRJw3DUmrB36MjdiOiz0kH7RbpS6qH289Teq0btur7d9soPVTliuRcnDBlLE0Xfby0AAK8XRBb10kY9Yqg+BM/O//QOrBa4jqaHbDpwaq6nCBTDYBjh80plbgWQsysauBhgCye6t0YWqQsy8bvHIvl2eJQVNY6uv8raUwciLGHVQ0P5BLwTk+uT/ix32ILHXMyCIO1KxA8vI979lUHFJJ+M92mn/Tm99gKE3tM1HAcKzfGp5Mul/T9VgTpX5dycCAJ9V2XO97fN+qF1Q3NEYIIHVKwF+rmoqB5W/nAfhpDILdJD93ShXHSmUy/QfrLAyWmHtSP4RVPtQY/LWyZYvB9WTz3BWzQEF5yct/VbvqwUbUauFHyHSKz7VplZjTuUPof9TgvvAVxI7wrJvRxAO0RIXFuoONXeZPQ9nZqKe8UxwedSg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(85182001)(122000001)(6486002)(86362001)(558084003)(71200400001)(33656002)(478600001)(8676002)(2906002)(4326008)(38100700002)(36756003)(8936002)(5660300002)(316002)(110136005)(64756008)(66946007)(76116006)(87266011)(66556008)(54906003)(6506007)(6512007)(66476007)(26005)(66446008)(2616005)(91956017)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?cUFSbzhkYmpiUnFnRGZ4REpGVUtZMGtRTEhDdW9LeUZ0OWhIWThxMUIySDZt?=
 =?gb2312?B?UFc4NGEvNzNKT3AvZk5kTitBZm5ObzFRSTlKZ25jdTY2MjlPOTQzdGxpUjJV?=
 =?gb2312?B?TVVSa1JEeUMwcHRocEJXUFZSeTJkQU55QWFQNE92Snp6WUx0b2lSeFcrYmhQ?=
 =?gb2312?B?S1FIL2VPaFV2b1pra2xFTng2RVZXcHUvSjFXb3k1bzg4Qks5cmVONFA5QklL?=
 =?gb2312?B?Qk9DVGNaWFdVZ044TXp4elBQU2E1SEFUMzc5cnVRMmwxeVYyVUVtOU15RDQy?=
 =?gb2312?B?OHhVRGUrMXpBQzZVMnM1dEhHcXpKSWpmK1JhT1R2YjB2dnFwRGhLTThjcXpB?=
 =?gb2312?B?TlpZRUhSakgwVGxZYThuWGVOUndsbVBZdG45eFQ5VzVPOFcwK3U5MXp5S292?=
 =?gb2312?B?VTF0SDBqeC9jamw2VG82T3c0RzRSUXFqb1ZlbWtSVG5aTFk3WStkUGF2TEFl?=
 =?gb2312?B?WGVoYUZMeUw3cmlCZnJMcUxGQU9IdVVlZFE2ZmNzSDh5YVk3cUcwbGtERTdG?=
 =?gb2312?B?NnFCNm1OazlVbENFRUVzbFV1WVRuSVlGdDNEUzJ0WHFHTEZQd0RlN0JiR1dj?=
 =?gb2312?B?NkpzSUlBeFZvR3dKaTZ2b1pOUzNVYy9HZ3lTd1Nkb0o5WFVKQ3dEdHFRbTNU?=
 =?gb2312?B?S0RRRHZvaE9JbEtYcmt1UDBFVHRiWlNUZXpNWVYxZlZNTDh3RHBoVldLOXNL?=
 =?gb2312?B?cHBUd0l0SkQvT2JuSW85M3prQTFYMXBLSTMzbng1U3ZYR1pBcHNwTERJcWdj?=
 =?gb2312?B?S1R4c0pJUDdRdTJRRFIyam12d2F5UE1MN2hnRVd1U3ZMTm8xQmVSOHlxbGFa?=
 =?gb2312?B?Q1hPWi9hLzlnZUhXYTFoMXNNWXJqQnp0ZVhpdGhqaTJIR3liNk9LL1NNenla?=
 =?gb2312?B?T3M3MlQ0SkpXUWZiN00wNDg5ZCtLbmtsaW9IYThOZDhkNEhyVDQ3eXFFSUUr?=
 =?gb2312?B?VU5TWWJPa0tKUm8vVGZoeWFOV0xXOHZ0SzZkN1VBRmFpd25KRGh0aVhVMTAx?=
 =?gb2312?B?eDFucnd5WnhVbDNSYmxTalZHMThuS3l4NFUxSzdXWGRzallqbEM0MkYvNEs0?=
 =?gb2312?B?SXJiSXNRTjVnYVdvMEFybk1xaXBlYjhrSjZsNmdYOU1kVnhBOUVGM1RwNWhq?=
 =?gb2312?B?Q3dpQjRnS1BGZ3Y3RmkvOWE4ZlFSVVBsQldOOEpKRVRadzV3RGpiWGtwM2pH?=
 =?gb2312?B?dWR1QzRLQS9EMVg3SnYyUENmak9aNzFCeUxqTk5GZXU1ZWF5OFNTK0xzb0hE?=
 =?gb2312?B?UVpnVmVTM1IvRTIzaXcyMnBnc3hDRlJVdE9obEJSZ3hNUHp3cU14bnhNVFRH?=
 =?gb2312?B?VHJNY1BNbk9lNFk1L1llNkNhUTFKRGJMRzVyUXN2M1hCZzRwaVlHcDlUcmxC?=
 =?gb2312?B?elloMmpnZGphL2NmR004RldJVCtmSFlyeE9JQkp4WjV1cTNQdkFyU1lQWC9K?=
 =?gb2312?B?c3RSUUZlWHFFWVAwNWhNUG5RN3JlNUFZclJuN0Z2RktOekZUQ2w2Qng2SFNi?=
 =?gb2312?B?M29RWVJza2xKUFNiOUFZWmlIYnFBSWF6UUUwQmZweHgrWHhWYTEyQ0RrbFpy?=
 =?gb2312?B?RHdkZnk4M1Rwc2hxc0tCWHV0WTY4V2RlM09NM3hsT1BWWDQyN2NCNUlOV2lU?=
 =?gb2312?B?RnN6SXZXNXBiOWpna0wwYUNpeUJoZTRZOVlwcVAzZ2NBRHhuWkFnRk1naURu?=
 =?gb2312?B?eitlcS94WUdESW4wdHlRZExzSHJIS1UwNEk1SVZrN21FT2FDYXlpTDQ5c1NK?=
 =?gb2312?B?TXlad25pdU5oc1BFckVaMmlBdFFxSE9IOStWc1pUWEZOVHVWZWlUVUxzcGtU?=
 =?gb2312?B?U3Z6cGwxcXVaWkJzbTM1QT09?=
x-ms-exchange-transport-forked: True
Content-ID: <C4E2F85263320A4FAE9E25DB7A7F0302@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a4746ab-abad-414a-0f14-08d941f1fabf
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2021 09:22:59.8777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d1CPJfU0aGltIwo4KAh9pm5njO5J0ZG3F7dkMFMKJx6nWW1WgASAprJrZTb/Hs7D+eYEhw6Cl69DFHNN+g1HDWFmQfTpVLDB3gjlwfyYIHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7011
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] kill13,
 CVE-2018-10124: Reproduce INT_MIN negation
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>,
 Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi  Cyril, Richard
> Hi!
> Both pushed, thanks.
>
It seems wait403 doesn't use correct doc format.

It used the following style.
/*
  * [Description]

Best Regards
Yang Xu

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
