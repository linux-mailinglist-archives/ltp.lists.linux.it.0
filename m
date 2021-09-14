Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C543840B5A1
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 19:09:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A6BC3C925E
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 19:09:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B0EAD3CA4D3
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 19:09:01 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AA2D420090C
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 19:09:00 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id D18741FD29;
 Tue, 14 Sep 2021 17:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1631639339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7yLEALOHM06a3MjZpWW9miIG8BaBc2UHxP8J265juOM=;
 b=D1vS5i4ApOLcvXrJUDlchqPfMrXWwkWyN1IheK+BPKwHhDvNjt1CJAw1tDuG21fbUkaTnD
 CvYCHQbB2mmgBaiwX9o8ul3v7b2cf/Ce65Up71jm92xk26E5I0EGJKp+Na+1i39tODKXe3
 w2ERjkiEbZg4aYv+lQ/vd+tovvxnj/k=
Received: from localhost.suse.de (blezhepekov.udp.ovpn2.nue.suse.de
 [10.163.45.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 9D697A3B91;
 Tue, 14 Sep 2021 17:08:59 +0000 (UTC)
To: ltp@lists.linux.it
Date: Tue, 14 Sep 2021 20:08:47 +0300
Message-Id: <20210914170851.22931-2-bogdan.lezhepekov@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210914170851.22931-1-bogdan.lezhepekov@suse.com>
References: <20210914170851.22931-1-bogdan.lezhepekov@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1 2/6] rt:pi-tests::sbrk_mutex: return actual exit
 code
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
From: Bogdan Lezhepekov via ltp <ltp@lists.linux.it>
Reply-To: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The original version always returned 0.

Signed-off-by: Bogdan Lezhepekov <bogdan.lezhepekov@suse.com>
---
 testcases/realtime/func/pi-tests/sbrk_mutex.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/testcases/realtime/func/pi-tests/sbrk_mutex.c b/testcases/realtime/func/pi-tests/sbrk_mutex.c
index 7ed7969d9..34e4e9666 100644
--- a/testcases/realtime/func/pi-tests/sbrk_mutex.c
+++ b/testcases/realtime/func/pi-tests/sbrk_mutex.c
@@ -97,7 +97,8 @@ void *worker_thread(void *arg)
 
 int main(int argc, char *argv[])
 {
-	int m, ret, robust;
+	int m, robust;
+	int ret = 0;
 	intptr_t t;
 	pthread_mutexattr_t mutexattr;
 	setup();
@@ -123,7 +124,8 @@ int main(int argc, char *argv[])
 		if (!(mutexes[m] = malloc(sizeof(pthread_mutex_t)))) {
 			perror("malloc failed\n");
 		}
-		if ((ret = pthread_mutex_init(mutexes[m], &mutexattr))) {
+		if (pthread_mutex_init(mutexes[m], &mutexattr)) {
+			ret = 1;
 			perror("pthread_mutex_init() failed\n");
 		}
 	}
@@ -140,11 +142,13 @@ int main(int argc, char *argv[])
 	/* destroy all the mutexes */
 	for (m = 0; m < NUM_MUTEXES; m++) {
 		if (mutexes[m]) {
-			if ((ret = pthread_mutex_destroy(mutexes[m])))
+			if (pthread_mutex_destroy(mutexes[m])) {
+				ret = 1;
 				perror("pthread_mutex_destroy() failed\n");
+			}
 			free(mutexes[m]);
 		}
 	}
 
-	return 0;
+	return ret;
 }
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
