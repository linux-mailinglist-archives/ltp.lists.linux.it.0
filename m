Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1103BA0BE
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:53:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D9AA53C8C7F
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:53:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2FA5B3C8259
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:53:51 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9CC5260103C
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:53:50 +0200 (CEST)
Received: from mail-ej1-f69.google.com ([209.85.218.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lzIg1-0001dR-EQ
 for ltp@lists.linux.it; Fri, 02 Jul 2021 12:53:49 +0000
Received: by mail-ej1-f69.google.com with SMTP id
 k1-20020a17090666c1b029041c273a883dso3510838ejp.3
 for <ltp@lists.linux.it>; Fri, 02 Jul 2021 05:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bytoPTEovQggc+9f7kbpQfRYDNgUQsLpNL/kvUsHjRY=;
 b=rTGlrgSv4zRecGCK5HkvIshEPT5lnmmK1Ld3LBK/cfnmjdI/EwH0qKgTcjSsBmBBjH
 A1wUdpDAboBc3IYI60yMzMkddm9t7aOrxnLS2JX321he3j7WvDd09I0ejEI8uwQteaAB
 ooHiija40zlzkTOzHUaNxp9jYLwy6sG7aqKeNGCyWurqg/HngfpHcQo5rHmYawC5qW8k
 tMnFy0l4e8eQxMdagTZ4LZcMgDRUeoQS2J2fDc1PTfwO9QFgpCw4BBmNZYVGJWQNTbJU
 A5cTVof6X9Vg1Xii09yo/Sv4Qzogvr5chMJ0dHdNlZxc9r/id7g0Ba/saOQFCXVhVOIc
 lvzw==
X-Gm-Message-State: AOAM533tJrcPH+0W3ehWh4vE+9i4IChdRQ75feX43jNPu1GKvQikXwot
 thq9X6N+wj3kgLIOyXNepZ9ljw/TcSkV50SYES7Rw72En2EBsOni6irLLzGPu2W7HR4V8XsvbmZ
 WySlpAJbWM5q/MhUkyKHq6e4YZhoI
X-Received: by 2002:a17:906:794f:: with SMTP id
 l15mr5203917ejo.400.1625230428981; 
 Fri, 02 Jul 2021 05:53:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDA7apQzfmzCSljFHQ+w3Qvl+pynGxe3Z9gaE472j8a8j1YeYSsnyJzwL4RPt/Ilx9k/KlwQ==
X-Received: by 2002:a17:906:794f:: with SMTP id
 l15mr5203906ejo.400.1625230428839; 
 Fri, 02 Jul 2021 05:53:48 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id b23sm1304446edy.44.2021.07.02.05.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 05:53:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Fri,  2 Jul 2021 14:53:33 +0200
Message-Id: <20210702125338.43248-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 0/5] controllers/memcg: fixes for newer kernels
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
 .../memcg/functional/memcg_subgroup_charge.sh | 16 +++++++-
 .../functional/memcg_usage_in_bytes_test.sh   |  7 +++-
 6 files changed, 85 insertions(+), 25 deletions(-)

-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
