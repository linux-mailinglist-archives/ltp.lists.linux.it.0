Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDAA40078C
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 23:48:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B8E793C9595
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 23:48:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CFFAD3C2833
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 23:48:19 +0200 (CEST)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BE41B1000968
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 23:48:18 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id z19so744604edi.9
 for <ltp@lists.linux.it>; Fri, 03 Sep 2021 14:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9pMFh+rg2IDGeWuT/jtN0LuVfUsvh5mW6KNQbNzKnAk=;
 b=QHRlu9MZc2QL0TBAVcVcOCqxHqGN4Z1njjVaoIecl2/R7dz778+lggE/Qtro5WkCgl
 nFCYlPord9r6EOty813ebDlGajshkC22BpU8gTvzdUs0FMDOzm+S35VrqRA3PkHLYT89
 qA13RzWQeuPgqdMk2j3dLFeqdOxDi4k+9eJY/BOD5XoUBV2DFhiZ5yukUf4dulc+dF9h
 7/6rkxggvPVqm68Rdm64EHFMfSg4JRo08AtAvjO9b8stSk7lMkwmgZvAXStHV9SCMjai
 9K9Cc5LTLOoz1+P7r3NWsf2LAgcJlho05xEvnKprbw5ibn/MSpL8RJpsFyyusKDApr35
 Ec8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9pMFh+rg2IDGeWuT/jtN0LuVfUsvh5mW6KNQbNzKnAk=;
 b=eUnAsDWIlFmG96/RDO3iSDT54i/GJSsRnXM6KcK1gQLmy/iXY1wif90dct6Kqu65Hp
 SLKcoViFH6RSeCOQspkzINGh9CtAWt6XNMn13rJoNTV4I5ca9JB6rFzQY4ut2F/1ArlJ
 LLLrCjnR8DyBswzy17bm8/IfBeErn/M2ggWkS/08tdVs7+ZnUBRXbsDwvdULpJ9lm/T4
 paAZ6C/6spbJe8NN7KTQsXsoFTRX1afyESeK1/e6GyCVSe1kMsvvsyol3zC7b2Ge0/GP
 3uPtNkOempwa3o0J5xxKzoyDoK4pQ0rdsbNzGW2rdKcPHjLP91dCxvAzdfC/dEoMBh5d
 ReLw==
X-Gm-Message-State: AOAM531pAfrer2KRaUEL7LNIWXRWSVajpUT39bRHDklt+uocfxUEGwNo
 agIeSGgoab3Qa72jim06V3U5BNKZMB3KUQ==
X-Google-Smtp-Source: ABdhPJyZGoVDScYKv+ZybGb5Avt5lioK9H5bi1FaJLkYl7YHbQjJclqOIm4RbIR4fBMUtiDf2HCGUg==
X-Received: by 2002:a05:6402:959:: with SMTP id
 h25mr1031730edz.283.1630705698304; 
 Fri, 03 Sep 2021 14:48:18 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id o26sm157070eje.24.2021.09.03.14.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 14:48:17 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Fri,  3 Sep 2021 23:48:10 +0200
Message-Id: <20210903214811.61727-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [RFC][PATCH 1/2] sched/process.c: Always use pointer to stderr
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

which was previously used for non-linux OS (not relevant to LTP thus not
used in LTP), for linux stderr directly was used.

This fixes compilation on MUSL which does not like assignment to stderr:

process.c:553:14: error: assignment of read-only variable 'stderr'
  553 |      debugfp = fopen(foo, "a+");
      |              ^

NOTE: needed to initialization in main(), because C standard does not
require stdin, stdout and stderr to be constants (at least not C99),
otherwise it fails to compile:

process.c:144:15: error: initializer element is not constant

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

not really sure why anything needs to be assigned to stderr and whether
this is a correct approach. Comments are welcome.

Kind regards,
Petr

 testcases/kernel/sched/process_stress/process.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/sched/process_stress/process.c b/testcases/kernel/sched/process_stress/process.c
index a5ff80987..11837c3cb 100644
--- a/testcases/kernel/sched/process_stress/process.c
+++ b/testcases/kernel/sched/process_stress/process.c
@@ -141,13 +141,8 @@ timer_t timer;			/* timer structure */
 
 Pinfo *shmaddr;			/* Start address  of shared memory */
 
-#ifndef _LINUX
-FILE *errfp = stderr;		/* error file pointer, probably not necessary */
-FILE *debugfp = stderr;		/* debug file pointer, used if AUSDEBUG set */
-#else
-#define errfp stderr
-#define debugfp stderr
-#endif
+FILE *errfp;
+FILE *debugfp;
 
 struct envstruct *edat = envdata;	/* pointer to environment data */
 
@@ -1221,6 +1216,9 @@ void doit(void)
 /* main */
 int main(int argc, char *argv[])
 {
+	errfp = stderr;
+	debugfp = stderr;
+
 	extern Pinfo *shmaddr;	/* start address of shared memory */
 
 	prtln();
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
