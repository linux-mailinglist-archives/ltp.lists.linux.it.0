Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D13FFA0A
	for <lists+linux-ltp@lfdr.de>; Sun, 17 Nov 2019 15:02:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 254CA3C225E
	for <lists+linux-ltp@lfdr.de>; Sun, 17 Nov 2019 15:02:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 1DEED3C17C4
 for <ltp@lists.linux.it>; Sun, 17 Nov 2019 15:02:30 +0100 (CET)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3D2571A009B1
 for <ltp@lists.linux.it>; Sun, 17 Nov 2019 15:02:30 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id l1so14595059wme.2
 for <ltp@lists.linux.it>; Sun, 17 Nov 2019 06:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=55exXkx/Nap3D/YZbysjxsoaOvLRIlbZrFv3SjxZ8UU=;
 b=qy3LMFQIbDymtXHm2XBXo9sun3wpKclVgWEWADw9Shyv3Pfxz/AbB0bq6W3zAUYIsl
 88fxpNBNrZM4UMv1ZudNAdxj7iDTbq94AruoUF+mx8yVBm5TpW60ptnWUGrHpodAHVtm
 pFUQz4TYy2L7N+rdORsz7nFNkX8a27HhnJ/y2/uL5uQ5dzy3v/BoS9iI7+ePK//ne4TX
 U8i1HfYZuh1Qh5fqvc6R1Dj1BsZvSIg7ZNgAlx1fowNIaFivGkEJeXpJHrOvl4k/Ta5p
 AkD/SDMf2BOJwe6fAT1J4ulFqkIJwwGHe7dNdmba6dkb513fdwaVLbNuJKSIc4oYNXJ3
 RpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=55exXkx/Nap3D/YZbysjxsoaOvLRIlbZrFv3SjxZ8UU=;
 b=k2wr008gHPNjtrSYd0ZGLaiijo6dLjP43txeHJgKjMsBmYEYNL/rQEOxBQnqi4xmF8
 jIR38p/n92D1z/OUMl8vY4qJG0DVaGajrMTh+3BmEYzqWPzdbHXcsOY7E9InRh310JJO
 7lT6W8A3VZCsTwEIYhsmV6Po6WWPl5/TO/ulkP3shTFZPGVogNCFWnZ3PZZKmR7Mk33A
 CGrt70DykXMe2Fn2ht4/CNqS43fQJ7t/RdSdwGG20ohEfMjnAIuXKeSVD8paMtMDj08V
 7p6LnWX7l/64Ocae7gLl1LRpp6i3CeSHcDcOsJcosZEBSJXhq9eERr9zf2sBv5KSqUKV
 YaxQ==
X-Gm-Message-State: APjAAAUXdGMi3lGMCrWEMvascJBrgic+Sgbe5u4af2Q+BTOzZksbGsqw
 bVSTYz4kBklZ5wnMy5kPAq8XiGyK
X-Google-Smtp-Source: APXvYqxxhT4VwBF8QTm7F+TMThEt0q7ltZIEX5z4H2kxhHSl7IOYGZrXYnIFypdbicrFlJgwMLfTww==
X-Received: by 2002:a1c:5fc4:: with SMTP id
 t187mr25820623wmb.142.1573999349475; 
 Sun, 17 Nov 2019 06:02:29 -0800 (PST)
Received: from localhost.localdomain ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id k14sm20075766wrw.46.2019.11.17.06.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 06:02:28 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Sun, 17 Nov 2019 15:02:20 +0100
Message-Id: <20191117140220.17978-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [COMMITTED][PATCH 1/1] nfsv4/acl: Remove unneeded
 malloc(sizeof(FILE))
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

FILE incomplete type under musl (comply C11 [1]).
malloc(sizeof(FILE)) is not needed anyway, thus remove.

This fixes build on musl (at least):
acl1.c:51:23: error: invalid application of 'sizeof' to incomplete type 'FILE' {aka 'struct _IO_FILE'}
  fptr = malloc(sizeof(FILE));

Fixes: 618fd23eb ("Initial add of acl testsuite from Bull")

[1] https://www.openwall.com/lists/musl/2019/01/16/1

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 testcases/network/nfsv4/acl/acl1.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/testcases/network/nfsv4/acl/acl1.c b/testcases/network/nfsv4/acl/acl1.c
index bdf0180da..aae9484e5 100644
--- a/testcases/network/nfsv4/acl/acl1.c
+++ b/testcases/network/nfsv4/acl/acl1.c
@@ -48,7 +48,6 @@ int do_file_op(char *filename)
 	result = 0;
 	FILE *fptr;
 	char str[256] = "./";
-	fptr = malloc(sizeof(FILE));
 
 	uid = geteuid();
 	strcat(str, filename);
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
