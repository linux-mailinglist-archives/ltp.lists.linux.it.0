Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7631A1983B1
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 20:48:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 09DDE3C316A
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 20:48:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 39F203C3138
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 20:48:30 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AC83C200DC4
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 20:48:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E7ADEABEF;
 Mon, 30 Mar 2020 18:48:28 +0000 (UTC)
Date: Mon, 30 Mar 2020 20:48:27 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200330184827.GA8636@dell5510>
References: <20200330124338.6764-1-pvorel@suse.cz>
 <20200330124338.6764-5-pvorel@suse.cz>
 <CAEemH2dcxrpB_dkp26=5oiMdY_2OVw5v_OjpyG37N+zx7y+A9g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dcxrpB_dkp26=5oiMdY_2OVw5v_OjpyG37N+zx7y+A9g@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 4/5] lib: Implement SAFE_CMD() macro (new API
 only)
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> > +       switch ((rval = tst_run_cmd(argv, stdout_path, stderr_path,
> > +                                   TST_RUN_CMD_PASS_EXIT_VAL |
> > +                                   TST_RUN_CMD_CHECK_CMD))) {


> This should be TST_CMD_TCONF_ON_MISSING ^.

> I'd help to build&run the whole patches tomorrow, anything wrong if I can
> find will reply to you then.

Thanks for fixes. Here is following diff from v2 (addressing issues you found,
fixed tst_run_cmd() being replaced in later commit, fix doc formatting),
code available also on:
https://github.com/pevik/ltp/tree/needs_cmds.v2.fixes

I'm going to test each commit if it builds and wait for your ack tomorrow.

Kind regards,
Petr

diff --git doc/test-writing-guidelines.txt doc/test-writing-guidelines.txt
index 75c2e517a..895f6c99d 100644
--- doc/test-writing-guidelines.txt
+++ doc/test-writing-guidelines.txt
@@ -1263,7 +1263,7 @@ different once the call returns and should be used only for rough estimates.
 int tst_cmd(const char *const argv[],
 	        const char *stdout_path,
 	        const char *stderr_path,
-			enum tst_cmd_flags flags);
+	        enum tst_cmd_flags flags);
 -------------------------------------------------------------------------------
 
 'tst_cmd()' is a wrapper for 'vfork() + execvp()' which provides a way
diff --git include/tst_safe_macros.h include/tst_safe_macros.h
index d050c5990..295800c1b 100644
--- include/tst_safe_macros.h
+++ include/tst_safe_macros.h
@@ -543,8 +543,8 @@ void safe_cmd(const char *file, const int lineno, const char *const argv[],
 {
 	int rval;
 
-	switch ((rval = tst_cmd(argv, stdout_path, stderr_path, TST_CMD_PASS_RETVAL
-							| TST_CMD_CHECK_CMD))) {
+	switch ((rval = tst_cmd(argv, stdout_path, stderr_path,
+				TST_CMD_PASS_EXIT_VAL | TST_CMD_TCONF_ON_MISSING))) {
 	case 0:
 		break;
 	default:

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
