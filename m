Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B234E480E
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Mar 2022 22:05:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 11BAD3C8A8D
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Mar 2022 22:05:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0783E3C882C
 for <ltp@lists.linux.it>; Tue, 22 Mar 2022 22:05:30 +0100 (CET)
Received: from a8-35.smtp-out.amazonses.com (a8-35.smtp-out.amazonses.com
 [54.240.8.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 51EF06009D7
 for <ltp@lists.linux.it>; Tue, 22 Mar 2022 22:05:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=sqsu7gnbk3ckn4qeg5tktvky4q6bd77q; d=linaro.org; t=1647983128;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=dL2PWS/uTguofuQFz0bINIgsJlkbYXGOtkORM+7izaU=;
 b=iJS6zPHN7eOxJt9HnBW7Pyf8oUrTbN6r7xZuSvFmlbR3XobROmiVoCmli9/JGjdJ
 SxUYD2G3ONWHRc+Awih78XSUPyNqBMybljPtnawpKNgNhCHpzb/XCohVo6dqmRH1cEd
 gCE8yqqA1Ue8i5plPJpjS2IG8okImrkma0r88hJ4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1647983128;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=dL2PWS/uTguofuQFz0bINIgsJlkbYXGOtkORM+7izaU=;
 b=O9NYys1+iMlJYRHo/F+/EmXnehbvzfLDgnOX118jdVFBVBUrIM5nKXXojywAksny
 aZnuMGwa33A0QisokJNeSJe6MzuC9PmUBcjuIIyHtKbZX+ThIDlB1AMaCmic44kJ+IJ
 0MgLqbb7E7RutTUrCbb0q2Y0wYQinB54CUF9GK7Y=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <0100017fb372ef27-ce859ae9-44a5-4ade-92a7-f367e5a7dead-000000@email.amazonses.com>
Date: Tue, 22 Mar 2022 21:05:28 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.03.22-54.240.8.35
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [REGRESSION] lkft ltp for f4b92b6
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
* git describe: f4b92b6
* test details: https://qa-reports.linaro.org/lkft/ltp/build/f4b92b6

## Test Regressions (compared to e246b2e)
* bcm2711-rpi-4-b, ltp-controllers-tests
  - memcg_subgroup_charge

* qemu_x86_64, ltp-fs-tests
  - read_all_proc


## Metric Regressions (compared to e246b2e)
No metric regressions found.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to e246b2e)
No test fixes found.

## Metric Fixes (compared to e246b2e)
No metric fixes found.

## Test result summary
total: 11946, pass: 10004, fail: 46, skip: 1896, xfail: 0

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
