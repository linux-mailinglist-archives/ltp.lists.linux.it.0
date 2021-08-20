Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 437E43F29B8
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 12:01:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C6C913C1AE4
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Aug 2021 12:01:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AF6163C1ABB
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 12:01:10 +0200 (CEST)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2569E600625
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 12:01:10 +0200 (CEST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 298D140768
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 10:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629453669;
 bh=XXou8AxTkcJIiyMrt45b16exc8u9MHix/8zhFeLGYiY=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=ONIviQqFzd8DCOi6xXgfD1izUJ/JfzOiy89FYhkvew/FNFvpjnIDzOisa98t5V9xA
 UJTFDUrRceR8HfAeB6foWSJNfgWr2qUaLyQzjl5rFHSX1YCgSesbkWcjKpkT1O6OpI
 VTnENwWf7eRki8WDYlSA92uUi1QHv/KNz+huCp0IYFJctbB99kW9H48o0zt+vFvUfl
 +yLxv+cbhpH1NIo/9zmoUOitcboCbaGLWCqnh+7bI6jxIGIpok9HviLJcSk+Lt5neq
 BWqyaDNTfHOzZDOVFf8Q8n31E0IbxqUo97z5JUXHb+gmnFTaIEtHLxuTrjlY5MmSDt
 56zc0r2cgRWSQ==
Received: by mail-ed1-f71.google.com with SMTP id
 ec47-20020a0564020d6fb02903be5e0a8cd2so4307342edb.0
 for <ltp@lists.linux.it>; Fri, 20 Aug 2021 03:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XXou8AxTkcJIiyMrt45b16exc8u9MHix/8zhFeLGYiY=;
 b=KdHK8XWQyyRuaSmHZdErF4vbM32kiW8wpMJyJYW5xqWKoqrZDm1yio82KM9ASelrUL
 R1H2EuxIADZT5vFOjrnNMSleaZns7Wv/hQLQJ99c+JSaCBoZrBNGG4V3yPF2Vj+sVwPh
 WHpCYBHpVRvg2SUB1QmXmRbpRMbMjApd5wZSPoeZPfUTLyb/HntAHmsH+99/Is0TDQmt
 cWh/rTeZlVqtlMArITfHYOVyYrk5y0mH7OxUoc2920Xv9pDCoYAzJsvbLlBKO9+GaxbM
 eDmQPZFdY4U+a1cmJgVz5QDXHFbYdxmZ+nRvw2ki0p9iEFNH8A+UKE8caLrh3uV6XpGX
 l4Xw==
X-Gm-Message-State: AOAM532Wz4uV6JVIzJ6S8onC5XzGk9cqOwcPG2X5Fbd3yWqjojmTutX2
 rvA3w22wjPz2LHGFs24tjS2DAcNUn2L03NOTFwnHKhHqmuZs338gOdTlz3Uiru3pyUZXAFTO+OH
 T3qNbPDfyiFjbYjonP51ICmoVaYvl
X-Received: by 2002:a17:906:a18f:: with SMTP id
 s15mr12324615ejy.269.1629453668617; 
 Fri, 20 Aug 2021 03:01:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6uDd72YczDKAxy3KNeEL4FLJ+PeMtmAuyO7T19CjzJNmRE6dN7S4jmispd2ma17XO8d5+cQ==
X-Received: by 2002:a17:906:a18f:: with SMTP id
 s15mr12324601ejy.269.1629453668495; 
 Fri, 20 Aug 2021 03:01:08 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id r2sm3280162edv.78.2021.08.20.03.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 03:01:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: ltp@lists.linux.it
Date: Fri, 20 Aug 2021 12:00:27 +0200
Message-Id: <20210820100028.97487-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210820100028.97487-1-krzysztof.kozlowski@canonical.com>
References: <20210820100028.97487-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v5 2/3] syscalls/msgstress03: fix fork failure on
 small memory systems
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

Running syscalls/msgstress03 on a system with less than ~4 GB of RAM fails:

    msgstress03    1  TFAIL  :  msgstress03.c:155: 	Fork failed (may be OK if under stress)

In dmesg:

    LTP: starting msgstress03
    cgroup: fork rejected by pids controller in /user.slice/user-1000.slice/session-1.scope

The reason is cgroups pid limit set by systemd user.slice.  The limit is
set for login session, also for root user.  For example on 2 GB RAM
machine it is set as:
    /sys/fs/cgroup/pids/user.slice/user-0.slice/pids.max:5207

Read the maximum number of pids and adjust the test limit.  For 2 GB RAM
machine with systemd this will result in:

    msgstress03    0  TINFO  :  Found limit of processes 5056 (from /sys/fs/cgroup/pids/user.slice/user-1000.slice/pids.max)
    msgstress03    0  TINFO  :  Requested number of processes higher than user session limit (10000 > 4556), setting to 4556

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 testcases/kernel/syscalls/ipc/msgstress/msgstress03.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c b/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
index 294b401b1b38..3cb70ab18a80 100644
--- a/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
+++ b/testcases/kernel/syscalls/ipc/msgstress/msgstress03.c
@@ -78,7 +78,7 @@ static void usage(void)
 
 int main(int argc, char **argv)
 {
-	int i, j, ok, pid;
+	int i, j, ok, pid, free_pids;
 	int count, status;
 	struct sigaction act;
 
@@ -109,6 +109,14 @@ int main(int argc, char **argv)
 		}
 	}
 
+	free_pids = tst_get_free_pids(cleanup);
+	if (nprocs >= free_pids) {
+		tst_resm(TINFO,
+			 "Requested number of processes higher than limit (%d > %d), "
+			 "setting to %d", nprocs, free_pids, free_pids);
+		nprocs = free_pids;
+	}
+
 	srand(getpid());
 	tid = -1;
 
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
