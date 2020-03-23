Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F57D190133
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 23:50:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DA4F53C4E5E
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 23:50:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 592BC3C4E5B
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 23:49:45 +0100 (CET)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D6AB314002B3
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 23:49:44 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id z18so1283535wmk.2
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 15:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=COqNbTj9UiYGL8LXUAOb1ZjGNmbPxO6A7eWXMSqpqF8=;
 b=C5oSf63V8A8ePJGBJRtNMwrw+z7Uft+MbKeZeUnQnnfmKDPuvQCOuBhUJDFYbrj8ud
 WTKFD8QwYcumu1HOF2KRqXcLeIw+SIhBZnuslqHpXwHF28PWNYSBg3yp168c9t4tw39G
 l7BGdBAvyJL0Xau84PaKMxFP4nVW0QuIu33iFnpbx/uR8e/cAn50NFTT1xW5y+ICETaD
 dGxdHlwcTuGxL0TSxFhCAtMhupdh+5EJjhkVPXo/0eBZnML5AWiCHmT7SGPP+jy9iOGx
 jjamErkD297eaGera2DJIFa9F25erambNgBBrkMsooJM726x7hPFvhpNAxQvrtTRWfqB
 +0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=COqNbTj9UiYGL8LXUAOb1ZjGNmbPxO6A7eWXMSqpqF8=;
 b=bWTTCPSFH0ZXo5BvVXlI1Yo5TORux8/BTc8Qa+rr12v+8DiqPecQYeAhVO7Au96u4P
 d4jYRR3Pi1g7irJ3vQSHzCOn6Aot9VaJXuLAgjXoMn6RpZ+2+GxpcMuYmc5WHRsNg8jc
 42MSdZAQaZIflQ74rsZpTpwfMUOFSPov4G/MBJZISyVCgRSaMcSIyI0Wk+y7pgrP11lE
 VrgbelclGW2DyK+Jfloo/cfleV2+RX+chRVdMYy8MK4IP9Y8GPha+gqM6b3lC1LuE1IU
 igKcIWGrSTQzbistX3Td5A3MFzD0JEU/K0yIq9CeKFUUVWJjK3DMeEmqb3yPds8uAZeo
 pLwA==
X-Gm-Message-State: ANhLgQ2p+XurIXb8CZEkS3/HAW/yV+2F9Ahey/rAl/1HLrmLtA/VtI9Z
 sH57u0EyZDMuT/+x98LqPaehmOAP
X-Google-Smtp-Source: ADFU+vs/BNQm43vJYWp3RY7P5230azV0rLe0pzHL48RtbnZQ8miJGiMKvEmIAlBKAs01e6RSNW8f5w==
X-Received: by 2002:a1c:4d16:: with SMTP id o22mr1881692wmh.56.1585003784016; 
 Mon, 23 Mar 2020 15:49:44 -0700 (PDT)
Received: from localhost.localdomain ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id k15sm2782317wrm.55.2020.03.23.15.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 15:49:43 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Mon, 23 Mar 2020 23:49:33 +0100
Message-Id: <20200323224933.2613658-3-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323224933.2613658-1-petr.vorel@gmail.com>
References: <20200323224933.2613658-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] travis: Update musl build
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

accept4_01.c was fixed in previous build.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 travis/alpine.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/travis/alpine.sh b/travis/alpine.sh
index 233dae78e..b2c1fff9e 100755
--- a/travis/alpine.sh
+++ b/travis/alpine.sh
@@ -30,7 +30,6 @@ echo "WARNING: remove unsupported tests (until they're fixed)"
 cd ..
 rm -rfv \
 	testcases/kernel/sched/process_stress/process.c \
-	testcases/kernel/syscalls/accept4/accept4_01.c \
 	testcases/kernel/syscalls/confstr/confstr01.c \
 	testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
 	testcases/kernel/syscalls/getcontext/getcontext01.c \
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
