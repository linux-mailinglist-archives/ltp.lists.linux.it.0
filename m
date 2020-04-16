Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B4A1ABE48
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 12:42:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C12003C6482
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Apr 2020 12:42:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 8584F3C2B14
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 12:42:47 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 671C2600708
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 12:42:46 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id b72so1469927pfb.11
 for <ltp@lists.linux.it>; Thu, 16 Apr 2020 03:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z/DZEzt9E368QBzEzzfAfGhUx3xWfSHOnyLwplptJY8=;
 b=vxOV/Zf81YJfUf2RerWXXuQxZ9G6UO19fhyi4U3H31TuypHz/2Gio/Dji1s7AANv+Y
 XW8icnwAC1uHbeToU4tM9RkHP7hpd4rj3dMHseT4DxeMAA6SK4G/pbuITZRwN0cnwWc/
 UAarEdr7shVo/Qj8n97J+bfTg9ILAs0MMz/ZNJkEIv2XxxctN/W9n3c1XnkaDTgWzw+W
 /zcJ3z+FfLGOb9onhSsMVK8RVT+Kq00rO6arYx84vsOaac5lMIGrDzNPA++41ZXWzKdY
 f3tbXjS8Vj9r+TLy+dcS5A/WlIp+MMKfa1K6jqn52NaVmRxei/pOhLeqxnvulKNUsanb
 wPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z/DZEzt9E368QBzEzzfAfGhUx3xWfSHOnyLwplptJY8=;
 b=YS6b+Nw+J6a4A0bu7qiAvcEfuEfiJqjKf0FNPiiOd+GbDGqK330aYv7XS+ZdborxAJ
 V45woZWVut8eVoLB7E6GgUY4jQ0+YNHXcNXaMCplogxAsskmFjEau8IckPphEyiYAb6t
 H/PQSrbzARjYQYpZBWRcgt5/G5BV42yN2lRb5SPjW+F0RHFi8nKICS0GbyLlGswCcWPR
 uHb9JHDg7AxSq6dhVAiazJO1Uk2WayAGfZMUcRf6eJ3RZYkfeDLOG2zgPvmQkJ9X/Onz
 ORWxt3w4viNIpU1ewlrJ5rGo7B3x2MvqIvKR/pImAzhQM3BsNMeWckqWA1kOIswJ3tn5
 ESEg==
X-Gm-Message-State: AGi0PuYjbNh+QiyWoFySnpVcwyDtwSr/jnnhGIQv8o9CdiUemeLTNbS6
 oYksW8auLQrWUa3WBrdil0wM9W2czIY=
X-Google-Smtp-Source: APiQypJp8y26lrT3pWaNDPiN0BZQeEJF032G/wsLCuPRbAWbCH0JUXERrHRiBXGRLJnA91KmSwudRA==
X-Received: by 2002:a63:5724:: with SMTP id l36mr26889982pgb.366.1587033764344; 
 Thu, 16 Apr 2020 03:42:44 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id l5sm14961577pgt.10.2020.04.16.03.42.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Apr 2020 03:42:43 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 16 Apr 2020 16:12:29 +0530
Message-Id: <cover.1587033556.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH V3 0/2] syscalls/clock_gettime: Add support for time64
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

Here is the third version which looks very different from the previous
one again :)

V2->V3:
- Define an enum for timespec type create struct tst_timespec and update
  all generic helpers to handle them.
- Update clock_gettime tests to use them.

Viresh Kumar (2):
  tst_timer: Add support for kernel's 64 bit timespec
  syscalls/clock_gettime: Add support for time64 tests

 include/tst_timer.h                                | 549 +++++++++++++++++----
 .../syscalls/clock_gettime/clock_gettime01.c       | 116 ++---
 .../syscalls/clock_gettime/clock_gettime02.c       |  72 +--
 .../syscalls/clock_gettime/clock_gettime03.c       |  55 ++-
 4 files changed, 602 insertions(+), 190 deletions(-)

-- 
2.7.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
