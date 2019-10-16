Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C23C7D9344
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 16:03:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 638413C2392
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 16:03:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 1A72C3C220D
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 16:03:45 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 03E0D600F28
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 16:03:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 32320A3CD95;
 Wed, 16 Oct 2019 14:03:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2665D5C207;
 Wed, 16 Oct 2019 14:03:43 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A08018089DC;
 Wed, 16 Oct 2019 14:03:43 +0000 (UTC)
Date: Wed, 16 Oct 2019 10:03:42 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Michael Moese <mmoese@suse.de>
Message-ID: <1535033044.6472706.1571234622819.JavaMail.zimbra@redhat.com>
In-Reply-To: <bc2f54f1-3be1-cf77-7475-3c08cbd24850@suse.de>
References: <20191016131506.17193-1-chrubis@suse.cz>
 <bc2f54f1-3be1-cf77-7475-3c08cbd24850@suse.de>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.28]
Thread-Topic: tst_taint: Ignore WARN taint flag if already set
Thread-Index: d7L1RT3jVzZ4DPSzfFjjB/et8/70YQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Wed, 16 Oct 2019 14:03:43 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: tst_taint: Ignore WARN taint flag if already
 set
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
> Hi,
> 
> On 16.10.19 15:15, Cyril Hrubis wrote:
> > This commit changes the library so that it ignores the taint warn flag
> > if it was set prior to the test run. It turns out that the warn taint
> > flag is not well defined and could be easily set on a freshly booted
> > kernel for example when buggy BIOS is detected.>
> > Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> > CC: Jan Stancek <jstancek@redhat.com>
> > CC: Chang Yin <cyin@redhat.com>
> > ---
> > 
> > I haven't tested this, since I don't have a system where the flag is set
> > at hand, but it's simple enough so that it should work as expected.
> > 
> >  lib/tst_taint.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/tst_taint.c b/lib/tst_taint.c
> > index a5dbf77d2..3de6d72f4 100644
> > --- a/lib/tst_taint.c
> > +++ b/lib/tst_taint.c
> > @@ -82,8 +82,13 @@ void tst_taint_init(unsigned int mask)
> >  		tst_res(TCONF, "Kernel is too old for requested mask");
> >  
> >  	taint_mask = mask;
> > -
> >  	taint = tst_taint_read();
> > +
> > +	if (mask & TST_TAINT_W && taint & TST_TAINT_W) {
> > +		tst_res(TCONF, "Ignoring already set kernel warning taint");
> > +		mask &= ~TST_TAINT_W;
> > +	}
> > +
> >  	if ((taint & mask) != 0)
> >  		tst_brk(TBROK, "Kernel is already tainted: %u", taint);
> >  }
> > 
> 
> Tests may rely on TAINT_W to decide the result.
> If we need TAINT_W, we can only run the test when it was not set before. For example,
> testcases/cve/cve-2017-17053.c relies on this.
> This may render this testcase unusable, or do I get this wrong?

Patch masks TAINT_W if that taint flag was set before test started. In such case,
test can't determine result accurately anyway.

I wonder if there is more specific way for cve-2017-17053 to determine
error condition. For example by inspecting new messages in dmesg.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
