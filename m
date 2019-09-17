Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8C7B4FCC
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Sep 2019 16:01:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 942FE3C20AD
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Sep 2019 16:01:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 6AA393C0051
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 16:01:23 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6B6C41A01526
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 16:01:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 791AFAE47;
 Tue, 17 Sep 2019 14:01:21 +0000 (UTC)
Date: Tue, 17 Sep 2019 16:01:19 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190917140119.GA20524@x230>
References: <20190913205328.6049-1-pvorel@suse.cz> <20190917112230.GA28255@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190917112230.GA28255@rei>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/acct02: Improve logging
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
Cc: ltp@lists.linux.it, Christian Amann <camann@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > Problem with s390 is caused by big endianess:
> > ac_version != 3 (131)

> Hmm, 131 == 83 hex, so there is one more bit turned on.

> > I suspect a bug in UNPACK(), but don't know how to fix it.

> Isn't UNPACK() used only for the timestamps?
Yep, you're right.

> The ac_version is a char, so this really looks like some strange kernel
> bug.

> > Failures on x86_64:
> > * various recent kernels 5.2.9 / 5.3, 4.20 on Debian, using v3:
> > acct02.c:222: INFO: Verifying using 'struct acct_v3'
> > acct02.c:174: INFO: == loop 1 ==
> > acct02.c:81: INFO: ac_comm != 'acct02_helper' ('acct02')
> > acct02.c:174: INFO: == loop 2 ==
> > acct02.c:81: INFO: ac_comm != 'acct02_helper' ('acct02')
> > acct02.c:132: INFO: ac_exitcode != 65280 (0)
> > acct02.c:140: INFO: ac_ppid != 18029 (18028)
> > acct02.c:174: INFO: == loop 3 ==
> > acct02.c:81: INFO: ac_comm != 'acct02_helper' ('acct02')
> > acct02.c:132: INFO: ac_exitcode != 65280 (0)
> > acct02.c:140: INFO: ac_ppid != 18029 (18028)
> > acct02.c:187: INFO: Number of accounting file entries tested: 2
> > acct02.c:191: FAIL: acct() wrote incorrect file contents!

> > * 3.10 on CentOS using v3:
> > acct02.c:82: INFO: ac_comm != 'acct02_helper' ('')
> > acct02.c:88: INFO: ac_btime < 1568406976 (0)
> > acct02.c:133: INFO: ac_exitcode != 32768 (0)
> > acct02.c:141: INFO: ac_ppid != 19863 (0)
> > acct02.c:147: INFO: ac_version != 3 (0)
> > acct02.c:152: INFO: ac_pid < 1 (0)
> > acct02.c:188: INFO: Number of accounting file entries tested: 0
> > => this looks to be completely wrong.

> > Other distros using various kernels (both old and recent) using struct
> > acct_v3 works well, so the bug might be some specific kernel
> > configuration.

> That does look like the structure has been filled in by a kernel
> incorrectly.

...
> > @@ -123,26 +170,27 @@ static void run(void)
> >  	run_command();
> >  	acct(NULL);

> > -	entry_count = 0;
> >  	do {
> > +		tst_res(TINFO, "== loop %d ==", ++i);
> > +

> Maybe I would call this "== entry %d ==" or something like that.

Sure, that's better, I'll change it.

...
> Otherwise the patch looks good, at least we can see now which checks
> have failed.
If nobody objects, I'll merge it with previous change.


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
