Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC911B9FAC
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 11:19:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 531143C2865
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 11:19:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B281C3C248F
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 11:19:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9C997200BCC
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 11:19:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 30FDCAD66;
 Mon, 27 Apr 2020 09:19:34 +0000 (UTC)
Date: Mon, 27 Apr 2020 11:19:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200427091933.GA23679@dell5510>
References: <20200424150422.17467-1-mdoucha@suse.cz>
 <20200427053125.GA21164@dell5510>
 <951270734.10286613.1587972682386.JavaMail.zimbra@redhat.com>
 <CAEemH2daE69UT7mFGXOFQaj3bjqq8CRJr6bnhssyK3_7JPdHng@mail.gmail.com>
 <96306598.10298812.1587978418983.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96306598.10298812.1587978418983.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add env variable as workaround for test issues in
 VMs
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > I take a rough look and doubt there is a bug in try_systemd_detect_virt().
> > Shouldn't strncmp() return zero the 'kvm'/'xen' is found?  I guess they
> > wanted:

> Yes, that looks like bug.
Good catch!

> > --- a/lib/tst_virt.c
> > +++ b/lib/tst_virt.c
> > @@ -93,10 +93,10 @@ static int try_systemd_detect_virt(void)
> >         if (ret)
> >                 return 0;

> > -       if (strncmp("kvm", virt_type, 3))
> > +       if (!strncmp("kvm", virt_type, 3))
> >                 return VIRT_KVM;

> > -       if (strncmp("xen", virt_type, 3))
> > +       if (!strncmp("xen", virt_type, 3))
> >                 return VIRT_XEN;

> >         return 0;

> > Apart from that two(kvm/xen) , we need to detect more virtualization tech
> > for ppc/s390 I think.

> We could return VIRT_OTHER by default. We don't really need to
> differentiate which one it is for purpose of this patch.
+1. And if we ever need to differentiate, we can always add them later, using
code from systemd-detect-virt
https://github.com/systemd/systemd/blob/master/src/basic/virt.c

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
