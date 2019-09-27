Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A69E5C0803
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Sep 2019 16:53:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 478BE3C1812
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Sep 2019 16:53:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 8C92B3C2210
 for <ltp@lists.linux.it>; Fri, 27 Sep 2019 16:53:22 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5E4C660238B
 for <ltp@lists.linux.it>; Fri, 27 Sep 2019 16:53:22 +0200 (CEST)
Received: from 1.general.cascardo.us.vpn ([10.172.70.58] helo=calabresa)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <cascardo@canonical.com>)
 id 1iDrcW-00015j-Sq; Fri, 27 Sep 2019 14:53:21 +0000
Date: Fri, 27 Sep 2019 11:53:17 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190927145316.GA8472@calabresa>
References: <20190926144507.15765-1-cascardo@canonical.com>
 <20190927144902.GA25060@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927144902.GA25060@rei.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] timer_create01: accept ENOTSUP
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

On Fri, Sep 27, 2019 at 04:49:02PM +0200, Cyril Hrubis wrote:
> Hi!
> > CLOCK_REALTIME_ALARM and CLOCK_BOOTTIME_ALARM require an RTC with alarm
> > support, which may not be present on a system. In that case, the kernel
> > will return EOPNOTSUPP, which is defined as ENOTSUP in userspace.
> > 
> > As these clocks are already possibly unsupported, accept that as an error
> > code besides the EINVAL code.
> > 
> > Note that previously the kernel would incorrectly return the ENOTSUPP code,
> > which is undefined in userspace. With these unfixed kernels, the test will
> > fail when those RTCs are not present.
> 
> Can you please include the kernel commit id that fixed the kernel here?
> 
> Otherwise this patch is fine.

f18ddc13af981ce3c7b7f26925f099e7c6929aba ("alarmtimer: Use EOPNOTSUPP instead of ENOTSUPP")

Do you want me to send a v2, or will you fixup the patch?

Thanks a lot.
Cascardo.

> 
> > Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
> > ---
> >  testcases/kernel/syscalls/timer_create/timer_create01.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/testcases/kernel/syscalls/timer_create/timer_create01.c b/testcases/kernel/syscalls/timer_create/timer_create01.c
> > index 258b6444c362..1ae5b9b2d1c2 100644
> > --- a/testcases/kernel/syscalls/timer_create/timer_create01.c
> > +++ b/testcases/kernel/syscalls/timer_create/timer_create01.c
> > @@ -77,7 +77,8 @@ static void run(unsigned int n)
> >  				&created_timer_id));
> >  
> >  		if (TST_RET != 0) {
> > -			if (possibly_unsupported(clock) && TST_ERR == EINVAL) {
> > +			if (possibly_unsupported(clock) &&
> > +			    (TST_ERR == EINVAL || TST_ERR == ENOTSUP)) {
> >  				tst_res(TPASS | TTERRNO,
> >  					"%s unsupported, failed as expected",
> >  					get_clock_str(clock));
> > -- 
> > 2.20.1
> > 
> > 
> > -- 
> > Mailing list info: https://lists.linux.it/listinfo/ltp
> 
> -- 
> Cyril Hrubis
> chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
