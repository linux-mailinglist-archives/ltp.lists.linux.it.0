Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7497E75BE4
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 02:07:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 26EDE3C1CF9
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 02:07:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 023BA3C1C81
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 02:07:34 +0200 (CEST)
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2A526200D1E
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 02:07:33 +0200 (CEST)
Received: by mail-qt1-x849.google.com with SMTP id l16so39191385qtq.16
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 17:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=H6F6RBv8h6hH5UKiMODgGRKO6qx351TmZVPiZ5UrQxI=;
 b=RanAT/PpoukcsZOSdXQ+weZbneObbHCz8P7Oiwa41jwR4LII/eXH2MFjbuZFiA8elQ
 givTH8rWMoeikjf0jAYs3klFYRnNGk36K+LmThwQ6WsMPaUt1x+FIsl8T6z1w5hn53kB
 RETgxnMa2UJk5qaph8oE7z/4y36rFJ8Rs5AZiSBlVdfYtaD2CUTRab1xOJ/SWzNtQpmH
 wr34x7od9Hwwn3yc0G9XQ/lNZ6QE5Llk8EsO5YzWxttWkG7BonFS9CL9ymgGLzfAEdkj
 Z2JibrqY8/eViM7Nw4jLIk6+KRmw4e4bidpKBPR9BwUDao4g13xDAs7NrX7iq0U6Bkqq
 HhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=H6F6RBv8h6hH5UKiMODgGRKO6qx351TmZVPiZ5UrQxI=;
 b=F/dhKeMgvcZTby3N8yVb2dPhzI958Llfw6BYBh4teB6SRcHaN9l9j4DN3MVksZI2MM
 fpBhbxZIYRjzL7ZG9d9HteqmBkyNksOt1s4s0PNpfE3p/hIIyvHtEIDoqqfySYfv0L/M
 E57oHs7E63fu3j4pbzhzMrvGqUjmr6UYupy7PaH9gYy7lgOAY9XHdkzJbEhNSfvI5W+Z
 W8ssHKpOMtmok8QRNAw8jW3fQBhbvx1GLDYRPXeG2AyaLarM4b1veHjADA1bojo8VCmX
 efWlssTPC7zmyioFC06RMEStwmrlDV/SrlWZ9uBNNWr0gOW7mCLFP6mQYV06MHNfsFYx
 0zDg==
X-Gm-Message-State: APjAAAXOsSTyEhbIPpTnAn675G6IPOlj8feJXtxDxw7THPLQuTAfO2Lb
 o8/3Iip+5TSUX4BfhqqZI6/MIuWHkwokp1hZKFVgFDyfIP5tQvaswE/PxVzOxpeX6IuYYE5Jp4/
 q5t8un0kowrHLZdYRd/I9jJPJOoCSbT+2Mk5k9/aZRw9/8mIb7aqjg741g3o=
X-Google-Smtp-Source: APXvYqzjX4/27FT2++07dmtd3oiyW7yprSk6v6uxhEXO0zD+JGvvUtEXBw1RYTl2aXckxRl5ciisuxve5GTx
X-Received: by 2002:a0c:8a43:: with SMTP id 3mr67272022qvu.138.1564099651846; 
 Thu, 25 Jul 2019 17:07:31 -0700 (PDT)
Date: Thu, 25 Jul 2019 17:07:27 -0700
Message-Id: <20190726000727.16842-1-smuckle@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
From: Steve Muckle <smuckle@google.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.4 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/statx01: loosen the stx_blocks check
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
Cc: kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Extended attributes may cause an extra block to be allocated for a file.
Loosen the test to accommodate this.

Signed-off-by: Steve Muckle <smuckle@google.com>
---
 testcases/kernel/syscalls/statx/statx01.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/statx/statx01.c b/testcases/kernel/syscalls/statx/statx01.c
index 23ea99b4a..c3ba94394 100644
--- a/testcases/kernel/syscalls/statx/statx01.c
+++ b/testcases/kernel/syscalls/statx/statx01.c
@@ -92,7 +92,7 @@ static void test_normal_file(void)
 			buff.stx_mode, MODE);
 
 
-	if (buff.stx_blocks <= buff.stx_blksize/512)
+	if (buff.stx_blocks <= buff.stx_blksize/512 * 2)
 		tst_res(TPASS, "stx_blocks(%"PRIu64") is valid",
 			buff.stx_blocks);
 	else
-- 
2.22.0.709.g102302147b-goog


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
