Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FBB3C6D33
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 11:22:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD70E3C8774
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 11:22:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6EA0D3C65F7
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 11:22:18 +0200 (CEST)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7C4A3600266
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 11:22:17 +0200 (CEST)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 9ABDF40653
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 09:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626168135;
 bh=gNanRshC/2JXKvToHfat2vXv5ThQ8q17TnH79vbjK1k=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=Y0cY5CVn6v5coUEpsbuIIWXg4Z8iMULnbn47u872p9iu4SuW4qYclEgXOe/BNu2Da
 3SwhwV2AtiaBV2M9J9oIV2Ao/eMd73aKDhWsp+fth5wmRu6wUTmrUOO7J1t0ITpDQ2
 qbGmsA+MxITIwksqamzQyE196InHj7jSjVkA7qDESyb4q3lEmtajF1lYjaPlxD6o6a
 01UARL5YY9/oUf5JoV6cVhD1T2A5PJZ8KzTXjqj2bVHg6JGRcaE07hb2lSdSRkVaU6
 Tn9Luwi85ldllBRfPvaxjpzAUWF152McTG6hmQu8K+NLd5nUTcfSqXCTo0OGLyqiwr
 Gg65PoXtTVhew==
Received: by mail-wr1-f72.google.com with SMTP id
 y15-20020a5d614f0000b029013cd60e9baaso6053143wrt.7
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 02:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gNanRshC/2JXKvToHfat2vXv5ThQ8q17TnH79vbjK1k=;
 b=OC5OZOeUILjaIGMqPkeAoWbo+KegRW3PnOLfPiaXYDbNHNDYfvaxZBn9PHBJeV5atM
 I+S9geUcfoSxh2XGmmgU9AV7l7FQA7wNUtT33Ue+V4mnRxbj9AWa7yoUPeQi+E6yn82I
 eguBn11Xho+5qjZMv6F/zAedM0tsLV6AIGds5nsFLaWLlDVm19jt6c1BNT50S+GXcGsG
 fGCKdyGo2Q9fGi1heVgXhCKHaU+Cu+y73FQswdoB9T0Sf1qNxKPNdDqWuKiWccCkdt9d
 d2t0xg+yAaoIV3fgyEboW6SVsMu8/cDtS6dA997XFcnEy5Vnx4olFKTnESIX9Q5atlf8
 hF+A==
X-Gm-Message-State: AOAM5305+r5E5vqRN4ePMlsu//UmaF5PvWtPzGx2CReOP3DtP8Bskl0P
 jXm41x/xNtDAYTg00G06D6s8uepRS4wrGBaglnyJHse6noClbxT++RDXJaFDjfvnccuIYlZoQXX
 jdKbHbrA1JE6qCBl/l3lS6jMqhpLz
X-Received: by 2002:a1c:1bc3:: with SMTP id b186mr19492520wmb.27.1626168135166; 
 Tue, 13 Jul 2021 02:22:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXNufu+C6BkJoCgQwIDIS1vsBDBpVfVb/9Idv5+Dtg1hpF1gPFvZjrD04ym5QTtUh5s19blw==
X-Received: by 2002:a1c:1bc3:: with SMTP id b186mr19492508wmb.27.1626168135032; 
 Tue, 13 Jul 2021 02:22:15 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id e11sm15663393wrt.0.2021.07.13.02.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 02:22:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 11:22:05 +0200
Message-Id: <20210713092210.17141-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v4 0/5] controllers/memcg: fixes for newer kernels
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

Changes since v3:
1. Patch 4/5: Include per-CPU memory as well in group limits.

Changes since v2:
1. Patch 1/5: Define MEM_USAGE_RANGE and explain it.
2. Patch 3/5: Use PAGESIZES to explain it is the batch accounting.
3. Patch 4/5: Add to this patchset (previously sent separately, no
   dependencies on others).
4. Patch 5/5: New patch, fixes additional difference, usually of 2-3
   pages coming from the kernel.

See also reply from Michal Hocko:
https://lore.kernel.org/linux-mm/85b8a4f9-b9e9-a6ca-5d0c-c1ecb8c11ef3@canonical.com/T/#m6459b3be3a86f5eaf2cfc48dd586b6faf949e440

v2: https://lists.linux.it/pipermail/ltp/2021-June/023259.html

Best regards,
Krzysztof

Krzysztof Kozlowski (5):
  controllers/memcg: accept range of max_usage_in_bytes
  controllers/memcg: accept range of usage_in_bytes
  controllers/memcg: accept non-zero max_usage_in_bytes after reset
  controllers/memcg: increase memory limit in subgroup charge
  controllers/memcg: offset kernel memory

 .../controllers/memcg/functional/memcg_lib.sh | 41 ++++++++++++++++---
 .../memcg_max_usage_in_bytes_test.sh          | 18 +++++++-
 .../memcg/functional/memcg_stat_rss.sh        | 20 ++++-----
 .../memcg/functional/memcg_stat_test.sh       |  8 ++--
 .../memcg/functional/memcg_subgroup_charge.sh | 33 +++++++++++----
 .../functional/memcg_usage_in_bytes_test.sh   |  7 +++-
 6 files changed, 96 insertions(+), 31 deletions(-)

-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
