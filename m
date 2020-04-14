Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D82CF1A7908
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 13:00:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5DBBE3C2B73
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Apr 2020 13:00:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 81B1C3C2B35
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 13:00:47 +0200 (CEST)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A9E481000C76
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 13:00:46 +0200 (CEST)
Received: by mail-pg1-x542.google.com with SMTP id n16so197950pgb.7
 for <ltp@lists.linux.it>; Tue, 14 Apr 2020 04:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=50t3ElARbJjqKPJmrRTCdXYdZX/wFaCrdEPtlGexme4=;
 b=bA3vWKlofuHWvZoQ7xY1t15tVoz/4y9F3kbL+i7nd++SrFcAorHpSLNA6NNPiH9WPd
 PNjpBunySfV3xBInbwCb4WjMCAEl8rxNcjc3wDbGB2mkQD1my6iIbDq4bevun0o7Ea5p
 hqYGltHUFQAUBsdKP7N9bwSeZKvuk8VtPKrh+PCuKCQ1EdMMgO3nSoUqYHrub6mzrLAa
 oO3MkWUY1eoMA42XQZ12f6sPYsI4V1+aaI1evvUw7BVgO8nsUT00CYu8lCA3c7lvhWri
 XxoWd/oT/s/ZSIjWgQK3u+RqerFHFnhm/bUA7X7/cgktWYIlHVpvv8bwNNBGYAhgAEZ6
 0tqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=50t3ElARbJjqKPJmrRTCdXYdZX/wFaCrdEPtlGexme4=;
 b=G2dGSy1Oc5uSTmD/4xlwNYXu+8cBX2Hm73jyJczw4tRYidUz1vc9FwoJmcsm91Eqbp
 GiUuLwnpNICw8VAsrJHQZuFnZyJzA02pKb42UjtKQ/CieV7/VhoGdbl8CX7ZRFjfKJQH
 QkiGfMjtACtvdf/ce+ufpCWI4oHaXTAN2r72BvMd4WteIYKGgVoIBHN4XU7OVX7EZGqH
 ZEHdSuJqdIuoWwUEMTnUw4NrTgqKsXt6g15mqtV929weywq8T6XX7kerncElq7gRbCG5
 d13WXU5eKucYKMq4Bh8zwjGHG8xXEXR6aJHLEOZtTlqPJaICK8Yw7HDfPpnv8eF99lU1
 MYeg==
X-Gm-Message-State: AGi0PuaGAhjERFQ6ajgJSip40R3YTX+s9CWrkRXmTwk+3jvDM8t8MORI
 u0CGWNrn3UDxdNtY7aLRR+9FV3PiYKA=
X-Google-Smtp-Source: APiQypK40ce1/YG6P5yfLl9sdMoNFLuKjBPIfE4as3LBLh7zUjfXcf3u6wlF7SqQEP7sdyL47Lkx/g==
X-Received: by 2002:a63:f14f:: with SMTP id o15mr12962547pgk.132.1586862044746; 
 Tue, 14 Apr 2020 04:00:44 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id w10sm9750820pfd.128.2020.04.14.04.00.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Apr 2020 04:00:43 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 14 Apr 2020 16:30:37 +0530
Message-Id: <cover.1586861885.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V2 0/2] syscalls/clock_gettime: Add support for time64
 tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

The first version was sent as an RFC to understand how we should go
about it and here is the first version that can be merged. There are
too many changes to be described here, very much different than the RFC.

--
viresh

Viresh Kumar (2):
  tst_timer: Add time64 related helpers
  syscalls/clock_gettime: Add support for time64 tests

 include/tst_timer.h                           | 379 ++++++++++--------
 .../syscalls/clock_gettime/clock_gettime.h    |  29 ++
 .../syscalls/clock_gettime/clock_gettime01.c  | 125 +++---
 .../syscalls/clock_gettime/clock_gettime02.c  |  80 ++--
 .../syscalls/clock_gettime/clock_gettime03.c  |  80 +++-
 5 files changed, 425 insertions(+), 268 deletions(-)
 create mode 100644 testcases/kernel/syscalls/clock_gettime/clock_gettime.h

-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
