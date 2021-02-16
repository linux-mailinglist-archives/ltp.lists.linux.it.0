Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4976831C69E
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Feb 2021 07:48:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E96633C5924
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Feb 2021 07:48:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id EDDB83C5907
 for <ltp@lists.linux.it>; Tue, 16 Feb 2021 07:48:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 568E6600065
 for <ltp@lists.linux.it>; Tue, 16 Feb 2021 07:48:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 66F87ADCD;
 Tue, 16 Feb 2021 06:48:48 +0000 (UTC)
Date: Tue, 16 Feb 2021 07:48:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YCtqzlNKb/GbGXBM@pevik>
References: <20210215155322.32623-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210215155322.32623-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] close_range02: Add simpler test and Check
 invalid params
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richard,

> This adds some coverage for invalid parameters and a min fd above or
> on the limits. There is also some overlap with close_range01, but this
> test is simpler and has less requirements.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

LGTM, just minor nit: could we close file descriptor?
Otherwise it fails on higher -i (> 50). Something like code below?

Kind regards,
Petr

diff --git testcases/kernel/syscalls/close_range/close_range02.c testcases/kernel/syscalls/close_range/close_range02.c
index 9e099cec4..237b3d759 100644
--- testcases/kernel/syscalls/close_range/close_range02.c
+++ testcases/kernel/syscalls/close_range/close_range02.c
@@ -42,7 +42,7 @@ static void run(unsigned int n)
 		.flags = CLONE_FILES,
 		.exit_signal = SIGCHLD,
 	};
-	int fd, res;
+	int fd = -1, res;
 
 	switch (n) {
 	case 0:
@@ -101,6 +101,9 @@ static void run(unsigned int n)
 
 		TST_EXP_PASS(fcntl(fd, F_GETFD), "%d is open", fd);
 	}
+
+	if (n != 0 && fd > 0)
+		SAFE_CLOSE(fd);
 }
 
 static struct tst_test test = {

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
