Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 604B840C8EC
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Sep 2021 17:52:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B4113C920D
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Sep 2021 17:52:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 575A83C55F4
 for <ltp@lists.linux.it>; Wed, 15 Sep 2021 17:52:13 +0200 (CEST)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B5994140115C
 for <ltp@lists.linux.it>; Wed, 15 Sep 2021 17:52:12 +0200 (CEST)
Received: by mail-pg1-x52f.google.com with SMTP id h3so3134371pgb.7
 for <ltp@lists.linux.it>; Wed, 15 Sep 2021 08:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ik0rnKZIWh5cQh9LrELm22GW+TakhVYjWjdYmcqj4Rs=;
 b=eeOUmxfFrtjWXHzIoJ8vo56+5k3H9R7B0fKNws3jHw001NPpO2iA68RRufCG7q0APF
 75SOt20NmRgj1diYdH6LYBk8Y0yfExAW/9+vxJch0WVDq8SU8pTqLbwJVbQyRvQU5n0G
 9mx7ZOGg0IPIz7CPYwaAxVxb7XoLy/8wGl3Irnf2fDyHRsQvsOEx1QiBQCHPIh3SVEF1
 pu1/waXGil0JrS0vdRUA7V+fidxWir2UMpmAEcNPuOdwRxEMrtVYRbt6avq2Har7oilY
 YjPzk1Z4c7DAoionM7o0qcZ3MRQpq3vZo0WqPVK+klx3W5K06AEQsOgB0YQxdxFEzxLC
 8ZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ik0rnKZIWh5cQh9LrELm22GW+TakhVYjWjdYmcqj4Rs=;
 b=ptV149afU/WeG4S3dHmOc4VkglllxI7ogXjXI4UDq3ykXlD7uAqlYNjQd8H1L2vPYv
 OeK6H9GGWW4jtCzwAinbyQ37UozMKGavqsPUEtDf0jieW9bLQiG2BGqZ0a+G+XK28boO
 mwiRCTsaxkHbQn1VPUcnA8am0wegFPfBG5uqvfM4ID+CbfgIUVhcyEvbyN5ttzVHD6Mk
 seEp5X5MrZiK3TVGk2pifh/nAbcGtnFm+GLib1ZIztvHHhHM8h2rhE1HpfP2om5katgb
 Q17qhWxmDL/hJMaqflvvNoC2jFDzR70uxDb9L7NCgTrHzsO3Z4WKjpMGFQWXeI0OmmQl
 yyyw==
X-Gm-Message-State: AOAM532CGn4eBdQmgVt0EvS0ZG+gdEgipD5/9QvG0rLUyxi6uc6J9hF6
 8QIm0BRlJzZBKkevRT83wLOryvZqneuwv/Qo
X-Google-Smtp-Source: ABdhPJyma3A0tbEMejd9RNZ+h3CSXzJ9+Pr366o7uXIUk9d5h+HoJ/Pf6xjQtyVGC6s5oHzbH/icmg==
X-Received: by 2002:aa7:9626:0:b0:3ff:6d8d:1d25 with SMTP id
 r6-20020aa79626000000b003ff6d8d1d25mr179274pfg.80.1631721131010; 
 Wed, 15 Sep 2021 08:52:11 -0700 (PDT)
Received: from fedora34.. (125x103x255x1.ap125.ftth.ucom.ne.jp.
 [125.103.255.1])
 by smtp.gmail.com with ESMTPSA id l14sm5452484pjq.13.2021.09.15.08.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 08:52:10 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Thu, 16 Sep 2021 00:51:48 +0900
Message-Id: <20210915155152.8515-1-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/4] Convert syscalls/dup2/dup2{01...05} to new API
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

QI Fuli (4):
  syscalls/dup2/dup201: Convert to new API
  syscalls/dup2/dup202: Convert to new API and merge dup204 into dup202
  syscalls/dup2/dup203: Convert to new API
  syscalls/dup2/dup205: Convert to new API

 testcases/kernel/syscalls/dup2/dup201.c | 174 +++------------
 testcases/kernel/syscalls/dup2/dup202.c | 190 +++++-----------
 testcases/kernel/syscalls/dup2/dup203.c | 282 +++++++++---------------
 testcases/kernel/syscalls/dup2/dup204.c | 128 -----------
 testcases/kernel/syscalls/dup2/dup205.c | 167 +++++---------
 5 files changed, 243 insertions(+), 698 deletions(-)
 delete mode 100644 testcases/kernel/syscalls/dup2/dup204.c

-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
