Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 681311848F3
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 15:15:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 930FB3C591A
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 15:15:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 3778D3C58EF
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 15:15:01 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E266E1A01E0A
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 15:15:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 29561AD61;
 Fri, 13 Mar 2020 14:15:00 +0000 (UTC)
Date: Fri, 13 Mar 2020 15:14:58 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, Jan Stancek <jstancek@redhat.com>,
 Alexey Kodanev <alexey.kodanev@oracle.com>,
 Xiao Yang <yangx.jy@cn.fujitsu.com>, Li Wang <liwang@redhat.com>
Message-ID: <20200313141458.GB21248@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [RFC] Define minimal supported kernel and (g)libc version
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

I'm sorry, I've raised this question in the past, but it got lost.
I remember we talked about 2.6 something.

It'd be good to state publicly the oldest kernel and glibc (or even other libc
versions) we support.  This would allow us to remove some legacy code or force
support for legacy code.

This shouldn't require test to be functional (e.g. for some cases like module
drivers it could be hard), but LTP to be compiled and when difficult/impossible
to achieve this functionality, it could resulted in TCONF (skipped test).

I created github issue for this [1], where I put link to this thread, so we
don't loose it again.

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/issues/657

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
