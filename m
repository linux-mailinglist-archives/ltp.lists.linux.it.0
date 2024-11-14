Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC389C9662
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Nov 2024 00:48:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E6B63D7201
	for <lists+linux-ltp@lfdr.de>; Fri, 15 Nov 2024 00:48:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E833B3D71D0
 for <ltp@lists.linux.it>; Fri, 15 Nov 2024 00:48:44 +0100 (CET)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C8A8C1BBF491
 for <ltp@lists.linux.it>; Fri, 15 Nov 2024 00:48:43 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d447de11dso101305f8f.1
 for <ltp@lists.linux.it>; Thu, 14 Nov 2024 15:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731628123; x=1732232923; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rbliS0InrBXP/XI9aWNBDdIBKMi4A+UPy3aaAR6rW7s=;
 b=RqPsXlPbfBjfA7HrS48Fo6G2PSxAr2P9Wm23d8IoYzAxyVwO76ny/hUif/VH6GyTLe
 acywqtBNg4HjlmwTKSrQ4uwpd8KwIjOTqjyZRaYKTttCyTwLVIoiDdLTLUPnSbSQQX5E
 hTL65pzipbuF2EQ3atxC7jFZXQ4Ngipdd42mAUVyN316xN3UMMXooOqlDdwwxkw1W9Lx
 TluUNQ49/8n45p3wFVy7YPjrGLcHRX+w6ZUrrGHC5lnPvR9Y2gsEIsXzXLkGQ3zYcOMG
 vJbZ21jK8nNtZi8fZUaT5NqwgvvpbFtWYVKKD5wz1Xmm5gMEBcPPwN7K6WbhS1P7Hpn6
 7pKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731628123; x=1732232923;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rbliS0InrBXP/XI9aWNBDdIBKMi4A+UPy3aaAR6rW7s=;
 b=VIr6bKfl4MLONUnAEOCrNTLTGtHclwEt9Z9IXWkZf0y1QH3x3iPiiYf11u4527b66M
 BuJSVwMpHVblLy93VnbrwPIR6VbGh4gZm95QSq7Y2Gyqrkadp83ge0Vdm6mP0SHivdWa
 +bStox+7Y06KXZLF+mEVakF5EJudTk2Xis28ynKqQfPXY1h+W9+JjxPLEVjXPHvS68tf
 wSJQX5fv7F7qyzODpQJAb6N68xEFoMC3iaPX5gDKGuKWZs/wa7qrcY9i/lF9s/ZU+/i7
 p9AFEiKlwEc+l7yrUj31EPIN0mk9Vu30cYa9o0JXX8+KubF/bps3Wcx7+31JLlLRlTdw
 Lh2Q==
X-Gm-Message-State: AOJu0Yxe3iS46P+AigGfFPIxS03Cp8Aw9YHMnDMUHy/z3GZrzD5wn/NX
 22+LgmZnAuQi2TyYwspQDMAEdMSVdD5MWUDCLo+SMkxwMufZld+EoZnEvQ==
X-Google-Smtp-Source: AGHT+IGldGaeonZaWmW1to0sDTTOLesL/uI4RGEE43Y16wEbXajarUzaCS5NsGdmK0s8bpXDaTOuYw==
X-Received: by 2002:a5d:6d01:0:b0:37d:4d80:34ae with SMTP id
 ffacd0b85a97d-38225901fe2mr380983f8f.4.1731628123062; 
 Thu, 14 Nov 2024 15:48:43 -0800 (PST)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ada2e35sm2789402f8f.5.2024.11.14.15.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 15:48:42 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Fri, 15 Nov 2024 00:48:35 +0100
Message-ID: <20241114234839.1680432-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 0/3] Port rt_tgsigqueueinfo01 to musl
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Petr Vorel (3):
  rt_tgsigqueueinfo01: Use siginfo_t portable members
  rt_tgsigqueueinfo01: Convert doc to docparse
  ci/alpine.sh: Update list of incompatible tests

 ci/alpine.sh                                  |  3 +--
 .../rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c   | 22 +++++++------------
 2 files changed, 9 insertions(+), 16 deletions(-)

-- 
2.45.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
