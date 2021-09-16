Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F0340D7CC
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Sep 2021 12:49:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7EA0E3C8965
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Sep 2021 12:49:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C96CF3C1D41
 for <ltp@lists.linux.it>; Thu, 16 Sep 2021 12:49:51 +0200 (CEST)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6AADF60103E
 for <ltp@lists.linux.it>; Thu, 16 Sep 2021 12:49:51 +0200 (CEST)
Received: by mail-pj1-x1036.google.com with SMTP id j1so4244253pjv.3
 for <ltp@lists.linux.it>; Thu, 16 Sep 2021 03:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V7v2s5b+4t08aT7DgGFfc4cg5AYmTFd0DbLU4pHLEoM=;
 b=WngYmf8Jda6meX53ydeT86N2hM/gpyPvCFN4NS7rHUDA0saMDLtdGV4pwMCL1Vz88n
 hK/YDIu7naYuKzVQGYVMR6neqAv2e7AEowZm66+Oi+oYjkGSqv4ad/d/UyNHOcApRhoB
 GhORwqeHKHz2qG6bsoSjFj9yVwKZJ5VU8uGr3Uk8a5vwVYRd0KDkm8r7U2M9dDrjO30B
 qq2T4TdCADXUXwP1DO/tM6iRfM+K/n+mqlrRKTEoFzbO4xelLnGYhZLhgHR5JNhbK1aG
 5T5ZnbUPiKzI5cGlInDGKQrjYzq421Q+eS2ZVm5vG8OQlOctP/fIhJsmPnUxn7RHa5lv
 /9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V7v2s5b+4t08aT7DgGFfc4cg5AYmTFd0DbLU4pHLEoM=;
 b=3+cLOZE10PLEPXB0HECFdpCnMFyS2kqmJt85ED8AEF0JZ7HdVITyd4DeDYiYqBApnD
 EQ/Y3/dHFy0X/Vue/IzRL+OfAKI8NVCybCgI11r7QLMnlyBvarPdo8QHXXfJiHFt6b19
 R3fn3R9OB1ejytmhfhnMRkRFP+/tu6uWep5K1cUQnsnpylK7Mnq7Qnt0z4qZqBu54lMd
 dt34+rgvfgiPZLHS5z2XXdxEQEb9XpUyu6nbM0oyS2pJ2MQlrDeqUDM3aHOwgFEAgbOe
 yfiXkRc10oHJcvqqs+onI15YnXqrNA+Wmh82H+ZbpKIQf3P4PjDMut4ZXHSczRkQA039
 LtiA==
X-Gm-Message-State: AOAM531cE9v8DC6VGdh3C9Mo+GGyjH+vhGarfTAIlJq1vtoA6l+4O6IV
 7lrYR/LEsRXUl5Ii9Ya99rtS3kg2NkyBetTT
X-Google-Smtp-Source: ABdhPJzZAKuuPnMTaKd8OavYTLNcWUWIj2Iz7LuwBWxdfGW3cNbIe1Ssim4TsNKRX9WGGyVy+AU2ng==
X-Received: by 2002:a17:90a:d312:: with SMTP id
 p18mr5312561pju.64.1631789389818; 
 Thu, 16 Sep 2021 03:49:49 -0700 (PDT)
Received: from fedora34.. (125x103x255x1.ap125.ftth.ucom.ne.jp.
 [125.103.255.1])
 by smtp.gmail.com with ESMTPSA id j6sm2831475pgh.17.2021.09.16.03.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 03:49:49 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Thu, 16 Sep 2021 19:49:28 +0900
Message-Id: <20210916104933.33409-1-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/5] Convert syscalls/dup2/dup2{01...05} to new API
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

Convert syscalls/dup2/dup2{01...05} to new API

QI Fuli (5):
  syscalls/dup2/dup201: Convert to new API
  syscalls/dup2/dup202: Convert to new API and merge dup204 into dup202
  syscalls/dup2/dup203: Convert to new API
  syscalls/dup2/dup205: Convert to new API
  syscalls/dup2: rename dup205 to dup204

 testcases/kernel/syscalls/dup2/dup201.c | 174 +++-----------
 testcases/kernel/syscalls/dup2/dup202.c | 191 ++++-----------
 testcases/kernel/syscalls/dup2/dup203.c | 307 ++++++++++--------------
 testcases/kernel/syscalls/dup2/dup204.c | 164 +++++--------
 testcases/kernel/syscalls/dup2/dup205.c | 134 -----------
 5 files changed, 263 insertions(+), 707 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/dup2/dup205.c

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
