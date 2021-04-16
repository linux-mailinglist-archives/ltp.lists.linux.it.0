Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA294361BB0
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 10:46:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72A8E3C1CBE
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 10:46:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C2D1D3C1AD6
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 10:46:44 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 33A451A0198E
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 10:46:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618562802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type;
 bh=1ZbCj82g3HZKQKO/+5WO6Kd2ET4/pgYw0Ahw+awtzm4=;
 b=Pn7KYfiMtza+X8Z7mbk/YkfXhw88/ZKKjp8+9vDDDRgLILO9kna4s4DAF7uBEdlp8PJ0+O
 5OL0ckbE5ibbZpYissZ6d6lYsU2iZuCmq3RPcjly+M6Zl8sr7JWIE+5M6OE3R+WwK1cFsY
 rlj4I24gPkLJwweQsivUTBknZwZtk3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-XqLaMlSNOS6Z0RzqyOqyjg-1; Fri, 16 Apr 2021 04:46:40 -0400
X-MC-Unique: XqLaMlSNOS6Z0RzqyOqyjg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01A3F18A08D6
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 08:46:40 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.36.110.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F8141349A
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 08:46:39 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Fri, 16 Apr 2021 10:46:34 +0200
Message-Id: <720dd61b04bf13974f9e3d69bfec5dc9a02a9e8d.1618562750.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] commands/ld01: relax check for missing files
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

Older gcc versions used to report:
  gcc: cannot find x.o: No such file or directory
newer ones now report:
  ld: cannot find x.o: No such file or directory

This is a sanity test and exact message is not important. Relax the check.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 testcases/commands/ld/ld01.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/commands/ld/ld01.sh b/testcases/commands/ld/ld01.sh
index a05627f9d9f8..0a598ec3a768 100755
--- a/testcases/commands/ld/ld01.sh
+++ b/testcases/commands/ld/ld01.sh
@@ -27,7 +27,7 @@ test1()
 {
 	EXPECT_FAIL $LD x.o y.o 2\> ld.out
 
-	if grep -q "$LD:.*[xy]\.o.*No such file or directory" ld.out; then
+	if grep -q "[xy]\.o.*No such file or directory" ld.out; then
 		tst_res TPASS "Missing files were reported"
 	else
 		tst_res TFAIL "Missing files were not reported"
@@ -39,7 +39,7 @@ test2()
 {
 	EXPECT_FAIL $CC x.o y.o 2\> cc.out
 
-	if grep -q "$CC:.*[xy]\.o.*No such file or directory" cc.out; then
+	if grep -q "[xy]\.o.*No such file or directory" cc.out; then
 		tst_res TPASS "Missing files were reported"
 	else
 		tst_res TFAIL "Missing files were not reported"
-- 
2.18.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
