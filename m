Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D8451341370
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 04:18:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C8FF63C90C3
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 04:18:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E5B403C3363
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 04:18:30 +0100 (CET)
Received: from esa16.fujitsucc.c3s2.iphmx.com (esa16.fujitsucc.c3s2.iphmx.com
 [216.71.158.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A4D5B1A00814
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 04:18:29 +0100 (CET)
IronPort-SDR: YtL2hSPBE0T96+5UOU6AOs/UB4OSB2bOYKCOcJCcWiaaboGpqlOBoUs/ZgNhdSDfkozmtfsAtU
 MokUtIYlRPUF7M5i/YDzhGcnbgK3AufKFu822ZT5aS5i3eSY287YDWdDtkEFJk5noWMnJnwT0e
 Ve/QIfytIs0MeoEiUsQ4G23i+AW3Z4WPe3qXQrINXnqLu/+todsirU/kPJ3N2ToTvGikwfzOyg
 qnTh3rhETVDnVpldzZcs6OAmvvB2QY0fyS1DSkze0l9DEwCpP8j/3E1ixLW9LK2EWV9oEqIT2j
 Bbw=
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="28117780"
X-IronPort-AV: E=Sophos;i="5.81,259,1610377200"; d="scan'208";a="28117780"
Received: from mail-os2jpn01lp2051.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.51])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 12:18:28 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMLmGdMv+F2Vb3iJ3kPHx7PQG8t7N2nQzpavZvIbKilU7O6gRY4ngzB9C7//Ef67oa6368BCuwAWzsbe/Bthv3ec0Gkd51UQSM7TuYYRs5Cql7KWwL1vRUlprqZXKmCaBRyzwo2jEVyVjQEWn8uz6s2w8WC+IbsQXZP5h6598jWqI2aArSRtYobJu9R/SzU99n4UrGTxE9NU/+18ICn+MlZxPjkYJou4IALmoYDIkIkf/HzHp5v9KqZXea7bTFomxEZYKcZ5J+FsCfnFdeUuhjDHE2nNOt3HdIJGMmQ1EmrLT4dTEs01HTqQvqSIfbT7Ris73n4wRGNBHEtrymiWHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TOpywQjV1PaK6NYIAnQPfbyOXYBcbhwRgppAGVfYZo=;
 b=HdBI9AyxZPUtKiWQ9VVDwb47fR/JXcDzN2bpTlY/ULIFe3r5x/EwvBkt1EdPNRVnBhbbhO+lhJ4X0iv6RH0QdRAFPoBKcLBVDwebGQ4SZfrEnKVQ0gdv/PkZMaTsRlomrYFz7a1KU7PTVVIUXOFepPLxBIMIqCVUQ2M6Fqw2qxqLvRd6ppoVRYykaw9TcTCceic7s4/pvlhe2lAlwwRlqL6Gw6uCeJSIyQMM+vMa3OgVEV9bIqxGaOZo3k1MhNgFGyjw2IdCxvMU1o9eEM8B6ZDmsTOLNbymq+D+DfwjhOev2khITDjisudU75WwO8wDFXetuojDnN7w3/9bh8jPfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TOpywQjV1PaK6NYIAnQPfbyOXYBcbhwRgppAGVfYZo=;
 b=eHMq0p0AkR6I/Dx6+fK132tAZSKBiSreUOTCfWADfjVebsq/xan5s9tsqQAT/YkqXiYl9kHJN6tam8r4tFaorgwwBPYK9DqGZHOwjTKC2gt4i4hYTnuxElCOZPvvjftZnuglBOqi4URtKFU+qW4+qDR2KkHrKAV5+9qlUIPMkbY=
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6)
 by TYXPR01MB1518.jpnprd01.prod.outlook.com (2603:1096:403:10::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 19 Mar
 2021 03:18:25 +0000
Received: from TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052]) by TYCPR01MB6544.jpnprd01.prod.outlook.com
 ([fe80::9095:8cd8:6e30:3052%5]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 03:18:24 +0000
From: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
To: Xie Ziyao <xieziyao@huawei.com>
Thread-Topic: [LTP] [PATCH v2] kernel/syscalls: Use SAFE_OPEN() instead of
 open()
Thread-Index: Adccbn7ZA1Eyg4boTTqyLUn/zdbDWA==
Date: Fri, 19 Mar 2021 03:18:24 +0000
Message-ID: <TYCPR01MB6544A7F832302FDBD3170712FD689@TYCPR01MB6544.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b41e5e6-eb02-4af6-7fce-08d8ea85a868
x-ms-traffictypediagnostic: TYXPR01MB1518:
x-microsoft-antispam-prvs: <TYXPR01MB1518796E4360AC6DC97EFD58FD689@TYXPR01MB1518.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ywJ9Cj0H/FGuvDiTZ6Ebz1xTKlit0jYKM60LmXSsNx35ZJO0HR0oF1lIrG2eUABK7czXmouvphqIlhH+u/Trs8rmZ00z/ao4fQSi4ioOLmMxdjr8vEuFJe7ZxYuT1ia6GGh9QGxiSAJWeyUkatr/1fCRJad9meR/epmDRQFIVn2FOkvosZ57WnaYI5qdmk0lR0NW4efCBy0vlALQx2sXR6l/ALIzrtYXdy2iMviL7D5HZZc3Ldd55QF926aw2UyrTt4NSgGbrljSF85A1nPa/nCH+69h1Y1BAFh+fXqdPu6PcXY3gBZoptZTfOX4p+6ZcASwCEQZUjPEiyImnCnYRcnzQQB4ENoj7HYqhN1zx49Ea5GXiDOVudvRHyayEM8G3m2Md7omsuXuti2kibsJQ6WO3TUCTpH5zpmHPq8wybfp+QNOYI9TfzVFKx2dUKqCxEgySUpH3cyx4jIH1RUmheZGJ+As6kko+9WvthqLU5Wx7ihtvHwEp+CK17aLV2952fEKcSvDxRQvIEfUlm/p6R+0kv0SdFU5QL2Pr3uVfBi9urfGrXSDxU/Gucg6DqZpjnHryl/Ns7shyGWlPX+G9eXIpUBRVdlBKtTvuuE8YBOs1zYLSfDXqfYXPINm9fqxSwZ6QVdCp8s51epV/OxQbrmmmLg48Mfl+snRj6MV1PLVX0vne2siNnNzHkiC7K5aKLhplcUwhFYts9i4saBP2/+9vp0HpAK6/F6oqhEXztSzSJEsEofRWxokiTu2TnNX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6544.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(966005)(316002)(478600001)(86362001)(38100700001)(5660300002)(186003)(4326008)(8936002)(7696005)(9686003)(26005)(55016002)(71200400001)(6506007)(558084003)(8676002)(85182001)(66476007)(6916009)(66446008)(64756008)(76116006)(33656002)(66556008)(52536014)(66946007)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?K1RPeTJLWW5OdDBBU2RZbi9GVGdyRUY0VmZ4M1M3ZFd5N0ZSSzdzdGt1RWRi?=
 =?gb2312?B?YW1RTDJRSGQ1OHZyUmZ2REJQek1uTyt1WU1KeGN4ZXZDc1ZmdzJLYjdtQndF?=
 =?gb2312?B?T0tsSzVtdHdCbVJKZ3VvL3VhVWZQczFGK0h5Z1hIMG9uZXVhRFk5MnVZaU4v?=
 =?gb2312?B?bXFVdkp1Mnh6YkRJVER4U0JpMnJ1K3l6SnlFekFQbVJ0N3p0QXhNTHZMZ0tH?=
 =?gb2312?B?MEJUZDRSK0hKYW9xSWdvblRYdk8vWFloSFF3czlWK3lZa2pJbUNKR013UERX?=
 =?gb2312?B?Q0Z4S3ZHa0R0alh6OXg2ZVJWelZZZGI5dnlYVm9TSlFzK2NrYkNKcDl3bWhT?=
 =?gb2312?B?TDM0dms1MkFEaGQ3NzJKeG8vd2xsaWZhVkNXbHRlMTRBbm96aWRWNHVZUHFQ?=
 =?gb2312?B?Q2lncE0wZzROd1VwZDZYMDQ5WWJxZ2x5YmY1eEtBK1dOQkp4WHMvTVBGZGtz?=
 =?gb2312?B?cUZqNUkyNW1IUlhaZytPRXAwZWxqTk11KzM5Rit5QVdwaHBhVlN3M0hNcnZS?=
 =?gb2312?B?cHhMdGJYMWdYN2FJSmlrQjNCd2x0Y3JDbERwNmNKM3pNUENmSTRFNkFNRWpU?=
 =?gb2312?B?akh3L0tXS2NzMVk5QzB4TXpxUi8vOXNka20yVzN0Vjg3QU51d1E4Z2RVcHN6?=
 =?gb2312?B?Tkk2aG1aVUJ1RjhBNitUSEF3RlRraHFjNC9VT0JWVkdrdnRuSDlBYzBLRC8r?=
 =?gb2312?B?czQxUUkvT2dXVHRtZGRXUVBHTE1NMVZ0enVkYVZGT2NXM0JyVk1hcW5qdm04?=
 =?gb2312?B?RHorQWNTZE1OZGNhamtUbWYwMUxYUUYyQ3pydkVpZFFSbmtPS21yS0FYTW50?=
 =?gb2312?B?QkJjNmRiODNBdkM5Mk5aR2tqZEZsWTN0YkY5eHpSWmlueHRhU1NYTjhJYzM5?=
 =?gb2312?B?a0czcHFBWG0xVjV2ZzJXL2g4clJ1UzVEVVpNVHhBTHZRa0NSUm5VT3dHWGVi?=
 =?gb2312?B?ZG5mYlE2QjRsN0hhR3pCbktka3BIUXNteUU5c0tWeloycjVrZTBOTmgvVS9Z?=
 =?gb2312?B?RmFXUkVlRUhUVUdOV1BjSkE2aUlZci8zTENWdnNuUm9aYjU4MGFHT3pHNGJ1?=
 =?gb2312?B?WnpSN1N6QlVlSGhWZXdqeVluR21JMDVDUjlZNUZDR3pLT3BMSXZsWCtLM1ZH?=
 =?gb2312?B?NVRkcnJrWHRFSWNnUG0wWnJWc1NxN3FEMzBzNWpLK3dZSTVyMUw2Mkx3RWF4?=
 =?gb2312?B?VTJzNFVJWWZJUDdLSyt4a0gwTWdjUlRTd2E2em9HVnNUd1hFUkNaV1FwaDB0?=
 =?gb2312?B?Slg1TmVBQ3czWUxORWUwakVkNmE5dmpkNEc3dnM0K1VETGxxNU5TOHk1eHZR?=
 =?gb2312?B?Vy9UYXhtWTdmRS8vSHpvS0xLR0RRNFZPWHFDbUF1ZUV6YlBBN3hRM09Bdk5w?=
 =?gb2312?B?amROTWZ4dGRLUTdCamhlY05tQnA1cnUwSGtucHhvYWVwWkhPRnlpVGZ2Umw0?=
 =?gb2312?B?MkpmekhVK01pbHdhUVU3cXVOejBFMjFldElUcXFmRXo0WjJEUHZIMUIvVmN5?=
 =?gb2312?B?Nkp4RmFpZDJrNndTOWlBV3BLeW84WitVWHVTaE8yTktJaEZCR3d5bjEveUFl?=
 =?gb2312?B?aW9DcFlxN01ZQVl2R2FIWTl2SkFPM3RLM0ZpMmFnSjNMdnlPUUNWSzFyVkRl?=
 =?gb2312?B?VTd0SnZYamxteWgzOE5mUkw2TkxDRDFzM3laY0ZsR21GQll3MTNQS2pNNHZp?=
 =?gb2312?B?b0ZHR0wvd3VJOHk5Z0tCa2dIVFVleEVSVzNQL3pIa1dUUFN0dUM0ZVluNTRG?=
 =?gb2312?Q?0mZuFP4cST2bW01vaW1m8nSmTNcBHOX2lcXffHk?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6544.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b41e5e6-eb02-4af6-7fce-08d8ea85a868
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 03:18:24.8979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AcW9liu1DOc87sEBLR1SDoDC1jA8jwW8mon7JW22s64OiEc2Tuzc791LGI2cMZov2ARVCuIrKMx2iv+cuKjuocAtmffF1f9SO/sPMHjOa9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1518
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] kernel/syscalls: Use SAFE_OPEN() instead of
 open()
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

Hi Xie

Merged, thanks!


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
