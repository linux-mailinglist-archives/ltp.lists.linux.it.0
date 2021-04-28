Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CC32E36D355
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 09:40:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B2DA3C62A1
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 09:40:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3C1573C621C
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 09:40:47 +0200 (CEST)
Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com
 [68.232.159.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 035AD6008DB
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 09:40:45 +0200 (CEST)
IronPort-SDR: 6q8Y/KqIlkUOfWcyY4uz/YbVrfV2hnz5JB2kE+1nkuM+5Q2Odj+VoMhdsG1mZyMMr6ia+PHUFg
 eGrqG6Eq3KynDSCYYkN9r7X/k8GN7of4pGi8Ed5qYt1CYDD6nPiRRFwKpMLOvZaSeL7zpydsLC
 BHFyLHdFUnEfJ0p+CUPfYJZUDBJzEIS6DANR9cux/jx4CC6CDcwtI4XKGYNQ6V2u4bB9d6fDE+
 jDrXcfBjgAEn+SlXVLtHQWAJTnNTCnCbxYy9X4gscM4xUh9u5axr7H2nL1LXc+2NK0phzFGNwI
 UII=
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="30551089"
X-IronPort-AV: E=Sophos;i="5.82,257,1613401200"; d="scan'208";a="30551089"
Received: from mail-os2jpn01lp2052.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.52])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2021 16:40:45 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHg8jsgXNIDiRwMzo1Ejuj7eVLZVdSCyHfqQ0G+y4NIFCqjXYYXKItevR2voybcK/AZm8uSvgTlV/K8CdB0wGVK5nWVD1i5+Xb6GlCPmMx5o5CvnrA5kv207SG4JFZsjaIk3VDISK0ZtIw61IE5FWhLuvuJ8xgxciSNfjbH+LsY5WFl2KtsKsrgi1CKZnGsCeVzxI7fpojzIiKuUR5XHExKqLVONIEHHKrhcF0YcYDTP5SfbQw+ESc5USjsdljKXTKPM/n1SKIFl74b7c67NiDIS0aoebbjPC3RDrTZINTny4MGAKQdGaGZaicWLptzhv0vwubOl8RFRVTdiFDUR/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpGUgnmZLS5TvjCbM5w1Tc0s/Axs5C/LGtt9SCTIwqA=;
 b=YfbgS3k4f3ScpC7Bay3SOngsXr3MHInxaLXwAb5Ntq9tD3fPY1YDVDzBXW33MZ6uxufzLg7e5lH1aIoFARerY8qlvLyrw7srrdu1qvUysmGtTS+wf1QNhfnPHv3mwFq3oZ2Vi6ZZJZeunBwNXRn7DbgepQTW0eYKsQoYpkdC0VjpxNO1Fs9k2rPY4PLc/U7C8x0aaeqTpnKONLId1Zreqg6oOFZlDTg1kyz1o2mXxdArryDcwHP0TIkFyN6/YX4PXzYoLnf89XYNYyR0mTuaszx5tWVUFKo5DWubMaD1rjGwMu51wywWGiEP04+X2wCOGTpm5kLKTbugFqnSOEVZ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpGUgnmZLS5TvjCbM5w1Tc0s/Axs5C/LGtt9SCTIwqA=;
 b=CbIeQ50AH09ThuhvehioxAdiITR/FLT6oagRTsY8Sb1yKGpuZPo8xiLU5pFipcemFP+MBox131/NIo5YEmiiunl85S4cgwCDJ9XRNo5AfXobtAh10qdyNn1YSGNR4uhNV66KMCYt5CUHZ+Z8QC69AJWN20waZXAZdMe3ScAN6SM=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYXPR01MB1823.jpnprd01.prod.outlook.com (2603:1096:403:11::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 07:40:42 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.4087.026; Wed, 28 Apr 2021
 07:40:42 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: "huangjh.jy@fujitsu.com" <huangjh.jy@fujitsu.com>
Thread-Topic: [PATCH] runtest/mm: Remove mem03 from runtest/mm
Thread-Index: AQHXO/N09NtQ0t4q8EOKd0RMSrAjbKrJi9CA
Date: Wed, 28 Apr 2021 07:40:42 +0000
Message-ID: <60891197.60306@fujitsu.com>
References: <1619589411-3349-1-git-send-email-huangjh.jy@cn.fujitsu.com>
In-Reply-To: <1619589411-3349-1-git-send-email-huangjh.jy@cn.fujitsu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [223.111.68.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32374dd7-82b2-4b00-daab-08d90a18ed22
x-ms-traffictypediagnostic: TYXPR01MB1823:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYXPR01MB182318DFEFDF17087E473C5DFD409@TYXPR01MB1823.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 928+V5MGvAEeHjKJleKSjSpT1+Ri0pBMXgcTJ1zNaHCMqPUwV2klbEPnLEHF4D6ZYKcSAEmRY6km2c34I51KdR2M7CU6nGQ72TkagbaS+TFgkENj2P9qM8fyDnniEEyoDjU3Nc+FhkOBs6QStHWLjmZ8NN7YavsJ2kyKdKYh36lQ04ohnZZDxLT2uZ1zWsdMm9okYEICA2AJc173yBdHY0TfJShcQZwQIrk1KifqwKLyrWr8SEtjKcW2HYz96UZN4fOzkJDJxgbAmgsqfKSGBhWMz7pyGiRVUIpvnwJji9h0Qs9oBDH/KPSDjlRxmaU1Zfvv5AhhkB3HXsE0glniWMddJJbaTrqEW9FSE+Tzh/ho1OFQKxsqw/Wr4NGE6lbcwlBjnkzm1MZY1LOwXYecbIBJzOtZi1mPT85g6RA5JUjbX4t6U2ikkejNjUCmQ9gi4Ut81BqVO/cNm0k1pDt+m533VxM/NhNjli1q5wlDH+xCbAkMqc6UBUiN1UPdAf2JMygq1Mjwc8dhprpg0xqmIOyjMzxFrIhAVGZ42kb2f78fUFkMBrQLX2KTt58NqEMbQK9HRj49jm0VpofS+1oxRFAnY4PEZNNm/n+iZ/fObJyOvrhzD7F4DNgeTryLSAHZjqrxFCvTJPH50WdUZFVCpg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(66946007)(76116006)(6506007)(91956017)(4744005)(6512007)(38100700002)(186003)(8676002)(6636002)(2616005)(8936002)(83380400001)(36756003)(66556008)(5660300002)(71200400001)(6486002)(85182001)(316002)(26005)(6862004)(86362001)(64756008)(478600001)(37006003)(122000001)(4326008)(66476007)(66446008)(2906002)(62816006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?SDlsdytnY05MUTVscWxmNTVxR3JFM0J6S2FWMS91a1AwdVRjbFV1ZUplQXV6?=
 =?gb2312?B?Tjh1VjJoOUp5M3N1LzNjdG5SYWFHREZsL1VVOVRGZHhTZDZlNzZ6WWtNN29P?=
 =?gb2312?B?NFc3dkx0OXBrRXFrSnJWcDlPRDBDSGlOQWtuWTRKTmo2SmhtcEdJOU5BdmU1?=
 =?gb2312?B?elBBVWNQamxnVGgvOTdQMUo0QjJtdkh4REo3RGRtZ09kYlF6N0E1KzNYRjUr?=
 =?gb2312?B?djhWQlZQMGpkY09RKzRNcDAwb3VoTjFSalhXOVFNdWJ2T0pQMUZkbElxZjJG?=
 =?gb2312?B?czFTaHBTRXBoTnRXVEVJanRzcXE3d3BIOExWSjJnQVRITUpZSjJHWXNBN0x4?=
 =?gb2312?B?UWNpbGZ2ZjF2VnBrTExEdlVyZWlNbVc4TklZSzA3SDBxRFUxYmlZWEc2bzdP?=
 =?gb2312?B?STdqYy8zMHkyWjBYcWVsSlhTenVhN1F4RFJvRXVkYWM1WEViaDJuaUxJYkxy?=
 =?gb2312?B?NTE0bDk2aXdSVmNYNjVGR0dFQWZ0TFZiNnFTNVBhN2g1eGhvOWdraTZIK1d1?=
 =?gb2312?B?TVMzbVpDN3FVOWdCcmZxQ0o3aXlZejIrb2lqZzZvS2NpWmF5L1lVSVMyeTNN?=
 =?gb2312?B?YWJxU2Jra1VJMmVLVnlTbDZrN09HS3VNZTBVTlRJa01mOU00Rk1QWTZvMldp?=
 =?gb2312?B?Q1dEQjk0bU1iL0RxOUJxUlFtWkNYV2pRRHVqTXJRckppZGNnc2NydGhPYVYv?=
 =?gb2312?B?bmdMUzJSVUc3ZFZ3Vkd6ajA4UTFvb1Zjd1Z4Qk1QSmZpdjRCeGZ6WTNBaXpr?=
 =?gb2312?B?QVRpSk14NUo3R3dHNVdNU0hyV3pFdlhTRERLcDlaZ3NIcFIzREIwWmZwbTJr?=
 =?gb2312?B?Zi9BMmlSQ3dpQ2V4UW9LVFRVaFhqWlFYSG92c3YwTW43MjN0QmpUN1hYYkc3?=
 =?gb2312?B?ZTdOS3RkSmdaT1lmdWduR291ZEhTVUtjQzVDWC9ycmpVR1drZ3R5a2I1Qld2?=
 =?gb2312?B?azM5MFpZUUtwOUhXU0tWeWNrVTVXUXpLdURhZC82SklPOXc1dlpGNUdRWXJQ?=
 =?gb2312?B?d1JDcWdsZC9XSVg0cDQyQ0RpTnQrY0h5UmtYZ0tENm5ZbFB0bDAzWEN1Y3A5?=
 =?gb2312?B?cjVIQUVuSlpZdWtQNE1hYVUvSXFKWmdrL2VBNUdJSEt2Qy9MOWxtQmlzUUZD?=
 =?gb2312?B?bTg3TVpwVUR5ZUR1Mjd4QzhIY3hIWmNKL0JLbUZ3YkIvSmRRNDFUdGRISnB4?=
 =?gb2312?B?MEp5U0FEZHlIUURFanF3eVVuL3VUeXZHZW9ZdWczYXcwblcwaFdGN3hPRlpv?=
 =?gb2312?B?Wnc3Q25Xam4vZ1d3L000M1JEczhQRmJtNC9uVFJwdWEyeDlpYmo0YkIyYzFj?=
 =?gb2312?B?YU9NeXMxL1NtS0FmTXpkZGxYUyt6Tk5XUlFEL1VHdGpNdTdCRjhxNUprUVNw?=
 =?gb2312?B?Z01sb1hIaXkybjBtZXE4ZzU5U1diUjlvVDN3V3dqY01TNXh1UFJoam11TzBi?=
 =?gb2312?B?VTVJa1AxRzcxN2R0RkVPR01BMEd0K2h6eHFuS1lEY3NleFJrVHV2bnB5ZXk3?=
 =?gb2312?B?WWcwdURRSGNoaFRpcm5qdCtPcXBLOUtzaVFlM1B4dWVVS0lCS1BUcHFjWFRj?=
 =?gb2312?B?ZDIyV2k1WHdpUE5xZnpFMXhxYzBJRHhNbHFJR0ppUDhzakUvRWJOSStzUzF1?=
 =?gb2312?B?SFRsWU5zR3BQTzlVc2RqdFZuZmgxeFZIeU9QbW1wYTRiY2RvZkkzUGpJb04w?=
 =?gb2312?B?amxvcUcvYWpVVTlTRVl5TGt4bE5xODB2QjZBcWtQbEdqdmRNc21IeDVJWW05?=
 =?gb2312?B?L1Y3cldDditXN2FxSElleUg4WXRBVXlNb1FPb2JmZGR0S0lvdXVCZDFmekpu?=
 =?gb2312?B?a0w0UnQyTCtxNklmd3prQT09?=
Content-ID: <1DAFE85C7917A44ABB219D38B3C69205@jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32374dd7-82b2-4b00-daab-08d90a18ed22
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 07:40:42.2856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v3FldRw8rEeoUGUB/QzuglceogfbcvFgMlgYFuNp95qixDNXBSOS3kMbPaFhtrgTmKcyyANnCkTqB2gZ4jYMlsJuxcHFNRA7nUr6ojWnr18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1823
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] runtest/mm: Remove mem03 from runtest/mm
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

Hi Jinhui

Good catch, merged with adding fixes tag.

Best Regards
Yang Xu
> Signed-off-by: Jinhui Huang<huangjh.jy@cn.fujitsu.com>
> ---
>   runtest/mm | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/runtest/mm b/runtest/mm
> index eeebd87..6537666 100644
> --- a/runtest/mm
> +++ b/runtest/mm
> @@ -21,7 +21,6 @@ mtest06_3 mmap3 -x 0.002 -p
>   #mtest-6_4 shmat1 -x 0.00005
> 
>   mem02 mem02
> -mem03 mem03
> 
>   page01 page01
>   page02 page02

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
