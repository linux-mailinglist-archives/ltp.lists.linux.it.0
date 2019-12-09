Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 773C411679E
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 08:42:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 385633C2332
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 08:42:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A6F3F3C1D95
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 08:42:13 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 68F711401B86
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 08:42:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0A7EFB12B;
 Mon,  9 Dec 2019 07:42:11 +0000 (UTC)
Date: Mon, 9 Dec 2019 08:42:06 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191209074206.GA2373112@x230>
References: <1575447166-7813-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1575447166-7813-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Remove duplicated ".needs_tmpdir=1" when using
 equivalent flags
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

Hi Xu,

> From ltp library code, when we have used these flags(".needs_device"
> ".mntpoint" ".resource_file" ".needs_checkpoints" ".format_device"
> "mount_device" ".all_filesystems"), we don't need to set ".needs_tmpdir=1".
> So remove it.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

LGTM (unless Cyril has some objections).

I propose following diff (fix formating, reword; I'll modify it before merge).

Kind regards,
Petr

diff --git doc/test-writing-guidelines.txt doc/test-writing-guidelines.txt
index 29b0e5db2..e8e766753 100644
--- doc/test-writing-guidelines.txt
+++ doc/test-writing-guidelines.txt
@@ -493,10 +493,10 @@ this needed.
 
 If '.needs_tmpdir' is set to '1' in the 'struct tst_test' unique test
 temporary is created and it's set as the test working directory. Tests *MUST
-NOT* create temporary files outside that directory. If we have used one of
-these flags(".needs_device" ".mntpoint" ".resource_file" ".needs_checkpoints"
-".format_device" "mount_device" ".all_filesystems"), we don't need to set
-'.needs_tmpdir' again because these flags also will create temporary directory.
+NOT* create temporary files outside that directory. The flag is not needed to
+be set when use these flags: '.all_filesystems', '.format_device', '.mntpoint',
+'.mount_device' '.needs_checkpoints', '.needs_device', '.resource_file'
+(these flags imply creating temporary directory).
 
 IMPORTANT: Close all file descriptors (that point to files in test temporary
            directory, even the unlinked ones) either in the 'test()' function

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
