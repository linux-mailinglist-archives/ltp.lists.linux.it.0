Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3270215E57
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 20:31:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 14DC73C54FA
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Jul 2020 20:31:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id CD2853C29D0
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 20:31:19 +0200 (CEST)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F1669600A07
 for <ltp@lists.linux.it>; Mon,  6 Jul 2020 20:30:14 +0200 (CEST)
Received: by mail-lj1-x243.google.com with SMTP id 9so46612543ljv.5
 for <ltp@lists.linux.it>; Mon, 06 Jul 2020 11:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=p5Lmi+n2aCPuO3HRqROvjZ77CiNJumYrCfcDWyCoeRo=;
 b=eeWUgxRo45PzzLMOYfNqM0fJG3eM7NhB0LGTmtY80A7HRBb96PXbpmm2eQ7cWidh/B
 TuMBksb61mp7mBvwy6xMYVeWjgnZW0XCH3OQxXUoDvh5pjiVoak0SmUzC4Ppmwnt1EOX
 djbiIXAdo7K0uMgMf7QT6ZkuKLl3EXY2WqHvR/g0lFwC5fwnIogO2p7f2mjjkzSodbAv
 opbO1ipwB03vwqWkP+GjYO2dKy/mRRGzSLTUiOJ9IalzRfYDGdYf9UmMpOWUoP09XcT8
 o9QAISDvnbmvuYYDSu5sgEJUCpkrVcpBwXTU3yfABGF2AAv4F67VsZBkA1w9RLpfAXqv
 Sprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=p5Lmi+n2aCPuO3HRqROvjZ77CiNJumYrCfcDWyCoeRo=;
 b=nMnGhbWfCuJYOjETJvOU8V/KcBIsO5MjIs6G/aauC890sqThIOZEac5TQXeT8a9yu/
 rsd+z3IT70PZ8IRb+2l++Zos2J0/0JhVYlz22eJC9vUafKNG3ni0QfKzJXbnfCeDFaxH
 M53l2v+L1NJcPPIdzXMloUzw0qS4l7u+MlhJ0feWsqHIjHuk2X+bt4lZWc5O/CGQAZb1
 rTva1F/0AMoevEgUdvLm3TAiWahBZ5GJrrnbAqexeUw+sWCWwk41Jlfcm7+lyZi+HEPs
 3H0LyiyX3Z3+nonGmXvxRe1NAkKRPod3lBAfySM3Qj81Lp7Y9FpImr6UWm5izt2DllZe
 WONg==
X-Gm-Message-State: AOAM533Ga0cWIaRJgpEK77uxeNvzq1kX+ecKSkgCVUmVQTyVaoCvHi0n
 UbJXeNfKZU/Xjh1dNBHe1DdoY8u0BrX0XYr4JrUCXsDLNJ8BOA==
X-Google-Smtp-Source: ABdhPJwS18nLQq/ktvdWl0S9gHYIEpELe1rh6z+qD6ClkdZU5mPQNRNLXiDBb3yDb/T6RZ6tXPh/BrUG0n7zFuAuJJ8=
X-Received: by 2002:a2e:9b42:: with SMTP id o2mr27484571ljj.102.1594060277199; 
 Mon, 06 Jul 2020 11:31:17 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 7 Jul 2020 00:01:05 +0530
Message-ID: <CA+G9fYuiK95tkP1e2VogtbzGex4qJdpfCZ6bfM5S5sA_o+iRQw@mail.gmail.com>
To: LTP List <ltp@lists.linux.it>, open list <linux-kernel@vger.kernel.org>, 
 lkft-triage@lists.linaro.org
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] clone302.c:88: FAIL: invalid parenttid: clone3() should fail
 with EFAULT: EINVAL (22)
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Christian Brauner <christian.brauner@ubuntu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

LTP clone302 test case failed on linux next 20200706 tag.
This is a regression on arm64, arm, x86_64, and i386.

The expected error code is EFAULT but got EINVAL.
This is already addressed here in this email thread by Christian Brauner
https://lore.kernel.org/linux-m68k/20200627122332.ki2otaiw3v7wndbl@wittgenstein/T/#u


Test output log.
clone302.c:92: PASS: invalid args: clone3() failed as expected: EFAULT (14)
clone302.c:92: PASS: zero size: clone3() failed as expected: EINVAL (22)
clone302.c:92: PASS: short size: clone3() failed as expected: EINVAL (22)
clone302.c:92: PASS: extra size: clone3() failed as expected: EFAULT (14)
clone302.c:92: PASS: sighand-no-VM: clone3() failed as expected: EINVAL (22)
clone302.c:92: PASS: thread-no-sighand: clone3() failed as expected: EINVAL (22)
clone302.c:92: PASS: fs-newns: clone3() failed as expected: EINVAL (22)
clone302.c:92: PASS: invalid pidfd: clone3() failed as expected: EFAULT (14)
clone302.c:92: PASS: invalid childtid: clone3() failed as expected: EFAULT (14)
clone302.c:88: FAIL: invalid parenttid: clone3() should fail with
EFAULT: EINVAL (22)
clone302.c:92: PASS: invalid signal: clone3() failed as expected: EINVAL (22)
clone302.c:92: PASS: zero-stack-size: clone3() failed as expected: EINVAL (22)
clone302.c:92: PASS: invalid-stack: clone3() failed as expected: EINVAL (22)

strace output:
[pid   519] getpid()                    = 519
[pid   519] wait4(-1, 0x7fff504b02ec, 0, NULL) = -1 ECHILD (No child processes)
[pid   519] syscall_435(0x7fcc0478bfc0, 0x40, 0x7fcc04278031, 0,
0x7fff504afb26, 0x360) = -1 (errno 22)
[pid   519] write(2, "clone302.c:88: FAIL: "..., 97clone302.c:88:
FAIL: invalid parenttid: clone3() should fail with EFAULT: EINVAL (22)

Test code:
{"invalid parenttid", &valid_args, sizeof(*valid_args),
CLONE_PARENT_SETTID | CLONE_CHILD_SETTID | CLONE_PIDFD, NULL, NULL,
&invalid_address, SIGCHLD, 0, 0, 0, EFAULT},

Test case link,
https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/clone3/clone302.c#L41

ref:
https://lkft.validation.linaro.org/scheduler/job/1542127#L3243
https://lkft.validation.linaro.org/scheduler/job/1542828#L1412

--
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
