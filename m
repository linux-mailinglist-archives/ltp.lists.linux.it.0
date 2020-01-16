Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F77F13E863
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2020 18:32:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 18E8F3C23A7
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jan 2020 18:32:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 21A333C237A
 for <ltp@lists.linux.it>; Thu, 16 Jan 2020 18:32:19 +0100 (CET)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id EA89E1001741
 for <ltp@lists.linux.it>; Thu, 16 Jan 2020 18:32:17 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id u1so23598831ljk.7
 for <ltp@lists.linux.it>; Thu, 16 Jan 2020 09:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ZRs7Xp0qs3qSGzHPRqTIAxDUBByj6hXad2iqRxuy3uU=;
 b=Ds0PkzXYKwfH5VMIQ2HwynIM8jIAXa3kQWMalAJeoiV9OgHxutgG8PSQtMDBHYShy0
 lqkPu35misOXAyD5IPvFaKfZaws3OZmCwdCejEDoEeMdZU8ZuplgXfD3/ChnIgEUF0wq
 54Mf8TfzdyjhPdkQDZ5wQxXj79Gss85UmIyb65ogaRhcmVAJzf2C2QCCmbJ9eCAGkI2H
 lj/BkkgMqhxklh0dpDCMqAOjYrUNVVy5JtFqssgsVehwpSCO+hzJQRCwE7R3tjiP8e1X
 JW7KcFDwgM5dscKbR5eXgyumflHxLbPnE0x7uprXD7ZeUZtUfF/THRu3TbKfH/T0G4Kf
 w7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ZRs7Xp0qs3qSGzHPRqTIAxDUBByj6hXad2iqRxuy3uU=;
 b=gz0eLnf1HLibs/RlcP5usXdrSZBgzpxy/VGhPrg/lduPRv+gOM5Eh5Rfl/1fg+CG/M
 IqhCmuhGR3GyLBWoDvtdI1lvSWZalyjgk3vjfS43dOrwWNDJphTTT92FfKyRICwYgapz
 lFUIKEANN8AiwJw2qImEqAFkxp248zfLi/boO47QW3ysUiFSLJJj4uDf3zvbQPdKCtlk
 wBqUUPza4Rn/1hDRSL8K0domd/F4G1kJIvmkskMAgLwVYghnD4ovJlWk4hG53jR+Kpzw
 Ryj+vS7WhOm+3I03K8MMgnYKdxtuQHKuqv2+sGEmZ0lNZVWTUaeNzPHBhu9XvxOY+ZVI
 Vhsg==
X-Gm-Message-State: APjAAAV+ghMmOzK5XqtffCF+8LckideOj11peFmXChhulb3jXxjCPbWb
 PQ+W7V2O796qOvLzV+u1UjYkl6ApEM1xj+ixQRoJQoSBhlY=
X-Google-Smtp-Source: APXvYqw22NAxskOmVG4g/0VbfThQV7pva1b0M4/v5OzJ6zLzfCSGpwdpRcbI9f3lbdNKyDsJ5uhJ3O9hLgJLDeEH3DI=
X-Received: by 2002:a2e:965a:: with SMTP id z26mr521409ljh.104.1579195937348; 
 Thu, 16 Jan 2020 09:32:17 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 16 Jan 2020 23:02:06 +0530
Message-ID: <CA+G9fYuBdcZvE6VPm9i2=F0mK5u3j6Z+RHbFBQ1zh9qbN_4kaw@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>, Daniel Lezcano <daniel.lezcano@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] LTP: statx06: FAIL: Birth time < before time
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
Cc: lkft-triage@lists.linaro.org, open list <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

LTP syscalls statx06 test case getting failed from linux next 20200115
tag onwards on all x86_64, i386, arm and arm64 devices

Test output:
statx06.c:152: FAIL: Birth time < before time
statx06.c:156: PASS: Modified time Passed
statx06.c:156: PASS: Access time Passed
statx06.c:156: PASS: Change time Passed

strace output snippet:
[pid   498] clock_getres(CLOCK_REALTIME_COARSE, {tv_sec=0, tv_nsec=1000000}) = 0
[pid   498] nanosleep({tv_sec=0, tv_nsec=1000000}, NULL) = 0
[pid   498] openat(AT_FDCWD, \"mount_ext/test_file.txt\",
O_RDWR|O_CREAT, 0666) = 3
[pid   498] clock_getres(CLOCK_REALTIME_COARSE, {tv_sec=0, tv_nsec=1000000}) = 0
[pid   498] nanosleep({tv_sec=0, tv_nsec=1000000}, NULL) = 0
[pid   498] statx(AT_FDCWD, \"mount_ext/test_file.txt\",
AT_STATX_SYNC_AS_STAT, STATX_ALL, {stx_mask=STATX_BASIC_STATS,
stx_attributes=0, stx_mode=S_IFREG|0644, stx_size=0, ...}) = 0
[pid   498] write(2, \"statx06.c:152: \33[1;31mFAIL: \33[0m\"...,
57statx06.c:152: [1;31mFAIL: [0mBirth time < before time
) = 57

Full test log link,
https://lkft.validation.linaro.org/scheduler/job/1107634#L2276

Test results comparison link,
https://qa-reports.linaro.org/lkft/linux-next-oe/tests/ltp-syscalls-tests/statx06

Test case link,
https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/statx/statx06.c

--
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
