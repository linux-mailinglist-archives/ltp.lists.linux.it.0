Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EChKi0Vl2kRugIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 14:50:37 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D2615F3B2
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 14:50:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1771509036; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : cc : content-type : content-transfer-encoding : sender :
 from; bh=VJd3P+BqzcohO6inaMVdCNDTJU/1Y/+s879FxS25F38=;
 b=G78J8YQfp8bYOHrqxFtN+9r5FHaPrwq17Sn3/LfD7JwRkE76h3uXvBsIsi1BUFTGj/X8o
 IYUs2FejPlEi9gT4uBvaNKWWl0+0cpSWUiQb1JMb6l/kYEkjMdtv3TMK1RHU7lZkrLQjZOV
 PBJKc0mZJwWNCLRsx4BstfKxUhsLS6A=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 91D4E3D074D
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Feb 2026 14:50:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 438393D0740
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 14:50:33 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 617C71A002C6
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 14:50:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771509030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GLoEOe/mOOsSKOBOLkrd4xxSn4nFF5yikdbT9k4xYGw=;
 b=i+tN7cOfvFJqUEm9QN6w4BI2XFfVagI7xoXN9Klccc0TXQMvxc08+4GvMuIAWoBRmll35c
 Xw4oZuGO5GWPHKy9Tz/D2yUpP1LPuAyE1/3j4WBuoJG9UI+i9TMDkLAW2aeusBipcI3glB
 1Iuj3td6nHinVT3Y9dZqf9irmcRMv38=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-Cn_gz2AAODCV3BL3WtFkOA-1; Thu, 19 Feb 2026 08:50:29 -0500
X-MC-Unique: Cn_gz2AAODCV3BL3WtFkOA-1
X-Mimecast-MFC-AGG-ID: Cn_gz2AAODCV3BL3WtFkOA_1771509029
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb52a9c0eeso1238712885a.2
 for <ltp@lists.linux.it>; Thu, 19 Feb 2026 05:50:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771509029; x=1772113829;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GLoEOe/mOOsSKOBOLkrd4xxSn4nFF5yikdbT9k4xYGw=;
 b=MtS+wiPrH9MJ5E/mjExWkRGMQrBITFmfcQz5UZ5cYOyf2HKmg3q4gnCPLlEC+gAiNS
 OBcWnr+amDbv6gpxEiuL4MZl0v9UgJV956CRpmvYNVEwVdlCdpnf6WdGe3b4Ijl578Xb
 /kKh/VaJi00EZF1MdAYQWMohu+sg4XKpx0D6VoMMa+L1HGrWdsw/frn54ELcVw2ect/w
 y60e+8APIuQyZEk4oCaIo1IjoDF7a2cmIxGgzUUYoHnV/237nCshrv/sZoSe3qLN87sc
 hisDZ3J+9TWRUY8OtDnqmTKclop6fhSnORV8/VqdNozf76DAF31oe/Mw3mdReXp5nLe+
 LwJw==
X-Gm-Message-State: AOJu0YxCkDpAVJSOD/4FRlNsMeJXd3uwvotl4zs2IAB9tvpfk7EQBVDl
 NXX+DrOovLUcSBFq7PzqBcwvq/gZjp+uzIrG7FUtc9TBh7HvnY/xK+FO26pnAEUwlHEpueY8hQ7
 ZGS+hCcP1Fsw89y8HrFAoqg4uQXM7dAR0XRkpiiHrQmXagEyT2ljswxmiDo2mYAttYVxqIxtetw
 kaUv7LQjcVPIlSQDt29D1/2Y6knndOIigevt0y
X-Gm-Gg: AZuq6aL02J/MzzPnFbK1F8TIixC2TccoCx/uvu4hXKZhqYzlTuIbvNkblyHqusuaL2X
 +izGBrR5ZKWYA47fpqpGbF3rzeBZ2qE/Dnso1CvNJoW6iiJcOEdO8v2xY2m/nr7bterI0+4c0DX
 P4z78yOgxrYjukhBMI9UG/eydFZMJZLF+vYBJlzhpx7qZJrypXNfCWCRJGvMCVrZBeanV58v3OB
 VjGAaIksclj0FVfM8VMBwuEcGpDyKDQFtCrBG0nTe8zMEfagH9CNHjO7gqUPEiCEesAA7K2I6EA
 1tFH4mLcNV6fw91gG0fw5D6ePLFA8KQTKW+I6hPUikBBF2NfhjrZ0sG90bPKsvE6sOdxa/zrw6u
 5tu8UMJDjhqlS7AG6qnfq8HgIeN+L3KIMNUxSTxEBbzvHdPo=
