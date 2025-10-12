Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7C9BD0BC6
	for <lists+linux-ltp@lfdr.de>; Sun, 12 Oct 2025 21:40:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 26BCC3CEAD4
	for <lists+linux-ltp@lfdr.de>; Sun, 12 Oct 2025 21:40:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 95C713CEA5F
 for <ltp@lists.linux.it>; Sun, 12 Oct 2025 21:40:18 +0200 (CEST)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 90C611A006EB
 for <ltp@lists.linux.it>; Sun, 12 Oct 2025 21:40:17 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b4c89df6145so589416266b.3
 for <ltp@lists.linux.it>; Sun, 12 Oct 2025 12:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760298017; x=1760902817; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pq+dQ0TtRXL+P+f1wk+U7uXG6CKGNz18kDsCClszaWU=;
 b=GpHtFk1q0LWQCjDTHEbhvb2fTLUeuCH09I5UgCNaBnDiKR1E9rS8RtskQhGmHM78YD
 r82lR8Qzx0OmCPyRzILYkcqpNFS1UOw6/EUWX/T7GuQLSOcQ90s27aKDgp6vHkyZ7LMH
 MCKMUh/cEPfbcVPbnYedos37e6eXmz1NzQY28cTLYyoPwjKTCNxF7DSqTf3jTGQLW5H2
 J2XKyH2dR3d9RqGgKe6hSw4qSGeQG9Xv6mZ0n0jCIl4AB/w1G38XHPuSPQfwf/gtVUOg
 uR86oSHL/OQLXK6wK23RpeifVVjDD2DF4sRO5o4IXRWtymcsH+7K0fxnL2aoaAEsMl5e
 TBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760298017; x=1760902817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pq+dQ0TtRXL+P+f1wk+U7uXG6CKGNz18kDsCClszaWU=;
 b=gHM78hhGM2+FGAkqI2wy0GQiJlxditD0X1oPL3sORYHf9BqU77jWPmX+6uGgCan9G6
 1xp6ggF1sLeK/3PtF3JIZyXU9WKaINCWAlyLcJEsNjWHLIMiBdEUtJHLT4LjNo2SxXAm
 I3GZBB0jYwNL8pHcasreQ1tlgyyS0I8GWruh8NtIDqaVfMemu4SHsfEYZ9uEW1Mswz7a
 EHVCnYpAZ9r16zFcrsuDfI9AC2sEn+YPNeup9Y+asEpu/IGrwxFjzxKI3CzhcEGj6kAl
 xNsOH+VXpAcGay4vLWuNPgQhe0D33oE4IAGghIlJgl8UjUyRkxzKoxfUQsKRXtu94ym7
 sthw==
X-Gm-Message-State: AOJu0YxbGxed2ArZwXZl4521btNTYCVfYjYErpW5LmKgM9WoD9VqR/Oy
 ZxUfU+pUMEtig496FzaUc+5Th1UHQVvThzviotEycQiZPF41kI0Iki3o4/WartVj
X-Gm-Gg: ASbGncsYXoRd1DvpmqGljDCXrnDXBxJ6rWod464yhbq/yLXrqrTEW6F7yGOEd945hU0
 DC7GcsWnKfSAqO9goXzlxsql5SbqcABlNonbhONkcG3hOQ2fIKsAyS82gVDaa74o/vp1nwwtXo0
 86TqjgO48j7/LMKXvyRB3Ot83cGqPZvTkWK3I0h2sdHWonToRt9KiDaepC61EQsv14nEi9HFtfK
 KO+Z8LgKkn2yokC+mb78ccjDrg2h4vyUqK6DnjDANevZCM7tWg0pqedujWizMaHz3Bs61NoUW2e
 +OPWxFAcePMTkH+7ZiGtt+qpHvZCPkvrzRAMNy/C8qOSmzxKq1WgqZekD8drJPJyWwdxZSikF+D
 9q4b15l/EqJfDntk87nSdVUsjffQdgFRXxSYzKJZJSf335Z69oj460C0=
X-Google-Smtp-Source: AGHT+IGbop1DE/VUZfSnhSnmvD8QFT3ZtWBtkY7odGPi+f5m4oX2lcvUSuDj/QbsVjjOrW5NcAvP7w==
X-Received: by 2002:a17:907:1b12:b0:b41:e675:95e3 with SMTP id
 a640c23a62f3a-b50aa9a1c71mr1962365766b.16.1760298016731; 
 Sun, 12 Oct 2025 12:40:16 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d8c12a8esm769901666b.42.2025.10.12.12.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Oct 2025 12:40:16 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Sun, 12 Oct 2025 21:40:05 +0200
Message-ID: <20251012194007.370008-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 0/2] __builtin___clear_cache() => __clear_cache()
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
Cc: Hui Min Mina Chou <minachou@andestech.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

based on Khem's report and attempt to fix

https://patchwork.ozlabs.org/project/ltp/patch/20240611055655.614782-1-raj.khem@gmail.com/
https://lore.kernel.org/ltp/20240611055655.614782-1-raj.khem@gmail.com/

Kind regards,
Petr

Petr Vorel (2):
  m4: mprotect04: Replace __builtin___clear_cache with __clear_cache
  hugemmap15: Check for __clear_cache()

 configure.ac                                  |  2 +-
 m4/ltp-builtin_clear_cache.m4                 | 19 ------------------
 m4/ltp-clear_cache.m4                         | 20 +++++++++++++++++++
 .../kernel/mem/hugetlb/hugemmap/hugemmap15.c  |  3 +++
 .../kernel/syscalls/mprotect/mprotect04.c     |  7 +++----
 5 files changed, 27 insertions(+), 24 deletions(-)
 delete mode 100644 m4/ltp-builtin_clear_cache.m4
 create mode 100644 m4/ltp-clear_cache.m4

-- 
2.51.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
