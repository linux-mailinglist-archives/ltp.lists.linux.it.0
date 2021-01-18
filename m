Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 230CF2FB604
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 13:10:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0F2E3C309C
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Jan 2021 13:10:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 2CE953C2305
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 17:18:35 +0100 (CET)
Received: from mr1.volkswagen.de (mr1.volkswagen.de [194.114.62.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 65F85600473
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 17:18:34 +0100 (CET)
Received: from [194.114.62.52] (helo=vw2bwosevg14.vw2c.b2x.vwg)
 by mr1.volkswagen.de with esmtps (TLS1.2:ECDHE-RSA-AES256-SHA384:256)
 (envelope-from <oliver.hartkopp@volkswagen.de>)
 id 1l1XEf-0005rf-55; Mon, 18 Jan 2021 17:18:33 +0100
Received: from vwagwoxx0801.vw.vwg ([10.186.102.59])
 by vw2bwosevg14.vw2c.b2x.vwg (Totemo SMTP Server) with SMTP ID 485;
 Mon, 18 Jan 2021 17:18:32 +0100 (CET)
Received: from VWAGWOXX0801.vw.vwg (10.186.102.59) by VWAGWOXX0801.vw.vwg
 (10.186.102.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 18 Jan
 2021 17:18:32 +0100
Received: from vwagwox00304.vw.vwg (10.186.25.50) by VWAGWOXX0801.vw.vwg
 (10.186.102.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2044.4 via Frontend
 Transport; Mon, 18 Jan 2021 17:18:32 +0100
Received: from mxmos06.wob.vw.vwg (10.186.25.217) by vwagwox00304.vw.vwg
 (10.186.25.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 18 Jan
 2021 17:18:26 +0100
Received: from vwagwoxx0302.vw.vwg ([10.186.25.87])	by mxmos06.wob.vw.vwg with
 esmtps (TLS1.2:ECDHE-RSA-AES128-SHA256:128)	(envelope-from
 <oliver.hartkopp@volkswagen.de>)	id 1l1XEY-000EeR-GX; Mon, 18 Jan 2021
 17:18:26 +0100
Received: from VWAGWOXX0302.vw.vwg (10.186.25.87) by VWAGWOXX0302.vw.vwg
 (10.186.25.87) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2044.4; Mon, 18
 Jan 2021 17:18:21 +0100
Received: from VW2BWOX00E02.vw2c.b2x.vwg (194.114.62.133) by
 VWAGWOXX0302.vw.vwg (10.186.25.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2044.4 via Frontend Transport; Mon, 18 Jan 2021 17:18:21 +0100
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.59) by
 smtp.vwgroup.com (194.114.62.133) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.2044.4; Mon, 18
 Jan 2021 17:18:21 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfcnZziPFOgJf6dDSm9HQ9pMtHbP/UFNYV4gvrCfMZdWVxou2LrcYQIzbsazZ+ZqcZiMJQ0SMicfBCXNMko9ZyxPBWqN3/rE3nvNeG/yY233zyEdsf1l7kbVpNuqbJNHPErg8pY3Lxyx4o5z+G1T9R/HPpWu1d52/JQCEbPZomNceRUbCmuJ0S0XHPK1ySQIeI+DcV+OQa1iDDf9kAraIZr7HKU9MsJhLPlnW6OjDXIDeENpe6NPA0GMmegu8DBiDgFs/HbI6WqE/ecwV7XW+i4cUBh61FgwKM6f5Ync9l7u1CA4zaZP8AvtqRXpLV5UXl5EHp+vUDjDLN8aVwNZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkcdQFA0JRlr1xMUQQPs3TgAbqzYWb+aNKsmNGOA+1E=;
 b=QKimguZflS7h36Z6iz/TA5vhQ0LMeJIZSrxsUyxvp7ocjpC8Tx/t+LwoP7P1Y5kvP6hS1oicMgqgIFARyDUzHipcR2rqZOOP0BBM7CS41178V7erwDoKhrhiZgJJMxqUesKVIv3/N6yrN/Fs+64BVZjfa/255WKd2A6ckCkkcThEBDVmxBQBMjqyooPZhKHIygXvFwXEQHLA4vwngxChS/U1TdIoEK0Qf2nkTI9Gz6PL9Ba5YjQJBeL6RrE4SER2z4E9nw0tlEn/67zQ7GQRAzFPrcwA/pHQqL6+NgAV70Lw+6jkXM2bCkbZ+wJGwekNQuARuAgTYKswNgsDjvQ4bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=volkswagen.de; dmarc=pass action=none
 header.from=volkswagen.de; dkim=pass header.d=volkswagen.de; arc=none
Received: from AM0PR05MB4642.eurprd05.prod.outlook.com (2603:10a6:208:b3::13)
 by AM8PR05MB7971.eurprd05.prod.outlook.com (2603:10a6:20b:314::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 16:18:21 +0000
Received: from AM0PR05MB4642.eurprd05.prod.outlook.com
 ([fe80::cd11:d6fe:7360:56e5]) by AM0PR05MB4642.eurprd05.prod.outlook.com
 ([fe80::cd11:d6fe:7360:56e5%4]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 16:18:21 +0000
From: "Hartkopp, Oliver, Dr. (EESC/5)" <oliver.hartkopp@volkswagen.de>
To: Richard Palethorpe <rpalethorpe@suse.com>, "ltp@lists.linux.it"
 <ltp@lists.linux.it>
Thread-Topic: [PATCH 0/5] Convert CAN tests to new LTP API
Thread-Index: AQHW7bTnYVH6T0Jax0+8kmgi91TAW6otjpZg
Date: Mon, 18 Jan 2021 16:18:20 +0000
Message-ID: <AM0PR05MB4642C547F8E6A3D5C230B87DECA40@AM0PR05MB4642.eurprd05.prod.outlook.com>
References: <20210118155628.9248-1-rpalethorpe@suse.com>
In-Reply-To: <20210118155628.9248-1-rpalethorpe@suse.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=volkswagen.de;
x-originating-ip: [165.225.27.77]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8b42bf2-1dbf-4b89-6d1d-08d8bbccac3a
x-ms-traffictypediagnostic: AM8PR05MB7971:
x-microsoft-antispam-prvs: <AM8PR05MB79711A324C3625C0791AA603ECA40@AM8PR05MB7971.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O20NLJR6pXsV0keKMRLTIFlYmmrlURrW+YrvmpSj6gY4SZMsiUUCBPEu3GO6vJ5ZlmmekbyVd6EgslBsP7pkOLqowjuCFMg+YopwtsNdJTQPywgcA9p5zZM5b/bIIA1/VNs3m9Z1AQAS35q5D5TCVHF47K3B8IcNJSaQa/qcPKN9rpztL/sg4rs7qsAXZmGaYzo2ygtv7y8kgGZSKzG5hepvmR1387ikuDLG2G3SumaDk0NOmLdNkplaGRmiWfryXp9SBJSycXO9XLaEj6gOHucs0BQ0OkWGuJ2AukF0on933r4lWd3KO7zlbreGcZ5qUlUHdHZaJjt/jIowtCiS/pKx7Vh8MPI2JDMnjbHvpGbKacUngdKLgnhrzFLsOmKmuMaHGz0Sva9sLdSEx4P9Fg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR05MB4642.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(8936002)(26005)(478600001)(55236004)(8676002)(66556008)(66476007)(66446008)(64756008)(86362001)(186003)(66574015)(110136005)(316002)(66946007)(33656002)(7696005)(5660300002)(76116006)(4326008)(6506007)(55016002)(52536014)(83380400001)(71200400001)(9686003)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?sFxWpQiGzlfa14rDmJfGXR4xhcnnq9qbjXCbI8rnRuY47Q5rHLqUUGyU2X?=
 =?iso-8859-1?Q?Ng3IPW9gdJF5APkCE5F8DPAS2tCa5EdUEpbZu10UhHAxcxbGah3ZKmT/jY?=
 =?iso-8859-1?Q?miz3yOMyaGF+6qqJ+z1rsMovNCn/NwV88Niwe2cmC4u0w/9Xb1/QJQLDan?=
 =?iso-8859-1?Q?PcBPMEJKJRUgFm48pe49T0CgBysDGQDitQ8TaJvkvhZ01lx3bfLiw2m9jA?=
 =?iso-8859-1?Q?PJxQpZ419QXcepj0jY/oF63uu2zX6SsmLYoenglmi7+YqDrgg5pY9Xx3n8?=
 =?iso-8859-1?Q?ZQ8bt3cYVn8ZuGlFK7IYrCfYCGmHHRYfV67b3B0YXOW4GC++ClIepBSGDw?=
 =?iso-8859-1?Q?56Q4vie4NZJXt3gwucdGYMds8ml/d5WEICE5cabMMRyOUuJcdCkG+gUHoU?=
 =?iso-8859-1?Q?MSYCeb2TaCCzDSrfe8vTLvZBIAO8Sx2W/iw73nLg4mJvMpaW0LSE2zagMy?=
 =?iso-8859-1?Q?NRW9+HUWAPgj+6kiFSjPk+fuM8OwrpXzelR+1ADtxNANKG+NGXr/SP0vqt?=
 =?iso-8859-1?Q?hgkZuPhGIGKDJBlAWYVVib4q9ev/vbFK5V5UxhyCBWE40LQD2DGW+56IzZ?=
 =?iso-8859-1?Q?WALhOU4WvYBeLmUx4/6KJJZPonWox9iZ/bswrlZ/3FSL7oGNnxvZtBMgmd?=
 =?iso-8859-1?Q?waQzK8+RMKpOBAFxEAue1Ilx2SB8o4BPvnmEafdsFxhAyWg1RviLhQ7YvF?=
 =?iso-8859-1?Q?pzB8osgZzeIUsXulJf/x2ECOHpM71cHPGepXn36zWPKRbkXO3wuR6gkRge?=
 =?iso-8859-1?Q?s5X0KPCGkN/TX8ia3+iFerZE8MHEQ5J/CBgpTDVa9g5FPNWKMhYBJDhKIY?=
 =?iso-8859-1?Q?MVl1/hjB3vjD1PBU5dy1T4HGOReoMgj17af4h8dzsw/+I0bbGbxN4EiVjC?=
 =?iso-8859-1?Q?0KZKnCLuL9z+JMFvojvhSPfUdhZHEpzL+CDMaEx/pafS06BdRo6SADWaaV?=
 =?iso-8859-1?Q?/vbDCEWQPV6zhdVrleDZB/E7KWWzzCHpjWXaOsjCWzrFCAi1J1M3+edoSY?=
 =?iso-8859-1?Q?pcBLDCmKgB9dNMcAU=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR05MB4642.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b42bf2-1dbf-4b89-6d1d-08d8bbccac3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2021 16:18:20.9208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2882be50-2012-4d88-ac86-544124e120c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fMimiu76vbuQQlp+xNQLXkwTIqlUQ25oBmxwpt9FHIuk8k20i43+oeo/xxUUml+uSmrvcBw9ad8nZ3BWNpgmOFRqNzFESDtYPPrZi90i0fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR05MB7971
X-SGG-UMAMSID: 20210118161809Z56323mxmos06.wob.vw.vwg 1l1XEY-000EeR-GX
X-SGG-RESULT: 20210118161809Z56323mxmos06.wob.vw.vwg C1:OK E1:OK MX1:OK BL:OK
 SPF:off CT: CM: SIP:10.186.25.87 SMF:oliver.hartkopp@volkswagen.de
X-EVG-VW-PASSED: outgoing
X-EVG-WOB-VW-VWG-LOOP-COUNT: 1
X-SGG-RESULT: 20210118161832Z22547mr1.volkswagen.de C1:OK E1:OK MX1:OK BL:OK
 SPF:off CT:Unknown CM: SIP:194.114.62.52 SMF:oliver.hartkopp@volkswagen.de
X-SGG-CTRefId: str=0001.0A782F25.6005B4D9.0030:SCFMA48990807, ss=1, re=-4.000,
 recu=0.000, reip=0.000, cl=1, cld=1, fgs=0
X-SGG-VWORIGIN: 1984
X-SGG-DKIM-Signing: 7af5e6687a8e0ef81b3da7a89c6afb54
X-SGG-Platform: 7af5e6687a8e0ef81b3da7a89c6afb54
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 19 Jan 2021 13:10:56 +0100
Subject: Re: [LTP] [PATCH 0/5] Convert CAN tests to new LTP API
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
Cc: "socketcan-users@lists.berlios.de" <socketcan-users@lists.berlios.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Dear Richard,

either I'm not using my VW-Email for OSS/SocketCAN anymore and the socketca=
n-users@berlios is also not used anymore.

Please resend you patch set with these updated mail addresses:

Oliver Hartkopp <socketcan@hartkopp.net>
Linux-CAN ML <linux-can@vger.kernel.org>

Many thanks,
Oliver

-----Urspr=FCngliche Nachricht-----
Von: Richard Palethorpe <rpalethorpe@suse.com> =

Gesendet: Montag, 18. Januar 2021 16:56
An: ltp@lists.linux.it
Cc: socketcan-users@lists.berlios.de; Hartkopp, Oliver, Dr. (EESC/5) <olive=
r.hartkopp@volkswagen.de>; Richard Palethorpe <rpalethorpe@suse.com>
Betreff: [PATCH 0/5] Convert CAN tests to new LTP API

Hello,

This is an attempt to convert the CAN tests to the (modern) LTP API and rem=
oves the wrapper script. I have tried to keep the core test behaviour the s=
ame, but (for example) moving to the SAFE_ functions will naturally introdu=
ce some changes in error checking. Deliberate behavioral changes have been =
noted in the commit messages.

Richard Palethorpe (5):
  API: Add FILE_SCANF to new lib
  can: Add can_common.h for vcan device setup
  can_filter: Convert to new library
  can_recv_own_msgs: Convert to new library
  can: Remove obsolete test wrapper script

 include/tst_safe_file_ops.h                   |   3 +
 testcases/network/can/Makefile                |   2 -
 .../can/filter-tests/00_Descriptions.txt      |   1 +
 testcases/network/can/filter-tests/INSTALL    |   3 +-
 testcases/network/can/filter-tests/Makefile   |   2 -
 .../network/can/filter-tests/can_common.h     |  70 ++++
 .../network/can/filter-tests/can_filter.c     | 317 +++++++-----------
 .../can/filter-tests/can_rcv_own_msgs.c       | 273 +++++----------
 .../network/can/filter-tests/can_run_tests.sh | 106 ------
 9 files changed, 288 insertions(+), 489 deletions(-)  create mode 100644 t=
estcases/network/can/filter-tests/can_common.h
 delete mode 100755 testcases/network/can/filter-tests/can_run_tests.sh

--
2.29.2

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
