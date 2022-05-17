Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B9352A4C0
	for <lists+linux-ltp@lfdr.de>; Tue, 17 May 2022 16:24:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 88A693CAA71
	for <lists+linux-ltp@lfdr.de>; Tue, 17 May 2022 16:24:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 290983CA613
 for <ltp@lists.linux.it>; Tue, 17 May 2022 16:24:30 +0200 (CEST)
Received: from a8-73.smtp-out.amazonses.com (a8-73.smtp-out.amazonses.com
 [54.240.8.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 391D01A00143
 for <ltp@lists.linux.it>; Tue, 17 May 2022 16:24:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=sqsu7gnbk3ckn4qeg5tktvky4q6bd77q; d=linaro.org; t=1652797468;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=YLrhp9sc/hpneJdnmd3QL4sLxpfvISfXOzbRctPPop8=;
 b=iARFfBMx+3sFiDa2dnNYCtoWOE5BspAJvMAchf5bQB7A9GuKl07SYN/63K6w/PEs
 8V3virhy55x4v3hehSy2lb+Qkg8oSSg6GeFT1uimOhMZ3x8wQlE1iPXW3RleeNZO5o2
 OgiViIqyB29M6osuyuxXRab+3CD3bC8TGWifU5m0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1652797468;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=YLrhp9sc/hpneJdnmd3QL4sLxpfvISfXOzbRctPPop8=;
 b=B7wwEqFjingAylk9T5h7uwnIjV/4TSAnfNTlzTmUdPj88Ay3CFJRlPVg/W0puv/D
 2LVUDiuSIA38D8/p/TKDbsmDlSmeP6Gxi4RgyJAROCxKURCbuvio6zyE9ZzjyCD/Kx2
 it6MAFI4vuF9qz9k10D81IWMGiJN1du/LQUgXYeI=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <01000180d267ef77-e5bba4fd-041b-4ace-ab79-21a8fa7f2f92-000000@email.amazonses.com>
Date: Tue, 17 May 2022 14:24:28 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.05.17-54.240.8.73
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [REGRESSION] lkft ltp for ffd7dbc
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
* kernel: 5.17.8
* git: 
* git branch: linux-5.17.y
* git commit: 039120668dacf48247c0760b12e3eacd6d6b08a2
* git describe: ffd7dbc
* test details: https://qa-reports.linaro.org/lkft/ltp/build/ffd7dbc

## Test Regressions (compared to fc37232)
* qemu_i386, ltp-syscalls-tests
  - futex_cmp_requeue01

* qemu_x86_64, ltp-syscalls-tests
  - futex_cmp_requeue01


## Metric Regressions (compared to fc37232)
No metric regressions found.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to fc37232)
* bcm2711-rpi-4-b, ltp-fs-tests
  - read_all_proc


## Metric Fixes (compared to fc37232)
No metric fixes found.

## Test result summary
total: 12021, pass: 10038, fail: 61, skip: 1922, xfail: 0

## Build Summary

## Test suites summary
* linux-log-parser
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
