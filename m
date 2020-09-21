Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5273427316B
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 20:04:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 172323C2A45
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 20:04:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 048FC3C101E
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 20:04:36 +0200 (CEST)
Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com
 [185.183.30.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7A67C10006AD
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 20:04:34 +0200 (CEST)
Received: from pps.filterd (m0209319.ppops.net [127.0.0.1])
 by mx08-001d1705.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08LI0fvV025685; Mon, 21 Sep 2020 18:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=S1;
 bh=0kHN44xURaZyP0rJSs7Q3mMrvYgloVTpW6gLfXwipWw=;
 b=K2lwe0tq7o/ayasna7JKt93Ri1PR32MWg4z3hFAYTWgo0WUU143cKpfb0rHEb82Pta1g
 AVrDgdIJhY3WblUZzH1En54v3Vfq4UFYQc6U9XyycrnAVGZVlcJ6bRPz/gFQwRRf1jN2
 A+X0stKGb7G4ru0RRcwRIkvgnGePKPBPqYitEkURcBjlglaENTXXdXlvg/YIzcmU1uej
 odlwPiEjI9c/4Lh1/tibetB+WKP83/oUv+dwxkN8LLwxgkOlc6dD3jJDbVpynzESGZHp
 n7sgOiK5JWk2PCHdHRXZj0DMdeYvGi3NKIiR3DklZ5jZBRn+gJzYFTs37jgQPfP+GF3E 8w== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx08-001d1705.pphosted.com with ESMTP id 33nacqs1kk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Sep 2020 18:04:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+xx4tA8Xs+Jh3uBiL/wzuMCT0EUNgvpFBGM3Ik3l1KtkjRH09mzEh8JYcQ4iOkMD9feKn2fgTrmq14cz8hZygujsJK/0/5XueZ30Nu7FKbF/jPeuk26iYHFNigYqwbUTGkP1v/uI7bQf/VfjQ+pNb5eQA8quv2G2lPtJOPt0ay/VjC1TZR36aw9m0BKZi4zDwbwZ2QhnVxceCc8Agl5vpMSA4gs2TLD4WdoDAwzUlLmgwZu0dxpliYZA1drLNpKqNAPADaqH0YZKbP2RyKIRGPK8Qzf0RwkuIaLYqh3c61PPiFG0mIFdaCMUZDIvPLLTRH6zd7mnlTosLtpIk0bwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kHN44xURaZyP0rJSs7Q3mMrvYgloVTpW6gLfXwipWw=;
 b=SzwvpDYMaTxG2jdUdAPevl7fkZLKcW/EN62lGwSIc9qlAxG2OaZYM42Hn3u87DGF6FlVkUVAf64WdxUf1epeVMiYl0LxJ9jy021qeaCCgik3WmUrctEXklWxFKzLntn1Xhx/mT2xrUZxYFjq5XOZCzjqQSX6R4W0MteVsnGXEYk3ztoQelwjvUYAN8jGkZo6V16waigNP2ngld9iwxZRxAL5evJGrgwKDEhiNpxfgzFOsEenqRazm4uqQN3Hq+G8XRB5zZR0CVCfRzPF3L4KKsbG7NBWDkW/xIfzkxuVw8QQvz0Nh2myvbQlfVCGIiwmqlrjRBwGJf2EijIXMdeL5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from CY4PR13MB1175.namprd13.prod.outlook.com (2603:10b6:903:40::23)
 by CY4PR13MB0885.namprd13.prod.outlook.com (2603:10b6:903:4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.4; Mon, 21 Sep
 2020 18:04:30 +0000
Received: from CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3]) by CY4PR13MB1175.namprd13.prod.outlook.com
 ([fe80::882:fde6:250d:4bc3%12]) with mapi id 15.20.3412.017; Mon, 21 Sep 2020
 18:04:30 +0000
From: "Bird, Tim" <Tim.Bird@sony.com>
To: Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] LTP release
Thread-Index: AQHWhbIQCGbLXijA4EiknupaabeIZqlhkjIAgAZzL4CAAKzBoIAF2qMAgATpREA=
Date: Mon, 21 Sep 2020 18:04:30 +0000
Message-ID: <CY4PR13MB117574DFAE3DBBFF4BF24CF7FD3A0@CY4PR13MB1175.namprd13.prod.outlook.com>
References: <20200908073138.GB2475@yuki.lan> <20200910084554.GA21741@dell5510>
 <20200914111543.GE5524@yuki.lan>
 <CY4PR13MB117529F882F68FED2C60AD09FD230@CY4PR13MB1175.namprd13.prod.outlook.com>
 <20200918145752.GA16897@yuki.lan>
In-Reply-To: <20200918145752.GA16897@yuki.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.cz; dkim=none (message not signed)
 header.d=none;suse.cz; dmarc=none action=none header.from=sony.com;
