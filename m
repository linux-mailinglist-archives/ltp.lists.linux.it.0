Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F23030BEFD
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 14:05:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 253673C748C
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Feb 2021 14:05:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 7CA563C4F6E
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 14:04:50 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 27835600955
 for <ltp@lists.linux.it>; Tue,  2 Feb 2021 14:04:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1F80BB0D2;
 Tue,  2 Feb 2021 13:04:49 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  2 Feb 2021 14:04:41 +0100
Message-Id: <20210202130441.17861-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210202130441.17861-1-pvorel@suse.cz>
References: <20210202130441.17861-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] keyctl05: TCONF on FIPS mode
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
Cc: Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

asymmetric key test fails on FIPS with dmesg:
RSA: key size not allowed in FIPS mode

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/keyctl/keyctl05.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/keyctl/keyctl05.c b/testcases/kernel/syscalls/keyctl/keyctl05.c
index 55ce852b8..1cd665ba4 100644
--- a/testcases/kernel/syscalls/keyctl/keyctl05.c
+++ b/testcases/kernel/syscalls/keyctl/keyctl05.c
@@ -85,19 +85,25 @@ static void test_update_nonupdatable(const char *type,
 
 	new_session_keyring();
 
+	int is_asymmetric = !strcmp(type, "asymmetric");
+
 	TEST(add_key(type, "desc", payload, plen, KEY_SPEC_SESSION_KEYRING));
 	if (TST_RET < 0) {
+		if (TST_ERR == EINVAL && is_asymmetric && tst_fips_enabled()) {
+			tst_res(TCONF, "key size not allowed in FIPS mode");
+			return;
+		}
 		if (TST_ERR == ENODEV) {
 			tst_res(TCONF, "kernel doesn't support key type '%s'",
 				type);
 			return;
 		}
-		if (TST_ERR == EBADMSG && !strcmp(type, "asymmetric")) {
+		if (TST_ERR == EBADMSG && is_asymmetric) {
 			tst_res(TCONF, "kernel is missing x509 cert parser "
 				"(CONFIG_X509_CERTIFICATE_PARSER)");
 			return;
 		}
-		if (TST_ERR == ENOENT && !strcmp(type, "asymmetric")) {
+		if (TST_ERR == ENOENT && is_asymmetric) {
 			tst_res(TCONF, "kernel is missing crypto algorithms "
 				"needed to parse x509 cert (CONFIG_CRYPTO_RSA "
 				"and/or CONFIG_CRYPTO_SHA256)");
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
