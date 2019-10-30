Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C1FE9DCE
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Oct 2019 15:46:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BEF6C3C203D
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Oct 2019 15:46:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id F031E3C1CA6
 for <ltp@lists.linux.it>; Wed, 30 Oct 2019 15:46:54 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7F1A6600D0E
 for <ltp@lists.linux.it>; Wed, 30 Oct 2019 15:46:52 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 89C64ACBD;
 Wed, 30 Oct 2019 14:46:52 +0000 (UTC)
Date: Wed, 30 Oct 2019 15:46:51 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20191030144649.GA25642@dell5510>
References: <20190925094721.18932-1-chrubis@suse.cz>
 <20190925135634.GA32581@dell5510>
 <575273995.9684474.1572426415443.JavaMail.zimbra@redhat.com>
 <1665612504.9724602.1572440600772.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1665612504.9724602.1572440600772.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/acct02: Check read size.
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

Hi Jan,

> > I'm seeing similar failure:

> > tst_kconfig.c:62: INFO: Parsing kernel config
> > '/boot/config-3.10.0-1106.el7.cki.s390x'
> > tst_test.c:1118: INFO: Timeout per run is 0h 05m 00s
> > tst_kconfig.c:62: INFO: Parsing kernel config
> > '/boot/config-3.10.0-1106.el7.cki.s390x'
> > acct02.c:239: INFO: Verifying using 'struct acct_v3'
> > acct02.c:192: INFO: == entry 1 ==
> > acct02.c:88: INFO: ac_btime < 1572367954 (1572367953)

> ^^ This is 'acct02_helper', which seemingly started before 'start_time'.

> ac_btime is calculated back from current time and elapsed time at fill_ac():

>   ac->ac_btime = get_seconds() - elapsed;

> s390s are slower, so my guess is another second ticks before btime gets calculated,
> and it appears to have started later.
Agree.

> > acct02.c:192: INFO: == entry 2 ==
> > acct02.c:82: INFO: ac_comm != 'acct02_helper' ('acct02')
> > acct02.c:88: INFO: ac_btime < 1572367954 (1572367953)
> > acct02.c:133: INFO: ac_exitcode != 32768 (0)
> > acct02.c:141: INFO: ac_ppid != 25608 (25607)

> The 2nd record is filled at acct(NULL), even though process still runs:

> [ 1156.025654] CPU: 0 PID: 11772 Comm: acct02_helper Tainted: G           OE  ------------   3.10.0-1106.el7.s390x #1
> <>
> [ 1156.027105]  [<00000000001dd630>] fill_ac+0x0/0x440
> [ 1156.027108] ([<00000000001ddae8>] do_acct_process+0x78/0x1a0)
> [ 1156.027110]  [<00000000001de3ae>] acct_process+0xf6/0x140
> [ 1156.027112]  [<000000000014de32>] do_exit+0x752/0xa38
> [ 1156.027116]  [<000000000014e216>] do_group_exit+0x66/0xf8
> [ 1156.027118]  [<000000000014e2ea>] SyS_exit_group+0x42/0x48

> [ 1157.033294] CPU: 1 PID: 11771 Comm: acct02 Tainted: G           OE  ------------   3.10.0-1106.el7.s390x #1
> <>
> [ 1157.033384]  [<00000000001dd630>] fill_ac+0x0/0x440
> [ 1157.033386] ([<00000000001ddae8>] do_acct_process+0x78/0x1a0)
> [ 1157.033389]  [<00000000001ddcda>] acct_pin_kill+0x52/0xa8
> [ 1157.033391]  [<000000000034a83e>] pin_kill+0xb6/0x178
> [ 1157.033395]  [<00000000001ddfe8>] SyS_acct+0x2b8/0x350

Hm, did you reproduce it on 4.18 (rhel8)?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
