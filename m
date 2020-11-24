Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C74882C2E35
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 18:16:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 629D53C5E6A
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Nov 2020 18:16:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 83E283C0354
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 18:16:33 +0100 (CET)
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DEF431400E12
 for <ltp@lists.linux.it>; Tue, 24 Nov 2020 18:16:32 +0100 (CET)
Date: Tue, 24 Nov 2020 18:16:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1606238190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=21CneeHv4WjigQFLsDRnBPjDyqomDe8iqs+F8eXUq54=;
 b=YNuNJPCqi1woBBDIVq9RGDhGKE6iS0zVkDg/F+0aJMJ0GY5xTotuc0YTbaaoOBOj4GJ55+
 Gq+cffSqonZhuVk0cyn+hqZxeb1PQNAscVhFfR13mG0F6nBjyzWpwWcGWgM9+2bDYlgKGM
 8aYGROcTmFdhOjzOxKT9NhzhHZiPQkH6B6T04lOXv3sdkt0zcQ1SreZRl4z/KoxQw8DIXw
 4jJhy4udc8nLLigI1DXPlSR8/lNCeRoSYVRKXLqsfAqELDICFn6jaZvr9MnqvgiGIi6j1b
 6v0XS65uq0uQUjbeoaKovB4FmWzoCzg3CLVwOdWv9adlVMvh0zcyRqzP3NsM9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1606238190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=21CneeHv4WjigQFLsDRnBPjDyqomDe8iqs+F8eXUq54=;
 b=5oMOmvZiz3+HJ0TFxE+1+ihsPdEcvXf76vE9EuoLCpFxRMC2ycJ9jAKLjiw2kZYcDmtSfZ
 4t6U78aUx76DFyCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20201124171628.dk6tle5lh3sx2jxg@linutronix.de>
References: <CA+G9fYuKZGaHVvAv=ZwOL_p6UM3YhOHy0DcJRRM_DOLGYXg1Dw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYuKZGaHVvAv=ZwOL_p6UM3YhOHy0DcJRRM_DOLGYXg1Dw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] kernel BUG at mm/highmem.c:417! invalid opcode: 0000 EIP:
 zero_user_segments
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
Cc: Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>,
 Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>, vtolkm@googlemail.com,
 Yang Shi <shy828301@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org, linux-mm <linux-mm@kvack.org>,
 torvalds@linuxfoundation.org,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Zi Yan <ziy@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Thomas Gleixner <tglx@linutronix.de>, LTP List <ltp@lists.linux.it>,
 Mel Gorman <mgorman@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2020-11-24 18:52:44 [+0530], Naresh Kamboju wrote:
> While running LTP test case access01 the following kernel BUG
> noticed on linux next 20201124 tag kernel on i386.
> 
> git short log:
> ----------------
> git log --oneline next-20201120..next-20201124 -- mm/highmem.c
> d9927d46febf Merge branch 'akpm-current/current'
> 72d22a0d0e86 mm: support THPs in zero_user_segments
> 2a656cad337e mm/highmem: Take kmap_high_get() properly into account
> 
> Please find these easy steps to reproduce the kernel build and boot.

This BUG_ON() is in zero_user_segments() which ash been added in commit
   72d22a0d0e86 mm: support THPs in zero_user_segments

> [   50.852189] kernel BUG at mm/highmem.c:417!

I managed to capture one invocation with:
zero_user_segments(0xd4367a90,
		   0x1000, 0x1000,
		   0x0, 0x50)
page_compound() -> 1
page_size() -> 4096

And at the end it BUGs because end2 is still 0x50.

because:
|         for (i = 0; i < compound_nr(page); i++) {
|                 void *kaddr;
|                 unsigned this_end;
| 
|                 if (end1 == 0 && start2 >= PAGE_SIZE) {
|                         start2 -= PAGE_SIZE;
|                         end2 -= PAGE_SIZE;
|                         continue;
|                 }
| 
|                 if (start1 >= PAGE_SIZE) {
start1 0x1000 is >= PAGE_SIZE.
|                         start1 -= PAGE_SIZE;
|                         end1 -= PAGE_SIZE;
|                         if (start2) {
start2 is 0.
|                                 start2 -= PAGE_SIZE;
|                                 end2 -= PAGE_SIZE;
|                         }
|                         continue;
|                 }

I don't know why the logic for start1/end1 and start2/end2 is coupled
here.  Based on how __block_write_begin_int() invokes it seems to zero
two independent blocks (or it is a bug in caller).
The generic implementation would do nothing for start1/end1 and for
second part if would memset(page + 0, 0, 0x50 - 0).

Sebastian

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
