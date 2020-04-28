Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 890CB1BC3B6
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 17:30:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA9953C299D
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 17:30:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 366153C2812
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 17:30:05 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5911E6012D7
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 17:30:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A7984AE7F;
 Tue, 28 Apr 2020 15:30:03 +0000 (UTC)
Date: Tue, 28 Apr 2020 17:30:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Aleksa Sarai <cyphar@cyphar.com>
Message-ID: <20200428153022.GC4244@yuki.lan>
References: <f969e7d45a8e83efc1ca13d675efd8775f13f376.1586830316.git.josh@joshtriplett.org>
 <20200427135210.GB5770@shao2-debian> <20200427142733.GD7661@rei>
 <20200428005126.6wncibudt6ohghvc@yavin.dot.cyphar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428005126.6wncibudt6ohghvc@yavin.dot.cyphar.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [fs] ce436509a8: ltp.openat203.fail
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
Cc: linux-arch@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Arnd Bergmann <arnd@arndb.de>, kernel test robot <rong.a.chen@intel.com>,
 linux-kernel@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>,
 lkp@lists.01.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > commit: ce436509a8e109330c56bb4d8ec87d258788f5f4 ("[PATCH v4 2/3] fs: openat2: Extend open_how to allow userspace-selected fds")
> > > url: https://github.com/0day-ci/linux/commits/Josh-Triplett/Support-userspace-selected-fds/20200414-102939
> > > base: https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-kselftest.git next
> > 
> > This commit adds fd parameter to the how structure where LTP test was
> > previously passing garbage, which obviously causes the difference in
> > errno.
> > 
> > This could be safely ignored for now, if the patch gets merged the test
> > needs to be updated.
> 
> It wouldn't be a bad idea to switch the test to figure out the ksize of
> the struct, so that you only add bad padding after that. But then again,
> this would be a bit ugly -- having CHECK_FIELDS would make this simpler.

Any pointers how can be the size figured out without relying on the
E2BIG we are testing for? Does the kernel export it somewhere?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
