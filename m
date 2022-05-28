Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F71536B4A
	for <lists+linux-ltp@lfdr.de>; Sat, 28 May 2022 08:34:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6056F3C1B37
	for <lists+linux-ltp@lfdr.de>; Sat, 28 May 2022 08:34:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2D4D93C0134
 for <ltp@lists.linux.it>; Sat, 28 May 2022 08:34:00 +0200 (CEST)
Received: from a8-81.smtp-out.amazonses.com (a8-81.smtp-out.amazonses.com
 [54.240.8.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BA9CA200D0B
 for <ltp@lists.linux.it>; Sat, 28 May 2022 08:33:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=r5f3hr7pzmhv6xwu5spgpns3mj2fddpz; d=linaro.org; t=1653719638;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=s/5vsPhQmoYfRDWUi6DLaLgER+TNr7GgOIRNGqMxA7A=;
 b=gjqHbi55UdZ9abTsXCjEb8JZe65HNj4jjdSsV/QnUShyK6iSz54th84lcQxXaEkd
 Lyuz0B05RAOBXcR2mkWaYAdJsYFHtYVeAlVpukSIdIgY4X49lTQc6oCM0vy6U63rOCh
 ddPQ+MDssok7j6lmLIMAeyB2gGbu7J6sD62W/4R4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1653719638;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=s/5vsPhQmoYfRDWUi6DLaLgER+TNr7GgOIRNGqMxA7A=;
 b=EpA2f8bT/qXuHYmRSiQ8WpxJWpF6fFiBqg2DenVCCW2x8Fqc6GDn/p7duagX8BZv
 UzEHlDbempCOQFRx+yVZGSgTRE3y6WNQWVb0fOyYgp5s/vCTdfk9ofK6EX47mv5leNE
 Ai9mhRD6wQKMf3KyKzniB8bb1bw8RcGN5xZcUgxQ=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <01000181095f2109-feba93e4-6693-440a-a0eb-9417d8f302c1-000000@email.amazonses.com>
Date: Sat, 28 May 2022 06:33:58 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.05.28-54.240.8.81
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [REGRESSION] lkft ltp for 20220527-3-g83978df
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
Cc: lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

## Build
* kernel: 5.17.11
* git: 
* git branch: linux-5.17.y
* git commit: e960d734930b58bd6ce00c631ea117af0764473c
* git describe: 20220527-3-g83978df
* test details: https://qa-reports.linaro.org/lkft/ltp/build/20220527-3-g83978df

## Test Regressions (compared to 20220527-1-ge0c6fbe)
* bcm2711-rpi-4-b, ltp-fs-tests
  - read_all_proc


## Metric Regressions (compared to 20220527-1-ge0c6fbe)
No metric regressions found.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to 20220527-1-ge0c6fbe)
* bcm2711-rpi-4-b, ltp-commands-tests
  - ar_sh

* qemu_arm64, ltp-cve-tests
  - cve-2019-8912

* qemu_x86_64, ltp-cve-tests
  - cve-2018-1000204


## Metric Fixes (compared to 20220527-1-ge0c6fbe)
No metric fixes found.

## Test result summary
total: 10831, pass: 9106, fail: 47, skip: 1678, xfail: 0

## Build Summary

## Test suites summary
* log-parser-boot
* log-parser-test
* ltp-cap_bounds-tests
* ltp-commands-tests
* ltp-containers-tests
* ltp-controllers-tests
* ltp-cpuhotplug-tests
* ltp-crypto-tests
* ltp-cve-tests
* ltp-dio-tests
* ltp-fcntl-locktests-tests
* ltp-filecaps-tests
* ltp-fs-tests
* ltp-fs_bind-tests
* ltp-fs_perms_simple-tests
* ltp-fsx-tests
* ltp-hugetlb-tests
* ltp-io-tests
* ltp-ipc-tests
* ltp-math-tests
* ltp-mm-tests
* ltp-nptl-tests
* ltp-pty-tests
* ltp-sched-tests
* ltp-securebits-tests
* ltp-syscalls-tests
* ltp-tracing-tests

--
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