x-originating-ip: [192.34.114.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 44792c01-4a13-4178-b5fa-08d85e58c984
x-ms-traffictypediagnostic: CY4PR13MB0885:
x-microsoft-antispam-prvs: <CY4PR13MB08850DFFA0C049EAA1FEB35FFD3A0@CY4PR13MB0885.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UV8RckZzt4svUCkDM4ina1Rg8ZzcCbnzFsJhjq3fNgxNJ/YOvTfv9PXh0Ip2/VU4qxnhEiZna4CYjyLYPm+EZnRnCCRcdnP+KrO4Mt1qbe/l1vlSfrnd3pZc+pc4OJUo6AcDLXHjW8zvXYzyThRMk/ZW1sv4IJ9seD3iUBxkMqtUrmXVZnqAj9UjX+5AXWXyo7ffWvu17M5+4v+kYr1aoDQGf4moTwPlpKUX2jp3FBgSo0bZr+XgnHQ9FYoynX0Objn+d71ZSWb2LccCWLLYt6QU2XLD/+HdI6InrkT2M50KEr7cV7p1gWQjZ6du1+rkvNwmnSBdpfUS5llLWz//tA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR13MB1175.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(33656002)(83380400001)(8676002)(316002)(8936002)(55016002)(7696005)(6916009)(5660300002)(2906002)(52536014)(9686003)(478600001)(76116006)(66556008)(66476007)(66446008)(64756008)(54906003)(4326008)(86362001)(71200400001)(66946007)(6506007)(186003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: aLGBPnGckPaAI1OMIP8E++wKW3hbouvO09dqDqr9fr3fvWW6+u0kuuFLqTZAYzcMlbmSyGIw0kyS8iIEgbbOCYetRqHKufFAZPR35EC6i10J4joXCauFG72ZSnjdTysuiRGDbpvKRKSY95dsC3B0EiUJesukRHvo1i7QzcjZhvFNtYkCi0bs6xM5P6aTSvvZHsNVAX9YrCZEPYeIAw0Tw7EAvNXe7HidG5XAm9koovLpCqjMnMgJ8U/aAuaV8tY0Q97gIeaKx86hFDZbY36lvHXdYKZoQoDc9HUpfATCYRKYLgHnRvsLDkVjJ7remMxIBCU12h6diUcugq+TGXcgXlLMDs8+FAeiOtOXcVAXQrUF81bI8DIZAAPe+kx6O7pxNqVJEd+oNJYinAAMMpLsOSLY9wg3Ucjlr+p8yI2XZ0JGXs48FCqPW3uIOaKYQd0iRUQdO1Q2dLX+0J5wGMeukpovtzwSSozwjfi/Jm10gZougm/6m0iAlQAklrvKydxEABlk5VvRax2XwoEVyVIgCB1Jykxj83uSLMhkX1krDJcZXWqo7b3kDwGPGolSsnhy10RQNrxsvE9K8t22sdLlMj+2GWESr8P8JQJsq5gvJnRaHci+n9ka0CRq25IaaGIDKO/+pM3/8TeN4S98GJf+6Q==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR13MB1175.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44792c01-4a13-4178-b5fa-08d85e58c984
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2020 18:04:30.3046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8GMmIwdbk0s9qNXM3ogHXVd43EiYnrc+fE0emUw50eVUV8YK7i5gEkh5K2MDQfsqV/DyDhtQVBfEsaI2UbQQ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR13MB0885
X-Sony-Outbound-GUID: IaKx443fMPR32RI7ePibLtgMvrQHnMze
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-21_06:2020-09-21,
 2020-09-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 malwarescore=0 mlxlogscore=905 mlxscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009210127
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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

Just to finish answering questions...

> -----Original Message-----
> From: Cyril Hrubis <chrubis@suse.cz>
> 
> > Do you have a preferred name for the runtest file?  My proposal, just off the top
> > of my head, is: "ltp-selftest-quick", but I'm open to other suggestions.
> 
> Maybe we should call it smoketest, but I'm okay selftest as well.

I'm fine with "smoketest".

...
> >
> > This takes about 5 seconds on one of my test machines.
> 
> So I will add a network test to the set and push that before a patch
> that removes quickhit.
> 
> It would be nice to have the outliners, but that is a bit more
> complicated change, so I would like to add these after a release, is
> that okay?

Yes.  I think that's actually better.  I think a simple change now
is good.  I'd like to think some more about whether it would be good to
add things that misbehave to smoketest, or if they should be put into
a separate selftest group.  My inclination is that a smoketest should really
just be a super-quick check that should work unless something fundamental
is broken, while selftest should try as many things as possible, including weird
stuff and corner cases, to actually test specific features of runtest handling.

I'm satisfied with the current smoketest content.

> 
> > P.S. Maybe, if you're moving away from runltp and ltp-pan, it's a little late to be
> > adding some selftests to make sure they work correctly.  But Fuego is using them.
> > I don't know what other frameworks use when they invoke LTP to perform
> > tests.
> 
> I do expect that we will have ltp-pan included for compatibility reasons
> at least for a year or two once the replacement would be in place
> anyways, so having a smoketest wouldn't harm at all.
Sounds good.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
