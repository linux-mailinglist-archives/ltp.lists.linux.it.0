Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8755719C00C
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Apr 2020 13:19:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 169C63C301F
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Apr 2020 13:19:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 23D3C3C2FF8
 for <ltp@lists.linux.it>; Thu,  2 Apr 2020 13:19:16 +0200 (CEST)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 76EF61A00EA6
 for <ltp@lists.linux.it>; Thu,  2 Apr 2020 13:19:15 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id x200so2412086lff.0
 for <ltp@lists.linux.it>; Thu, 02 Apr 2020 04:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Du37Hi8yrMuGoPEFoTb3iFhtLjaQUvyasPWBPyTfNcA=;
 b=kGn3ZKlfselrX3HU3Nj59RsgNtaRuODGLl8uoa2/styhXss6DItjZ2rfvleFBQc4mG
 seOT2BJXLBns7p8QA4bS7V34P6VRtocsC6jv/hWwIe3FaGGUuSNvLSI9ct+BLlR8fRaP
 WGR8G7jCOzKdPkQr/UXQQ5TF0lkTn9g7fON95IDBR/Q8l4yuYzqKZPbzZigc3Fq1AOnQ
 g+mY5gY232oBxl5x5o1WkHhgb1kyA7O80pxaykHZcM0J05UTPUFH7fA5ZAI3WYc/1y1k
 aWNcdey6gCYia4zaQQ7mRJrxiLJ8mu0KmzDWFipOSSdZBPlg5oWYyO6yYLR1LHRTVBIY
 Y7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Du37Hi8yrMuGoPEFoTb3iFhtLjaQUvyasPWBPyTfNcA=;
 b=BhArPjQgAbmDt6T/VbxK3FOsjjsICdUtcys5L2YV/jPa5IQX181mQTUF16bRA6v3Go
 3tOKKjai6aPT0XveRF4WGAWGBm97ct8je8iDjNXyciADqtVlFXS2uDfeRvw8hOlUIqXS
 jS34c7x8yeppP2pLAsc0ZkdFwbORsHvi0BpEGzuTojl1Hqr35LmTY4gy+bD4PkkSj7By
 XsSWYSxim2vT5wZnu437NZo7fWf+QdxPCOnlzAM1CK96jV4a5JfiPLpdZOyz8Az2oxwN
 6QuM7JSAfjWx7qk5XRV8H+8TJfCGOTii2ReZMLkga1KfuNbKI9lMsKr5L/2uASiX51ex
 ClBA==
X-Gm-Message-State: AGi0PuYRK6SEb3IS65kx7Ua7SF+XuWjsiMXP2Q/ZnkLRzRfGUshYp9pr
 d6/Ap+4KbWM7ETQQkQAwUd2g0n4IXxLt5RckILbrNg==
X-Google-Smtp-Source: APiQypKwOxi9GqOecjvbNkySqq8FzFJQg61p2C1w+CUg3VyPxGQwOSrg6TVvzNTS/1W/85rVMOAIoaEHCaK0nBgH+I8=
X-Received: by 2002:ac2:5211:: with SMTP id a17mr1848403lfl.167.1585826354441; 
 Thu, 02 Apr 2020 04:19:14 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 2 Apr 2020 16:49:02 +0530
Message-ID: <CA+G9fYs1xStrrsvGbW7bc4h1a0Kjfz0_zn4c7LL7-bGZb0GH6g@mail.gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 linux- stable <stable@vger.kernel.org>, linux-mm <linux-mm@kvack.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] mm/mremap.c : WARNING: at mm/mremap.c:211
 move_page_tables+0x5b0/0x5d0
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
Cc: William Kucharski <william.kucharski@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Will Deacon <will.deacon@arm.com>, lkft-triage@lists.linaro.org,
 Michal Hocko <mhocko@kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 "Kirill A. Shutemov" <kirill@shutemov.name>, LTP List <ltp@lists.linux.it>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

While running LTP mm thp01 test case on i386 kernel running on x86_64 device
the following kernel warning was noticed multiple times.

This issue is not new,
we have noticed on stable-rc 5.4, stable-rc 5.5 and stable-rc 5.6 branches.
FYI, CONFIG_HAVE_MOVE_PMD=y is set on
and total memory 2.2G as per free output.

steps to reproduce:
--------------------
boot i386 kernel on x86_64 device,
cd /opt/ltp
./runltp -f mm
thp01.c:98: PASS: system didn't crash.
thp01.c:98: PASS: system didn't crash.
thp01.c:98: PASS: system didn't crash.

[  207.317499] ------------[ cut here ]------------
[  207.322153] WARNING: CPU: 0 PID: 18963 at mm/mremap.c:211
move_page_tables+0x5b0/0x5d0
[  207.330061] Modules linked in: x86_pkg_temp_thermal
[  207.334940] CPU: 0 PID: 18963 Comm: true Tainted: G        W
 5.6.2-rc1+ #1
[  207.342498] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.2 05/23/2018
[  207.349881] EIP: move_page_tables+0x5b0/0x5d0
[  207.354233] Code: 00 00 c0 ff 2b 45 08 39 c3 0f 46 c3 89 45 d4 01
f8 89 45 cc e9 7e fb ff ff 8d 45 d8 83 4d e8 01 e8 65 b0 01 00 e9 b2
fa ff ff <0f> 0b 80 7d be 00 0f 84 7e fd ff ff 31 db e9 74 fe ff ff 31
db e9
[  207.372969] EAX: 7ce5f067 EBX: 00400000 ECX: e2cc8000 EDX: 00000000
[  207.379225] ESI: e2cc8bfc EDI: bfc00000 EBP: f3273e18 ESP: f3273dc0
[  207.385484] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010202
[  207.392261] CR0: 80050033 CR2: b7d02f50 CR3: 22cc8000 CR4: 003406d0
[  207.398517] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[  207.404774] DR6: fffe0ff0 DR7: 00000400
[  207.408605] Call Trace:
[  207.411053]  setup_arg_pages+0x22b/0x310
[  207.414977]  ? security_bprm_committed_creds+0x22/0x30
[  207.420107]  load_elf_binary+0x2fb/0x10a0
[  207.424110]  ? selinux_inode_permission+0xfb/0x1d0
[  207.428894]  ? bm_status_write+0x61/0xa0
[  207.432811]  ? security_inode_permission+0x2c/0x50
[  207.437597]  ? writenote+0xb0/0xb0
[  207.440992]  search_binary_handler+0x77/0x190
[  207.445356]  __do_execve_file+0x429/0x760
[  207.449375]  sys_execve+0x21/0x30
[  207.452693]  do_fast_syscall_32+0x7a/0x280
[  207.456784]  entry_SYSENTER_32+0xa5/0xf8
[  207.460702] EIP: 0xb7ee7c5d
[  207.463491] Code: Bad RIP value.
[  207.466716] EAX: ffffffda EBX: bfff9ed0 ECX: 08069420 EDX: bfffa134
[  207.472971] ESI: 080599d4 EDI: bfff9ed9 EBP: bfff9f78 ESP: bfff9ea8
[  207.479230] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000296
[  207.486008] ---[ end trace d49b75932d5396d5 ]---

full test log,
https://lkft.validation.linaro.org/scheduler/job/1328795#L14498
https://lkft.validation.linaro.org/scheduler/job/1331455#L8923
https://lkft.validation.linaro.org/scheduler/job/1331632#L17251

Kernel config:
https://builds.tuxbuild.com/RJ9BGpsgfPfj3Sfje8oLSw/kernel.config

Test case source:
https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/mem/thp/thp01.c
-- 
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
