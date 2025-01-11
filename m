Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE4EA0A51D
	for <lists+linux-ltp@lfdr.de>; Sat, 11 Jan 2025 18:43:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1736617422; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-transfer-encoding :
 content-type : sender : from;
 bh=C9SURPJdtI5rQFNcAI047YMXxjlHrbbOhgGOXC8Ho9w=;
 b=pdOopI0z7G77JtZvcc3qwxu/bblK/3EWvb55MBX0zkwkIh2Ld/0bLqBhQXjX1Yax5X2C2
 XKvHVTtKPDZ4e1LXfgWt9KE5pBm98qypBBatECx/6ua6/QSQHOtoj8O2Ytb6RuL2qq1owj8
 +UplPLatO5tIJsMjdZSmBejMaPGqo9A=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 31E403C526F
	for <lists+linux-ltp@lfdr.de>; Sat, 11 Jan 2025 18:43:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 135783C4BAB
 for <ltp@lists.linux.it>; Sat, 11 Jan 2025 18:43:39 +0100 (CET)
Authentication-Results: in-3.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org;
 envelope-from=sashal@kernel.org; receiver=lists.linux.it)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E148E1A00342
 for <ltp@lists.linux.it>; Sat, 11 Jan 2025 18:43:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CA700A402A6;
 Sat, 11 Jan 2025 17:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFB5C4CED2;
 Sat, 11 Jan 2025 17:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736617416;
 bh=gfwzQfof4FDZzhjP1I8FK4NWQ2wQZrEEDHH9veGrIXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TAk+4vcRAWVH7DLIjuAcmIWQH2hTQoO8I/VFZgL3IeATxvuh+mifQNiieVXvNHWEc
 HgYYkUO6JGvS4Kr2bm1wI57qlWqNVeaaC72ytPy0Bj8RA/z3f8iEO6IBLBhSY5/GWa
 CT+SGTMj19zr+dJDWHfohI7AvH016fgaeh5GcCovfJZjMYAjMqMskjTQYxfRzGdF0V
 5GMoTeCMhYw52NOKgzIqf7Y5yTWlbzV+EoV1iYuVLQCaOWkkwTGhXSgIZqzzsCIexP
 bs4ZMnGTMqVXElkPXycxl0GfJFQ3SW/9In6Kr2utuCN72J4kcq6TSZK3jX47fAU28S
 0LtnxcIF6IG0w==
Date: Sat, 11 Jan 2025 12:43:35 -0500
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <Z4Ktx-wizYLYnQfM@lappy>
References: <CA+G9fYvcBvbabg+m7brKfpGCGZUcK+KHHTFX7hFvW6GmN2XF0g@mail.gmail.com>
 <CA+G9fYuHGTKM5P+nEifZwfALPfO9uw7sraCrGo-c3YzR=JjwJg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYuHGTKM5P+nEifZwfALPfO9uw7sraCrGo-c3YzR=JjwJg@mail.gmail.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] selftests: core: unshare_test: WARNING: at mm/util.c:671
 __kvmalloc_node_noprof
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
From: Sasha Levin via ltp <ltp@lists.linux.it>
Reply-To: Sasha Levin <sashal@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Barry Song <baohua@kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>, Arnd Bergmann <arnd@arndb.de>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Al Viro <viro@zeniv.linux.org.uk>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 David Gow <davidgow@google.com>, Shuah Khan <shuah@kernel.org>,
 LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Dec 11, 2024 at 11:09:46AM +0530, Naresh Kamboju wrote:
>[Gentle Reminder]
>
>On Mon, 26 Aug 2024 at 18:50, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>
>> The following kernel warning is noticed on all arch and all devices while
>> running selftests: core: unshare_test on Linux next-20240823 and next-20240826.
>>
>> First seen on next-20240823.
>>   Good: next-20240822
>>   BAD:  next-20240823 and next-20240826
>
>This is an open issue from August.
>The reported kernel warning is still seen on linux next and mainline
>while running selftests: core: unshare_test.

