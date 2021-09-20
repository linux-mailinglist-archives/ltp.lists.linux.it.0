Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED78410ECF
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 05:37:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4895B3C2944
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 05:37:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 68F193C207C
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 05:37:20 +0200 (CEST)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AF3C3200977
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 05:37:19 +0200 (CEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 m21-20020a17090a859500b00197688449c4so11689902pjn.0
 for <ltp@lists.linux.it>; Sun, 19 Sep 2021 20:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LdRPVXGLgYwpxAoXxfGDhkbc+92YvRoj40T10gGoyB4=;
 b=hHD7EUlQTXb22kY8L4nRBFnj+UUhrb/GnRePhFYeEhuAxDgPi6wENw4PaiRoawJnNj
 pK1k4VooNMWsNa0Mx7NMNSD4QMcSzTSEcZQh694mljiM663SiQj9vjeb+B/cboTKC6wx
 zJ7YreEZSeOJLlwTFCkKjIgf2LSAnREEryyDHukS1cvyyuo2arfzEWM4LyyNLsML3keK
 5zb0ir9qdjesUCW5PgvvW7COD1DOcunfpwvvlXt+KLMhrGo+VJ/XJ4FFQGctoQKT4Rbm
 CA7qercNqvfGhD2+LNdrJfynKFA1oLEtkotjR17kjoytE77F8MfGmSqP1jDM1VbnDl9a
 D2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LdRPVXGLgYwpxAoXxfGDhkbc+92YvRoj40T10gGoyB4=;
 b=DJAxiMhhkFemOKY9sgmRMte3rF8qaIpHLD9ATxsgon3YJNeTHI8YSMRm3t9OP/GowQ
 jMFWNNVRtfsF+sAZuRamQXcBsmQtaJB4MCTZVQA3E6oS8G7wU0RHXNhfIrwuVN8dxFnN
 2e6B1e6x6s/JN9tYPppgxfYPmGWvyjkmuw5iKp/ox7SHef+ATsMEKB6kjz7y0OHzOh+O
 oOhn+xouBoq1ZIohgcY4tDEI580fbB7UzRG/G/STHY12MwzoG/KI9v1tUqJNRVx5717K
 06FocnKPISX9gJ7iAMkCwMbQUstr6YIQSC5y8935RayLSM9d9SZ712SBcjwX2VgmZy+k
 +0qA==
X-Gm-Message-State: AOAM5327lGqof94+5WueUXk454n8mB7BFuwss5onF3L1pCQ0XTYL7mpL
 kEj0iEzqO5mOol3fwk07AzYRPMa8NB49sA==
X-Google-Smtp-Source: ABdhPJwC+sbMBg5c1f0WuvjNZsRHkCYvFm5sLimSN1DrUOMdWCTb+GvnMK5BR43pzwYIkDYA3pirhQ==
X-Received: by 2002:a17:90b:1102:: with SMTP id
 gi2mr26979208pjb.43.1632109038039; 
 Sun, 19 Sep 2021 20:37:18 -0700 (PDT)
Received: from fedora34.. (125x103x255x1.ap125.ftth.ucom.ne.jp.
 [125.103.255.1])
 by smtp.gmail.com with ESMTPSA id v25sm11932301pfm.202.2021.09.19.20.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 20:37:17 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Mon, 20 Sep 2021 12:37:00 +0900
Message-Id: <20210920033705.20544-1-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v6 0/5] Convert syscalls/dup2/dup2{01...05} to new API
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
  syscalls/dup2/dup202: Convert to new API
  syscalls/dup2/dup203: Convert to new API
  syscalls/dup2/dup204: Convert to new API
  syscalls/dup2/dup205: Convert to new API

 testcases/kernel/syscalls/dup2/dup201.c | 174 +++-------------
 testcases/kernel/syscalls/dup2/dup202.c | 196 ++++++------------
 testcases/kernel/syscalls/dup2/dup203.c | 265 ++++++++----------------
 testcases/kernel/syscalls/dup2/dup204.c | 147 ++++---------
 testcases/kernel/syscalls/dup2/dup205.c | 178 ++++++----------
 5 files changed, 276 insertions(+), 684 deletions(-)

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
