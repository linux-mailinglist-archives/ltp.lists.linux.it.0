Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3D03E8E32
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 12:11:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A13C23C6F4F
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 12:11:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7A5A03C22F3
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 12:11:38 +0200 (CEST)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 1CE4860013B
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 12:11:37 +0200 (CEST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 43EBC3F370
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 10:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628676697;
 bh=QbEPw/cWe+Ld0Y4r6wtPzWYxAVuNsmUJfvcLKPbIlA4=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=LlK/Lz/QBa3sXnKSU6XDFStxN0grcEH9xCGjnoXtlWeGeMNnk3C2ZBPOjnjbuecEk
 4rlh7byK5q4ySMfqFNajzEuQXuoCt7xLx7U0xzvf5j7ailqamigzSB5ITfldie+fIx
 gIhIfSw2sTRR4j0f+Q3zCODeBqkbrSP/6yHw9PGFQ04nDUhpoBtGHI2WUbRResljqZ
 qTDQisuCXIs/Y2DM9yfn8tEdK5kdGvZUT13zGIuveohXMvtHMKJnhbXx+6qDySf/Ro
 az2F5Pf+DifjhN8N8szPZOfSPOsdESKPURg6AazCqEFUTpsdxXe92E2Csb4S70MXeP
 zAnpOZTUSNAGw==
Received: by mail-ej1-f70.google.com with SMTP id
 r21-20020a1709067055b02904be5f536463so502166ejj.0
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 03:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QbEPw/cWe+Ld0Y4r6wtPzWYxAVuNsmUJfvcLKPbIlA4=;
 b=tOWxlRQu/vxZa/C6F7LmENXYX9NWDW5xmUuYoaPwUPm8X1f9rYwuwk5njDr6FFkf4J
 qSho1QtTIRnh0wRXAWZ6izu61h1qKb1xkkETYuVwk9NuLqv97JOALOzMmNvjKLc07HLo
 yxNFMrUPLBEtiWh9sOYAx/U2Kf5b00WA1xrqSKuDTNGZAJ8AUdNIzvnMvscuepkHkJ9A
 QiiEFKt3A/FKNmv7DomZ4YHFLZKS/rP7zpzrCDOzaSg22sLltFr2KEXFHQN95Ge/ffER
 PBG9uIWKXxoK8CTndoU4o7itmFvV/ObZwO19jtcJixGhPE6OLH9TgSHG/OJyeaAQcCoG
 rKPg==
X-Gm-Message-State: AOAM533DUAPjreGO7r0Kkip8zziWyLlW6rLV2NiCfV/trI42cK6ykzzH
 nY0OAz4Gp91WsS3C2S7wu2h/YNGbMudfE2Jg0TiBXFylmpFB4Mn8OyzrgNUS7EwkjZ5Qh1PK7Le
 YSvXvnZi99Le9ddX8QulJFFTD0tFB
X-Received: by 2002:a17:907:1b1b:: with SMTP id
 mp27mr2844404ejc.538.1628676696757; 
 Wed, 11 Aug 2021 03:11:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbd9YNYZEJm8EUtOTpSOUnT+0z2zczlllf8WKgTVwF1I1+kL3cUuZs1JkKjmgzCPtmtD8cLA==
X-Received: by 2002:a17:907:1b1b:: with SMTP id
 mp27mr2844385ejc.538.1628676696625; 
 Wed, 11 Aug 2021 03:11:36 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id c6sm7938345eje.105.2021.08.11.03.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 03:11:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 11 Aug 2021 12:10:54 +0200
Message-Id: <20210811101058.36695-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [RESEND PATCH 0/4] controllers/memcg: fixes for CPU nodes on
 newer kernels
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

Hi,

This is continuation of my work fixing controllers/memcg.

Rebased on top of latest master - no other dependencies.

The problem is that since v5.9 kernel, not only per-CPU but also
per-node kernel memory is accounted to group.  Creating a subgroup on
v5.11 kernel on a two-node machine eats ~440 kB by itself in kernel
memory.

The patchset tries to take it into account and adjust the memory limits.
Have in mind however that kernel might change such accounting in the
future.

Best regards,
Krzysztof


Krzysztof Kozlowski (4):
  controllers/memcg: account per-node kernel memory
  controllers/memcg: fix memcg_stat_test on two node machines
  controllers/memcg: fail early to avoid possible false-positives
  controllers/memcg: check status of commands using interface

 .../memcg/functional/memcg_failcnt.sh         |  4 +-
 .../controllers/memcg/functional/memcg_lib.sh | 46 ++++++++++++++++++-
 .../memcg_max_usage_in_bytes_test.sh          | 10 ++--
 .../memcg_memsw_limit_in_bytes_test.sh        |  8 ++--
 .../memcg_move_charge_at_immigrate_test.sh    |  4 +-
 .../memcg/functional/memcg_stat_test.sh       | 39 ++++++++--------
 .../memcg/functional/memcg_subgroup_charge.sh | 14 ++----
 .../functional/memcg_usage_in_bytes_test.sh   |  4 +-
 .../functional/memcg_use_hierarchy_test.sh    | 16 ++++---
 9 files changed, 96 insertions(+), 49 deletions(-)

-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
