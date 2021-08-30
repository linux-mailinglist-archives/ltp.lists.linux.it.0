Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD3F3FB157
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 08:46:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8108C3C2AF0
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 08:46:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E39C83C0409
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 08:46:07 +0200 (CEST)
Received: from esa19.fujitsucc.c3s2.iphmx.com (esa19.fujitsucc.c3s2.iphmx.com
 [216.71.158.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D5AD5600711
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 08:46:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1630305967; x=1661841967;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+QuyoEbCAb7f1zQuHR5NWC6Ef5BoN85w7b+HmwCVuvU=;
 b=R0itmeZfwmzGyvVoqrWKZO8kNRQeICdPJEiyLtNW/z2/3w/nyEy5Sejp
 8drhMLCKrZ6QjeoqpruvhATdW98xZEf/sx3qk3qMgo+p+Cgr4txqwgglm
 z1WADBbb4xY9JgNcIiwePLa/KZJCfCnAvxdKsHBxRrhWZu97Ak3COpws5
 ndo1RSa4S3+kTs1TWBOSfkncf/Kd8Vl1F2SJugwZMuBvaITIvAUlGZi+e
 UUpRNm9Cjo8y5HHOTVmnOAS535Z05c+NplnQC2EMHel2Q+tki2GPOoRz3
 rA/kRedhx0CU0J9k5t/AUOaKPKpHlrXHyLMiu0BJfsDBrE9XWt0koUQ4e Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="37716172"
X-IronPort-AV: E=Sophos;i="5.84,362,1620658800"; d="scan'208";a="37716172"
Received: from mail-hk2apc01lp2051.outbound.protection.outlook.com (HELO
 APC01-HK2-obe.outbound.protection.outlook.com) ([104.47.124.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 15:46:04 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8Wy/Qr+E0Zf5JKAXekJoXc8uu9p3eimY3rj4M0i3S/6qZ6zvPyOHC3r3TGX5hobLHJgBDsGzWXvcjVYLmcwvkdpEfjlaQTDx/c5f6S4ItCHeBz3Hv6RwNVOhMaBzvJFYtODgQaO1wAGkdKuwm/N34dNRGppUaSRLbCXQ9KR8oiYW0KEj596HbNaT5Vvj3iRQNJ4SnaIjpeK5Pa0zmmxjtrny/FfcmOlTS74S1yjaFBLg16eTux8speYdJu/dXE/dGktWSE/vElPvSZq+bZjNirevt+F8N3KkUwl6ocdWbUrNQML1RInpDXelsNC3TxdjdQaoWcug041BMsfO6K85w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QuyoEbCAb7f1zQuHR5NWC6Ef5BoN85w7b+HmwCVuvU=;
 b=Wx5NUBGKMDS+ad9szg90t0LASDVAVqHCYIWOVSrLLykEVStLtrMCSFxb/BhaKeaMmXGVO1PrZJ+QDuE76Z2wQsR9el0t6bs74Yb1CzMXGKGYT4Tk4aJ3kKnITxCN7udEK2ygPb3RNoeXGHCDIziAAjjLPhXKEDpyxe5sYO8BZwZx7Vk7eUcB/t9+5I1MoGJlEYRNNXVoDkIut0nB3n00vLY0Hfqn5/kzEEXQQw/sZ9i2S3oXm35f+3y3XVuI9aRqEJgI6L3jtahX4835evNx/FdPQse+Hsui/rqccR/qhRtJpIf1CG6Mps5yQj6KUmLhZ/5fJEsXnvKElaKWNUmIqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QuyoEbCAb7f1zQuHR5NWC6Ef5BoN85w7b+HmwCVuvU=;
 b=NWIP0+BDd6kU6PGzbtS1jfCKpNZY0+Th9ZcSLw0cH9ijYAZaxVgoAqIvVkwu8jvCjWkA25F0sbjh6v8i13FvQ4Z06EifLoNgD9nP9e971dZMbzUnhZ5YxORS54P0hDiOK6E4EDObUYqQJyBO+EmqcnW91w5Ua2S+ipSAUo0PZso=
Received: from TY2PR01MB2124.jpnprd01.prod.outlook.com (2603:1096:404:e::16)
 by TY2PR01MB4748.jpnprd01.prod.outlook.com (2603:1096:404:113::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 06:46:01 +0000
Received: from TY2PR01MB2124.jpnprd01.prod.outlook.com
 ([fe80::3072:a985:1d9a:3d9d]) by TY2PR01MB2124.jpnprd01.prod.outlook.com
 ([fe80::3072:a985:1d9a:3d9d%3]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 06:46:01 +0000
From: "suy.fnst@fujitsu.com" <suy.fnst@fujitsu.com>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>, "ltp@lists.linux.it"
 <ltp@lists.linux.it>
Thread-Topic: [LTP] [PATCH] network/mpls: sleep 1 after setup in mpls02
Thread-Index: AQHXml3UZcoUQ2aMVkqdYiVBYmNh96uLn3Ry
Date: Mon, 30 Aug 2021 06:46:00 +0000
Message-ID: <TY2PR01MB2124907012E8CCEADD65682A89CB9@TY2PR01MB2124.jpnprd01.prod.outlook.com>
References: <TY2PR01MB212429263FC238F44A2C1D7D89C79@TY2PR01MB2124.jpnprd01.prod.outlook.com>
 <410b2b2d-9633-7a57-527a-1663afe5f631@bell-sw.com>
In-Reply-To: <410b2b2d-9633-7a57-527a-1663afe5f631@bell-sw.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bell-sw.com; dkim=none (message not signed)
 header.d=none;bell-sw.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53b4d4d0-8cb0-45cf-9085-08d96b81d485
x-ms-traffictypediagnostic: TY2PR01MB4748:
x-microsoft-antispam-prvs: <TY2PR01MB4748C47A4137D78E8C674FDD89CB9@TY2PR01MB4748.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NxuVVFtu659PCVXojQYzD44NfTGiqaCmQRrEQsK557dAipAw9qlimWS0zkvEqRGIVWywxoio9ZjG2xqoK9B1il4RHyL3b2pjxDWqh0eJ0magUvKth1AJfLUMRoDoLBkP+7NsN5rUyyONpFshCfSRHrhbIcRAD7TpTsL9nYuzXlhjzLM2uy4u8ZF5Jp7ZrJQDMO79uLA2VgHD2D9I8Y2o52RGf+YwweOnBssSkXKq4MtXG4K5WmZ8+Vw4PpUBr6fCwtY7nSngdRrDjk/tZP2S9Nm0RtnTO04ZghTK8D6FlEwG0pAZ5ohK15wUzoLCu7ia+cA2GHebgi2MPiWW1VlBrSykn2atZgJk+H8+nyh54zqNy/w1jqjFU4QhmgQ22tO4Woc81AHg6nhg3LBvK94oRL9Dfz18Ci28/brGDp/9ODdVxsD259B7p5rcViYhcZ1mkfaXAm4+O+InZlh0RYjtApSpUHcFaDMCMkIpS3TDIERVYsd2mgqbTH0FzVitV0512471ZxDjd3FzpmxSNaR7qV8fjJQvlQPH7bXbvquWL3nyzKUo42Rd5shDa1GBMh5xmvTLp8xTEWADUPbAfsP52mKFwRH5+3e2JImcBLGl9ByMuAZXX5MJiSRQtHngNBFJGMx+cK4S+UZ33wXGS66nY00dzN82LD/bUTHAdJT5N2hOZioPcTknz/MolRay2ELjm4bLIUTJGPDoeHiC8+PdUg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR01MB2124.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(76116006)(91956017)(122000001)(85182001)(64756008)(26005)(52536014)(8676002)(86362001)(6506007)(8936002)(2906002)(71200400001)(55016002)(53546011)(9686003)(38100700002)(316002)(508600001)(33656002)(5660300002)(66946007)(66446008)(66556008)(66476007)(7696005)(186003)(110136005)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?dkRMMkZzNTZyTk84SXlBb3hiZVl0REJVOXNkZFFsd2pmQzlxRzJxU0FPYmgz?=
 =?gb2312?B?Q0swNS9UeERtRzVUOFgzMndnNXNOTXI5WC8vWXhvWmZqOVRtMUsva1dHMm1Y?=
 =?gb2312?B?SXQySlVmaVA2MDRvUkQ1dW10ZWo3bTBRa2M1Yjd6MEZIV1ZDdkpoODJXTit2?=
 =?gb2312?B?RHA0WEdDMnpiSGFiOGRHVXVKOEp2RUxXQlJsenpqR0srenVSbXQzZm5vR0Nl?=
 =?gb2312?B?bHUxSkJ4VThOQngyOWZYRDNzaFhudjRQL3BKTHFJT1ZSeGNDeWdlUlByOGYy?=
 =?gb2312?B?L1B5SVpMdTBFZ3gxRVJVbHN1d0YyalRIejlvcGVOL0tTbW1HajRBWnREYU5y?=
 =?gb2312?B?QkJpY2VEV29xREJrbFdFMVBhK29od1hWQ2pNRDJmcjUwTnBOMnBzbjNmdVRq?=
 =?gb2312?B?bjA5b2w5ZmRaNGR3VTVxYzRTMys5cGVEVnJHckdRNDFQOXB1OTVqYVpBdmEv?=
 =?gb2312?B?MWdGbkpvUUgrdmpneUhiK1Vra0R6RlpsQUVPSGxhNFEraTh0cGZ5TWMyQ29V?=
 =?gb2312?B?Z29Udk1ZQksyenFyNEtNeGFtM1N0eWUzUm5MTGJ0ekVjK29SaE1kM0MzTnRL?=
 =?gb2312?B?YUZYb3VTUGRhRHVlT3V1WXozRWV2WkxrKzZCNkE2NFVKakRvVU1FOFQxZ0V3?=
 =?gb2312?B?R0I5S29mekNhNm0zam56bXNkcEFReVlTK09wSENyVzlOZ05vaHovNHpMUSt6?=
 =?gb2312?B?aVpZd0F4QWRlbUw1MUVTN1hSVTNFbldaSVlYbEhmdjgvVnZKSkhIZ3d4eUFO?=
 =?gb2312?B?RG5mYURld2hHUS9ib1Fyd21wS3NKaHR3NzRUeEQvUDhVNnhZZld4TmJESFh3?=
 =?gb2312?B?aGRjZkRLTFFRMUFZOTUzdjI1TmExY05zc3FwV00vMUV3eHpvTERoRGZNRldD?=
 =?gb2312?B?Mm9FeEFvYTEvYmpIRFZYUkpEUzVZM1dydVVyMElod1lPODFPQ1lVNTJZd0hz?=
 =?gb2312?B?bHNnZ0p1MURscW5veW53RXNGSnBtbkUvcWlPeFJvaE9IaUp3QVUva1pUeWsv?=
 =?gb2312?B?ODVEK2NoNCtXdTVWSERGYk9wR25rYlNFZVRabzJLdGtJV3VzYlkzTCt3enN5?=
 =?gb2312?B?MTErV1hNcW95VlBGVEJCWEVEMHZpeXZwWTJFU2tIY005VnZaRlYzNUtvbGlT?=
 =?gb2312?B?T01iWGt2SVdScndRekRsQzVSTGxtU3BvOTM2L0kvc0J1RnZwRHA0cjdrRGlV?=
 =?gb2312?B?ZXpnQ3hzSGVESTBFRXdjd3hRV01tWlU2WGx0WDZ5UmJOZGk3SnhmaExCbk1k?=
 =?gb2312?B?THJ1YWpXUWJDZlJBSFoyTThOenpuRjd6WGNlYXBZNEd5c1ROd2lya0JGemRo?=
 =?gb2312?B?dWpvMXNqbWRoWUN1c29CbVY2WnJ4c001SklQR05YTTNZaDlZRlp0U1FXb2JK?=
 =?gb2312?B?YzA1VTUvMmtDME45N0JyNlEwSm5aUlFlQXFxd3N1WmxGM0x5R2pmb1p4YkJ2?=
 =?gb2312?B?SnhObWl2VmdTMzN4N1ArZ3RPTVBCSVBrS3hRa3JWVGF2NEhkTGllMEdhTUtp?=
 =?gb2312?B?aDMxWHJrZVYvRXF4QWgyTjF0UG5sYlhqU0xxcXlCN2NFTjBsaHR2amZpVzE3?=
 =?gb2312?B?QVBxWGFJNkh2Nkl5dEVnOU1oczJiWG5qQS82VmdKbWRsRGJoc09DaDFoSXZB?=
 =?gb2312?B?VXNtNldnWFgwTTVTYThpSVZXcWN0K1F6OHJXMHNhc2J2eUZ3RTZZMUJBNzcx?=
 =?gb2312?B?RnV6WWMvZExYa3JwUklROUU2VmNYZTR4YkhsaStOM3BTenFWUG9XMzhxTk9R?=
 =?gb2312?Q?Bw47gx5iXG11YXCpVE=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB2124.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b4d4d0-8cb0-45cf-9085-08d96b81d485
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 06:46:00.9002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JksiQRDB8uHwu7bOIlx+BI+5Ajn6f9enx7ZKRqFRtUQjUAGnawTZdN1oMRF7HDxSpkhCCIQo+4CFxpLkh4bXgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4748
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] network/mpls: sleep 1 after setup in mpls02
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksIEFsZXhleQogIFNvcnJ5IGZvciBsYXRlIHJlcGx5IGFuZCB0aGUgYmFkIGVtYWlsIGZvcm1h
dC4gCiAgQW5kIHRoYW5rcyBhIGxvdCBmb3IgeW91ciBzdWdnZXN0aW9uISBJdCBpbnNwaXJlIG1l
IHRvIGZpbmQgdGhlIGNhdXNlLgogIEknbGwgZXhwbGFpbiBpdCBpbiBWMi4KCi0tClN1IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcm9tOiBBbGV4ZXkgS29kYW5l
diA8YWxla3NlaS5rb2RhbmV2QGJlbGwtc3cuY29tPgpTZW50OiBUaHVyc2RheSwgQXVndXN0IDI2
LCAyMDIxIDE3OjM2ClRvOiBTdSwgWXVlL8vVINS9OyBsdHBAbGlzdHMubGludXguaXQKU3ViamVj
dDogUmU6IFtMVFBdIFtQQVRDSF0gbmV0d29yay9tcGxzOiBzbGVlcCAxIGFmdGVyIHNldHVwIGlu
IG1wbHMwMgoKT24gMjYuMDguMjAyMSAwODoyNiwgc3V5LmZuc3RAZnVqaXRzdS5jb20gd3JvdGU6
Cj4gV2hpbGUgcnVubmluZyBtcGxzMDIuc2ggLTYgaW4gb3VyIHNsb3cgdGVzdCBib3ggd2l0aCBr
ZXJuZWwKPiB2ZXJzaW9uID4gdjUuMTEsIHdlIGZvdW5kIHRoZSB0ZXN0IGhhbmdzIGF0IHBpbmc2
IG9jY2FzaW9uYWxseToKPgo+ICAgKyBncmVwIC1xICdpbnZhbGlkIG9wdGlvbicKPiAgICsgZm9y
IHNpemUgaW4gJHttc2dfc2l6ZXM6LSI1NiJ9Cj4gICArIEVYUEVDVF9QQVNTIHBpbmc2IC1JIGZk
MDA6MjM6OjIgLWMgNTAwIC1zIDEwIC1mIGZkMDA6MjM6OjEKPiAgICc+L2Rldi9udWxsJwo+ICAg
KyBfdHN0X2V4cGVjdF9wYXNzIHRzdF9yZXMgcGluZzYgLUkgZmQwMDoyMzo6MiAtYyA1MDAgLXMg
MTAgLWYKPiAgIGZkMDA6MjM6OjEgJz4vZGV2L251bGwnCj4gICArIGxvY2FsIGZuYz10c3RfcmVz
Cj4gICArIHNoaWZ0Cj4gICArIHRzdF9yb2QgcGluZzYgLUkgZmQwMDoyMzo6MiAtYyA1MDAgLXMg
MTAgLWYgZmQwMDoyMzo6MSAnPi9kZXYvbnVsbCcKPgo+IFRoZSB3ZWlyZCBwYXJ0IGlzIHRoYXQg
bWFudWFsIHBpbmc2IHdvcmtzIGluIHRoZSBtZWFudGltZS4KPgo+IFRoZW4gd2UgZm91bmQgdGhh
dCBhZGRpbmcgYHNsZWVwIDFgIGF0IGVuZCBvZiBtcGxzMDIuc2gvc2V0dXAoKSBtYWtlCj4gdGhl
IHRlc3QgcGFzcyBpbiAxMDAlLiBEaWcgZGVwcGVyIGluIHRoZSBwcm9ibGVtLCBmdHJhY2UgY2F0
Y2hlZCBkdXJpbmcKPiB0aGUgMSBzZWNvbmQgc2hvd3MgKFRoZSB0ZXN0IHN0YXJ0ZWQgYXQgWyAz
OTc5LjQ4NTQ4OF0pOgo+Cj4gIDM5ODEuMjEwNzAxIHwgICAyKSBrd29ya2VyLTI0NzQyICB8ICAg
ICAgICAgICAgICAgfCAgYWRkcmNvbmZfZGFkX3dvcmsoKSB7Cj4gIDM5ODEuMjEwNzEyIHwgICAy
KSBrd29ya2VyLTI0NzQyICB8ICAgICAgICAgICAgICAgfCAgICBhZGRyY29uZl9kYWRfY29tcGxl
dGVkKCkgewo+ICAzOTgxLjIxMDcxMiB8ICAgMikga3dvcmtlci0yNDc0MiAgfCAgIDAuNDE3IHVz
ICAgIHwgICAgICBhZGRyY29uZl9kZWxfZGFkX3dvcmsoKTsKPiAgMzk4MS4yMTA3MTMgfCAgIDIp
IGt3b3JrZXItMjQ3NDIgIHwgICAgICAgICAgICAgICB8ICAgICAgX19pcHY2X2lmYV9ub3RpZnko
KSB7Cj4gIDM5ODEuMjEwNzE2IHwgICAyKSBrd29ya2VyLTI0NzQyICB8ICAgMS4wOTcgdXMgICAg
fCAgICAgICAgaW5ldDZfZmlsbF9pZmFkZHIoKTsKPiAgMzk4MS4yMTA3MzAgfCAgIDIpIGt3b3Jr
ZXItMjQ3NDIgIHwgICAgICAgICAgICAgICB8ICAgICAgICBpcDZfaW5zX3J0KCkgewo+ICAzOTgx
LjIxMDczMSB8ICAgMikga3dvcmtlci0yNDc0MiAgfCAgICAgICAgICAgICAgIHwgICAgICAgICAg
ZmliNl9hZGQoKSB7Cj4KPiBJbiBrZXJuZWwsIGFkZHJjb25mX2RhZF93b3JrKCkgaXMgZGVsZWdh
dGVkIGJ5IGluZXQ2X2FkZHJfYWRkKCkgdG8gZG8KPiByb3V0ZSByZWxhdGVkIGpvYnMgaW4gYSBk
ZWxheWVkIHdvcmtxdWV1ZSAuIEhlbmNlLCB0aGVyZSBpcyB0aW55IHBlcmlvZAo+IHdlIG5lZWQg
dG8gd2FpdCBmb3IgaXQuIEFkZGluZyB0aGUgYHNsZWVwIDFgIHNlZW1zIHN1ZmZjaWVudCBmb3Ig
bm93LgoKV2hhdCBpcyBoYXBwZW5pbmcgaW4gdGhlIHBpbmc2LCBpdCBpcyBPSyBmb3IgaXQgdG8g
aGFuZyBvbiB0aGlzPwoKQWRkaW5nIG5vZGFkIHRvIGxvb3BiYWNrIG1pZ2h0IG9ubHkgY2hhbmdl
IHRoZSBmbGFncyAocmVtb3ZlIHRlbnRhdGl2ZQppZiBpZmFfZmxhZ3M9PUlGQV9GX05PREFEKSwg
dGhlIGRlbGF5ZWQgZGFkIHdvcmsgc2hvdWxkIGJlIGNvbXBsZXRlZCBpbgphZGRyY29uZl9kYWRf
YmVnaW4oKSBmb3IgaXQgYW55d2F5Li4uIGJ1dCB3aWxsIGl0IG1ha2UgYW55IGRpZmZlcmVuY2UK
Zm9yIHBpbmc2IHRvIGNoYW5nZSB0aGUgdGVzdCBhcyBiZWxvdz8KCmlwIGFkZHIgYWRkICRpcF9s
b2MvJG1hc2sgZGV2IGxvIG5vZGFkCnRzdF9yaG9zdF9ydW4gLXMgLWMgImlwIGFkZHIgYWRkICRp
cF9ybXQvJG1hc2sgZGV2IGxvIG5vZGFkIgoKPiBTaWduZWQtb2ZmLWJ5OiBTdSBZdWUgPHN1eS5m
bnN0QGZ1aml0c3UuY29tPgo+IC0tLQo+ICB0ZXN0Y2FzZXMvbmV0d29yay9tcGxzL21wbHMwMi5z
aCB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL3Rlc3RjYXNlcy9uZXR3b3JrL21wbHMvbXBsczAyLnNoIGIvdGVzdGNhc2VzL25ldHdvcmsv
bXBscy9tcGxzMDIuc2gKPiBpbmRleCAyZmQzZWM1YmY0YmEuLjc1ZjVmY2EzMmY5YSAxMDA3NTUK
PiAtLS0gYS90ZXN0Y2FzZXMvbmV0d29yay9tcGxzL21wbHMwMi5zaAo+ICsrKyBiL3Rlc3RjYXNl
cy9uZXR3b3JrL21wbHMvbXBsczAyLnNoCj4gQEAgLTM1LDYgKzM1LDggQEAgc2V0dXAoKQo+ICAg
ICAgIHRzdF9yaG9zdF9ydW4gLXMgLWMgImlwIGFkZHIgYWRkICRpcF9ybXQvJG1hc2sgZGV2IGxv
Igo+ICAgICAgIHRzdF9yaG9zdF9ydW4gLXMgLWMgImlwIHJvdXRlIGFkZCAkaXBfbG9jLyRtYXNr
IGVuY2FwIG1wbHMgNjAgdmlhIGluZXQkVFNUX0lQVjYgJCh0c3RfaXBhZGRyKSIKPiAgICAgICB0
c3Rfcmhvc3RfcnVuIC1zIC1jICJpcCAtZiBtcGxzIHJvdXRlIGFkZCA1MCBkZXYgbG8iCj4gKwo+
ICsgICAgIHNsZWVwIDEKPiAgfQo+Cj4gIGRvX3Rlc3QoKQo+CgoKLS0gCk1haWxpbmcgbGlzdCBp
bmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
