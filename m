Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5D4153309
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Feb 2020 15:32:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B572C3C2655
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Feb 2020 15:32:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 575E43C2642
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 15:32:26 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id CDDF31A01724
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 15:32:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580913144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+wga9NxLv3PyUMx58GsW9+rb3OWDczlHeUFOPPYIl+o=;
 b=EHK+mP8gjFVjIZGcrpCEXxszIP2zSmSsJm32DK4QEeTRHKnfg7Cfm8UTyZKu2570V+RQpu
 lHDrHcbRRR5Ip6P3zmWtM3ecyNudVUd8USHjxbCIMyVIzNz34OXQZAvIRl0BkmzGuwnsQI
 LlogCuH94aH/fKmabrfUPqjwBC1O7tI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-22WelQ5DMGW-j9KgzreldQ-1; Wed, 05 Feb 2020 09:32:12 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E99018C43EE
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 14:32:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0528F60C85
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 14:32:12 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED06385CCC;
 Wed,  5 Feb 2020 14:32:11 +0000 (UTC)
Date: Wed, 5 Feb 2020 09:32:11 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1751041821.5968536.1580913131753.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2fnu9nZiGDfa5LTTMA0a_-PJ35fjjLdZ2vXYNGRJqHfVA@mail.gmail.com>
References: <7843cc36a04deb034e9479a139f535e5fa5f3135.1580894017.git.jstancek@redhat.com>
 <CAEemH2fnu9nZiGDfa5LTTMA0a_-PJ35fjjLdZ2vXYNGRJqHfVA@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.3]
Thread-Topic: syscalls/getrandom02: lower bufsize if low on entropy
Thread-Index: tAwxNZz37FMCUxinYIlBnWio7KQSeg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 22WelQ5DMGW-j9KgzreldQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/getrandom02: lower bufsize if low on
 entropy
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
> >
> > @@ -37,11 +39,17 @@ static int check_content(unsigned char *buf, int nb)
> >  static void verify_getrandom(unsigned int n)
> >  {
> >         unsigned char buf[256];
> > +       int bufsize = 64, entropy_avail;
> >
> 
> I'm not sure why here initialize bufsize as 64? can you explain more?

That would be the default, unless we know we have enough entropy.

I picked 64 as it matches 'random_read_wakeup_bits'. Assuming we can get
1bit/s entropy, then potentially worst case of waiting 4x for 64bit,
it should still fit within default 300 seconds.

But it's also rule of thumb, because it's smaller.

> 
> 
> >
> > -       memset(buf, 0, sizeof(buf));
> > +       if (access(PROC_ENTROPY_AVAIL, F_OK) == 0) {
> > +               SAFE_FILE_SCANF(PROC_ENTROPY_AVAIL, "%d", &entropy_avail);
> > +               if (entropy_avail > 256)
> > +                       bufsize = sizeof(buf);
> > +       }
> >
> > +       memset(buf, 0, sizeof(buf));
> >         do {
> > -               TEST(tst_syscall(__NR_getrandom, buf, sizeof(buf),
> > modes[n]));
> > +               TEST(tst_syscall(__NR_getrandom, buf, bufsize, modes[n]));
> >         } while ((modes[n] & GRND_NONBLOCK) && TST_RET == -1
> >                   && TST_ERR == EAGAIN);
> >
> > --
> > 2.18.1
> >
> >
> > --
> > Mailing list info: https://lists.linux.it/listinfo/ltp
> >
> >
> 
> --
> Regards,
> Li Wang
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
