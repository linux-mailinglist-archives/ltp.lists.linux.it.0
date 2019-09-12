Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FA4B0DDF
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 13:33:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A252B3C20CE
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 13:33:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id AE6963C207F
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 12:37:18 +0200 (CEST)
Received: from m9a0003g.houston.softwaregrp.com
 (m9a0003g.houston.softwaregrp.com [15.124.64.68])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D2BFC14088F4
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 12:35:55 +0200 (CEST)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 12 Sep 2019 10:35:06 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 12 Sep 2019 10:16:43 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 12 Sep 2019 10:16:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUg8NUxJL7yc3tLLS0NW529K79oXXq4MMEZ63UVYIQkQTGBuU3KnzyhmvZN2+dnYbaAmsulkTFDJfeUc/KidrxEYWM8LzsOb/JpIUZjgd5wvLjOSxguP252X8MlqhaupyXZ0Pt4t72eYYxmbH2Vu6+2rDGkdxtCN5PUR9tqJH2N5jK3QIRWbNvXnEbrZdPhuJvHnur2SK1ehGktKy9KQZVsn7m3CINjr/gS/fzvZDa0s1JTfe6qTlkAhI0s9bHUPTUpr+UBK7duP2GBU52OKTXnhavBY+WnmZtEvNui1YHwj/CpS2FzfBUQqjmqUHtWolc+Ph6UbTM/Q5Qt7GoKyjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxs1bsgTvhwJ0FAK9Fs3j3inJ3CtyBOkC4cbmQ6sN7g=;
 b=VljhDanIh+ZsP/2pOK2dCzVkHj9WMcEqvtI8GxwTv8nMwELc8ZZgnnZVTSIPCtwReiou8XNqedkD4SHa6Gs9Dr/mi0ZH9rDbMOsFTo8q5aFOxCYmUIaWixHxnLIded8Dd9/etSCxOx7pAEdQtQYn0pf9ukGEcyQwRrwM+KFt8MlM2LyRrbrceD6VMS8jueDnygmGrFbv9MXp176hJc4vNMVtmkf4PNh+HKWiDc2JRstj8qqvTvvMhXOE0IbS4wU6uBYwU4vHUAsvs1dLkIcZ4GfnRlNT2/PDjaD9h2tnog5kHh081xMAz/aZPqMs638qGYSppP8mBl7s5w4lKDLuwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from CH2PR18MB3206.namprd18.prod.outlook.com (52.132.247.79) by
 CH2PR18MB3255.namprd18.prod.outlook.com (52.132.245.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Thu, 12 Sep 2019 10:16:37 +0000
Received: from CH2PR18MB3206.namprd18.prod.outlook.com
 ([fe80::d08b:9bf9:2af:2207]) by CH2PR18MB3206.namprd18.prod.outlook.com
 ([fe80::d08b:9bf9:2af:2207%4]) with mapi id 15.20.2241.018; Thu, 12 Sep 2019
 10:16:37 +0000
From: Clemens Famulla-Conrad <cfamullaconrad@suse.com>
To: "liwang@redhat.com" <liwang@redhat.com>, "cristian.marussi@arm.com"
 <cristian.marussi@arm.com>
Thread-Topic: [LTP] [PATCH] memcg_stress_test.sh: Respect LTP_TIMEOUT_MUL set
 by user
Thread-Index: AQHVaU1TeJE6lGUN70ewINNFJ73YC6cnzfBtgAAFx4A=
Date: Thu, 12 Sep 2019 10:16:37 +0000
Message-ID: <1568283397.3621.23.camel@suse.com>
References: <20190829181146.20261-1-pvorel@suse.cz>
 <CAEemH2dzn92GYwiw2tP101wNkYfM30rfL=cmPU+B1iH-8UWoDw@mail.gmail.com>
 <20190830085036.GA27453@dell5510>
 <9e518589-9c98-1513-2c19-bae0268b8a81@arm.com>
 <20190830104609.GA9330@dell5510>
 <CAEemH2ch1+asP7OKikqrM4Sea2f2xvVB4JPbUqDkm41cFJ+kdg@mail.gmail.com>
 <1568279073.3621.12.camel@suse.de>
 <CAEemH2cw+O5ZrZyQV5qy7wp6-h1SSinu3ENueRG7Gr--xJCRfA@mail.gmail.com>
 <e07d08e2-df58-2114-0278-8f1e50f2ac3a@arm.com>
In-Reply-To: <e07d08e2-df58-2114-0278-8f1e50f2ac3a@arm.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=cfamullaconrad@suse.com; 
x-originating-ip: [94.134.172.166]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6659779-ea8c-4b38-a2ed-08d7376a4c11
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CH2PR18MB3255; 
x-ms-traffictypediagnostic: CH2PR18MB3255:
x-microsoft-antispam-prvs: <CH2PR18MB3255706D89B88131A8C9DAE7ADB00@CH2PR18MB3255.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(199004)(189003)(99286004)(64756008)(66066001)(66556008)(476003)(446003)(11346002)(2616005)(66476007)(66446008)(4326008)(305945005)(256004)(14444005)(186003)(36756003)(66946007)(486006)(8676002)(81156014)(81166006)(14454004)(8936002)(6506007)(102836004)(25786009)(478600001)(3846002)(6116002)(2906002)(91956017)(86362001)(53936002)(6436002)(71190400001)(71200400001)(6512007)(2501003)(6486002)(103116003)(76176011)(7736002)(26005)(5660300002)(54906003)(76116006)(316002)(229853002)(110136005)(6246003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR18MB3255;
 H:CH2PR18MB3206.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +DWcj8SO/Cj1DW9029x0RTp8aw4ESln89Y+NS6N65/3AWxCzBhkONv9HosG7NnQjRghgOfn0ModW46o5vgNPwQsyXf/od7pA78VLb2fA47AX9sukmtM4kFYIvUFPQ5uus4q5xgXXpeU+uU7fYCqyAUDxCDaMqCVoQ2fWQn4r/jgmmj9lO41i2CFttV9P1LLSuQxDhFw9m/cjPQCitzxjsvIAuae+023Q34E/BqdJeIiB/wsg3EUrgV/We5RQbYXu/Ulg8KOk8Ir32wqhnP99obooIgPr2cvKgYCiyeo7Ka12ALMX4A/kB0X0NLKfxLMtvYmKkhqb+GC02J6EsxuMo9itllYlDt0eNfjAJDu5vYIgAvUk/XwGHlags5YBT6e65eWWx+4gvfUvtmVbuLin5qs8uMMEx7DCFPRMEWZ5N7c=
x-ms-exchange-transport-forked: True
Content-ID: <7D9EDEFE88EA7447920AD9A7CE6D57E2@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e6659779-ea8c-4b38-a2ed-08d7376a4c11
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 10:16:37.7100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sS/aEPwAwXWBO9fyU0/wHpjS5f9c7SIbo/nUXceQHYXyI2vGMiErGQU+2/WkhTpLdpG0c8cDoUitcbVq8BUUnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR18MB3255
X-OriginatorOrg: suse.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

On Thu, 2019-09-12 at 10:55 +0100, Cristian Marussi wrote:
> Hi
> 
> > Hmm, what we want to do is:
> > 
> > If a testcase needs timeout value is larger than the default (300
> > sec), we
> > could only define a variable LTP_TIMEOUT_MUL_MIN in the test, then
> > the
> > _tst_setup_timer() will detect if LTP_TIMEOUT_MUL_MIN is valid and
> > reset
> > the minimum time for the test.
> > 
> > @Petr and @Cristian, If I misunderstand anything, please correct
> > me.
> 
> my understanding was that:
> 
> - we should already be able to set a non default per-test timeout
> using
>   the existing global LTP_TIMEOUT_MUL (and we are)
> 
> - in this test we hardcoded such LTP_TIMEOUT_MUL to 7 because is the
> minimum sane
>   value for this test (less than 7 and it fails 100%)
> 
> - we want to allow again the user to specify its own LTP_TIMEOUT_MUL
> if he wants
>   BUT also being able to enforce on a test by test basis a MINIMUM
> allowed value:
>   so we would define LTP_TIMEOUT_MUL_MIN=7 here, and then a user
> would be free to 
>   run LTP with a different global LTP_TIMEOUT_MUL but when running
> this test
>   
>   + if LTP_TIMEOUT_MUL < LTP_TIMEOUT_MUL_MIN ===> use local
> LTP_TIMEOUT_MUL_MIN
>   + if LTP_TIMEOUT_MUL >= LTP_TIMEOUT_MUL_MIN  ===> use global
> LTP_TIMEOUT_MUL
> 
> This way you don't break specific tests' needs while allowing the
> user to global reduce
> run-time....now basically the user cannot enforce a higher timeout on
> this test
> using the global LTP_TIMEOUT_MUL even if it should be allowed to
> since this wouldn't
> break the test.
> 
> ...unless I misunderstood too o_O :D

Thanks for explaining. That's how I understood the idea of
LTP_TIMEOUT_MUL_MIN, too.

But what I understood from current "c" approach is:
We have a fixed (minimal) timeout value, specified in (struct
tst_test*)->timeout, which can be adjusted by user with environment
variable TST_TIMEOUT_MUL.
This behavior is missing in shell.

And if we now introduce a LTP_TIMEOUT_MUL_MIN, it doesn't make much
sense, cause we have already a timeout min. So I think, we only need
something to specify the default minimum timeout in seconds for shell
(like we already do in c) and we are done.

Thanks
Clemens

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
