Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A39FE1FEF9A
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 12:25:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54AEC3C2C8B
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 12:25:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 5A50F3C2C7C
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 12:25:02 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id A07A4200914
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 12:25:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592475900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=soQIuBK1lI0Gp+p8Avfzo3dTSUZaVSS09oNTzPhNLJo=;
 b=aQW3kYCLcrFoKrHczQgBegXfcN2vJtM1LdXHmlL2WMCbNlJu29ZgIfCtENX04++u1TtJpB
 0NgYkVzZBIS71rmVpgBQmQfRnB9uOfqWY3TOmzHrLWzA7W4PmR6HNgg8OxWIjuvuOEh6l7
 aYIcCGVVWBZfK/nP9AWOzQF5OVD0lBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-fpL7oUK5PBiCQ_tMgjMJDA-1; Thu, 18 Jun 2020 06:24:55 -0400
X-MC-Unique: fpL7oUK5PBiCQ_tMgjMJDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8F218005AD;
 Thu, 18 Jun 2020 10:24:54 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.43.17.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4CB2E60BF3;
 Thu, 18 Jun 2020 10:24:51 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 18 Jun 2020 12:24:49 +0200
Message-Id: <53a3e9975f00c50c78528994472ec7e9f8adeb90.1592475774.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] clocks/invaliddates.c: relax acceptable delta
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Test allows just 5ms delta for PASS, and test randomly fails in
environments with shared resources and increased steal time.

Relax the condition and also print deltas if test fails.
Remove DEBUG ifdefs and main parameters to avoid unused variable
warning.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 .../functional/timers/clocks/invaliddates.c   | 25 +++++++------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.c b/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.c
index face334fd250..d4116b1e9bc0 100644
--- a/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.c
+++ b/testcases/open_posix_testsuite/functional/timers/clocks/invaliddates.c
@@ -18,8 +18,7 @@
 
 #define NUMTESTS 5
 
-#define ACCEPTABLESECDELTA 0
-#define ACCEPTABLENSECDELTA 5000000
+#define ACCEPTABLESECDELTA 2
 
 static int testtimes[NUMTESTS][2] = {
 	{INT32_MAX, 999999999},	// large number
@@ -29,7 +28,7 @@ static int testtimes[NUMTESTS][2] = {
 	{1049623200, 999999999},	// daylight savings 2003
 };
 
-int main(int argc, char *argv[])
+int main(void)
 {
 	struct timespec tpset, tpget, tsreset;
 	int secdelta, nsecdelta;
@@ -44,9 +43,6 @@ int main(int argc, char *argv[])
 	for (i = 0; i < NUMTESTS; i++) {
 		tpset.tv_sec = testtimes[i][0];
 		tpset.tv_nsec = testtimes[i][1];
-#ifdef DEBUG
-		printf("Test: %ds %dns\n", testtimes[i][0], testtimes[i][1]);
-#endif
 		if (clock_settime(CLOCK_REALTIME, &tpset) == 0) {
 			if (clock_gettime(CLOCK_REALTIME, &tpget) == -1) {
 				printf("Error in clock_gettime()\n");
@@ -58,16 +54,13 @@ int main(int argc, char *argv[])
 				nsecdelta = nsecdelta + 1000000000;
 				secdelta = secdelta - 1;
 			}
-#ifdef DEBUG
-			printf("Delta:  %ds %dns\n", secdelta, nsecdelta);
-#endif
-			if ((secdelta > ACCEPTABLESECDELTA) || (secdelta < 0)) {
-				printf("clock does not appear to be set\n");
-				failure = 1;
-			}
-			if ((nsecdelta > ACCEPTABLENSECDELTA) ||
-			    (nsecdelta < 0)) {
-				printf("clock does not appear to be set\n");
+
+			if ((secdelta > ACCEPTABLESECDELTA)
+				|| (secdelta < 0)) {
+				printf("FAIL: test(%d,%d), secdelta: %d,"
+					" nsecdelta: %d\n",
+					testtimes[i][0], testtimes[i][1],
+					secdelta, nsecdelta);
 				failure = 1;
 			}
 		} else {
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
