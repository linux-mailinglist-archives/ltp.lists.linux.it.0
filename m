Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D63251C7289
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 16:14:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 659B43C57A9
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 16:14:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id DA4973C209D
 for <ltp@lists.linux.it>; Wed,  6 May 2020 16:14:17 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 830D0601649
 for <ltp@lists.linux.it>; Wed,  6 May 2020 16:14:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7AAD2AC11;
 Wed,  6 May 2020 14:14:16 +0000 (UTC)
Date: Wed, 6 May 2020 16:14:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200506141412.GA26506@dell5510>
References: <20200506134858.23919-1-pvorel@suse.cz>
 <1588328084.11511511.1588773609302.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1588328084.11511511.1588773609302.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] pty04: Fix build for kernel headers < v4.2-rc1
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


> ----- Original Message -----
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > https://travis-ci.org/github/pevik/ltp/builds/683787204

> >  configure.ac                 |  1 +
> >  include/lapi/tty.h           | 17 +++++++++++++++++
> >  testcases/kernel/pty/pty04.c | 17 ++++++++++-------
> >  3 files changed, 28 insertions(+), 7 deletions(-)
> >  create mode 100644 include/lapi/tty.h


> Works for me (rhel6/7), thanks Petr.

OK, I'll merge with your ack and Cyril's and Richard's suggestion.

I want to fix minimal version as well. Works well on our 3.0 kernel.
Other kernel has a problem 2.6.32-696.el6.x86_64, but IMHO that does not mean
that the test is not valid for this kernel.

./pty04
tst_test.c:1246: INFO: Timeout per run is 0h 05m 00s
pty04.c:95: INFO: PTS path is /dev/pts/1
pty04.c:149: INFO: Netdev is sl0
pty04.c:158: INFO: Netdev MTU is 8192 (we set 8192)
pty04.c:175: INFO: Bound netdev 5 to socket 5
pty04.c:208: INFO: Reading from socket 5
pty04.c:123: PASS: Wrote PTY 1
pty04.c:133: PASS: Wrote PTY 2
pty04.c:213: PASS: Read netdev 1
pty04.c:217: PASS: Read netdev 2
pty04.c:249: BROK: ioctl(4,TIOCVHANGUP,...) failed: EINVAL (22)
tst_test.c:373: BROK: Reported by child (12112)

Can please anybody double check, that with this patch it should be possible to
run this test even on v2.6.25 (which added can module)?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
