Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 61612875F8A
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Mar 2024 09:32:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1709886750; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=41yWOHialRU1q5W3mtq4JJa5YkC9Ovzvv4D2ZorVHBw=;
 b=Fjqf9B182mD8fX1mDIEW/ZqsuHLHiNCiS9J8Lx6VGT5W+aW/Yqa/pUAM/nAMGWSUROeYo
 QTdAhIi9F8MrObqP4jdOjN05vaYc270rdTjKIlHdobcwG1QHFkNdPS7MyOQLO+kB8n8uK41
 IwDemzMgaStGENdNL6s00m8zfShMoSo=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2099A3CE976
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Mar 2024 09:32:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B9B6F3CE966
 for <ltp@lists.linux.it>; Fri,  8 Mar 2024 09:32:28 +0100 (CET)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CD40B1BB874E
 for <ltp@lists.linux.it>; Fri,  8 Mar 2024 09:32:27 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33e7946bddfso96000f8f.0
 for <ltp@lists.linux.it>; Fri, 08 Mar 2024 00:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1709886747; x=1710491547; darn=lists.linux.it;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JKxC1tvBLNDnofh1ey4ai3wekKneNyXIejc5YAU9e/8=;
 b=O0dXtzUdQ9bDoCMI5LvW1yU+xoPdFqmUm7g183rKfkA4gyZOuF2kUdVlYzWX+wmHkD
 gPBG6Y6XCsR4I2GWZ4nqSUr5amsuQnbj3hmKRDvy1o65k1Dz4fwgjHTp6kUtpJSvC6th
 C68fdYtJ8WRd+qwSV+YNBdt5DTShPofSZwO7DBue8dzbCpeQQE9ziypXW4Q5hAnwkZ9R
 Y1ZnyWMS4P1uChIJi9KGmp5WVUzB9nI/TyDDOMV/lxzi3Khey27J56jkD0hVhyLB/v7d
 8h3hK++WmeitIn1vG/XEHDvcI9pbsq1c5fkq/qAqaZZ2O1Q+xvo5w2EpZ6FumOSWh2lR
 16ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709886747; x=1710491547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JKxC1tvBLNDnofh1ey4ai3wekKneNyXIejc5YAU9e/8=;
 b=bt6p3SHqwNFf49ncahaJWd4bP7Xe46hEAFcFkVBMHG7fLIiek2UQw245AvwehF0SN9
 aZWWXmuf8OlZBuOa+/PinIVGlr8rLw/22okTCHqic8DGj18SHrqaHom7IWDDGaYgs6sa
 d1h0Q+jaW+3SS8SLF8nBp6qgmcbgTOhFhRfBi55jJKfij7gKvi/3mK+bFO/M7ZKK+1lo
 7vn22Bb0PtPih6+esAFs3pK0zp7/XSgvIW/54ofQkmR3aja0FW/zMcI5bMjC0F3vSyWE
 ICa9BGWao8wQpTUfVbZbd9YVlyfAiz2u48WsbzcVqAxyagmXI9HSpUmouZFUSbbbCMBm
 0OmA==
X-Gm-Message-State: AOJu0YxHPwvnZ87PgycX3Zx1hSNQi0EJ3tv+BscFgEYq6ojzEhg4aNKP
 0Zt+tHvwvD5WODs5EhZKUevAgoouifsqL8xi0GuciA2Ocd3krBHjFZiVHz3H3yTyE4epflYmqZE
 =
X-Google-Smtp-Source: AGHT+IEdPbu1SQbnPINfjFpb5smjF9nBmvJwNh1bV22v/T4ZLlFzKGVD//JbGKTeVPxfwxIZ63gFfA==
X-Received: by 2002:a5d:4e8b:0:b0:33e:72f4:d6b1 with SMTP id
 e11-20020a5d4e8b000000b0033e72f4d6b1mr1574140wru.56.1709886747022; 
 Fri, 08 Mar 2024 00:32:27 -0800 (PST)
Received: from localhost ([81.95.8.245]) by smtp.gmail.com with ESMTPSA id
 b7-20020a05600003c700b0033e44b23921sm11138846wrg.24.2024.03.08.00.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Mar 2024 00:32:26 -0800 (PST)
To: ltp@lists.linux.it
Date: Fri,  8 Mar 2024 03:32:20 -0500
Message-Id: <20240308083220.19332-1-wegao@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240306104609.17141-1-wegao@suse.com>
References: <20240306104609.17141-1-wegao@suse.com>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2] safe_macros.c: set umask to 0 within safe_mount
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When system's default umask is 0077, this will trigger following issues:
chdir01.c:100: TFAIL: nobody: chdir("subdir") returned unexpected value -1: EACCES (13)

Suggested-by: Martin Doucha <mdoucha@suse.cz>
Signed-off-by: Wei Gao <wegao@suse.com>
---
 doc/C-Test-API.asciidoc | 4 +++-
 lib/safe_macros.c       | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/doc/C-Test-API.asciidoc b/doc/C-Test-API.asciidoc
index 08a76c403..81067b12b 100644
--- a/doc/C-Test-API.asciidoc
+++ b/doc/C-Test-API.asciidoc
@@ -2460,7 +2460,9 @@ with 'open()' or 'creat()' etc, the mode specified as the last parameter *is
 not* the mode the file is created with. The mode depends on current 'umask()'
 settings which may clear some of the bits. If your test depends on specific
 file permissions you need either to change umask to 0 or 'chmod()' the file
-afterwards or use 'SAFE_TOUCH()' that does the 'chmod()' for you.
+afterwards or use 'SAFE_TOUCH()' that does the 'chmod()' for you. SAFE_MOUNT
+also does similar action such as setting umask(0) and then restoring the
+original value.
 
 2.2 access()
 ~~~~~~~~~~~~
diff --git a/lib/safe_macros.c b/lib/safe_macros.c
index 951e1b064..109268587 100644
--- a/lib/safe_macros.c
+++ b/lib/safe_macros.c
@@ -913,7 +913,10 @@ int safe_mount(const char *file, const int lineno, void (*cleanup_fn)(void),
 	 * the kernel's NTFS driver doesn't have proper write support.
 	 */
 	if (!filesystemtype || strcmp(filesystemtype, "ntfs")) {
+		mode_t old_umask = umask(0);
+
 		rval = mount(source, target, filesystemtype, mountflags, data);
+		umask(old_umask);
 		if (!rval)
 			return 0;
 	}
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
