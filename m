Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F217132B10
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2020 17:29:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B0903C27D6
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2020 17:29:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3A38E3C2357
 for <ltp@lists.linux.it>; Tue,  7 Jan 2020 17:29:36 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3A66260047C
 for <ltp@lists.linux.it>; Tue,  7 Jan 2020 17:29:35 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5C2AEB00D;
 Tue,  7 Jan 2020 16:29:35 +0000 (UTC)
Date: Tue, 7 Jan 2020 17:29:34 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200107162933.GA2193@rei.lan>
References: <461386048.17251961.1576663655809.JavaMail.zimbra@redhat.com>
 <20191218131533.15323-1-mdoucha@suse.cz>
 <20200107152108.GA27182@rei.lan>
 <c0d44447-8bd2-8dbe-b865-3323ad6bb5b0@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c0d44447-8bd2-8dbe-b865-3323ad6bb5b0@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] Use real FS block size in fallocate05
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
> > Why realloc()? Each filesystem is tested in separately forked process so
> > buf can't be anything but NULL here.
> > 
> > So this should just simply be SAFE_MALLOC() and this piece of code, the
> > part that gets the blocksize and allocates the buffer should be moved
> > into the test setup() function that is executed also once per
> > filesystem. And the free should be in the test cleanup().
> > 
> > That way we would allocate the buffer only once if the test was executed
> > with -i option.
> 
> Where is this control flow documented? When some behavior is not
> documented, I assume it may change without notice and write my code so
> that it will work in every case.

Unfortunately at the moment only in the lib/tst_test.c source code.

I want to write down a design document for the library, that would
explain the more complicated parts and decisions, but I'm not sure when
I will get to that.

> >> -	tst_res(TPASS | TERRNO, "fallocate() on full FS");
> >> +	for (tmp = extsize; tmp > 0; tmp -= TST_RET) {
> >> +		TEST(write(fd, buf, MIN(bufsize, tmp)));
> >>  
> >> -	ret = fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, 0, FALLOCATE_SIZE);
> >> -	if (ret == -1) {
> >> -		if (errno == EOPNOTSUPP)
> >> +		if (TST_RET <= 0)
> >> +			tst_brk(TFAIL | TTERRNO, "write() failed unexpectedly");
> > 
> > tst_brk(TFAIL, is not allowed at the moment, see:
> > 
> > https://github.com/linux-test-project/ltp/issues/462
> > 
> > The only current solution is to tst_res() + return
> > 
> > Also shouldn't we check for the write size here as well?
> 
> I'll fix the tst_brk().
> 
> The code above will either fill the extra allocated space to the last
> byte, or hit the tst_brk(). No other result is possible. I don't want to
> pedantically check for short writes because we're not testing write() here.
> 
> I'll implement the rest of your suggestions and resubmit when we get a
> reply from Btrfs devs.

Ok, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
