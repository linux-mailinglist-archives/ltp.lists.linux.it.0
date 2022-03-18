Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D529D4DD3CF
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Mar 2022 04:58:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04A583C9451
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Mar 2022 04:58:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1F5043C6D9E
 for <ltp@lists.linux.it>; Fri, 18 Mar 2022 04:58:06 +0100 (CET)
Received: from a8-97.smtp-out.amazonses.com (a8-97.smtp-out.amazonses.com
 [54.240.8.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4609B200766
 for <ltp@lists.linux.it>; Fri, 18 Mar 2022 04:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=sqsu7gnbk3ckn4qeg5tktvky4q6bd77q; d=linaro.org; t=1647575883;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=3DAHPZya8+JScpd4dpV4S6sPxMxyuv43nEc8FH84RSw=;
 b=gs+Xh4v6UmZ0Pgo9c0FxJjz/UNqI/PF6FoVdQyT9XKZtJJvfmERnURdcU2ln4bJJ
 x1jvGc8hj954KUj0Hc/U/tc0bbXkFB7Z4wpD0tFvlnMq+jVAOIhml9h69z8v7ZBw9es
 428tEua0LzoVb2sF9EoYgo9HbT2oWmlzf9SinMTc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1647575883;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=3DAHPZya8+JScpd4dpV4S6sPxMxyuv43nEc8FH84RSw=;
 b=iY6656+hQT4Um07OIzIVb3FUibv+ErMQV1gTJFQ5IjD7OWEjKIoKYHAnpxqe3Phu
 cgWyoAL5gS+dY6GMLJCJ5HvYrBDggzykTb1xS4QnYbX5e3o82kdoY8PaxAvdUIdwpBU
 x7f9I4hLvo+2Z7nVjOLQOE8Vf/+zwBEF9VoecYDo=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <0100017f9b2cde66-97c040bb-f3f1-4466-8c58-8f7d70480b3a-000000@email.amazonses.com>
Date: Fri, 18 Mar 2022 03:58:03 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.03.18-54.240.8.97
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [REGRESSION] lkft ltp for 26d117f
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
* kernel: 5.16.15
* git: https://gitlab.com/Linaro/lkft/mirrors/stable/linux-stable-rc
* git branch: linux-5.16.y
* git commit: 3ea3a232f03adfcf6d18d91d6e851057b6cb079b
* git describe: 26d117f
* test details: https://qa-reports.linaro.org/lkft/ltp/build/26d117f

## Test Regressions (compared to 57d05ce)
* qemu_arm, ltp-syscalls-tests
  - accept02


## Metric Regressions (compared to 57d05ce)
No metric regressions found.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to 57d05ce)
* bcm2711-rpi-4-b, ltp-controllers-tests
  - memcg_subgroup_charge

* bcm2711-rpi-4-b, ltp-crypto-tests
  - af_alg07

* qemu_arm64, ltp-controllers-tests
  - memcg_move_charge_at_immigrate
  - memcg_stat_rss
  - memcg_subgroup_charge


## Metric Fixes (compared to 57d05ce)
No metric fixes found.

## Test result summary
total: 12104, pass: 10136, fail: 49, skip: 1919, xfail: 0

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
