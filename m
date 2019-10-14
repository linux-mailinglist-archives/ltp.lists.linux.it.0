Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E682DD5D2A
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Oct 2019 10:11:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 32A983C2347
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Oct 2019 10:11:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 705C33C14EE
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 10:11:15 +0200 (CEST)
Received: from m9a0002g.houston.softwaregrp.com
 (m9a0002g.houston.softwaregrp.com [15.124.64.67])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8F2B11A00F8C
 for <ltp@lists.linux.it>; Mon, 14 Oct 2019 10:11:10 +0200 (CEST)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP FOR ltp@lists.linux.it;
 Mon, 14 Oct 2019 08:10:33 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 14 Oct 2019 08:09:03 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 14 Oct 2019 08:09:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiRiGoIq/iNNeMZ0BDY4Ka180sOvdsyPpfIC7Ddu1YYMauA8xsEPKo5NBEbBmelKodoHrDlkfVR8XwmVh0Ujb3gkFXD8tQgWABHXoO1VDDWm18Cw4VXcFkUTxaLZ98+yIfE3mN2wGy7pqertbnOvgmXT6b+qIGg3zSAzG2j+PCcnDX6JereN7VUSMoT2BfEc+jOEoJHu5KSpo+qkd+xri2cApyVcnY7dLbVP0TisGxkJ77oR0Pt2FIsuSM4v7TI3wpMFHOvsof7O8aMjt21s1pagU5yxhyiSQE+IA99KaEaFPJrKaBM7fPbphYjVMxbw2xosDFnjL5jkQqn9ObEdGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+4AQDjqBMpR+X4/q7BR/wIKPsd6AecJh9+8lB60VCg=;
 b=Oqci8OqIkjfwNhMcU45OBpPN6ewBGwak7JZjt4WbUoiy1nnKhsjOhWDgb5ledTV8DvD6HYvbbcIkvW6NB5bqWdb9LMSXm6hRV1y63OAfymdqWytNSjufxhY92QJG2Y6aRCCjY6IjhZM6Whaf38daaQ/NUjQAzUnsgiJE6DQM5tBfpABaVa+hZU+toer2pvLt7up6hpzVJNVSb5FL+TdNq1SqpIQbo44qBpGgZn50UcNkQw9iZfpbsfQ9B2TGYYURTJbB2s0Hp5pkcqlU/8Mhyic+ydBOWhNq0C3pB7NUqrPjo2zjpDPmG5XTaurSwitBLvHp2vtUt404a2yCsyePQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3206.namprd18.prod.outlook.com (52.132.247.79) by
 CH2PR18MB3221.namprd18.prod.outlook.com (52.132.246.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Mon, 14 Oct 2019 08:08:58 +0000
Received: from CH2PR18MB3206.namprd18.prod.outlook.com
 ([fe80::adf9:7570:c3ae:f686]) by CH2PR18MB3206.namprd18.prod.outlook.com
 ([fe80::adf9:7570:c3ae:f686%4]) with mapi id 15.20.2347.021; Mon, 14 Oct 2019
 08:08:58 +0000
From: Clemens Famulla-Conrad <cfamullaconrad@suse.com>
To: "pvorel@suse.cz" <pvorel@suse.cz>
Thread-Topic: [PATCH v5 3/5] shell: Add timeout shell API tests
Thread-Index: AQHVgDMIKdQeSmLDiUGc5VFSewwfHqdVZkkAgAAJxQCABFzLAA==
Date: Mon, 14 Oct 2019 08:08:58 +0000
Message-ID: <1571040536.6146.0.camel@suse.com>
References: <20191011095442.10541-1-pvorel@suse.cz>
 <20191011095442.10541-4-pvorel@suse.cz> <1570797394.4238.7.camel@suse.de>
 <20191011125413.GA30000@dell5510> <20191011125648.GF2591@rei>
 <20191011133129.GA23391@dell5510>
In-Reply-To: <20191011133129.GA23391@dell5510>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=cfamullaconrad@suse.com; 
x-originating-ip: [90.187.83.213]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e79093a8-accf-4b81-c4df-08d7507dc3eb
x-ms-traffictypediagnostic: CH2PR18MB3221:
x-microsoft-antispam-prvs: <CH2PR18MB322130B0705D3E61061CD316AD900@CH2PR18MB3221.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(199004)(189003)(103116003)(6916009)(256004)(316002)(478600001)(18001115003)(3846002)(6506007)(6116002)(6512007)(2906002)(102836004)(4326008)(6246003)(81156014)(229853002)(2351001)(8936002)(76176011)(1730700003)(6436002)(8676002)(81166006)(5640700003)(19618925003)(25786009)(476003)(11346002)(446003)(2616005)(6486002)(486006)(7736002)(305945005)(186003)(86362001)(26005)(76116006)(99286004)(66946007)(91956017)(558084003)(71190400001)(71200400001)(66476007)(36756003)(2501003)(14454004)(66556008)(64756008)(66446008)(66066001)(555874004)(403974003)(482994005)(558944008)(19559445001)(15288005002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3221;
 H:CH2PR18MB3206.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NlcXD4u10uZKh30uPaPtT6lW5Xifpva8fhs1wFPfey8QtWcEUSOy06egFY9LbRkVJPdwrkTNu8R5K4LtalKQZ+cyNSFMFZG5Dd9lucsZTVqcM38txXoIy+xrsEoxHr4zqzW8/svSgRgaABJNgAB3uUP6WjM1TCgeErHeQlcoS2HPLJPzmo7iSreEEFNbVKjxNavpAVyaPYnKH2hSktV2lRWdNitKkfDGiyrwS082rfTEt25O0+k73SpkB1nyhZ6Qc6oF/TlS1Td6V0dK80Vp7z7RMcuntM2lyTXi6jbdiNs=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e79093a8-accf-4b81-c4df-08d7507dc3eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 08:08:58.1948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: haMDbxxnjMvj/uCjtsEAggSyNGPTZj3j3fUDpO8KnEdOe31koXTo3sqz2bNIJh2vYiPuVOPpw2UhsD5sDuoSqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3221
X-OriginatorOrg: suse.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 3/5] shell: Add timeout shell API tests
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

Ack

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
