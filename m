Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D39D619850C
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 22:02:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B46F3C3148
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 22:02:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 4CDDE3C3138
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 22:02:54 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B4D7D6008E7
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 22:02:53 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F0632AF89;
 Mon, 30 Mar 2020 20:02:52 +0000 (UTC)
Date: Mon, 30 Mar 2020 22:02:50 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200330200250.GB8636@dell5510>
References: <20200330124338.6764-1-pvorel@suse.cz>
 <20200330124338.6764-6-pvorel@suse.cz>
 <CAEemH2dQfpn9mEBY=CFfVj_8dLETD7zh4=j3KP-bt95m_CCBxg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dQfpn9mEBY=CFfVj_8dLETD7zh4=j3KP-bt95m_CCBxg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/5] Use SAFE_CMD()
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

> Oh, you did the renaming in patch 5/5, but pity that the
> TST_CMD_TCONF_ON_MISSING still not being used:). I guess this modification
> should belong to patch4/5.
Thanks for careful review. Yes, I found that as well + the other problem you
reported - tst_run_cmd() during one more check.

+ I needed to put back static inline for safe_cmd() (it was in previous version,
it's really needed). So there is latest version available on
https://github.com/pevik/ltp/tree/needs_cmds.v2.fixes

which passed some travis jobs (I'll check that tomorrow)
https://travis-ci.org/github/pevik/ltp/builds/668925599

Diff from v2 below.

IMHO now it should be ok, but I'm waiting for your or anybody else ack/review.

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
index d050c5990..8126179f4 100644
--- include/tst_safe_macros.h
+++ include/tst_safe_macros.h
@@ -538,13 +538,13 @@ void safe_unshare(const char *file, const int lineno, int flags);
 void safe_setns(const char *file, const int lineno, int fd, int nstype);
 #define SAFE_SETNS(fd, nstype) safe_setns(__FILE__, __LINE__, (fd), (nstype));
 
-void safe_cmd(const char *file, const int lineno, const char *const argv[],
+static inline void safe_cmd(const char *file, const int lineno, const char *const argv[],
 				  const char *stdout_path, const char *stderr_path)
 {
 	int rval;
 
-	switch ((rval = tst_cmd(argv, stdout_path, stderr_path, TST_CMD_PASS_RETVAL
-							| TST_CMD_CHECK_CMD))) {
+	switch ((rval = tst_cmd(argv, stdout_path, stderr_path,
+				TST_CMD_PASS_RETVAL | TST_CMD_TCONF_ON_MISSING))) {
 	case 0:
 		break;
 	default:

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
