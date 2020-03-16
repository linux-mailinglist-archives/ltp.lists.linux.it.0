Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18783186CC0
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Mar 2020 15:01:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 958373C5694
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Mar 2020 15:01:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id DEC203C1411
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 15:01:25 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1C37E60171D
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 15:01:24 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 45C5DB1FF
 for <ltp@lists.linux.it>; Mon, 16 Mar 2020 14:01:24 +0000 (UTC)
Date: Mon, 16 Mar 2020 15:01:23 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200316140123.GA26750@rei.lan>
References: <20200316103831.10224-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316103831.10224-1-mdoucha@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add new test cases to syscalls/readv01
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
> Split the original test scenario into two test cases and add:
> - read into buffers bigger than input file
> - read into multiple buffers
> - read into non-NULL buffer with size = 0 (test for kernel commit 19f18459)
> 
> Also use guarded buffers in all IO vectors. Fixes #382
> 
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
> 
> Changes since v1:
> - Code style fixes
> - Use tst_get_bad_addr() in the zero-size lockup test case
> 
> Re: Timeout.
> The last test case may cause infinite loop in some kernels. The entire test
> program should finish in less than a second so waiting 15 minutes to detect
> the possible lockup is a waste of time. 15 seconds is long enough to avoid
> false positives.

I've added the linux-git tag to the testcase and pushed, thanks.

> Re: Guarded buffers/invalid pointers.
> Fixed. Patching the buffer library won't help me here because I'm working
> with IO vectors anyway. Negative size in IO vector definition array currently
> represents end of vector so negative sizes could only be used for single
> buffers. Or the whole IO vector definition semantics in struct tst_test
> would have to be redesigned.

Well, we can as well define -1 to be TST_BUF_END and -2 to be
TST_BUF_BAD and change the code to use these.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
