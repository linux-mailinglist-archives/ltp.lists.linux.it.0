Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 273853C73FF
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 18:13:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 477A53C9CF4
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 18:13:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D400E3C8769
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 18:13:38 +0200 (CEST)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 08A0E1A007F5
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 18:13:37 +0200 (CEST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 365B44057E
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626192812;
 bh=Qql3tcqw1EY0rhmQh2kEmmG45JsjCeoTix66oCRjui4=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=GpStLYWX3ZSc1MEADflpeihC6Wn9wv4juWfIy28VqJFaXYJdrAeZxTS36aCSU3SuI
 F+j8L1Z92V95gSiy/qIKBzZDhq0t1ObIUvej+XcDWqHi+KEkTOu/0LHVMHtaV+leNz
 phKUst0oSqJpM4S0u0+usJZT3Ih16jA2MypnYOeMuXIb0gYlVG82UgNIez4FDrzC9t
 FnWU0ohn5bSahLAavllTdxsCEMuoo+7dXmydM4Oww469oURU0jMIf63VoJ8E2mInyP
 MP+HDd/CPRqT/utsLrsqrYs6ROcX2Qiu/dEZMEi9WEiN6au24sgBCxKHY49d23b3iX
 Rh+QdPKuB5I2g==
Received: by mail-ed1-f69.google.com with SMTP id
 f20-20020a0564020054b0290395573bbc17so12157749edu.19
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 09:13:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qql3tcqw1EY0rhmQh2kEmmG45JsjCeoTix66oCRjui4=;
 b=dbvvj20gtm4e2H53mys6FJg5gIFB5pOf9cWfDu0I0Bdz52jMOeP987gy0BMqdy1tvq
 7DBnwT02OJRRHaOAaf8VzSFUXuBzBrBGkkNEGyRM7yHrtpsw76S7Xckcendq4H1ZPPFx
 RjdraGKucOZ0KO8re8IDqw7hiHzeHNcQjQh8VwYp2nga8KFOYaHFz9IC6ulB2IH9nXIx
 ufNGdczq5eOxuz+Q0RjhX6nmrAeynwNUgmzQilKMMX/t2DJ4PrgkXskxbYPyyBo5/wy5
 Av5LeWJX+V+hwYqpJKR5mca3t4NITHxTN8uh66NMYFSOttv6gYN3lbU0A3urKBpRX/gu
 zn4w==
X-Gm-Message-State: AOAM5316BNpKXg3jV8m6FE64JjTC6Pm4OiVBlmTuV1Svl7w8pLRyusYO
 3ojsKLpAySbe4/ITvfdOrWoAA3miLOLHRUOXhV74Gb+jxery2R6KMHiQsZmu1Cw+Ntsx6x4NTO/
 np1t97OxcpJPrWbWPuPQSZShlrlU8
X-Received: by 2002:a17:906:9b8d:: with SMTP id
 dd13mr4929303ejc.480.1626192811785; 
 Tue, 13 Jul 2021 09:13:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxD6ZaFh5aIOA3AN1a/gSYzK/GvOIq/UcpBkGtHdEBqy7lrb8Tf/eMNeTS7l8grsZGoaLB1Fw==
X-Received: by 2002:a17:906:9b8d:: with SMTP id
 dd13mr4929282ejc.480.1626192811636; 
 Tue, 13 Jul 2021 09:13:31 -0700 (PDT)
Received: from kozik-lap.lan (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id qp12sm8331122ejb.90.2021.07.13.09.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 09:13:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 18:13:24 +0200
Message-Id: <20210713161328.62560-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/4] controllers/memcg: fixes for CPU nodes on newer
 kernels
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

This is continuation of my work fixing controllers/memcg. It's on top
of: https://lists.linux.it/pipermail/ltp/2021-July/023764.html

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
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
