Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eObWBtepp2lTjAAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 04:41:11 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B98991FA78A
	for <lists+linux-ltp@lfdr.de>; Wed, 04 Mar 2026 04:41:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772595670; h=to : date :
 message-id : in-reply-to : references : mime-version : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=FijGOShpG5ujxrf7/rLeINUXNjDssL88ejzllx8hFVI=;
 b=m2ppsLQvbx5xlInNmt8nQP34nY0I/VrYEKBGpojmfMmj0GFMPk4c8F6PyXiQuNPquVZxs
 l2Zxx5n22Oxtb/LnRUMuDyIWsmgJbaQmnJaUfo5/+l/1OWMlWURo5E3PMRYBOmDnwNqcmIV
 KzjSihBtINyvGaj14oXaHWb+z1ZYOeg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 701183CDBED
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2026 04:41:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CB5403CAF08
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 04:40:46 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3962E1000466
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 04:40:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772595644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UcaURo37dSdJIOW79sqGE3Ewv/rmSAMuYpL4B7/O498=;
 b=IUIu/TniCaC48BAGC2zmrVK6zf4qW3KMXO6VZFTKSqmdw2kfClOgQ6qFE/HcF3osIt85xJ
 I2TNb2jEgfeNxDJrN9FRRloFmPBqJNwGjSyc+lUSlxJi1FSmzKhutLn5PgD+np6vs30dgm
 +lr1fPHM+dS3yqBgenlbuGVIDs3h5Mw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-608-l6I5YeSYOY6SRNoW6m6weQ-1; Tue,
 03 Mar 2026 22:40:43 -0500
X-MC-Unique: l6I5YeSYOY6SRNoW6m6weQ-1
X-Mimecast-MFC-AGG-ID: l6I5YeSYOY6SRNoW6m6weQ_1772595642
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 84FBA180075F
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 03:40:42 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.116.173])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 58A5F195608E
 for <ltp@lists.linux.it>; Wed,  4 Mar 2026 03:40:40 +0000 (UTC)
To: ltp@lists.linux.it
Date: Wed,  4 Mar 2026 11:40:34 +0800
Message-ID: <20260304034034.59303-2-liwang@redhat.com>
In-Reply-To: <20260304034034.59303-1-liwang@redhat.com>
References: <20260304034034.59303-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P9g531_OMf95jQZ6cAuMNutMQ-lrhbixIagTqiHLGKA_1772595642
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3 2/2] lib: Extend LTP_ENABLE_DEBUG to support
 verbosity levels
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Queue-Id: B98991FA78A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_EQ_FROM(0.00)[];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	TAGGED_RCPT(0.00)[linux-ltp];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,picard.linux.it:rdns,picard.linux.it:helo,lists.linux.it:dkim]
X-Rspamd-Action: no action

Following the introduction of verbosity levels for the `-D` command line
flag, this patch extends the `LTP_ENABLE_DEBUG` environment variable to
support the same levels (1, and 2).

Previously, `LTP_ENABLE_DEBUG` acted as a simple boolean toggle. It now
mirrors the behavior of `-D`, allowing developers to specify the exact
level of debug verbosity required from the environment.

And, command-line should take precedence over environment variables when
set both.

Signed-off-by: Li Wang <liwang@redhat.com>
---

Notes:
    v2 --> v3:
    	* Command-line -D take precedence over environment variables.

 doc/developers/debugging.rst     |  2 +-
 lib/newlib_tests/tst_res_flags.c |  2 +-
 lib/tst_test.c                   | 15 +++++++++++----
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/doc/developers/debugging.rst b/doc/developers/debugging.rst
index dcb287bb6..86050aa86 100644
--- a/doc/developers/debugging.rst
+++ b/doc/developers/debugging.rst
@@ -9,7 +9,7 @@ Debug messages
 --------------
 
 The LTP framework supports ``TDEBUG`` flag test debug messages. These
-messages can be enabled using the ``-D`` parameter or setting ``LTP_ENABLE_DEBUG=1``
+messages can be enabled using the ``-D[1,2]`` parameter or setting ``LTP_ENABLE_DEBUG=1,2``
 environment variable (see :doc:`../users/setup_tests`).
 
 The ``-D`` parameter also supports the following verbosity levels:
diff --git a/lib/newlib_tests/tst_res_flags.c b/lib/newlib_tests/tst_res_flags.c
index a14f0df2c..21637a472 100644
--- a/lib/newlib_tests/tst_res_flags.c
+++ b/lib/newlib_tests/tst_res_flags.c
@@ -21,7 +21,7 @@ static struct tcase {
 	{FLAG(TCONF)},
 	{FLAG(TWARN)},
 	{FLAG(TINFO)},
-	{FLAG(TDEBUG), " (printed only with -D or LTP_ENABLE_DEBUG=1)"},
+	{FLAG(TDEBUG), " (printed only with -D[1,2] or LTP_ENABLE_DEBUG=1,2)"},
 };
 
 static void do_cleanup(void)
diff --git a/lib/tst_test.c b/lib/tst_test.c
index e01c14638..669d43768 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -675,7 +675,7 @@ static void print_help(void)
 	fprintf(stderr, "LTP_COLORIZE_OUTPUT      Force colorized output behaviour (y/1 always, n/0: never)\n");
 	fprintf(stderr, "LTP_DEV                  Path to the block device to be used (for .needs_device)\n");
 	fprintf(stderr, "LTP_DEV_FS_TYPE          Filesystem used for testing (default: %s)\n", DEFAULT_FS_TYPE);
-	fprintf(stderr, "LTP_ENABLE_DEBUG         Print debug messages (set 1 or y)\n");
+	fprintf(stderr, "LTP_ENABLE_DEBUG         Print debug messages (set 1(y) or 2)\n");
 	fprintf(stderr, "LTP_REPRODUCIBLE_OUTPUT  Values 1 or y discard the actual content of the messages printed by the test\n");
 	fprintf(stderr, "LTP_QUIET                Values 1 or y will suppress printing TCONF, TWARN, TINFO, and TDEBUG messages\n");
 	fprintf(stderr, "LTP_SINGLE_FS_TYPE       Specifies filesystem instead all supported (for .all_filesystems)\n");
@@ -1445,9 +1445,16 @@ static void do_setup(int argc, char *argv[])
 
 	parse_opts(argc, argv);
 
-	if (tdebug_env && (!strcmp(tdebug_env, "1") || !strcmp(tdebug_env, "y"))) {
-		tst_res(TINFO, "Enabling debug info");
-		context->tdebug = 1;
+	if (tdebug_env && !context->tdebug) {
+		if (!strcmp(tdebug_env, "2"))
+			context->tdebug = 2;
+		else if (!strcmp(tdebug_env, "1") || !strcmp(tdebug_env, "y"))
+			context->tdebug = 1;
+		else
+			tst_res(TWARN, "Invalid LTP_ENABLE_DEBUG value: %s", tdebug_env);
+
+		if (context->tdebug)
+			tst_res(TINFO, "Enabling debug info (level %d)", context->tdebug);
 	}
 
 	if (tst_test->needs_kconfigs && tst_kconfig_check(tst_test->needs_kconfigs))
-- 
2.53.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
