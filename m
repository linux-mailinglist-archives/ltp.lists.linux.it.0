Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F973B6EBA
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 09:28:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A4E793C6C6C
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 09:28:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9AE4F3C194A
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 09:27:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BEE091400E19
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 09:27:50 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 7524B20397;
 Tue, 29 Jun 2021 07:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1624951670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=25/EF2GRzdfMURwRYCuDmbXjMN5JYuD3Ir8hqpEFMMk=;
 b=a+RMKZRhWxtBUjssaO5Dw7Ko0IRiSrAXBp6DDAp03GcXbGR5JfCi41b93yUrzZgbtcGg6W
 qRkUzn1Ny7o2i4XEIBtWAXAfqkpQoBPNHp4ulZ9+i7rUgSw6Hi00SG2fxhugICdI4zdNPq
 FkHFbLtOiXvUKK5ezt1CkqjAzK0eIkc=
Received: from g78.suse.de (unknown [10.163.24.38])
 by relay2.suse.de (Postfix) with ESMTP id 3A68BA3B8A;
 Tue, 29 Jun 2021 07:27:50 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 29 Jun 2021 08:27:06 +0100
Message-Id: <20210629072710.23800-4-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210629072710.23800-1-rpalethorpe@suse.com>
References: <20210629072710.23800-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 3/7] meltdown: Set CFLAGS for check targets
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The include set in the CFLAGS is necessary for Sparse to parse the
test source. If a specific target has variables set on it. Then these
won't be available to the corresponding check-target. Usually this is
not a problem because most variables set on a target are just for
linking and the checker doesn't need them.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/cve/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/testcases/cve/Makefile b/testcases/cve/Makefile
index ddf8b6fe1..7b011b6c9 100644
--- a/testcases/cve/Makefile
+++ b/testcases/cve/Makefile
@@ -19,6 +19,7 @@ cve-2014-0196:  LDLIBS += -lutil
 endif
 
 meltdown: CFLAGS += -I$(abs_srcdir)/../realtime/include
+check-meltdown: CFLAGS += -I$(abs_srcdir)/../realtime/include
 
 ifneq (,$(filter $(HOST_CPU),x86 x86_64))
 meltdown: CFLAGS += -msse2
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
