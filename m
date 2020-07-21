Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7738C227B13
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 10:52:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D6DF3C2937
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jul 2020 10:52:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 518B03C26BE
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 10:52:15 +0200 (CEST)
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4A5711A01724
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 10:52:14 +0200 (CEST)
Received: by mail-pj1-x1041.google.com with SMTP id b92so1329819pjc.4
 for <ltp@lists.linux.it>; Tue, 21 Jul 2020 01:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=R2nD+mMLHgn2FEYP+wDuuJUyTBk/k5vDGDNtpX61k5w=;
 b=Pih88A/1kKZrT+xQD8fPU4ZuRRsOTCP1pHibRPrTwZPQdXzF0HA4JWZVt/w72nd/bL
 99cJWAAXrJGsTpwa0dIMM4HVRKE0VoQlMVlpjZ2ddYkpmS7d9vNBTnR+kMmg4hK+PF0j
 SVn5b1CF3axa5LWC5Icpy8LWZNZDqqT5TeZ0W4c3aUbLRs6SHoes9nabJbREBC37cu+r
 NoE4tEWkHfWioZN1SpMv0Hw1d3mcwM8lmO8pRt9A0T900tIBQ4Z3gyxtBkgXS6MVTq0Q
 ZFt42RZA8y7B3eC8VsImrBqnbgShMlKyW0KKL8fyuBSDLezyU1ABfvSuaIyi6Wtp62xI
 cJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=R2nD+mMLHgn2FEYP+wDuuJUyTBk/k5vDGDNtpX61k5w=;
 b=NP0h/SMhECBz0jbVvcCXADcusjneEtFpwBAiWMw5fpW9M5mIoLdeiVQYOCkT+dii1j
 /urpx5gSgF0wKs0U5B2RDaQLcbIfzOVhuRY+qgSnttIdfazFoD5Ndz/vTOiFPWL5wPk4
 bEq5A5V8p7/DnTPDDbV9nFbj1m/eXC4N6c7AissXItfboGXU7jRN6Ir7BJxzenJ9A02Y
 alTS5q+jLpudUPGLuXk7cDN1+0nGTPlA3mBxDi+NhV4QX7Z3Ojuvm7lTUmvyh8i96qpb
 /LCuNa/kCZ9C5fewzZZEX2iTdG7cd2YeeyU9exUTtIgbteQVy1U/IMjP4XuAAqeow4lu
 xbZQ==
X-Gm-Message-State: AOAM530kiHdhfWRsLdsn2s2AqVvDYu80zWhDENXuTBB2aEB3Ak5qIpZa
 wPHAO+oT2Fd3LNgoafauik3c9yFj0CA=
X-Google-Smtp-Source: ABdhPJy3eXQ7MXS8q48XDJ5YxUVuL8pU04t+GxNDtzfWfSioC6WJ9L/LwMxhpkf7OJXYKEn5tPAW/A==
X-Received: by 2002:a17:90a:4b0d:: with SMTP id
 g13mr3608032pjh.200.1595321532209; 
 Tue, 21 Jul 2020 01:52:12 -0700 (PDT)
Received: from localhost ([223.179.133.67])
 by smtp.gmail.com with ESMTPSA id r2sm19209857pfh.106.2020.07.21.01.52.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 Jul 2020 01:52:11 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 21 Jul 2020 14:22:01 +0530
Message-Id: <cover.1595321086.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.14.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH V2 0/3] syscalls: Rearrange sigwait syscall tests
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

As suggested by you I have tried to rearrange stuff here and I was able
to fix the linking issues reported earlier by doing following:

-LDLIBS  += -lltpsigwait
+LDLIBS  := -lltpsigwait $(LDLIBS)

And so here is the proper series now, all working fine.

This is rebased over the earlier series which is under review
(specifically the following patch,
[PATCH V7 10/19] syscalls/rt_sigtimedwait: Add support for time64 tests).

V2:
- Fixed build issues with proper ordering of libraries.

--
Viresh

Viresh Kumar (3):
  syscalls: sigwaitinfo: Suppress all warnings around unused parameter
  syscalls: sigwaitinfo: Remove SUCCEED_OR_DIE() macro
  syscalls: sigwait: Separate out code to relevant folders

 include/libsigwait.h                               |  45 ++
 libs/libltpsigwait/Makefile                        |  11 +
 libs/libltpsigwait/sigwait.c                       | 428 +++++++++++++++++
 testcases/kernel/syscalls/rt_sigtimedwait/Makefile |  10 +-
 .../syscalls/rt_sigtimedwait/rt_sigtimedwait01.c   |  78 ++++
 testcases/kernel/syscalls/sigtimedwait/Makefile    |   9 +-
 .../kernel/syscalls/sigtimedwait/sigtimedwait01.c  |  37 ++
 testcases/kernel/syscalls/sigwait/Makefile         |   9 +-
 testcases/kernel/syscalls/sigwait/sigwait01.c      |  37 ++
 testcases/kernel/syscalls/sigwaitinfo/Makefile     |   4 +-
 .../kernel/syscalls/sigwaitinfo/sigwaitinfo01.c    | 511 +--------------------
 11 files changed, 662 insertions(+), 517 deletions(-)
 create mode 100644 include/libsigwait.h
 create mode 100644 libs/libltpsigwait/Makefile
 create mode 100644 libs/libltpsigwait/sigwait.c
 create mode 100644 testcases/kernel/syscalls/rt_sigtimedwait/rt_sigtimedwait01.c
 create mode 100644 testcases/kernel/syscalls/sigtimedwait/sigtimedwait01.c
 create mode 100644 testcases/kernel/syscalls/sigwait/sigwait01.c

-- 
2.14.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
