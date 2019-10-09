Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18771D11D0
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 16:54:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 820933C224B
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 16:54:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 057913C0B92
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 16:54:19 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id F2B801401451
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 16:54:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C4390AD6D;
 Wed,  9 Oct 2019 14:54:17 +0000 (UTC)
Date: Wed, 9 Oct 2019 16:54:16 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Dmitry Vyukov <dvyukov@google.com>
Message-ID: <20191009145416.GA5014@rei.lan>
References: <20191009142446.6997-1-rpalethorpe@suse.com>
 <CACT4Y+b0tTAQ0r_2gCVjjRh--Xwv=aLzh6MY=ciXMMrK+cAQsA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACT4Y+b0tTAQ0r_2gCVjjRh--Xwv=aLzh6MY=ciXMMrK+cAQsA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] LTP Wrapper for Syzkaller reproducers
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
Cc: automated-testing@yoctoproject.org, kernelci@groups.io,
 George Kennedy <george.kennedy@oracle.com>,
 syzkaller <syzkaller@googlegroups.com>,
 "open list : KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Cyril Hrubis <chrubis@suse.com>, shuah <shuah@kernel.org>, ltp@lists.linux.it,
 Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I don't have prior experience with LTP tests, but from reading the
> code it looks reasonable to me.
> 
> I assume that .needs_tmpdir = 1 ensures that each test runs in its own
> new temp dir, which is later removed.

Indeed, it's removed recursively by the test library.

> I've stared for a while at "rem / exec_time_start < 0.98" trying to
> understand what is that tst_timeout_remaining() returns that we want
> to kill that process when the ratio is < 0.98... provided that we
> convert 1 to float but not the other var. I failed to come up with the
> answer. I have potential answers for "<0.02" and ">0.98". But I assume
> you know what you are doing :)

The tst_timeout_remaining() returns remaining test timeout, so at test
start it returns something close to 300 seconds, since that is a default
for a LTP tests, so this would probably kill a process quite fast, if
I'm reading right, after a bit more than five seconds. I guess that this
is something intended for a quick v1 hack rather than for later use.

> Re tst_res(TINFO, "Timeout; killing reproducer"). Not sure how much it
> pollutes output on 3000 tests. If it is, it can make sense to remove
> it. Lots of tests run forever, killing it is not something of
> particular interest generally.

I guess so.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
