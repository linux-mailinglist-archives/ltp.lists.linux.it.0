Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 737774E434C
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Mar 2022 16:46:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F4BA3C88B9
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Mar 2022 16:46:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4532F3C07B5
 for <ltp@lists.linux.it>; Tue, 22 Mar 2022 16:46:41 +0100 (CET)
Received: from a8-97.smtp-out.amazonses.com (a8-97.smtp-out.amazonses.com
 [54.240.8.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3D0701A007F0
 for <ltp@lists.linux.it>; Tue, 22 Mar 2022 16:46:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=sqsu7gnbk3ckn4qeg5tktvky4q6bd77q; d=linaro.org; t=1647963998;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=veHoOreiCs6kHgEnBrSpfgyL/QiBm0M6gJWdhVwYggc=;
 b=eZkdZgTWTv+rPuO6hEb2+yZetNmDp43jJtVP5bTot+wKFYsdJbC3lvXnz8LQ5DtN
 Vkx2hq5mHhXK5g/CGwYyE7ai7bXCRSUIfSd8XH2T9C3EG6PiDALw1HfYeJec4NBkAEE
 bCCz42kJtpha7tPgad++sNSBsyVeZFRowRsEabB8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1647963998;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=veHoOreiCs6kHgEnBrSpfgyL/QiBm0M6gJWdhVwYggc=;
 b=IvJ8JHbe79+ip2lteb6Rzg/6OyDzC/1y1Kmxfo0YO794M4AyzYfZRdJ6CLXMyDtf
 9/nLvGOwO31HVfAG+pMYphuIjPdqGYFVqCS205NUmQ+vMPb7cfczqYA9Pggo517qi1A
 7CAUWdPavQU0uNilTcR58jRHCLn1/K4EtcLWxGRI=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <0100017fb24f068d-de91b142-df8a-4cdd-86b0-f09cdcd2b85d-000000@email.amazonses.com>
Date: Tue, 22 Mar 2022 15:46:37 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.03.22-54.240.8.97
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [REGRESSION] lkft ltp for e246b2e
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
* kernel: 5.16.16
* git: https://gitlab.com/Linaro/lkft/mirrors/stable/linux-stable-rc
* git branch: linux-5.16.y
* git commit: 9aed648340400df7f403d41d8558244afd6d69d3
* git describe: e246b2e
* test details: https://qa-reports.linaro.org/lkft/ltp/build/e246b2e

## Test Regressions (compared to f68379f)
* qemu_arm, ltp-controllers-tests
  - memcg_subgroup_charge

* qemu_arm, ltp-syscalls-tests
  - accept02

* qemu_arm64, ltp-syscalls-tests
  - accept02

* qemu_i386, ltp-controllers-tests
  - memcg_subgroup_charge


## Metric Regressions (compared to f68379f)
No metric regressions found.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to f68379f)
* qemu_arm64, ltp-controllers-tests
  - memcg_move_charge_at_immigrate

* qemu_x86_64, ltp-controllers-tests
  - memcg_subgroup_charge


## Metric Fixes (compared to f68379f)
No metric fixes found.

## Test result summary
total: 12109, pass: 10139, fail: 44, skip: 1926, xfail: 0

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
