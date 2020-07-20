Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9375226F42
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 21:50:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 422F53C62F9
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 21:50:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 928503C4E2B
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 21:49:59 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 4B8126005D1
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 21:48:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595274597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=31nFcdvYz7h2yr/bdNj+wc/7U2Ozj9yKic77J9pL7c8=;
 b=MbF+IaOmxNTSoYIKioVzKooxDgnxjgW58uRfleN7wiRTv8ZhIjIZsNgG3C/9wu5DwSvKaY
 j3DXyXJQb0sjCQ3vFHeXRpx2TOyz8LpFGEi4oZWEzMIKJaCDmY8j89m+03PANeFRoW+KOK
 fWCr6IQDG1DzsMa/xk8lz9+Vrz28Wz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-gNTEX3nZO-O1c_gLGq0IKQ-1; Mon, 20 Jul 2020 15:49:56 -0400
X-MC-Unique: gNTEX3nZO-O1c_gLGq0IKQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57E3910BF
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 19:49:55 +0000 (UTC)
Received: from centennial.enunes.eu.com (unknown [10.40.192.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97A1710021B3;
 Mon, 20 Jul 2020 19:49:54 +0000 (UTC)
From: Erico Nunes <ernunes@redhat.com>
To: ltp@lists.linux.it
Date: Mon, 20 Jul 2020 21:49:20 +0200
Message-Id: <20200720194920.22784-3-ernunes@redhat.com>
In-Reply-To: <20200720194920.22784-1-ernunes@redhat.com>
References: <20200720194920.22784-1-ernunes@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] iopl01: skip test if kernel is locked down
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

iopl is restricted under kernel lockdown.

Signed-off-by: Erico Nunes <ernunes@redhat.com>
---
 testcases/kernel/syscalls/iopl/iopl01.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/testcases/kernel/syscalls/iopl/iopl01.c b/testcases/kernel/syscalls/iopl/iopl01.c
index edf586cd1..4237d3f10 100644
--- a/testcases/kernel/syscalls/iopl/iopl01.c
+++ b/testcases/kernel/syscalls/iopl/iopl01.c
@@ -42,6 +42,12 @@ static void verify_iopl(void)
 	}
 }
 
+static void setup(void)
+{
+	/* iopl is restricted under kernel lockdown. */
+	tst_lockdown_skip();
+}
+
 static void cleanup(void)
 {
 	/*
@@ -54,6 +60,7 @@ static void cleanup(void)
 static struct tst_test test = {
 	.test_all = verify_iopl,
 	.needs_root = 1,
+	.setup = setup,
 	.cleanup = cleanup,
 };
 
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
