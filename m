Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B3B142ACD
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 13:28:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 73CAD3C234E
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 13:28:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4EB253C224E
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 13:28:17 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4F524200DAB
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 13:28:15 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9538AABB3;
 Mon, 20 Jan 2020 12:28:15 +0000 (UTC)
Date: Mon, 20 Jan 2020 13:28:15 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200120122814.GA21132@rei.lan>
References: <20200117113715.22786-1-pvorel@suse.cz>
 <20200117113715.22786-3-pvorel@suse.cz>
 <20200120103108.GA15405@dell5510>
 <558281761.2778139.1579517819187.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <558281761.2778139.1579517819187.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] tst_device.h: Use lapi/syscalls.h instead of
 <sys/syscall.h>
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Example of the error is #634 [1], which is caused by __NR_socketcall being -1
> > instead of not defined (socketcall is not defined on some archs, e.g. x86-64
> > and ARM).
> > We can fix the condition
> 
> Tests using tst_syscall or ltp_syscall should be fine, since those check
> for ENOSYS.
> 
> >, but it will lead to numerous not obvious errors, so
> > I
> > suggest to revert this (and thus get LTP broken on very old distros).
> > 
> 
> Cyril, any thoughts?

I would say that doing #ifdef __NR_* in test source to disable it is
wrong to begin with.

Doing 'git grep ifdef __NR' shows only socketcall, set_robust_list and
timerfd tests.

The timerfd tests include lapi/syscalls.h already and uses ltp_syscall()
so that shouldn't break. I guess we can safely remove the ifdef there as
well.

The set_robust_list includes the old test.h so thi change to
tst_device.h should not affect it either.

So as far as I can tell the only thing that breaks are the socketcall
tests and I guess that the actual fix would be using tst_syscall()
instead of syscall() and we can remove the ifdefs as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
