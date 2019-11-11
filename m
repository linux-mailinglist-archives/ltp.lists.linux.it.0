Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BA3F71F6
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 11:29:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D84B13C2356
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 11:29:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 91D603C176C
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 11:29:29 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id AA2251001122
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 11:29:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573468166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pcVRVS2wigfNxAtSVYLPPaPRSK4c2t19oDRB3orBUZ8=;
 b=Qu8oR+yS+SqKnZKhq7MLdSGa7rTRFICVguQD0H8Odfe6wr9GUAVwXwMnBOJSX7jzKbEi5o
 gzUH6SjKbp9xeBjhAjRy6mERaKnfY9eSs1cQBcUOMDvMOm6UcGlBD92+7O6wB8xKtXIHXA
 ZrAYGJhK0OkDbK4QJiUdDjUt72GFF2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-z809MnJvNym6fsK2ylp1rQ-1; Mon, 11 Nov 2019 05:29:23 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 531491005500;
 Mon, 11 Nov 2019 10:29:21 +0000 (UTC)
Received: from dustball.usersys.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 640765D6A3;
 Mon, 11 Nov 2019 10:29:18 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: darrick.wong@oracle.com,
	naresh.kamboju@linaro.org,
	hch@infradead.org
Date: Mon, 11 Nov 2019 11:28:10 +0100
Message-Id: <b757ff64ddf68519fc3d55b66fcd8a1d4b436395.1573467154.git.jstancek@redhat.com>
In-Reply-To: <20191111083815.GA29540@infradead.org>
References: <20191111083815.GA29540@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: z809MnJvNym6fsK2ylp1rQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] iomap: fix return value of iomap_dio_bio_actor on
 32bit systems
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
Cc: tytso@mit.edu, arnd@arndb.de, broonie@kernel.org,
 linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org,
 linux-next@vger.kernel.org, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, ltp@lists.linux.it
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Naresh reported LTP diotest4 failing for 32bit x86 and arm -next
kernels on ext4. Same problem exists in 5.4-rc7 on xfs.

The failure comes down to:
  openat(AT_FDCWD, "testdata-4.5918", O_RDWR|O_DIRECT) = 4
  mmap2(NULL, 4096, PROT_READ, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7f7b000
  read(4, 0xb7f7b000, 4096)              = 0 // expects -EFAULT

Problem is conversion at iomap_dio_bio_actor() return. Ternary
operator has a return type and an attempt is made to convert each
of operands to the type of the other. In this case "ret" (int)
is converted to type of "copied" (unsigned long). Both have size
of 4 bytes:
    size_t copied = 0;
    int ret = -14;
    long long actor_ret = copied ? copied : ret;

    On x86_64: actor_ret == -14;
    On x86   : actor_ret == 4294967282

Replace ternary operator with 2 return statements to avoid this
unwanted conversion.

Fixes: 4721a6010990 ("iomap: dio data corruption and spurious errors when pipes fill")
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 fs/iomap/direct-io.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 1fc28c2da279..7c58f51d7da7 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -318,7 +318,9 @@ static void iomap_dio_bio_end_io(struct bio *bio)
 		if (pad)
 			iomap_dio_zero(dio, iomap, pos, fs_block_size - pad);
 	}
-	return copied ? copied : ret;
+	if (copied)
+		return copied;
+	return ret;
 }
 
 static loff_t
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
