Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5A718422A
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 09:03:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BA9C3C58FD
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 09:03:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 981983C58EA
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 09:03:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 81E216006E7
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 09:03:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BC030AD03;
 Fri, 13 Mar 2020 08:03:35 +0000 (UTC)
Date: Fri, 13 Mar 2020 09:03:34 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200313080334.GA6597@rei.lan>
References: <cover.1584014172.git.viresh.kumar@linaro.org>
 <824c287cd06190cf0a489535fd4617aff8742b03.1584014172.git.viresh.kumar@linaro.org>
 <20200312191025.GD3803@rei.lan>
 <20200313040012.bvkzfbxlvrwkkltd@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313040012.bvkzfbxlvrwkkltd@vireshk-i7>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V6 05/10] syscalls/fsconfig: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > diff --git a/testcases/kernel/syscalls/fsconfig/fsconfig01.c b/testcases/kernel/syscalls/fsconfig/fsconfig01.c
> > index d05350ce2..aea6db822 100644
> > --- a/testcases/kernel/syscalls/fsconfig/fsconfig01.c
> > +++ b/testcases/kernel/syscalls/fsconfig/fsconfig01.c
> > @@ -77,6 +77,8 @@ static void run(void)
> >                 SAFE_UMOUNT(MNTPOINT);
> >                 tst_res(TPASS, "fsconfig() passed");
> >         }
> > +
> > +       SAFE_CLOSE(fd);
> 
> This isn't required as cleanup() routine is taking care of it and this
> is a test_all type test.

It _is_, I've tried top explain in the paragraph below, just run the
test with large enough -i, sooner or late the test will run out of file
descriptiors and then it will fail.

The key here is that the run() function can be called repeatedly but
setup() and cleanup() are called only once at the start and at the end
of the test.

> > We need to close the fd here, because the test will run out of file
> > descriptors for large enough -i parameter, since cleanup is executed
> > only at the test end. Also note that SAFE_CLOSE() sets the fd to -1 so
> > that cleanup is no-op unless we trigger some of the tst_brk()
> > statements.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
