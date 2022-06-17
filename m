Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1297954EEB2
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jun 2022 03:17:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84F1B3C7B43
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jun 2022 03:17:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2EE813C19CA
 for <ltp@lists.linux.it>; Fri, 17 Jun 2022 03:17:09 +0200 (CEST)
Received: from a8-29.smtp-out.amazonses.com (a8-29.smtp-out.amazonses.com
 [54.240.8.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 53A40601350
 for <ltp@lists.linux.it>; Fri, 17 Jun 2022 03:17:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=r5f3hr7pzmhv6xwu5spgpns3mj2fddpz; d=linaro.org; t=1655428626;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=O1kc1RRnjup5cDWVcgxDbNM/AYrMVcjeOUVzCJEXWl4=;
 b=c03rZL1fJmtpBnSL6nHuRuZ5ryFliolzHeBmPZvsqZoQs9LzrtrX4RltTd2pVjAC
 SxnjQckGcdnVrxsmXMHjrV36FyK0RDTQcQel9h4iJpG8pxQ7UOR5xIl9oYnbVcswoTT
 6cR9Bf8uWZ+VU2U7r4dJAQDfNK1QEYvxtntgL0dk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1655428626;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=O1kc1RRnjup5cDWVcgxDbNM/AYrMVcjeOUVzCJEXWl4=;
 b=C77tTaNZ40ZlNcNDr7RZL1OE+lrhhP8DCFvA6CnD2UCHRSZkdxz2Trd1PqjCE4wC
 PmRGgssBX1s6NThaydCTYBxTv+9lmx5kGNsq3XaEKy6Dy4heAJqwNMeD5Z3fHTxQubf
 KFj0swnUfRdLJQT54SYgU4NX3RmneHzIr9IrdiyQ=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <010001816f3c352e-f5ee78c6-1425-42f5-b673-409a0a92ef74-000000@email.amazonses.com>
Date: Fri, 17 Jun 2022 01:17:05 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.06.17-54.240.8.29
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [REGRESSION] lkft ltp for 6763a36
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
* kernel: 5.17.15
* git: https://gitlab.com/Linaro/lkft/mirrors/stable/linux-stable-rc
* git branch: linux-5.17.y
* git commit: eed68052d2016d9f96d6656435099762608120e3
* git describe: 6763a36
* test details: https://qa-reports.linaro.org/lkft/ltp/build/6763a36

## Test Regressions (compared to 20220527-48-g47ebb84)
* qemu_arm, ltp-syscalls-tests
  - accept02


## Metric Regressions (compared to 20220527-48-g47ebb84)
No metric regressions found.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to 20220527-48-g47ebb84)
* qemu_arm, ltp-syscalls-tests
  - inotify12

* qemu_arm64, ltp-crypto-tests
  - af_alg07

* qemu_arm64, ltp-syscalls-tests
  - inotify12

* qemu_i386, ltp-fs-tests
  - read_all_proc

* qemu_i386, ltp-syscalls-tests
  - inotify12

* qemu_x86_64, ltp-syscalls-tests
  - inotify12


## Metric Fixes (compared to 20220527-48-g47ebb84)
No metric fixes found.

## Test result summary
total: 12654, pass: 10650, fail: 63, skip: 1941, xfail: 0

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
