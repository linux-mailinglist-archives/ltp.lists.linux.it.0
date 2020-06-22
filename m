Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B81EF2033F1
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 11:50:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 373F33C281E
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 11:50:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 726543C13D9
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 11:50:05 +0200 (CEST)
Received: from mail.zilogic.com (mail.zilogic.com [45.33.14.236])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 5927914017E0
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 11:50:03 +0200 (CEST)
Date: Mon, 22 Jun 2020 09:49:50 -0000
To: ltp@lists.linux.it
Message-ID: <03810e4636b8c7eca94b0d2692f3b105.squirrel@pike.zilogic.com>
From: "niravparmar" <niravparmar@zilogic.com>
Received: from pike.zilogic.com (localhost [127.0.0.1])
 by mail.zilogic.com; Mon, 22 Jun 2020 09:49:50 -0000
Received: from 198.58.112.207 (proxying for 27.5.117.54)
 (SquirrelMail authenticated user niravparmar)
 by pike.zilogic.com with HTTP; Mon, 22 Jun 2020 09:49:50 -0000
User-Agent: SquirrelMail/1.4.23 [SVN]
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=MSGID_FROM_MTA_HEADER,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Add test case for CVE-2018-11508
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
Cc: vijaykumar@zilogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Hello petr,

The fix 3a4d44b61625 ("ntp: Move adjtimex related compat syscalls to
native counterparts"), was fixed in the v4.13-rc1. With this fix, the bug
introduced CVE-2018-11508. This bug was then resolved in v4.17-rc5. In
that case, shouldn't we test the 'CVE-2018-11508' bug after the kernel
version where it got resolved ?

Thanks and regards,
Nirav


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
