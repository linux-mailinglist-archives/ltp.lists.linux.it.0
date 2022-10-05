Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A373F5F5657
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Oct 2022 16:26:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF6413CADF4
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Oct 2022 16:26:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 92F643C2730
 for <ltp@lists.linux.it>; Wed,  5 Oct 2022 16:25:57 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2C9361400BC0
 for <ltp@lists.linux.it>; Wed,  5 Oct 2022 16:25:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664979955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j486sH3fOW9wUq6819JnVSq+AireEecWwvF+AJeTytU=;
 b=PoAhXmR5/iWLNYhvqEVz8xVH/NT+fMeaoF8qXpkWo/2hXSObi5Lh/tDOY+A6b12VDxNzI4
 VvLsCs18fSvmhNn7t1Vte3cyEkU0f1tl5EAWY5TkF9lDKQS7sLCoy0H/eXt2YO3fTNRv+1
 xPB0yZRVIagRMZZ/PkmJ3cIEvjzXojI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-gfzAqZnLN0K95NbW0s1o4w-1; Wed, 05 Oct 2022 10:25:52 -0400
X-MC-Unique: gfzAqZnLN0K95NbW0s1o4w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8C202932483;
 Wed,  5 Oct 2022 14:25:51 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.40.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F00517585;
 Wed,  5 Oct 2022 14:25:50 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Wed,  5 Oct 2022 16:25:43 +0200
Message-Id: <4a26cbb687ab570411d12ec7c4cd313db47f919f.1664979933.git.jstancek@redhat.com>
In-Reply-To: <cf13ddfffdb08e0771be253ac6911febb96a47c4.1664979933.git.jstancek@redhat.com>
References: <cf13ddfffdb08e0771be253ac6911febb96a47c4.1664979933.git.jstancek@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 2/4] syscalls/preadv203: don't treat short write() as
 failure
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

Test is sporadically running into TBROK in setup() due to short write:
  tst_test.c:1064: TINFO: Formatting /dev/loop0 with xfs opts='' extra opts=''
  preadv203.c:257: TBROK: write(501,0x3fff4ef7d15,4123) failed: SUCCESS (0)

Switch to SAFE_WRITE_RETRY.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/kernel/syscalls/preadv2/preadv203.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/preadv2/preadv203.c b/testcases/kernel/syscalls/preadv2/preadv203.c
index 60dc4a882f16..25c6e1c2ecd0 100644
--- a/testcases/kernel/syscalls/preadv2/preadv203.c
+++ b/testcases/kernel/syscalls/preadv2/preadv203.c
@@ -254,7 +254,7 @@ static void setup(void)
 
 		for (j = 0; j < CHUNKS; j++) {
 			memset(buf, '0' + j, sizeof(buf));
-			SAFE_WRITE(1, fds[i], buf, sizeof(buf));
+			SAFE_WRITE(SAFE_WRITE_RETRY, fds[i], buf, sizeof(buf));
 		}
 	}
 }
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
