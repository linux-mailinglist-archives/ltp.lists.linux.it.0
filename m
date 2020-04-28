Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD531BB5B7
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 07:14:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 025603C283C
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 07:14:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id DFF1D3C281E
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 07:14:13 +0200 (CEST)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 298C020017B
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 07:14:13 +0200 (CEST)
Received: by mail-pj1-x1044.google.com with SMTP id a32so616642pje.5
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 22:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P57c2RyRKq5HxNF3v/pIPsOpOlcyu8r0EwGpuaunzvw=;
 b=zVLaI8c0c2qAdALWJOkhgq1s1YNFJKzuWeXOfMIUF4qx+m4QQjmhR0ass5Jn3XBewT
 bl3/SoUIvbg8d8AgZBPHNaGQOW59yMbGGlJqs8CoDqVQ+QiYiDzWTVOCRIsg1enlumqs
 +/QKorp4K5b04HNSsK/BFKzrjB/EL8nIeUpPjByV3d4qhXJ3hBDNZQgaQD32jRhmgJXl
 GKjzty9cfC5u505ax50BoA1viFkkAEhCpx+EMGN4o2M140OkPrMHKhpfqkkaE5UsPY55
 DooAM9r9Sc8hztAtKeXjiiLwz1K7NoSTB60im6gSUESg4/6y7FRf0O+EYq0bBYqknCCp
 wDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P57c2RyRKq5HxNF3v/pIPsOpOlcyu8r0EwGpuaunzvw=;
 b=Y+G9ta1gf5d4VsWoFAuk/KERX0HKG+VTpqXpBeY1QxNZpqyldGY9Q9P/oaKFaIHaq3
 e0oPV/WSkppfb9q6WvJPw8mHHm9yrNG37xukjb13DyDro6xMXOt/wche+5SRTEzalLJW
 9rH2zWEEDJY/B+OPTevWGiTbueP9DuN4piKYfQlg8YDD25EQfkSuWd9POxW1QbcZM+OT
 BjHE8Cg2mM11KSEWPOzUbFqUrflySRpgGSHgHRPZlJv+Rqzr0z3V5KOZ1OonrdoLK/0w
 58ONAG/WCbgHi8RoMVRj5dy2VWiJOjPJI88mLJl6++UE9c3wKF0tsp/IE8vSs+6DaGDI
 3l+g==
X-Gm-Message-State: AGi0Pub3Z9jzkNVo4KyqHilVZQg7yxgtQM4/TWqf0UQjOx7AlcyJZHTT
 P3D+2LuKeDlNqjDS/CMvrYmg6eT179A=
X-Google-Smtp-Source: APiQypKxvfuDzYXNRJZAz4URjeT7/biLqoxlnP+bgseN06+9Rs0jcHp2+OXI/76rGvKKV5J79t5eng==
X-Received: by 2002:a17:90a:33c5:: with SMTP id
 n63mr2743002pjb.4.1588050851187; 
 Mon, 27 Apr 2020 22:14:11 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id h6sm914350pje.37.2020.04.27.22.14.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Apr 2020 22:14:10 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Tue, 28 Apr 2020 10:44:07 +0530
Message-Id: <6bbeda113f33b284abcd652647273726fc1bef5c.1588050829.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/pipe2: Add pipe2_02_child in .gitignore
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 testcases/kernel/syscalls/pipe2/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/kernel/syscalls/pipe2/.gitignore b/testcases/kernel/syscalls/pipe2/.gitignore
index 773450a484af..7e7b3cc89916 100644
--- a/testcases/kernel/syscalls/pipe2/.gitignore
+++ b/testcases/kernel/syscalls/pipe2/.gitignore
@@ -1,3 +1,4 @@
 /pipe2_01
 /pipe2_02
 /pipe2_04
+/pipe2_02_child
-- 
2.25.0.rc1.19.g042ed3e048af


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
