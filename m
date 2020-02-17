Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F5C160E46
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 10:17:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 497EC3C23DC
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Feb 2020 10:17:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id C1A8F3C02F2
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 10:17:09 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id B05AC6011AB
 for <ltp@lists.linux.it>; Mon, 17 Feb 2020 10:17:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581931027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=59hvLMHBccSqwFRqRLy4Dipr4VpgVZN1i2gWFB+rChM=;
 b=AcF4S/qni95Rt13qKT3yqrEQbj0NVLSRWI0OHVpYz7ywyvlUQM9JXrSimgFwjD7luDKOY0
 JeLY4sxzaNG26s5VkXYmTbDBkRAxXR5SM5IlT8KPDzNDdv/9bKUJz65GYBF72css80GgR4
 qzwQu6Ch720P7t6/hyG4iIvZkKgZCYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-K6FCLYHPMUKpSJ_P4W5-2Q-1; Mon, 17 Feb 2020 04:17:01 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA5AE800D5A;
 Mon, 17 Feb 2020 09:16:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75ED75DA2C;
 Mon, 17 Feb 2020 09:16:59 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1BD2235AF6;
 Mon, 17 Feb 2020 09:16:59 +0000 (UTC)
Date: Mon, 17 Feb 2020 04:16:58 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1181359180.7790231.1581931018783.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2ewgh=OnRzEs+1X4rvsiChrLRRMxeK-ChZL3wDqco_iLg@mail.gmail.com>
References: <20200207144105.19947-1-pvorel@suse.cz>
 <20200207144105.19947-2-pvorel@suse.cz>
 <CAEemH2f0db1i7Tpg-4jqa5h5j9KZpH+d4aRg-M3Xn3Mw9NU1eA@mail.gmail.com>
 <20200216131723.GA2725117@x230>
 <CAEemH2ewgh=OnRzEs+1X4rvsiChrLRRMxeK-ChZL3wDqco_iLg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.1]
Thread-Topic: syscalls/fsmount01: Add test for new mount API v5.2
Thread-Index: UtBVbJuBpBYP2BgGul1fIwoZ6/y14Q==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: K6FCLYHPMUKpSJ_P4W5-2Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 2/2] syscalls/fsmount01: Add test for new mount
 API v5.2
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
Cc: LTP List <ltp@lists.linux.it>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> Hi Petr,
> 
> On Sun, Feb 16, 2020 at 9:17 PM Petr Vorel <pvorel@suse.cz> wrote:
> 
> > ...
> > > >  include/lapi/syscalls/powerpc64.in            |  4 +
> > > Is there any reason why only add syscall num for ppc64?
> > The other numbers are already there:
> > 01e4dc222 lapi/syscalls: Add MIPS support
> > c2f27f6e9 Add syscall numbers for new file-system related syscalls
> >
> 
> Good to know this.
> 
> Not sure if we should add a note in the commit message to prevent confusion
> > later (probably not needed).
> >
> 
> Or just mentionion that commit(c2f27f6e9 Add syscall numbers ...) message.
> 
> > BTW, I like the way Viresh Kumar gives in his fsmount.h, it looks more
> > tidy
> > > and clean.
> > > http://lists.linux.it/pipermail/ltp/2020-February/015413.html
> > Hm, competing implementations.
> > Both tries to handle preventing redefinitions (e.g. FSOPEN_CLOEXEC) once
> > the API hits libc headers (at least in musl it might be soon).
> > Zorro tries to bind them to function check (e.g. #ifndef HAVE_FSMOUNT,
> > #ifndef
> > HAVE_MOVE_MOUNT), Viresh just use single check #ifndef OPEN_TREE_CLONE.
> > I slightly prefer Viresh way (it's unlikely that libc headers would
> > include just
> >
> +1 Viresh way.
> 
> 
> > part of the new mount API definitions, although obviously the most safest
> > way
> > would be to either guard with #ifndef each definition or just give up on
> > testing
> > header and copy whole include/uapi/linux/mount.h (+ avoid using
> > sys/mount.h;
> > that's the way used for include/lapi/bpf.h).
> >
> 
> @Cyril, @Jan, any else suggestion?

I'd go with additions to lapi, and avoid copying entire linux/mount.h. And use
#ifndef for each definition. v7 is currently not doing that, but it's easy
to add if we run into problems later, when/if there are additions to mount API.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
