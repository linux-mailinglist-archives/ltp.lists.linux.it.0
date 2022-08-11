Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1D658FF18
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Aug 2022 17:17:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CA3F93C9575
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Aug 2022 17:17:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 896BA3C0204
 for <ltp@lists.linux.it>; Thu, 11 Aug 2022 17:17:23 +0200 (CEST)
Received: from a8-97.smtp-out.amazonses.com (a8-97.smtp-out.amazonses.com
 [54.240.8.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7A8061000601
 for <ltp@lists.linux.it>; Thu, 11 Aug 2022 17:17:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=r5f3hr7pzmhv6xwu5spgpns3mj2fddpz; d=linaro.org; t=1660231041;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date;
 bh=EASncmh2Ah5Pmpb4iHm8BBql988m/UexOvSYSNOcQHI=;
 b=Wt81b3bjoBsBwWwcrSULEKSGbbrBpZQeIwKhbz0GBD9rniNDQpIG7LqD/IX3vdOr
 kaG59ZQNmbha6DkNSG8bnvLyRa3njc08BrFqJ3CqYPLkqcoierOMXU5V5gHCIzC8Rsr
 ejJb+X6Z2RHsv6bgbEEVFdxlwrk5540W3JeM1px0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1660231041;
 h=From:To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:Date:Feedback-ID;
 bh=EASncmh2Ah5Pmpb4iHm8BBql988m/UexOvSYSNOcQHI=;
 b=f0Am2/tT0VacbPxX94P+Q3p37BGOom7tmeWvOA53DTyTgy6xA2TVxVHf3zO2FytL
 5ZbN1QrM1k/kTCOo/Y6s76rHBcGH2oMUnGsJL1PzlaP5MePWYorO2d4SsRDy9lHt5/c
 u1u13IGgTcnfsScSB5HUOb7BT8OeM2iZqJzlgA/8=
From: lkft@linaro.org
To: ltp@lists.linux.it
MIME-Version: 1.0
Message-ID: <010001828d7b3ed8-00b39a83-3b61-40a1-adbd-63dbe64b3083-000000@email.amazonses.com>
Date: Thu, 11 Aug 2022 15:17:20 +0000
Feedback-ID: 1.us-east-1.MCLpz+6YeXzvh9aTd6J8upg22bI0XPzIkR2gghvgyqQ=:AmazonSES
X-SES-Outgoing: 2022.08.11-54.240.8.97
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] lkft ltp for f42f6f3
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
* kernel: 5.18.16
* git: https://gitlab.com/Linaro/lkft/mirrors/stable/linux-stable-rc
* git branch: linux-5.18.y
* git commit: 8843bf1f0737ecea456d2bbd19d4263d49f2d110
* git describe: f42f6f3
* test details: https://qa-reports.linaro.org/lkft/ltp/build/f42f6f3

## Test Regressions (compared to 72efdad)
No test regressions found.

## Metric Regressions (compared to 72efdad)
No metric regressions found.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Test Fixes (compared to 72efdad)
No test fixes found.

## Metric Fixes (compared to 72efdad)
No metric fixes found.

## Test result summary
total: 1120, pass: 1120, fail: 0, skip: 0, xfail: 0

## Build Summary

## Test suites summary
* log-parser-boot
* log-parser-test

--
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
