Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ADB2E05D8
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 06:49:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E87623C571E
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 06:49:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id AEA523C296F
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 06:49:29 +0100 (CET)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E445B14011AA
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 06:49:28 +0100 (CET)
Received: by mail-pj1-x1031.google.com with SMTP id n3so873269pjm.1
 for <ltp@lists.linux.it>; Mon, 21 Dec 2020 21:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bQQNu0MnFSMpJXr35XSr6ggSHHJLdG9qVpQqwYm46zs=;
 b=utW1+K4YiNT0sNC1Ry0wN+gVvtKNY/w8PO/WrugBlSIHCR2i+IiRHBwLejMQwkwpJW
 u6AMX7gabBffItazpgHa8I783UwnZ/2fLD+z/0OOks9sb7YvnwbsrTKC6iaH4UsO1hCy
 q0YADbZOXHNgMlbaJlyTA9CUITAlQ+KUJlvT0LNUG1GgpMzbJLX6VikAZR3bcSfd5IIT
 64Am3JJRjoX/WPiSSkDQIQIZs10FbhXCbevReRx8/4h6V4aO9D9/0Wg2/rX+d5uBw+b6
 dj4icQlUrjgE0UWPKXZQ0P2Re8TrmSafe2WDCb7XgRh9DrxTtBC4ECDCcwx0XPJuzhVd
 tVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bQQNu0MnFSMpJXr35XSr6ggSHHJLdG9qVpQqwYm46zs=;
 b=sC8Xwz1KvJ4LqNdV7ESs20OYlH0XBCa30Gm7t71aBQpLOKGHz0q77QWzBBC0FcdbPB
 neCLJRxEw0nAKk5y04+Usz8q7YeWKV4r09NqUnCTfPBIKdtIWUIr+CbHgU6gaXvfdGZR
 xpEoYMbXS4v6d9SQefAK5fYWxhhWma1ZtENCdU2+cD/Y6qKPJ8LR6K7RFyJQsWYB9Vni
 vmNl8/78+5jsJUYsE5foEO+I9nqAE2jRmfsMBCLEyfzWrjNxwaSBQZteGjbiKVhW4tN+
 6X5EKj4GEb+ccpAOQyPb4cUlaXi9XL8K66VfQIjLOlIqhlYU5r3z8HXcaRw6gYt7KI0v
 BPoQ==
X-Gm-Message-State: AOAM533rBUTpKjZN6udgffNK37W0qaiZJCK9FiJC1sqQD/ek+JeJjz6b
 xy1IxF0MSTTndwzZBr/tfJfY6IMsStnb2w==
X-Google-Smtp-Source: ABdhPJyn87RsQqxGSCfffJb79Zn2Nz/SjhS9SRRt2mpeHX7Wbd8oHo7S5ZycZ51fUuqD1VA7H3XTBw==
X-Received: by 2002:a17:902:c20c:b029:da:b4d4:4f42 with SMTP id
 12-20020a170902c20cb02900dab4d44f42mr19689838pll.85.1608616167264; 
 Mon, 21 Dec 2020 21:49:27 -0800 (PST)
Received: from bj10039pcu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id t22sm18201068pgm.18.2020.12.21.21.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 21:49:26 -0800 (PST)
From: gengcixi@gmail.com
To: ltp@lists.linux.it,
	pvorel@suse.cz,
	chrubis@suse.cz
Date: Tue, 22 Dec 2020 13:48:40 +0800
Message-Id: <20201222054841.736529-4-gengcixi@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201222054841.736529-1-gengcixi@gmail.com>
References: <20201222054841.736529-1-gengcixi@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4] insmod:add gitignore files
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
Cc: orsonzhai@gmail.com, Cixi Geng <cixi.geng1@unisoc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Cixi Geng <cixi.geng1@unisoc.com>

add compile module generate files into .gitignore

file:
	testcases/commands/insmod/.built-in.a.cmd
	testcases/commands/insmod/.ltp_insmod01.ko.cmd
	testcases/commands/insmod/.ltp_insmod01.mod.cmd
	testcases/commands/insmod/.ltp_insmod01.mod.o.cmd
	testcases/commands/insmod/.ltp_insmod01.o.cmd
	testcases/commands/insmod/Module.symvers
	testcases/commands/insmod/ltp_insmod01.mod.c
	testcases/commands/insmod/modules.order

Signed-off-by: Cixi Geng <cixi.geng1@unisoc.com>
---
 testcases/commands/insmod/.gitignore | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 testcases/commands/insmod/.gitignore

diff --git a/testcases/commands/insmod/.gitignore b/testcases/commands/insmod/.gitignore
new file mode 100644
index 000000000..0e19fb3fd
--- /dev/null
+++ b/testcases/commands/insmod/.gitignore
@@ -0,0 +1,9 @@
+*.ko
+*.mod.c
+*.ko.cmd
+*.mod.cmd
+*.mod.o.cmd
+*.o.cmd
+.built-in.a.cmd
+Module.symvers
+modules.order
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