X-Received: by 2002:a05:620a:700f:b0:8c7:16fb:ed45 with SMTP id
 af79cd13be357-8cb4bf96a37mr2148712485a.27.1771509028757; 
 Thu, 19 Feb 2026 05:50:28 -0800 (PST)
X-Received: by 2002:a05:620a:700f:b0:8c7:16fb:ed45 with SMTP id
 af79cd13be357-8cb4bf96a37mr2148709185a.27.1771509028203; 
 Thu, 19 Feb 2026 05:50:28 -0800 (PST)
Received: from sbertram-thinkpadp1gen5.bos.com ([67.189.222.97])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8971cc7bbcdsm215026976d6.9.2026.02.19.05.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 05:50:27 -0800 (PST)
To: ltp@lists.linux.it
Date: Thu, 19 Feb 2026 08:50:01 -0500
Message-ID: <20260219135019.1140234-1-sbertram@redhat.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E8QlXSCWkdfrHDqBj8HFDjVzOivucI5dRtosNLtJs4k_1771509029
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2] cachestat02: Harden parallel worker execution.
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
From: Stephen Bertram via ltp <ltp@lists.linux.it>
Reply-To: Stephen Bertram <sbertram@redhat.com>
Cc: Stephen Bertram <sbertram@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	HAS_REPLYTO(0.00)[sbertram@redhat.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.it:dkim]
X-Rspamd-Queue-Id: 24D2615F3B2
X-Rspamd-Action: no action

This does not happen all the time but when running in parallel
sometimes one of the test instances will throw an error:
TFAIL: cs->nr_cache + cs->nr_evicted (297) != num_pages (512)

When LTP runs several instances of the cachestat tests in parallel, they share resources:
cachestat02: Uses a fixed shm name "myfile.bin". All instances use the same POSIX shared memory object.
That leads to:
Races on creation/removal of the same file/shm.
cachestat() reporting stats for a shared or partially overwritten file instead of the one the current process wrote.
nr_cache + nr_evicted not matching num_pages because the measured range is not the one written by this process.

The change is to create a unique file/shm space for each instance using the pid of each cachestat() process.
Harden parallel worker execution for cachestat02.

Signed-off-by: Stephen Bertram <sbertram@redhat.com>
---
 testcases/kernel/syscalls/cachestat/cachestat02.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/cachestat/cachestat02.c b/testcases/kernel/syscalls/cachestat/cachestat02.c
index 72428ee83..d6505c4a4 100644
--- a/testcases/kernel/syscalls/cachestat/cachestat02.c
+++ b/testcases/kernel/syscalls/cachestat/cachestat02.c
@@ -17,10 +17,9 @@
 #include <stdlib.h>
 #include "cachestat.h"
 
-#define FILENAME "myfile.bin"
-
 static int page_size;
 static char *page_data;
+static char shm_name[64];
 static struct cachestat *cs;
 static struct cachestat_range *cs_range;
 
@@ -32,7 +31,8 @@ static void test_cached_pages(const int num_pages)
 
 	memset(cs, 0, sizeof(struct cachestat));
 
-	fd = shm_open(FILENAME, O_RDWR | O_CREAT, 0600);
+	snprintf(shm_name, sizeof(shm_name), "/cachestat_%d.bin", getpid());
+	fd = shm_open(shm_name, O_RDWR | O_CREAT | O_EXCL, 0600);
 	if (fd < 0)
 		tst_brk(TBROK | TERRNO, "shm_open error");
 
@@ -53,7 +53,7 @@ static void test_cached_pages(const int num_pages)
 	TST_EXP_EQ_LI(cs->nr_cache + cs->nr_evicted, num_pages);
 
 	SAFE_CLOSE(fd);
-	shm_unlink(FILENAME);
+	shm_unlink(shm_name);
 }
 
 static void run(void)
-- 
2.52.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