I attempted a bisection of the range provided above, and that has landed
on: 611fbeb44a77 ("selftests:core: test coverage for dup_fd() failure
handling in unshare_fd()"), so the underlying issue was probably there
for much longer.

Al, any thoughts on what could trigger this? I'm assuming you had
something in mind when you added the above test?

>Linux version: 6.13.0-rc2-next-20241210
>> Crash log:
>> --------
>> # selftests: core: unshare_test
>> <4>[   61.084149] ------------[ cut here ]------------
>> <4>[ 61.085175] WARNING: CPU: 0 PID: 477 at mm/util.c:671
>> __kvmalloc_node_noprof (mm/util.c:671 (discriminator 1))
>> <4>[   61.088958] Modules linked in: crct10dif_ce sm3_ce sm3 sha3_ce
>> sha512_ce sha512_arm64 drm fuse backlight dm_mod ip_tables x_tables
>> <4>[   61.093141] CPU: 0 UID: 0 PID: 477 Comm: unshare_test Not
>> tainted 6.11.0-rc5-next-20240826 #1
>> <4>[   61.094558] Hardware name: linux,dummy-virt (DT)
>> <4>[   61.096763] pstate: 23400009 (nzCv daif +PAN -UAO +TCO +DIT
>> -SSBS BTYPE=--)
>> <4>[ 61.097841] pc : __kvmalloc_node_noprof (mm/util.c:671 (discriminator 1))
>> <4>[ 61.099701] lr : __kvmalloc_node_noprof (mm/util.c:661)
>> <4>[   61.100448] sp : ffff800080abbce0
>> <4>[   61.100819] x29: ffff800080abbcf0 x28: fff0000004549280 x27:
>> 0000000000000000
>> <4>[   61.101744] x26: 0000000000000000 x25: 0000000000000000 x24:
>> fff0000003615e40
>> <4>[   61.102512] x23: fff0000003615ec0 x22: bfafa45863b285c8 x21:
>> 0000000200002000
>> <4>[   61.103232] x20: 00000000ffffffff x19: 0000000000400cc0 x18:
>> 0000000000000000
>> <4>[   61.104053] x17: 0000000000000000 x16: 0000000000000000 x15:
>> 0000000000000000
>> <4>[   61.104927] x14: 0000000000000000 x13: 0000000000000000 x12:
>> 0000000000000000
>> <4>[   61.105752] x11: 0000000000000000 x10: 0000000000000000 x9 :
>> 0000000000000000
>> <4>[   61.106606] x8 : 0000000000000001 x7 : 0000000000000001 x6 :
>> 0000000000000005
>> <4>[   61.107377] x5 : 0000000000000000 x4 : fff0000004549280 x3 :
>> 0000000000000000
>> <4>[   61.108207] x2 : 0000000000000000 x1 : 000000007fffffff x0 :
>> 0000000000000000
>> <4>[   61.109262] Call trace:
>> <4>[ 61.109619] __kvmalloc_node_noprof (mm/util.c:671 (discriminator 1))
>> <4>[ 61.110248] alloc_fdtable (fs/file.c:133)
>> <4>[ 61.110751] expand_files
>> (include/linux/atomic/atomic-arch-fallback.h:457
>> include/linux/atomic/atomic-instrumented.h:33 fs/file.c:177
>> fs/file.c:238)
>> <4>[ 61.111171] ksys_dup3 (fs/file.c:1337)
>> <4>[ 61.111596] __arm64_sys_dup3 (fs/file.c:1355)
>> <4>[ 61.112006] invoke_syscall (arch/arm64/include/asm/current.h:19
>> arch/arm64/kernel/syscall.c:54)
>> <4>[ 61.112480] el0_svc_common.constprop.0
>> (include/linux/thread_info.h:127 (discriminator 2)
>> arch/arm64/kernel/syscall.c:140 (discriminator 2))
>> <4>[ 61.112955] do_el0_svc (arch/arm64/kernel/syscall.c:152)
>> <4>[ 61.113384] el0_svc (arch/arm64/include/asm/irqflags.h:55
>> arch/arm64/include/asm/irqflags.h:76
>> arch/arm64/kernel/entry-common.c:165
>> arch/arm64/kernel/entry-common.c:178
>> arch/arm64/kernel/entry-common.c:713)
>> <4>[ 61.113742] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:731)
>> <4>[ 61.115181] el0t_64_sync (arch/arm64/kernel/entry.S:598)
>> <4>[   61.115709] ---[ end trace 0000000000000000 ]---
>>
>>
>> Crash Log links,
>> --------
>>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240826/testrun/24953436/suite/log-parser-test/test/check-kernel-exception-warning-cpu-pid-at-mmutilc-__kvmalloc_node_noprof/log
>>
>> Crash failed comparison:
>> ----------
>>  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240826/testrun/24953436/suite/log-parser-test/test/check-kernel-exception-warning-cpu-pid-at-mmutilc-__kvmalloc_node_noprof/history/
>>
>> metadata:
>> ----
>>   git describe: next-20240823 and next-20240826
>>   git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>>   git sha: c79c85875f1af04040fe4492ed94ce37ad729c4d
>>
>> Please let me know if you need more information.
>>
>
>Kernel warning log:
>-----------------
> - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241210/testrun/26261199/suite/kselftest-core/test/core_unshare_test/log
>
>> --
>> Linaro LKFT
>> https://lkft.linaro.org
>
>-- 
>Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Thanks,
Sasha

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
