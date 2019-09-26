Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5FEBF2FD
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 14:29:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C01A63C22D0
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 14:29:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id C0D653C1E0F
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 14:29:12 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 31053602074
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 14:29:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4021110DCC82;
 Thu, 26 Sep 2019 12:29:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 335D15C21A;
 Thu, 26 Sep 2019 12:29:10 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 297864EE50;
 Thu, 26 Sep 2019 12:29:10 +0000 (UTC)
Date: Thu, 26 Sep 2019 08:29:10 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <278524783.2287755.1569500950109.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190926121744.GC13769@rei.lan>
References: <a9fc2ff0c27317ae8ac2d56a819eeac5a281dd86.1569496399.git.jstancek@redhat.com>
 <20190926121744.GC13769@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.9]
Thread-Topic: syscalls/bpf: auto bump RLIMIT_MEMLOCK
Thread-Index: Jfj81fxfoaSm7BXRgdEM1FhQZ9lhyA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Thu, 26 Sep 2019 12:29:10 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/bpf: auto bump RLIMIT_MEMLOCK
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



----- Original Message -----
> Hi!
> > eBPF tests may fail (-EPERM) if max locked memory limit is too low.
> > User-space tools such as perf started increasing MELOCK limit to
> > avoid this problem.
> > 
> > LTP follows same approach and will attempt to raise RLIMIT_MEMLOCK
> > if possible, otherwise prints an info message.
> > 
> > Link: http://lists.linux.it/pipermail/ltp/2019-August/013349.html
> > Link: https://lkml.org/lkml/2019/7/17/714
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> 
> Looks good, acked.

Thanks, pushed with typo above fixed: s/MELOCK/MEMLOCK/.

> 
> Also have you had a look at the eBPF regression test?
> 
> Do you mind if I push that before the release (with added call to adjust
> the memlock limit)?

If you mean "Regression test for 64bit arithmetic", I think that's OK for release.

> 
> --
> Cyril Hrubis
> chrubis@suse.cz
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
