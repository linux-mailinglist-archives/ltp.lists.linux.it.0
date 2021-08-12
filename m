Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6A63EA023
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 10:03:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 674DC3C6B53
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 10:03:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5FDE73C6C12
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 10:03:22 +0200 (CEST)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DE3011A00F64
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 10:03:21 +0200 (CEST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 51D993F0F8
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628755401;
 bh=1Ol++xcoPlUoW+y6b+lvBSwBRMq7E0fmDOyoKjoWyGU=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=skPLn5qwWLq+ApmPfhUFS9ZgqJFC4SO9weXKAN2Nr510Pgwg5VJQGTXmOI+vKhARI
 WxPchGlQj7INW5x981IgECpvs9+3f/MInmq/dEpZzPrdxKp1Z/DJtIpgcacsnU2MAL
 CH9ZakZxceaeV7C6CbMeVWkqiGL6hjZ3Mwrz7t+spKgb9ewDjAERS0gLyR0DOAAFzW
 opw1BPzBev6hamS1iv9BTIlnCYj557Kxowucg/824ZBjmraSDmNTTQss2gl4F3/8uo
 wwmVzVlbLdV3sDN5FAqGgyAYRc8fZB2rHF5vVrQiTU0JNBALGRUlmpAQk80Zl9Pwxd
 NfGRGHj1ATmvg==
Received: by mail-ed1-f70.google.com with SMTP id
 b16-20020a0564022790b02903be6352006cso2648785ede.15
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 01:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Ol++xcoPlUoW+y6b+lvBSwBRMq7E0fmDOyoKjoWyGU=;
 b=Msup8mfHWd5TKcZhCvvWW7m1kEUq5na0vU2OIbHjxsEaZw1j08k6+OvvdzYyKNuE2n
 c6Ud+tgAWNj6V1rXbRHlSIfSTWs1bNo4/YULMyVDGGK+FH/4vLOQMxxeB99Dh1O4GulD
 NordTHFpej9UjAitBl5Tt5rhUZ7tVAtcoHBCkJK9fyciSFcoSSt8/+EPVivd6k2MUIMy
 y+u7TFWHJlLVnr9sxRAP2sJIG8IGab9IOs2c+1mP4jcgPLw1rTt0S1tWUGd5SF3+lMfB
 d58uKiBQweW0ISxCxd2LfIkAyfSgffgE5z7aSIl5S9cok9kMGJXzjmfO8EFPcZEWWyke
 pOdg==
X-Gm-Message-State: AOAM530U3INzshtfN0n5lNtqlKf0p6/wFQapfyRTVeN4Orqx1/s8I0c8
 QwZipo4hht2r7CHn58meTW2fNZvvuJero+S0UaFLr2AKXBiJpR5jUk39viHJuxpTQGbTkAPT2XA
 kgE2YJnUnM62MEcVKgmS9d+/T31Ip
X-Received: by 2002:a17:906:4a51:: with SMTP id
 a17mr2390312ejv.435.1628755400789; 
 Thu, 12 Aug 2021 01:03:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfWa8B0BQU4aYVdT+dEv67JxzL616CLvUhFNdm+aQFa/Qwhxe25pKdwX2FiBaqdHHj28TGiw==
X-Received: by 2002:a17:906:4a51:: with SMTP id
 a17mr2390300ejv.435.1628755400612; 
 Thu, 12 Aug 2021 01:03:20 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id r2sm759114edv.78.2021.08.12.01.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 01:03:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Thu, 12 Aug 2021 10:02:38 +0200
Message-Id: <20210812080242.16972-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/4] controllers/memcg: fixes for CPU nodes on
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

Changes since v1
================
1. Address Richard's review by echoing the new node-adjusted limit and
   counting nodes in easier way.

Description
===========
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
 .../controllers/memcg/functional/memcg_lib.sh | 37 +++++++++++++++++-
 .../memcg_max_usage_in_bytes_test.sh          | 10 ++---
 .../memcg_memsw_limit_in_bytes_test.sh        |  8 ++--
 .../memcg_move_charge_at_immigrate_test.sh    |  4 +-
 .../memcg/functional/memcg_stat_test.sh       | 38 ++++++++++---------
 .../memcg/functional/memcg_subgroup_charge.sh | 14 +++----
 .../functional/memcg_usage_in_bytes_test.sh   |  4 +-
 .../functional/memcg_use_hierarchy_test.sh    | 14 ++++---
 9 files changed, 84 insertions(+), 49 deletions(-)

-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
