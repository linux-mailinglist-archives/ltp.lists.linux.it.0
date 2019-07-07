Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C620D6163A
	for <lists+linux-ltp@lfdr.de>; Sun,  7 Jul 2019 21:00:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E6D0E3C1CFF
	for <lists+linux-ltp@lfdr.de>; Sun,  7 Jul 2019 21:00:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E966C3C0596
 for <ltp@lists.linux.it>; Sun,  7 Jul 2019 21:00:27 +0200 (CEST)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 03BD06005E3
 for <ltp@lists.linux.it>; Sun,  7 Jul 2019 21:00:30 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id v15so3262190wml.0
 for <ltp@lists.linux.it>; Sun, 07 Jul 2019 12:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rED4gOwtBg4nmO/obajgKt3u2zcvwhouitvptVJBYVY=;
 b=IzaJq03f+RaFFmv5n9tnGnmNxFYO5D3t9y8aQTvp4VURwgwoCP2AnAMVW8Bx+Q3ivh
 J+SmGtiWyW/zJR6ZeC14vpZ5uNfXih6fJkNGYuT7sGxtLRnBg5nUNFqfOytAJiQMjIfK
 nblC5GJR63Qi+ELcqp86Kw9FQ58jlBjUPsE03O45HxatWIXQ7Z+JqFgiPCcMza7H5A0T
 aW9pI84r1kFUsnNhLqpRTtYTqMbn8krc+hdK0E8O3PAwn+BivptJp+OnnJ8Sw/XfbKvW
 MqxWgHjWmjTVgQyHMBsFKRxZEwRS2wqkeeTf9giAdFwd94VBqFgXhxlrCzM1oF6g7nPq
 Tw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rED4gOwtBg4nmO/obajgKt3u2zcvwhouitvptVJBYVY=;
 b=PdBcx2f8EAFTHvWeeJGJZDtZT3c0nz8rUNPtRUdty0ytGHex9HpggnFmM8PJx0YTSN
 nKS+O4CPnHoN4CnXa6BLvsaOuTZgb+tLe3jyevQjgzmqzCGNRHqa7MLukrfhWReQtFKG
 zO6vP74w9bnnZPS3dIN0biZQ/JNjpPA9g4o43pi4qGLh2TcYA91pgCExWiBtDfMHupHE
 iyyeGzyaj3YComXOkMRC9/XDePpxq4X//VVjuCSznPSTKOFV47fws2J9KubhChriFEeN
 tK1uFGW8xzU66v4Bb5CUFnTFKlkbUEgCZ/vrFzv56CbAPF1s4mrniObF3ZS+yNsSYPhU
 RgxQ==
X-Gm-Message-State: APjAAAUgqJ4UIj775zTGrc5XGB4sXmU6OXg2td5C8weXYELLEaJdcbuM
 BUSGiIZZ2U070Wqvt/5HFzIW1tcj
X-Google-Smtp-Source: APXvYqwcelEPw7Eh94TMvA103QAYcLgxdMfjsP+2pa8IMJCxYdSADXIdp1zG6DaWAd/4dsPlQoPEFA==
X-Received: by 2002:a1c:3:: with SMTP id 3mr13097849wma.6.1562526026853;
 Sun, 07 Jul 2019 12:00:26 -0700 (PDT)
Received: from x230.suse.de (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id d10sm16403849wro.18.2019.07.07.12.00.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 07 Jul 2019 12:00:26 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Sun,  7 Jul 2019 21:00:12 +0200
Message-Id: <20190707190016.27296-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190707190016.27296-1-petr.vorel@gmail.com>
References: <20190707190016.27296-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/5] lib: include <errno.h> in tst_test.h
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

tst_test.h is using errno variable, thus it should include <errno.h>.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 include/tst_test.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/tst_test.h b/include/tst_test.h
index 2e8e36352..2e53e68bf 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -14,6 +14,7 @@
 #include <unistd.h>
 #include <limits.h>
 #include <string.h>
+#include <errno.h>
 
 #include "tst_common.h"
 #include "tst_res_flags.h"
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
