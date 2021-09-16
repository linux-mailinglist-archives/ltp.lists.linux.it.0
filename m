Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A73440DD23
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Sep 2021 16:46:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 256853C8984
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Sep 2021 16:46:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 451203C1D7D
 for <ltp@lists.linux.it>; Thu, 16 Sep 2021 16:46:22 +0200 (CEST)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7FA49140012E
 for <ltp@lists.linux.it>; Thu, 16 Sep 2021 16:46:21 +0200 (CEST)
Received: by mail-pj1-x102c.google.com with SMTP id k23so4752353pji.0
 for <ltp@lists.linux.it>; Thu, 16 Sep 2021 07:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k091TM984c4u9MP75CYtwoCZJaWIgusTPBYYeV+PvZU=;
 b=Ybc6XWfL3FCDe9q344t9WciCEHnnLqhm5t0lSZSTmxdIvwX8SwITgsmvTGeRFE5T01
 4qIEerE8jKvjbnp0PLuImSzS3/1HijB+SMWf5dYVfM7lZHaciOTWbtLjPYptrg0Vjett
 uikkMzj/XDrANEQ1VjRoW1ka2V0GXqI3Wwi91ADtobjl4dgrEeqbwHd6u5gETwrQu5l4
 4ka8ggqvRi8Hh3F/MnYkJNmho5HEO9x9QakqxPkAIa9eYz5iPDclRo87Oe77VDPrw22D
 ccVGhF9/OAmSPG9tUlVsetjizpz0LtcTTtbceNZ9kdLY7oJlzLkOgPY4WqIEhyks8lbY
 jowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k091TM984c4u9MP75CYtwoCZJaWIgusTPBYYeV+PvZU=;
 b=gHl8Imt2fsoZXX82apGd9cZmq7jt1M9bsB/XuwaTL/Z9X6UNkP1Uw09dWLu/sXvIg4
 Y18LZ2BC5Q7UpFmM7nrVcpDXsTEjF7HCGGpN3RLpb+kO3hcwX+8ocxlbIUxBQYIHgjc+
 XOr4fiRZ/D2uv0qxVXVK1R0lEj+BZAnxkhef0Lme9LpQxl+mQG5ipy0sGF93V++hn5qQ
 8ddgLPYmYjsEuVZKB7nKGu4DPlrafhkRtrzkYDyDdRdlV4i6mjeF8QL8Z/GJRJy2hILL
 63C7IaDDS2ewwXwhv29utVjcytpUnYSslm37TXu6fO7OqT81qhnNAX7DtqCrMdwnFY0k
 t8aA==
X-Gm-Message-State: AOAM530z5uuFiTSMl067u4qxPEv3NjhxLcQ1j1w7ezJut7f8Duoax9r0
 jBVWbAv33D4Ypymm7uxtIBA5/QzHgMOITB2k
X-Google-Smtp-Source: ABdhPJzp7I+VwKwzm7nB11PPor6xF0AxutNGaurYda/UWgU3ISFmuNj2mKpzu2N8MKB9iLg19Xc7sw==
X-Received: by 2002:a17:90b:f02:: with SMTP id
 br2mr15084931pjb.125.1631803579832; 
 Thu, 16 Sep 2021 07:46:19 -0700 (PDT)
Received: from fedora34.. (125x103x255x1.ap125.ftth.ucom.ne.jp.
 [125.103.255.1])
 by smtp.gmail.com with ESMTPSA id v25sm3299097pfm.202.2021.09.16.07.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 07:46:19 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Thu, 16 Sep 2021 23:46:03 +0900
Message-Id: <20210916144605.36204-1-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] Convert syscalls/dup3/dup3_{01,02} to new API
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

Convert syscalls/dup3/dup3_{01,02} to new API

QI Fuli (2):
  syscalls/dup3_01: Rewrite and convert to new API
  syscalls/dup3_02: Convert to new API

 testcases/kernel/syscalls/dup3/dup3_01.c | 157 ++++++++---------------
 testcases/kernel/syscalls/dup3/dup3_02.c | 111 ++++------------
 2 files changed, 75 insertions(+), 193 deletions(-)

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
