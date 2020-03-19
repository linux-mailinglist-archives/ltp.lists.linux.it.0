Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0622218B3B6
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 13:49:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 943AD3C5469
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 13:49:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id CEB523C544C
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 13:49:06 +0100 (CET)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id A981D1400558
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 13:49:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584622144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z2xzZw6bLwUQoG5rmWBMWZ1mx1LOzPpDpwpeEfX5VGM=;
 b=CDHo9unSw9zdtvzm94x+MftyOfcrKHhzFawIoTr87e281PXHdtZOOShesBo0dJR7Yg7DS7
 SV/X0eRB01g9ZOfm+MGQvrPHBO9fJv3G2U6k28n2Pusn8t2XYgztGneEamGfM8fdo/SaC+
 hdxeOcEl7aA/KCnyyDquk2XhThd4XtM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-V4wSIg1XPVCCAjAEv2lyAg-1; Thu, 19 Mar 2020 08:49:00 -0400
X-MC-Unique: V4wSIg1XPVCCAjAEv2lyAg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB65810CE787;
 Thu, 19 Mar 2020 12:48:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEA625C1A2;
 Thu, 19 Mar 2020 12:48:58 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DE4018095FF;
 Thu, 19 Mar 2020 12:48:58 +0000 (UTC)
Date: Thu, 19 Mar 2020 08:48:58 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>, Li Wang <liwang@redhat.com>
Message-ID: <2016207059.2611128.1584622138390.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200317081547.GA15989@dell5510>
References: <20200313141458.GB21248@dell5510>
 <CAEemH2cNc7pCc-wB=4hGVquJT1Y5NCeZ_z8nH6D9V+J_5o_TWw@mail.gmail.com>
 <20200317081547.GA15989@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.29]
Thread-Topic: Define minimal supported kernel and (g)libc version
Thread-Index: qLbHHaSm+1t3yh5yQf720VGjmPNbSQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Define minimal supported kernel and (g)libc version
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
> Hi Li,
> 
> > This is a good topic, thanks for kicking off this initiative!
> Thanks for your input.
> 
> > > I'm sorry, I've raised this question in the past, but it got lost.
> > > I remember we talked about 2.6 something.
> 
> > Yes, the past discussion is still valuable to us. see:
> > http://lists.linux.it/pipermail/ltp/2019-May/011990.html
> Great, thanks!
> 
> > > It'd be good to state publicly the oldest kernel and glibc (or even other
> > > libc
> > > versions) we support.  This would allow us to remove some legacy code or
> > > force
> > > support for legacy code.
> 
> 
> > Maybe we could also state the oldest GCC version too? Though I haven't seen
> > any conflict or supporting issue from my side, it helps avoid some
> > potential error in cross-compilation I guess.
> +1
> Not sure if we want to specify also clang.
> 
> >     i.e.  kernel-3.10.0 / glibc-2.17 / gcc-4.8.0
> This is for RHEL7 I guess.

Correct, it's still active (though in less extent than RHEL8). But
I still see value of running/supporting LTP here.

As I said in previous thread, if we want to draw a line somewhere,
e.g. say anything older 10 years is too old, RHEL6/Centos6 would
fall in that. For regression tests it should be OK to use older
stable release.

> 
> The oldest system in travis we have CentOS 6: kernel-2.6.32 / glibc-2.12 /
> gcc-4.4.7 (clang-3.4.2, but we don't test it with clang). I'm ok to have this
> older dependency, just to make sure it builds.  But code would be cleaner for
> sure if we drop it.
> 
> BTW I also occasionally test build on SLES 11-SP3 (kernel 3.0 / glibc-2.11.3
> /
> gcc-4.3.4 - older glibc and gcc), but this is not even in travis.
> But for testing these distros we use older releases (the same mentioned Jan
> [1]).
> I wonder if there is really somebody using 2.6.x or 3.x < 3.10 on master.
> If not, we can drop some lapi files which mention 2.6.

There are some, since LTP didn't reject such patches yet. But updates to
those old kernels are few and far between, so it might be not be worth
the trouble from LTP point of view.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
