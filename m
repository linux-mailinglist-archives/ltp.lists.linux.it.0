Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD684671C3
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Dec 2021 06:57:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28C993C907A
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Dec 2021 06:57:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D56ED3C9073
 for <ltp@lists.linux.it>; Fri,  3 Dec 2021 06:57:21 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2D0C9600D71
 for <ltp@lists.linux.it>; Fri,  3 Dec 2021 06:57:19 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.192.100.83])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 840279F651;
 Fri,  3 Dec 2021 05:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1638511031; bh=snThretmxVkQt+RpKTRno8AwQTj5RhmBuc1jgBEW2gQ=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=giHImc/0+Invf8WJ/nk1K6CnfG6luhAn5bjZ8j1VUN57yUdMCMff42Ib3Ltyh7wZR
 G0MhzjTsj0sD7elA7DghYro7Bc5qGlX0M4L4J7jxd9T6DGU2oYkTTvTjZrXJJnlQAe
 cCzSA3OtzBANytppzbsFGVE8X25eb/n8hFBLtv0M=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	chrubis@suse.cz
Date: Fri,  3 Dec 2021 06:57:06 +0100
Message-Id: <20211203055707.2271191-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 1/2] metadata/test: Remove bashism
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 metadata/tests/test.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/metadata/tests/test.sh b/metadata/tests/test.sh
index c11f0e496..475d721df 100755
--- a/metadata/tests/test.sh
+++ b/metadata/tests/test.sh
@@ -4,7 +4,7 @@ fail=0
 
 for i in *.c; do
 	../metaparse $i > tmp.json
-	if ! diff tmp.json $i.json &> /dev/null; then
+	if ! diff tmp.json $i.json >/dev/null 2>&1; then
 		echo "***"
 		echo "$i output differs!"
 		diff -u tmp.json $i.json
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
