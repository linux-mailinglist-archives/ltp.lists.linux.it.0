Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6390240078D
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 23:48:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F2353C98DA
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 23:48:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AA9603C2833
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 23:48:20 +0200 (CEST)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9365B600648
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 23:48:19 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id bt14so786689ejb.3
 for <ltp@lists.linux.it>; Fri, 03 Sep 2021 14:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JHyjp6uNgGzjTpRdbryMjQOx5eZNMcVET424vBDZVQo=;
 b=GSyzAPgCDttCzUNLMW81r3FhacvddzxrKa+H+D+sOT4HkgWotYOLVcJZPZG1ELl5tJ
 7CzyN4MVdNUT9UNhIZAQPaknL7DHVr66wFFiTOvJtxHOUbL/t2tY0Tq+M0JMq5BURl+D
 x7OkdXgqaTegnX026Zd6RDstOTxNWFNYtw7bZnx77KrQpW7nnTXpHzFtJHvPpvAsjwM0
 ANT5fTXDy5bySHVxdKGmvG+ELNPobvzUG97hczlgfvu71u/93gCG5CydDittDHFBpvZb
 dfVROc+7BRGm3ykKYzhOsaFWpYciumGJ3YmtjKqXpXyQuIdGJU9B/WiZy+4X5mtPryyu
 M9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JHyjp6uNgGzjTpRdbryMjQOx5eZNMcVET424vBDZVQo=;
 b=nkzuILDiPVrj0VGuLNOlb5v15CbhT73LwQZZv1I9Uz9WPeQlLZIAmiqOLCaZ7Z9uXl
 ydABhIiSSo8vfOKXCRDrf+EXunOLqXTPsbDDCyXJz6jqmcpN6Zj6vN+zGLgdi0wUEI6I
 GH8+YjOEml9huPMIICXIJKXZrCtT8dePnWOV3GYtwEhuHFNKkwue6KO0UqVYWArglFbu
 O6VhhEqPuwJgLqjRMxm8YHb45AgGpUjt0ZZde9/7b/bZzLScz3HijgyTfww8F+X60Mt0
 OxxUNUfrFjBDxnUWHi6q/AWoD9mqXojU/6iJzrmJ+n/NRM3hY7VJjDOCLIIu+HkYXrhP
 WRhg==
X-Gm-Message-State: AOAM531JIv+c6hKcYeSrDwBRYNS74WIDakTZFXx6fdeFwsCzPVRNs7MK
 1kT+HG+4nMRhfk8bS4cWiHrEt1U2PXad7A==
X-Google-Smtp-Source: ABdhPJzL6JXgi03cjJIttZ28a90TGSLHYkmVv1ett8t0YWcTGZR33U1xiukOaQ3qGKwzJTb6e6lcCw==
X-Received: by 2002:a17:906:5855:: with SMTP id
 h21mr1007644ejs.230.1630705699117; 
 Fri, 03 Sep 2021 14:48:19 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id o26sm157070eje.24.2021.09.03.14.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 14:48:18 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Fri,  3 Sep 2021 23:48:11 +0200
Message-Id: <20210903214811.61727-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903214811.61727-1-petr.vorel@gmail.com>
References: <20210903214811.61727-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] ci/alpine: Enable process.c
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

Fixed in previous commit.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ci/alpine.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ci/alpine.sh b/ci/alpine.sh
index deb9cfdcf..d93a57616 100755
--- a/ci/alpine.sh
+++ b/ci/alpine.sh
@@ -33,7 +33,6 @@ cat /etc/os-release
 echo "WARNING: remove unsupported tests (until they're fixed)"
 cd $(dirname $0)/..
 rm -rfv \
-	testcases/kernel/sched/process_stress/process.c \
 	testcases/kernel/syscalls/confstr/confstr01.c \
 	testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
 	testcases/kernel/syscalls/getcontext/getcontext01.c \
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
