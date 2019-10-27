Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 069FFE6128
	for <lists+linux-ltp@lfdr.de>; Sun, 27 Oct 2019 07:50:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4970C3C22C6
	for <lists+linux-ltp@lfdr.de>; Sun, 27 Oct 2019 07:50:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 19D563C0B8F
 for <ltp@lists.linux.it>; Sun, 27 Oct 2019 07:50:33 +0100 (CET)
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 325421A0066F
 for <ltp@lists.linux.it>; Sun, 27 Oct 2019 07:50:33 +0100 (CET)
Received: by mail-lf1-x141.google.com with SMTP id 195so5370562lfj.6
 for <ltp@lists.linux.it>; Sat, 26 Oct 2019 23:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=/AqYigvbvoqryExHFEWJtEDJ9fqQnf8cNT4zJvRDNVE=;
 b=QvdCKqxeApX/Sp/h6lT7cS2kXtR27eYj3UUhVadH492liJdEEV++SyS6PnjsOLw+e7
 eqfArx9SpXE05dax5INJkfIIE3M9Jts5N+4eJuhtUeBoxemxOIHH2mGJ9vxnhEl4QVCS
 brnE6JikmmF5n9QJDQPhTfsShsGvAe8dFvlruzs2KJsOgVzWdfkoIIWUYBtouZd9Sa5q
 uDmLcCFItd5Xqb0DH+GYefGEeRdd+nI5wPzfRItTD0NRD5fphLv6urXKOdpdTtCs7vvz
 TjgFwIwqmA53wxzzO/wIiwHVbe9DoCsI2+6lW5Y5wLPUMNwQCP3fOk+ov4u1djo4/vY4
 yQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=/AqYigvbvoqryExHFEWJtEDJ9fqQnf8cNT4zJvRDNVE=;
 b=PXhigKBkBlUakWlye5nLw1KBq6Ult+5cnfM2VXxeQxNqN2htzssXFxnpOXzyTNkCGh
 gMG3OH+2fWo2ZLjDBD7wzosvPxHFj3kRWJpZteNcvxuQDuZGJGR3WDjHYTZsISbak4OT
 dZSW2zr/s+KatundI1SpWwrmmRoZQ1ophRySm7CLsvdwBFPlLFYgPPk5fzP6pK+qSBx+
 cmaMfiENYsaKLTNGKk2FgbXN5Kt3k31QA+nQ+/LGSQ7Q3kUVOn6mZUCkxvCWd081I0iN
 PdJNA47cPmvE57oHuUfJyGQq0gWZQ9L9ze4+bfwvIfR2YzVmreteTYW14qnqRBlfPSTT
 2gsg==
X-Gm-Message-State: APjAAAUZi8CG6ooD1z4XOcOmo4ERYG/jcJoKex/lfIgxpPmDsqb+SbA2
 0DPk4uDEQfAAQkcaOEJxuS0M/mQ+sYKHMPrupmp40GH6iB8=
X-Google-Smtp-Source: APXvYqzpG7LSYra6k96g3HpTEDMB6EQ6GKoD9nP7C1PKuv8KP0CmqMUlsqzZorjiCdCz2XEUvgIe74aoW2eBRIG+pCM=
X-Received: by 2002:a05:6512:51a:: with SMTP id
 o26mr7482492lfb.132.1572159031940; 
 Sat, 26 Oct 2019 23:50:31 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Sun, 27 Oct 2019 12:20:19 +0530
Message-ID: <CA+G9fYvdOcsqZ8M4VfOinnGGiacSL9rms5cnSkPK-cuZKNNP=w@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] LTP: mtest06: mmap1.c:204: BROK: mmap((nil), 2147483648, 3, 34,
 -1, 0) failed: ENOMEM (12)
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
Cc: lkft-triage@lists.linaro.org, Carlos Hernandez <ceh@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

LTP new release 20190930 mm test cases mtest06 started failing always
on beagle board x15 and intermittent failure on i386,
mmap1.c:204: BROK: mmap((nil),2147483648,3,34,-1,0) failed: ENOMEM (12)

Do you notice this failure ?

Strace output:
---------------------
[pid   383] mmap2(NULL, 2147483648, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0 <unfinished ...>
[pid   382] waitpid(383,  <unfinished ...>
[pid   383] <... mmap2 resumed> )       = -1 ENOMEM (Cannot allocate memory)
[pid   383] write(2, \"mmap1.c:204: \BROK: \mm\"..., 83mmap1.c:204:
BROK: mmap((nil),2147483648,3,34,-1,0) failed: ENOMEM (12)
) = 83

Device under test:
-------------------------
Architecture :  ARMv7 (32 bits)
Processor Family : AM5728
CPU model : DRA752-GP ES2.0
Cores : 2 x Cortex-A15

full test log:
-----------------
https://lkft.validation.linaro.org/scheduler/job/980108#L1676
https://lkft.validation.linaro.org/scheduler/job/980109#L1228

LTP version:
https://github.com/linux-test-project/ltp/releases/tag/20190930

Test case description:
------------------------------
/*
* Test: Spawn 2 threads. First thread maps, writes and unmaps
* an area. Second thread tries to read from it. Second thread
* races against first thread. There is no synchronization
* between threads, but each mmap/munmap increases a counter
* that is checked to determine when has read occurred. If a read
* hit SIGSEGV in between mmap/munmap it is a failure. If a read
* between mmap/munmap worked, then its value must match expected
* value.
*
* Can trigger panics/stalls since at least 4.14 on some arches:
* fc8efd2ddfed ("mm/memory.c: do_fault: avoid usage of stale vm_area_struct")
* Can trigger user-space stalls on aarch64:
* 7a30df49f63a ("mm: mmu_gather: remove __tlb_reset_range() for force flush")
* https://lore.kernel.org/linux-mm/1817839533.20996552.1557065445233.JavaMail.zimbra@redhat.com
* Can trigger "still mapped when deleted" BUG at mm/filemap.c:171, on
aarch64 since 4.20
* e1b98fa31664 ("locking/rwsem: Add missing ACQUIRE to read_slowpath
exit when queue is empty")
* 99143f82a255 ("lcoking/rwsem: Add missing ACQUIRE to read_slowpath
sleep loop")
*/

Best regards
Naresh Kamboju

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
