Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B5754042E
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jun 2022 18:56:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6847A3C8F88
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jun 2022 18:56:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0E7443C0162
 for <ltp@lists.linux.it>; Tue,  7 Jun 2022 18:56:49 +0200 (CEST)
Received: from a8-73.smtp-out.amazonses.com (a8-73.smtp-out.amazonses.com
 [54.240.8.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2F5481A008AC
 for <ltp@lists.linux.it>; Tue,  7 Jun 2022 18:56:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=r5f3hr7pzmhv6xwu5spgpns3mj2fddpz; d=linaro.org; t=1654621007;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=zP0QzOGg9R9+9o0MiCBzNBrczuLwaG4VPgrJ2W34BNM=;
 b=nSbZDeUK2mS8/jXxGbMjCF6NN1JNoFfniBgiqAkBEvv/qC/wpFkCWRUqzK/oU19b
 xHqPMo5xAvtPuIvuAJ4dGYRLxpIfHTO/q+S0UVfcfmzTnje7jzYn6DZIFo0XfIFm5zq
 zc6X68J2C8o8y+Hnqt7tb2ZsMAEKBGV1NTjVa/J0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1654621007;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=zP0QzOGg9R9+9o0MiCBzNBrczuLwaG4VPgrJ2W34BNM=;
 b=brIILuRHcyad3yc+knkq4vOVvw22+SlQ8J8f8cRnqadS1rIBxH67c3BeJYp4FvTF
 thCv7ofEdy94bwoxbrm/lfPpL7DiJRlrBtjJ8owmcIPMrquEFTEqvRNPeL9mkbS+H78
 3IrxYGWqUrOHewmCsU27TbdQyWmnDnQ+6iRKTgY8=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <010001813f18ebf6-7561a4f2-94af-410d-85dc-32309be0b623-000000@email.amazonses.com>
Date: Tue, 7 Jun 2022 16:56:46 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.06.07-54.240.8.73
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [REGRESSION] lkft ltp for 20220527-34-gc5a5f50
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
* kernel: 5.17.13
* git: https://gitlab.com/Linaro/lkft/mirrors/stable/linux-stable-rc
* git branch: linux-5.17.y
* git commit: 8eb69e8f0d4544de764ab03c5b292ead949d9ac1
* git describe: 20220527-34-gc5a5f50
* test details: https://qa-reports.linaro.org/lkft/ltp/build/20220527-34-gc5a5f50

## Test Regressions (compared to 20220527-32-g9bc65ed)
* bcm2711-rpi-4-b, ltp-fs-tests
  - read_all_proc

* qemu_arm64, ltp-fs-tests
  - read_all_proc


## Metric Regressions (compared to 20220527-32-g9bc65ed)
No metric regressions found.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to 20220527-32-g9bc65ed)
* bcm2711-rpi-4-b, ltp-crypto-tests
  - af_alg07

* qemu_arm, ltp-mm-tests
  - ksm03

* qemu_x86_64, ltp-fs-tests
  - read_all_proc


## Metric Fixes (compared to 20220527-32-g9bc65ed)
No metric fixes found.

## Test result summary
total: 12210, pass: 10252, fail: 53, skip: 1905, xfail: 0

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
