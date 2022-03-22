Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F22874E4860
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Mar 2022 22:38:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 902533C94B0
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Mar 2022 22:38:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 33D953C8C8C
 for <ltp@lists.linux.it>; Tue, 22 Mar 2022 22:38:35 +0100 (CET)
Received: from a8-81.smtp-out.amazonses.com (a8-81.smtp-out.amazonses.com
 [54.240.8.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 070121400B81
 for <ltp@lists.linux.it>; Tue, 22 Mar 2022 22:38:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=sqsu7gnbk3ckn4qeg5tktvky4q6bd77q; d=linaro.org; t=1647985112;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=0fYL1jb3DBhoX1lJNY8UzTIacKZ13L5mW+rWOXaGJLg=;
 b=BDcJE8il66g5vCh0gLI5FLFL4HjMHC305qxeieZ/zdh9QRhZRzqDI6gEi1CdP61g
 Ez12cJ8MOEbKJYjaFI9wOFmrZl4ZJmPKuIOV3Saf61uC3+Rw4Uu2a/8UiwZBRCfK7Zs
 86gcTsc9r4DCrsjCpEPr0l5FY93SV75OzpdpACjU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1647985112;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=0fYL1jb3DBhoX1lJNY8UzTIacKZ13L5mW+rWOXaGJLg=;
 b=O+QMzTETbg6dWG+kfOoKoj+3Sfi3of9QlplaxJHW9VjbNCstf0wKDX9KllKSDVke
 9vESaOrHijk3YOuwMsW80KVp0rz1q9S0+rhltO1Bz6o5COYOfkN/XBkQ9vir0k9cPCD
 Udk5W00Xw08kutW7MGI+kISGil/9xtbVS2MBMXIg=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <0100017fb39133f3-e59a8953-1e23-4a91-aeda-8ae2e39c6fe2-000000@email.amazonses.com>
Date: Tue, 22 Mar 2022 21:38:32 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.03.22-54.240.8.81
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [REGRESSION] lkft ltp for 5b9db1a
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
* git describe: 5b9db1a
* test details: https://qa-reports.linaro.org/lkft/ltp/build/5b9db1a

## Test Regressions (compared to e246b2e)
* bcm2711-rpi-4-b, ltp-fs-tests
  - read_all_proc

* bcm2711-rpi-4-b, ltp-syscalls-tests
  - inotify11

* qemu_arm64, ltp-controllers-tests
  - memcg_subgroup_charge

* qemu_x86_64, ltp-controllers-tests
  - memcg_subgroup_charge


## Metric Regressions (compared to e246b2e)
No metric regressions found.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to e246b2e)
* qemu_arm, ltp-syscalls-tests
  - accept02

* qemu_i386, ltp-controllers-tests
  - memcg_subgroup_charge


## Metric Fixes (compared to e246b2e)
No metric fixes found.

## Test result summary
total: 11767, pass: 9834, fail: 43, skip: 1890, xfail: 0

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
