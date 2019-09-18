Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 79956B68D4
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 19:18:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 234E03C20E3
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 19:18:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 53D253C20B5
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 19:18:19 +0200 (CEST)
Received: from m4a0039g.houston.softwaregrp.com
 (m4a0039g.houston.softwaregrp.com [15.124.2.85])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4358C600815
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 19:18:17 +0200 (CEST)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP FOR ltp@lists.linux.it;
 Wed, 18 Sep 2019 17:16:22 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 18 Sep 2019 17:16:53 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 18 Sep 2019 17:16:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eweYtUWUHZzvAKCrp2w8qxk9eeYqB5/fuaoolGMa13o13tH84M9rPEl2aVM6BenjzpDHQ/a41qyxcCv3MOsvDb3s09T2aRviXUCgQK8mcDHmO3s9eY2WDOp6MOWgshTCZv17eh7S/auouQk991NR9A0FpSj3HoTyVZa53+t7S/iV1tty1KO5nPzWbTArtseMxRe1kqi3bLyqx25KO4LVX1KnFhVsm8KyQw5SdidxcfwYWgQiX035B1P/4eqqNDhTRAuNZTMSGxU0VSwQ2+VYl3IzfA5RAJK90/VTmxbnFEpq2f81ky6ROUexnRDTd2raUodHm9Rf0agrXyUtEQF3OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOZdltXWY99vHXKu5dXKOij6rWiUIVmZXB6VuKg1aZU=;
 b=YbGVx8uNwJAXDmwps8S5cNsJPEcWXtI7K5Hwq9AoGVTqrZvnNh4eDXOQ34mKGPe0aZFEdlVJDiSIPOA6yLm5o3Nw4mgiS6zaCqPg9YryMeiwqq8YWBAnELHi1uluREismLrGcfYr+VucOSAzdpUqIWc1TWEUbp8trXoyrJ3JOpd2bCIZOjiPOys4IMFZ0vOO78TF+Iqt5wlBCrPDBUxG5IddHRtxTrc6hgqVJKxWwpNB77xFEsrfcB9JcIqQYqzRRRtjz3b0jMGpOoge3klW3dpFdiU78qV0ASPT8VWwgAcJc00SWWcA8bRlU3W3mKMt7CEdzErTFSRSrya3rjOu0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3206.namprd18.prod.outlook.com (52.132.247.79) by
 CH2PR18MB3397.namprd18.prod.outlook.com (52.132.246.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Wed, 18 Sep 2019 17:16:52 +0000
Received: from CH2PR18MB3206.namprd18.prod.outlook.com
 ([fe80::d08b:9bf9:2af:2207]) by CH2PR18MB3206.namprd18.prod.outlook.com
 ([fe80::d08b:9bf9:2af:2207%4]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 17:16:52 +0000
From: Clemens Famulla-Conrad <cfamullaconrad@suse.com>
To: "pvorel@suse.cz" <pvorel@suse.cz>
Thread-Topic: [LTP] [PATCH v2 2/3] shell: Introduce TST_TIMEOUT variable
Thread-Index: AQHVbgU1dsPurTH1r06j0X2ru4u2NacxrawA
Date: Wed, 18 Sep 2019 17:16:51 +0000
Message-ID: <1568827010.6619.2.camel@suse.com>
References: <20190913125823.17314-1-pvorel@suse.cz>
 <20190913125823.17314-3-pvorel@suse.cz> <1568629595.3028.13.camel@suse.de>
 <20190918094039.GB11711@x230>
In-Reply-To: <20190918094039.GB11711@x230>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=cfamullaconrad@suse.com; 
x-originating-ip: [193.86.95.52]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49b7709c-5846-4ea8-30a8-08d73c5bff64
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CH2PR18MB3397; 
x-ms-traffictypediagnostic: CH2PR18MB3397:
x-microsoft-antispam-prvs: <CH2PR18MB3397A5E6707E53CE71A2FE31AD8E0@CH2PR18MB3397.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(189003)(199004)(2351001)(2501003)(3846002)(99286004)(6246003)(81166006)(6116002)(256004)(186003)(71190400001)(76176011)(316002)(6512007)(7736002)(8936002)(305945005)(4326008)(8676002)(25786009)(86362001)(26005)(102836004)(103116003)(11346002)(2616005)(1730700003)(66946007)(81156014)(5640700003)(14454004)(71200400001)(486006)(64756008)(91956017)(76116006)(5660300002)(446003)(2906002)(66446008)(55236004)(66556008)(476003)(66066001)(6506007)(36756003)(229853002)(6916009)(6436002)(6486002)(478600001)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3397;
 H:CH2PR18MB3206.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Rvdrqt4mm4cusTqwPnJ1yNi3SOt28cbB7IJ9tfM7rUEBuJ2/3GaIXn3qzfoKcVDFxvKxxj3CHcltnH5Eb/UIYjg5FUkSmn5lKaiTKVhcNIMOsGby0ZrRwFazDb+0cBhIVcK3/GjmXyuNjl6MofYLu5MRWYkbgBhPLHFzO8KN7TnZ95Xpl9FZ9CEXDw9VuA9kO2hZKO1oDEr4nBNk2d8vXKLfpsCsMuzqgZ5IFCSCT9jS2eh4oRzt40yP2daYz30g4eU6XvWoBsza7rhbar7/4yCJs1roRlU2X7RSirwSGNthVysFDyMXvgWBGdnDA+eTmX6/P8n/wGcZngBMV/A4IKdXUXwfXeMchWqExab3zUaTaejrxpMO0E9/yzaaX1t58Nfi+R99u09f98fRqchiWKsZQ5bUPTIW0AYMb2GBALg=
x-ms-exchange-transport-forked: True
Content-ID: <9D59D7CCB931B440B6A815EF061A192D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b7709c-5846-4ea8-30a8-08d73c5bff64
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 17:16:51.9741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0NuK4x0k1QFebnrJJvj6j8x0Y7XFhxlcGmqCIQCHg1LwbR4PyVofqJ4e2ZfD6FPh+ArkzBAjDAkg8TZvIRRb1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3397
X-OriginatorOrg: suse.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] shell: Introduce TST_TIMEOUT variable
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

Hi Petr,

On Wed, 2019-09-18 at 11:40 +0200, Petr Vorel wrote:
> Hi Clements,
> 
> > Hi Petr,
> > only some small comments below.
> > On Fri, 2019-09-13 at 14:58 +0200, Petr Vorel wrote:
> > > <snip>
> > > -2.3.2 Library variables
> > > -^^^^^^^^^^^^^^^^^^^^^^^
> > > +2.3.2 Library environment variables for shell
> > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >  Similarily to the C library various checks and preparations can
> > > be
> > > requested
> > >  simply by setting right '$TST_NEEDS_FOO'.
> > > @@ -2047,6 +2058,14 @@ simply by setting right '$TST_NEEDS_FOO'.
> > >                         the test (see below).
> > >  | 'TST_NEEDS_MODULE' | Test module name needed for the test (see
> > > below).
> > >  | 'TST_NEEDS_DRIVERS'| Checks kernel drivers support for the
> > > test.
> > > +| 'TST_TIMEOUT'      | Maximum timeout set for the test in sec.
> > > Must
> > > be float
> >       ^
> > I think TST_TIMEOUT isn't evaluated in c at all. There we have
> > `(struct
> > tst_test*)->timeout` which is `int`,
> > tst_test*)->timeout (BTW it's *unsigned* int).
> 
> Correct, thanks!
> This is a proposed description, which I'll post to v3.
> (using tst_test.timeout to be short enough, is that ok?):
> > 'TST_TIMEOUT'      | Maximum timeout set for the test in sec. Must
> > be int >= 1,
> 
>                        or -1 (special value to disable timeout),
> default is 300.
>                        Variable is meant be set in tests, not by
> user.
>                        It's equivalent of `tst_test.timeout` in C.
> > 'LTP_TIMEOUT_MUL'  | Multiply timeout, must be number >= 1 (> 1 is
> > useful for
> 
>                        slow machines to avoid unexpected timeout).
>                        Variable is also used in C tests.
>                        It's meant to be set by user, not in tests.

ACK

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
