Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C266C158DF2
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2020 13:10:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C0B93C2387
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Feb 2020 13:10:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E56F53C224B
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 13:10:19 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 80D3B201009
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 13:10:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581423016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Lv99XegEkdx/gAhXA2YpX3IZluqQFguZFWjpib28hc=;
 b=UwmGdGRQaOFiNxl6KJjG300+9T8VR0/P2vjG/65mv+WyXMgrcM0+uvQWBpCxyRPqqkRjxb
 lL1cVrlv4ya2iqAXNMXPpF9eaEhcntgsVlT1Yk+2af2BGU96ONkSvQEjY9WxQSfM61eHCu
 aam0Pc1T/RWvrgAr5IX3KshOd5vmtHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-r_HdpGybNB6BwDYRQKRumQ-1; Tue, 11 Feb 2020 07:10:15 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A89E1800D42
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 12:10:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42C0D89F24
 for <ltp@lists.linux.it>; Tue, 11 Feb 2020 12:10:14 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 37C0C18089C8;
 Tue, 11 Feb 2020 12:10:14 +0000 (UTC)
Date: Tue, 11 Feb 2020 07:10:14 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <333995219.7015340.1581423014012.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2cJhxWcMj3k1ayasQegL-aPgjkkdypk881dXmjeV=MQmA@mail.gmail.com>
References: <87e6761eb699c7912e2064dea222f5ac7fd04a6b.1581338640.git.jstancek@redhat.com>
 <CAEemH2f90MPBV_w2+gw331cg0Fiu-=aqgp3M1BHhBCXcFUbyyg@mail.gmail.com>
 <1734212650.7000036.1581418326024.JavaMail.zimbra@redhat.com>
 <CAEemH2cJhxWcMj3k1ayasQegL-aPgjkkdypk881dXmjeV=MQmA@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.1]
Thread-Topic: syscalls/setrlimit06: lower RLIMIT_CPU parameters
Thread-Index: tEr4bAQB8SaAMOKLoXzu4gg+hP+N+A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: r_HdpGybNB6BwDYRQKRumQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/setrlimit06: lower RLIMIT_CPU parameters
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> On Tue, Feb 11, 2020 at 6:52 PM Jan Stancek <jstancek@redhat.com> wrote:
> 
> >
> >
> > ----- Original Message -----
> > > On Mon, Feb 10, 2020 at 8:47 PM Jan Stancek <jstancek@redhat.com> wrote:
> > >
> > > > Lower the parameters so that test completes faster where possible.
> > > >
> > > > This also increases alarm timer slightly, which in combination with
> > > > lower RLIMIT_CPU aims to avoid false positives in environments with
> > > > high steal time, where it can take multiple of wall clock seconds
> > > > to spend single second on a cpu.
> > > >
> > >
> > > This patch could reduce the test failure possibility, but I'm afraid it
> > > can't fix the problem radically, because with `stress -c 20' to overload
> > an
> > > s390x system(2cpus) in the background then setrlimit06(patched) still
> > > easily gets failed:
> > >     setrlimit06.c:98: FAIL: Got only SIGXCPU after reaching both limit
> > >
> > > Another way I can think of is to raise the priority before its running,
> > not
> > > sure if that will disturb the original test but from my test, it always
> > > gets a pass even with too much overload.
> >
> > Is this in addition to my patch? Because on its own I don't see how this
> > will help when load is coming from different guests.
> >
> 
> Yes, this is only solving for itself loads. Besides the high steal time,
> that's another reason I guess it causes the same failure, so do you think
> it makes sense to merge two methods together?

For now I'd go with just original patch. Until there is parallel test execution,
there shouldn't be any local load during this test.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
