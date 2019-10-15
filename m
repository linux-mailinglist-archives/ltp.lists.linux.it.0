Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 49897D77DA
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 16:00:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EFE473C207E
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Oct 2019 16:00:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id AC0133C13BB
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 16:00:30 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4E4BC1A01219
 for <ltp@lists.linux.it>; Tue, 15 Oct 2019 16:00:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 36116302C095;
 Tue, 15 Oct 2019 14:00:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 261435D6A9;
 Tue, 15 Oct 2019 14:00:28 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0AEB74E589;
 Tue, 15 Oct 2019 14:00:28 +0000 (UTC)
Date: Tue, 15 Oct 2019 10:00:27 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <679691068.6290837.1571148027820.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190919100205.GA26642@rei>
References: <20190918053519.26244-1-liwang@redhat.com>
 <20190919100205.GA26642@rei>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.3]
Thread-Topic: tst_taint: TCONF when kernel is alreay tainted
Thread-Index: YkV8t3V04h0/uilPg6pE2oXZ7kg4qQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 15 Oct 2019 14:00:28 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] tst_taint: TCONF when kernel is alreay tainted
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
Cc: Chang Yin <cyin@redhat.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Hi!
> > As the tst_taint_init comments described, If the tainted-flags are already
> > set
> > by the kernel, there is no reason to continue and TCONF is generated. But
> > in
> > the function achieve, it uses TBROK.
> > 
> >   cmdline="cve-2017-17053"
> >   tst_test.c:1096: INFO: Timeout per run is 0h 10m 00s
> >   tst_taint.c:88: BROK: Kernel is already tainted: 536871424
> 
> There is a reason for generating TBROK, we do not want the test to be
> skipped silently in this case.

It can still run and maybe trigger worse problem. IMO if test wants
to report taint flags it should only report _new_ taint flags.

We could add a dummy test to end of runtest file, which would check
selected taint flags and report WARN/FAIL, so they are guaranteed
to appear on report.

Regards,
Jan

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
