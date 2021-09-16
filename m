Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 423F440D7D3
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Sep 2021 12:50:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB7353C915D
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Sep 2021 12:50:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0DE2F3C915D
 for <ltp@lists.linux.it>; Thu, 16 Sep 2021 12:50:04 +0200 (CEST)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 67ABF200CF1
 for <ltp@lists.linux.it>; Thu, 16 Sep 2021 12:50:04 +0200 (CEST)
Received: by mail-pf1-x42d.google.com with SMTP id g14so5569790pfm.1
 for <ltp@lists.linux.it>; Thu, 16 Sep 2021 03:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QYamLoXSjOl+yEJMefa3oD+exTupwgGSDYBt2h8IRyY=;
 b=JEQnN7qeRFhqyHbSSQgKTh8QrAi4TwSAFV6mkaXwRvCtx75QetwmCAsTZ0hInFcucM
 28mK/Y8zRBAOZ+1SBvHj8jiwZaDoI/+fZICgjzBO1s/BoC9gMo0bsAQKNFcn90YJF3lC
 JrAmSxlXjSJnvO3FtP1AYQI+O3KL2eXopyyKRmATCse6PtTxdt/wBT+HWA8uWdvhXLeC
 2NQdaLcTlRc51Hyp0x9CFE3WZrdPoaW7i1CD8hFVLl5oKJQDzUdYvOxhY85xnUIp/f2v
 nLn2Sz5/7qBdsjCYD/OFvBHDOEzADg8/8r64DsaJVHDUdDIdhpd9NveBYptcP7jVHu56
 XCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QYamLoXSjOl+yEJMefa3oD+exTupwgGSDYBt2h8IRyY=;
 b=AwGWNudQyxN1uceDaqgix1zJpTyc2VYSjQBo3CzmiY/gsgvaq6ETtJODkykvEPiHBE
 kKXGL3z3WRdG5LIaXGek8xz2Xbz800sLsm35dvfWbRfaVUb5UJJ/iQ6ed4Z2rGzl0Jvi
 R2K/UpxeMI4po2T4TSLcaSlnPqnqwoZthKsEtVUYlflXwn6PgdOC4qLGEHH5BYNzTAFO
 fk6rKChDJtZmCCXygQpNUH6ik/REeDOZy8NPHKr5sCli9xvN0oz53YvHDODWeVG7Byl1
 UcIBXiVuXoRoyjqPQfekp6COeJnvbd+ikDsNKPNhgmsaxEGbt2Zjo5JWOnPhFk2p4vNd
 ym/w==
X-Gm-Message-State: AOAM530YE5S/Bu8uoTD6uMqPgAL1MzAv7rU41C2mVTs19dzRq6d9yqA6
 Fz19T/4v3Qmq6VKPb9VSq+sV9O+biqZJIRMc
X-Google-Smtp-Source: ABdhPJytd0E6aCtPOa+Ao9z9hetaZjRDf0DgDPgGdLhheQ61Ttc82J3aH6A3tgoKz0KnB8kkkBiW4Q==
X-Received: by 2002:a63:3e8b:: with SMTP id l133mr4404523pga.352.1631789402838; 
 Thu, 16 Sep 2021 03:50:02 -0700 (PDT)
Received: from fedora34.. (125x103x255x1.ap125.ftth.ucom.ne.jp.
 [125.103.255.1])
 by smtp.gmail.com with ESMTPSA id j6sm2831475pgh.17.2021.09.16.03.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 03:50:02 -0700 (PDT)
From: QI Fuli <fukuri.sai@gmail.com>
X-Google-Original-From: QI Fuli <qi.fuli@fujitsu.com>
To: ltp@lists.linux.it
Date: Thu, 16 Sep 2021 19:49:33 +0900
Message-Id: <20210916104933.33409-6-qi.fuli@fujitsu.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916104933.33409-1-qi.fuli@fujitsu.com>
References: <20210916104933.33409-1-qi.fuli@fujitsu.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 5/5] syscalls/dup2: rename dup205 to dup204
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

Signed-off-by: QI Fuli <qi.fuli@fujitsu.com>
---
 testcases/kernel/syscalls/dup2/{dup205.c => dup204.c} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename testcases/kernel/syscalls/dup2/{dup205.c => dup204.c} (100%)

diff --git a/testcases/kernel/syscalls/dup2/dup205.c b/testcases/kernel/syscalls/dup2/dup204.c
similarity index 100%
rename from testcases/kernel/syscalls/dup2/dup205.c
rename to testcases/kernel/syscalls/dup2/dup204.c
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
