Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A160B0DDE
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 13:33:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D7E53C2091
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 13:33:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 96C883C0309
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 12:08:04 +0200 (CEST)
Received: from m4a0041g.houston.softwaregrp.com
 (m4a0041g.houston.softwaregrp.com [15.124.2.87])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BEB22101315B
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 12:07:49 +0200 (CEST)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 12 Sep 2019 10:06:06 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 12 Sep 2019 09:51:06 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 12 Sep 2019 09:51:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oa03ZQij/EhQJJsJua/q1DaUAan5hfOWoI7abE6c3fz9wV+zc4Cr8vefb6ASWCdgCb+6zPRQqeLKzzctWrRv92jyGzoHM5p+kma6tBYvOJ0BkyPqArdkFT1SCoC0vlBb0KqFaM6CfVNYunHvocRPd47ISjkoTJ6zbYr7PvdraoUS2R3DiynMPQGp70Mltn1Wb0r/IoGPGlHji9btamJNlhqymlNr2O69VAgIE6p6s7IMCW1/30+qppuwT6nWAk7anX22Q8iHzPLdei3h0MaN6hxJFJlAjWB6qrVsoiAczPc0muH2dASKxc14XhuR8tus7mPWpI4t53Mmc4hM0egfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idhPhe6MbFeHJbQ9FA9tOSivyEWhioT5PVfUjRGTpyo=;
 b=BAgBVLlRqbyufDIBvvZsgkO6AFP/8FiaykegRKZPJ/Q2j81DtoZ+5ACBEI5dmX3GFiFoF1ULW+EgIJlBadhNget6jfjKWnwmGyBLTQswTiLk2bD+5897E8cJXGO2SnoCfv0fiFnKtTv73PNqvr20NgoWc+OLiIVBpnFgcuxWvCKlwr2wPJ3Tm/ehWRtpy11/w+ub2WL8IlYU9gF8Vr4chQx5Sk42wU/N6kyH1xIX9nOhTX2OE5d4OF8rvVgRfSdrOhPFP+bjAq33/AuYHXgROsLV6ccsQeXu2TqZj9vLqXn8E+jBGicq/dAHnuL3VhjNugDputSmcoYWcQjo3gEHcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3206.namprd18.prod.outlook.com (52.132.247.79) by
 CH2PR18MB3109.namprd18.prod.outlook.com (52.132.231.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.17; Thu, 12 Sep 2019 09:51:04 +0000
Received: from CH2PR18MB3206.namprd18.prod.outlook.com
 ([fe80::d08b:9bf9:2af:2207]) by CH2PR18MB3206.namprd18.prod.outlook.com
 ([fe80::d08b:9bf9:2af:2207%4]) with mapi id 15.20.2241.018; Thu, 12 Sep 2019
 09:51:04 +0000
From: Clemens Famulla-Conrad <cfamullaconrad@suse.com>
To: "liwang@redhat.com" <liwang@redhat.com>
Thread-Topic: [LTP] [PATCH] memcg_stress_test.sh: Respect LTP_TIMEOUT_MUL set
 by user
Thread-Index: AQHVaU1TeJE6lGUN70ewINNFJ73YC6cnzJKA
Date: Thu, 12 Sep 2019 09:51:04 +0000
Message-ID: <1568281863.3621.15.camel@suse.com>
References: <20190829181146.20261-1-pvorel@suse.cz>
 <CAEemH2dzn92GYwiw2tP101wNkYfM30rfL=cmPU+B1iH-8UWoDw@mail.gmail.com>
 <20190830085036.GA27453@dell5510>
 <9e518589-9c98-1513-2c19-bae0268b8a81@arm.com>
 <20190830104609.GA9330@dell5510>
 <CAEemH2ch1+asP7OKikqrM4Sea2f2xvVB4JPbUqDkm41cFJ+kdg@mail.gmail.com>
 <1568279073.3621.12.camel@suse.de>
 <CAEemH2cw+O5ZrZyQV5qy7wp6-h1SSinu3ENueRG7Gr--xJCRfA@mail.gmail.com>
In-Reply-To: <CAEemH2cw+O5ZrZyQV5qy7wp6-h1SSinu3ENueRG7Gr--xJCRfA@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=cfamullaconrad@suse.com; 
x-originating-ip: [94.134.172.166]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccb65db1-d9b3-4c43-2f8a-08d73766ba15
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CH2PR18MB3109; 
x-ms-traffictypediagnostic: CH2PR18MB3109:
x-microsoft-antispam-prvs: <CH2PR18MB31095B1D89FEDF4E6E7EA0E4ADB00@CH2PR18MB3109.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(199004)(189003)(6916009)(229853002)(8936002)(305945005)(99286004)(36756003)(86362001)(53936002)(6512007)(5660300002)(6116002)(6436002)(5640700003)(6486002)(3846002)(54906003)(2351001)(7736002)(8676002)(1730700003)(6246003)(316002)(11346002)(446003)(14454004)(478600001)(2906002)(102836004)(76176011)(25786009)(4326008)(81166006)(81156014)(14444005)(256004)(486006)(6506007)(26005)(476003)(2616005)(186003)(2501003)(66066001)(71200400001)(71190400001)(64756008)(76116006)(91956017)(66946007)(66556008)(66476007)(66446008)(103116003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3109;
 H:CH2PR18MB3206.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: docsyFgomtJd5+ti4ilxR7Jny6KD4Pz9BLK6hbzdI/5/wSnV1nWVQsXt0vp/hY3yeK1OYXUb55iC5RUsymui9F9ez2QWSgVb79x1HYosV9SIw25o4jmqiE2h+auP5+cVdz7bQPJNqaqeFt3g6mAAvwJoLWgkiBcn7kHNMMeNI8hZ44AYx4x28bFYQKQIJ9+zHrE/ZHyosbL+iaq+gdi3ra9kmbcNiUAXdAWJQpOfWx3nWqJMh8JMzxhDVXES1RHjaHac6uE+4sZ2iNsR863oPitX0oe7+LsHd9fmhHisk90VAjHkAkG6+QGN5UbkWjs56+ZARlwniFSPNiBppY52D/4xUpHGv9B7QkO4k44ioFtA0+H4lovynPXKUOiZ/KL/LBnUHa119Rh8S776IoIB+02D5HlNRHaz88GXvm6roFM=
x-ms-exchange-transport-forked: True
Content-ID: <4D19C7F7A7733E4BA74AFC9CC79A6384@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb65db1-d9b3-4c43-2f8a-08d73766ba15
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 09:51:04.3167 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7tR5KOHffQXmNJ7P9qB4quX32OesCkUCLJagZHVK6m6QxtNFjCY5thGjYqMfOgqpAi0JoDvDBgqljGm3qVGS5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3109
X-OriginatorOrg: suse.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 12 Sep 2019 13:33:15 +0200
Subject: Re: [LTP] [PATCH] memcg_stress_test.sh: Respect LTP_TIMEOUT_MUL set
 by user
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

On Thu, 2019-09-12 at 17:34 +0800, Li Wang wrote:
> > > > > I also wonder if it is worth somehow put this minimum-enforce
> > > > > mechanism inside the framework itself
> > > > > instead that hardcoding it in this specific test (unless you
> > > > > already mean to do it this way...
> > > > > and I misunderstood)
> > > > 
> > > > Yes, I was thinking about it as well.
> > > > LTP_TIMEOUT_MUL should be reserved for users, tests should use
> > > > LTP_TIMEOUT_MUL_MIN,
> > > > check for LTP_TIMEOUT_MUL being higher than LTP_TIMEOUT_MUL_MIN
> > > > would be in
> > > > _tst_setup_timer(). Similar mechanism I introduced in 9d6a960d9
> > > > (VIRT_PERF_THRESHOLD_MIN).
> > > 
> > > +1 agree.
> > 
> > I have a general question. What do we try to get with
> > LTP_TIMEOUT_MUL_MIN? From my perspective, we try to set a minimum
> > timeout value. Isn't it the value (struct tst_test*)->timeout ?
> > 
> 
> Well, the (struct tst_test*)->timeout is the default minimum value to
> set a
> timeout, but for some test case(e.g memcg_stress_test.sh), they
> required
> time should be higher than the default. So as we discussed in the
> above
> mails, we're planning to introduce a new variable LTP_TIMEOUT_MUL_MIN
> to
> set as a new minimum value for test timeout. The operation will be
> encapsulate in function  _tst_setup_timer().
> 
> 
> 
> > 
> > I'm missing such configuration value for shell. Is there one?
> > 
> 
> No, we don't have it so far.
> 
> 
> > 
> > Or do we need to increase timeout in smaller steps and that is why
> > we
> > need this LTP_TIMEOUT_MUL_MIN?
> > 
> 
> Hmm, what we want to do is:
> 
> If a testcase needs timeout value is larger than the default (300
> sec), we
> could only define a variable LTP_TIMEOUT_MUL_MIN in the test, then
> the
> _tst_setup_timer() will detect if LTP_TIMEOUT_MUL_MIN is valid and
> reset
> the minimum time for the test.
> 
> @Petr and @Cristian, If I misunderstand anything, please correct me.

So from what I understood now, we need to specify a minimum timeout and
not a minimum timeout multiplier.
And we already have it for c, but only miss it in shell, or?

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
