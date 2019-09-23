Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E98C6BB91C
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Sep 2019 18:08:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ACBB03C2075
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Sep 2019 18:08:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E07933C025A
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 18:08:46 +0200 (CEST)
Received: from esa2.cray.iphmx.com (esa2.cray.iphmx.com [68.232.143.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5B61A1A00981
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 18:08:44 +0200 (CEST)
IronPort-SDR: fuQNqmC3qpsKddta5DdZ5PZELKwK8IEBb62LNd1sFKU2xsTQEqLbBAsuhHmM52yYkFEnX24bTL
 eDnD3CJqx+At18dkYkYcxTpk4lU6e3JPlCfzo+Q0Hc8QvRvme4f+NcKZi4pYxjV3kWFT5ohgre
 O76nBXLS9nC1AqY6dqFMYOqtXggkV6KntL2WrAE9yREW3YGec5fXgFqWoWdl82FZ9XCkPNze6i
 sGvLNzMPhbSpWGchF3Ad+kXFqH8b0U+xOpiAVN02eS3Xlt08Bk0/nUJeQNhSKKZQsI9wHOUNyC
 /xk=
X-IronPort-AV: E=Sophos;i="5.64,541,1559516400"; d="scan'208";a="27678514"
X-Cray-OBMMKR: 1433258124 27678514
Received: from mail-by2nam03lp2057.outbound.protection.outlook.com (HELO
 NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.57])
 by ob1.cray.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 17:08:42 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KeFGJX06HO/k6odQHwXDKXB4CNQLq83OlwYwf8x8Mb03u0jBhLigV/FhzcwYvqrOBlglhFi+tPggEs9eoYNeFexPzXQIRSn5C9IP7NUB01tRoL/4GENcN7jIuY9OdU4D1Wl+4Vf+xpQRvg+8DPj1BAuNHPhDmtnsYJWHZiIrKH8N+kMucWLOAvpqPSNcNiliI3AdxxegYYWne9RlKFlVDi0Ety3uRX0adQRVS7vM5Ca/FFbqX47JQpS8obE+VBPvty0TOZJsyMB3nJqy54EjvN/Liz6fosd54jckCF+qfU3ZwbATVcFa8mZEDz4sTETXW0HbwghRhjALU4GPVUHapA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9hlP6V30KCo+8AX0sug3seiP4YYy51zUB6MEzxs44E=;
 b=G5h2u+i26ex3v0x3ERNg0MTvUnQCAH+2vr2zkk0wXkQcwvo8ntNeXmKkYEcnqdCZAutN/er8ziy7hR43+FMeaG4qzE1SwstWOJfMsgwbK5HqIITbmDlMykrGhcnB2JhqW0o4ysilGKnmmkOeHVc4qzCK3kNMrGEKn6NNtOReGJ+zoxtaBtxWYr0PQwYumiEmT08yztFXfboR543RgFv3m8XJooKH48DoIpV1Ju85wGwpVyHFGBggjHtjR37/T6Ohl8hM4Kqrd/6beLXQGAR9Um2u1ol19hNKdzBsW30TaWZDr9sFS0KbKapJ2tvUTCAUAD3Kz+QuVC2CRdmqZng7pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cray.com; dmarc=pass action=none header.from=cray.com;
 dkim=pass header.d=cray.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crayinc.onmicrosoft.com; s=selector2-crayinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9hlP6V30KCo+8AX0sug3seiP4YYy51zUB6MEzxs44E=;
 b=MfAM7KLP4BlOs/3eIu2kyNodCLrayFpDuT5hU02CYnAXZ1vOFm25qL519KmE+hmbVf0btrPoyMQ/ZFj0F13EUhx9iK3UCMfBNTMqX9a6I01zVw1gEKNw+txbF2WDmgUr/+QjOWyAdgPxDlydem1ykYd+u8p+f0UVeimy4wI5B2Q=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (20.178.239.225) by
 BYAPR11MB3319.namprd11.prod.outlook.com (20.177.127.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Mon, 23 Sep 2019 16:08:41 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::951a:b7d5:8953:14eb]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::951a:b7d5:8953:14eb%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 16:08:40 +0000
From: Steve East <sge@cray.com>
To: Petr Vorel <pvorel@suse.cz>, Richard Palethorpe <rpalethorpe@suse.com>
Thread-Topic: [LTP] [PATCH] fzsync: Add reproducing race-conditions section to
 docs
Thread-Index: AQHVcg7A9yqzbdOtjEKTfsjksrZvsKc5aaCAgAAD9QA=
Date: Mon, 23 Sep 2019 16:08:40 +0000
Message-ID: <BYAPR11MB362484D50E4178C05B7D09C3CD850@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20190923125914.2572-1-rpalethorpe@suse.com>
 <20190923155215.GA2531@dell5510>
In-Reply-To: <20190923155215.GA2531@dell5510>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=sge@cray.com; 
x-originating-ip: [136.162.2.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d0ad929-1d5e-47bb-9e6d-08d740404cf9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BYAPR11MB3319; 
x-ms-traffictypediagnostic: BYAPR11MB3319:
x-microsoft-antispam-prvs: <BYAPR11MB3319240A3928A951931793CDCD850@BYAPR11MB3319.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(346002)(396003)(376002)(366004)(136003)(189003)(199004)(66946007)(7696005)(6116002)(3846002)(81166006)(7736002)(74316002)(25786009)(14454004)(81156014)(110136005)(66066001)(99286004)(5660300002)(229853002)(476003)(305945005)(8676002)(256004)(9686003)(6246003)(55016002)(186003)(71200400001)(102836004)(6436002)(71190400001)(6506007)(26005)(66446008)(64756008)(66556008)(66476007)(86362001)(4326008)(486006)(2906002)(478600001)(33656002)(446003)(316002)(76116006)(52536014)(8936002)(4744005)(11346002)(76176011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR11MB3319;
 H:BYAPR11MB3624.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: f6/oPTDTSUbWfGHmP0vTZijcTAyHp7kBqCtWx0OMKsTtOGDiCH1soDzvB/ECgwuhwAKT/Th5gLv7mGsEaXkvj40a2uyBBZcEkthess+GWhI+3++y3T7cicfCi2VGKW67U6wt4y2VygRikBas1ULOgdv6P/7Bk4p3lzZrwXizYzhyKnOkQq4+fsg5EpPHjB8tR1XbcvMpWXR+rnvBG4PeEmSP7hL4pUCiX+gvCmQC83mgCtt7mDkwqxKDW+n2tIfowiH9gUuj2o7Qd7SzC/xJ5SVBKm7Z7vrQSgMU6I6oUQIUnOVlo3T5TTuCQmWi7c9HXW2vhCb/3jS1hPj4tim2jHtXmxmEweQ6X0b3McTQ5bo9/697Nu43Sqo6K21mi9E0z3Huy6icDFAX3LFXvDQqvXPrbs9IphdgTg5yyUphM1w=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: cray.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0ad929-1d5e-47bb-9e6d-08d740404cf9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 16:08:40.7797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e7b8488a-c0cd-4614-aae1-996bfabec247
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HyOZT8mnjQ7eL3VIzhVSOiu85f7lWDxNODfUAA0Am+mRR9pqpbISSSVAjnbxDHpj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3319
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fzsync: Add reproducing race-conditions section
 to docs
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

>> +2.2.33 Reproducing race-conditions
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> +
>> +If a bug is caused by two tasks in the kernel racing and you wish to 
>> +create a regression test (or bug-fix validation test). The 
>> +'tst_fuzzy_sync.h' library should be used.
>Looks a bit strange to have this in 2 sentences (I'd write single one), but you're a native speaker, so you must know what is correct :).

It is strange... 

"If a bug is caused by two tasks in the kernel racing and you wish to create a regression test (or bug-fix validation test) then the 'tst_fuzzy_sync.h' library should be used."

Steve.



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
