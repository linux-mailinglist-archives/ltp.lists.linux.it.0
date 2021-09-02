Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F00643FED52
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 13:59:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3FF3B3C7598
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Sep 2021 13:59:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F16653C29D1
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 13:59:09 +0200 (CEST)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 230DC1A00A2F
 for <ltp@lists.linux.it>; Thu,  2 Sep 2021 13:59:09 +0200 (CEST)
Received: by mail-pf1-x431.google.com with SMTP id y17so1436209pfl.13
 for <ltp@lists.linux.it>; Thu, 02 Sep 2021 04:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xgNArvAjbYt1uJ+EwdbhbAL41J2kAZyL5CBzxmrmLvw=;
 b=Kz4iV+PfowOM2WPTzhY3ylbNVPUKbuWPbl5cD6WUTTSW1dAo72QSi1zraHrJlXYta6
 Od7yN0WZ77IwE1apqvxXBOoUzRsApjn22yf2xFM5cpUYfD5SAE6bNuYOit8BzGye569y
 ID+LOif+CULXLi2nwhGblgY9ghzogtU8EE3WcdJg3tziVZ7LJQWVkcUH6fO8fwkY/upb
 oaAPtwdZLYexmO1pXsIZ3DuaVKyUW36TpOBEKSVhn1YM8r+yHCilqI9c6TZOrSNL0lRn
 Ana0fdfho/bMyeeF707qb72UZEi7+J60R3Imulen8TgLvno3NjbuflDU9atTDpWU1MF7
 h/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xgNArvAjbYt1uJ+EwdbhbAL41J2kAZyL5CBzxmrmLvw=;
 b=Lv0YdVxQ8IN3DfVdbouJO65cvhACGIGJ4ZYvcdXD34F+Kx5WH8uVp2IhaAfJh2kRiy
 iBExCEc4Vn8w3xPudDRt6DUptdDSQLSzCCK//1gSPAsif5+0hIf2qo0qt+WCZpZgoGO7
 5C36L37Y6Y4bUKzrXXy7fRh26rO83n/siyW3JrhM9VnY6TCBIOH4+rtaXofqzz82j2eY
 nTvTV0m3TokKn4gjruoMFRvJTwkGQH9bpln43ER/UaDsY7AqhOYdh2dg01Avg2IGQWlH
 injY0s1kOalBn3WxSPn3mg9XU5RZjYp0x7HVNVWb0vcRnmpMbBhXuTSHrK0t52INNQgY
 8h3g==
X-Gm-Message-State: AOAM5314Nn8kcyBWdhiFUDhcwow+eMgbiEscxNIb01KiDy54TRj/pxnS
 3u/xwaIvcO/4sMiFHX1xRBp6uF9dYFK6QMXC
X-Google-Smtp-Source: ABdhPJzQ0QBcwmroFoqCX09mjiq+vC9TmiHgJbVl3QiCT1dgpz8sQfpSb4K073RRWjhDKzGjzilGHA==
X-Received: by 2002:a63:d40a:: with SMTP id a10mr2895352pgh.7.1630583947555;
 Thu, 02 Sep 2021 04:59:07 -0700 (PDT)
Received: from localhost.localdomain (125x103x255x1.ap125.ftth.ucom.ne.jp.
 [125.103.255.1])
 by smtp.gmail.com with ESMTPSA id d22sm2137490pjw.38.2021.09.02.04.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 04:59:07 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Thu,  2 Sep 2021 20:58:44 +0900
Message-Id: <20210902115849.72382-1-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/5] Convert syscalls/dup2/dup2{01...05} to the new API
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
Cc: QI Fuli <qi.fuli@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: QI Fuli <qi.fuli@fujitsu.com>

Convert syscalls syscalls/dup2/dup2{01...05} to the new API

QI Fuli (5):
  syscalls/dup2/dup201: Convert dup201 to the new API
  syscalls/dup2/dup202: Convert dup202 to the new API
  syscalls/dup2/dup203: Convert dup203 to the new API
  syscalls/dup2/dup204: Convert dup204 to the new API
  syscalls/dup2/dup205: Convert dup205 to the new API

 testcases/kernel/syscalls/dup2/dup201.c | 161 +++----------
 testcases/kernel/syscalls/dup2/dup202.c | 175 ++++----------
 testcases/kernel/syscalls/dup2/dup203.c | 291 +++++++++---------------
 testcases/kernel/syscalls/dup2/dup204.c | 135 +++--------
 testcases/kernel/syscalls/dup2/dup205.c | 165 +++++---------
 5 files changed, 291 insertions(+), 636 deletions(-)

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
