Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD7D53582C
	for <lists+linux-ltp@lfdr.de>; Fri, 27 May 2022 06:05:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 995BB3C1348
	for <lists+linux-ltp@lfdr.de>; Fri, 27 May 2022 06:05:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1E2993C051B
 for <ltp@lists.linux.it>; Fri, 27 May 2022 06:05:35 +0200 (CEST)
Received: from a8-81.smtp-out.amazonses.com (a8-81.smtp-out.amazonses.com
 [54.240.8.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 281552000B2
 for <ltp@lists.linux.it>; Fri, 27 May 2022 06:05:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=r5f3hr7pzmhv6xwu5spgpns3mj2fddpz; d=linaro.org; t=1653624333;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=V/ajPQgJk8wWfMPRg6hXbGIHW72JQ0qa3GB7ytJ2iqA=;
 b=LumVaEWuCUaD5+SnLh2AFaTikP7DEM/VxYSxuEKM9fdcXjUZvYXjc8TuEZVgGFEZ
 4V92WyTy1N5PgaJ2kv2yWVFsRYytGW874xc8X16DE8uK3xuUgDzrZPCG0IY9KVk48H2
 ZjQMTood4X6h2Lne9LFM8dIoHYuqPi6lOK7ij6Z0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1653624333;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=V/ajPQgJk8wWfMPRg6hXbGIHW72JQ0qa3GB7ytJ2iqA=;
 b=eiXbzzuTKY7JKzRNhO2YhK7KOd1BH+iNEj6TaTuJaA+shnapzm8Zq+LxioXEZDPT
 KpGYE+kkPP1zjqcNCtPn7DgUiNGRc1WdXgWzIZYJ94G0z08GKtRYY847do5L13dfjEY
 95TZZFl3+jB4mvIMEAdIk9gUqb7fBolWoRnGCWIs=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <0100018103b0e434-ff621c39-e396-4c3e-9623-d757058d2daa-000000@email.amazonses.com>
Date: Fri, 27 May 2022 04:05:33 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.05.27-54.240.8.81
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [REGRESSION] lkft ltp for 03f246f
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
* git describe: 03f246f
* test details: https://qa-reports.linaro.org/lkft/ltp/build/03f246f

## Test Regressions (compared to a7362af)
* bcm2711-rpi-4-b, ltp-fs-tests
  - read_all_proc


## Metric Regressions (compared to a7362af)
No metric regressions found.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to a7362af)
* bcm2711-rpi-4-b, ltp-syscalls-tests
  - inotify11

* qemu_arm64, ltp-cve-tests
  - cve-2019-8912

* qemu_x86_64, ltp-syscalls-tests
  - clock_adjtime01


## Metric Fixes (compared to a7362af)
No metric fixes found.

## Test result summary
total: 12634, pass: 10639, fail: 60, skip: 1935, xfail: 0

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
