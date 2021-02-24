Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F693238A1
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 09:30:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 462263C4E75
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 09:30:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 875583C4E2C
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 09:30:06 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2932F200D3E
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 09:30:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 29EFDAF52;
 Wed, 24 Feb 2021 08:30:05 +0000 (UTC)
Date: Wed, 24 Feb 2021 09:30:03 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <YDYOi5QTuas+ScAZ@pevik>
References: <CAOQ4uxjGkm0Pn84UW6JKSK3mFkrPKykfkXDLL1V4YPSgAOXULA@mail.gmail.com>
 <20210218143635.24916-1-lhenriques@suse.de>
 <CAOQ4uxjtap0jQat19h7g+6xvpMnqrwEihgN7pw11d57kkRVsaw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxjtap0jQat19h7g+6xvpMnqrwEihgN7pw11d57kkRVsaw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] vfs: fix copy_file_range regression in
 cross-fs copies
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Luis Henriques <lhenriques@suse.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> On Thu, Feb 18, 2021 at 4:35 PM Luis Henriques <lhenriques@suse.de> wrote:

> > A regression has been reported by Nicolas Boichat, found while using the
> > copy_file_range syscall to copy a tracefs file.  Before commit
> > 5dae222a5ff0 ("vfs: allow copy_file_range to copy across devices") the
> > kernel would return -EXDEV to userspace when trying to copy a file across
> > different filesystems.  After this commit, the syscall doesn't fail anymore
> > and instead returns zero (zero bytes copied), as this file's content is
> > generated on-the-fly and thus reports a size of zero.

> > This patch restores some cross-filesystem copy restrictions that existed
> > prior to commit 5dae222a5ff0 ("vfs: allow copy_file_range to copy across
> > devices").  Filesystems are still allowed to fall-back to the VFS
> > generic_copy_file_range() implementation, but that has now to be done
> > explicitly.


> Petr,

> Please note that the check for verify_cross_fs_copy_support() in LTP
> tests can no longer be used to determine if copy_file_range() is post v5.3.
> You will need to fix the tests to expect cross-fs failures (this change of
> behavior is supposed to be backported to stable kernels as well).

> I guess the copy_file_range() tests will need to use min_kver.

Thanks for info! I see, after "vfs: fix copy_file_range regression in cross-fs
copies" and backported to 5.4.x, 5.10.x and 5.11.x we'll probably have to
replace verify_cross_fs_copy_support() with .min_kver = "5.3".

We have also tst_kvercmp2() in case original 5dae222a5ff0 ("vfs: allow
copy_file_range to copy across devices") was backported to any enterprise distro
(and then this fix would follow).

Kind regards,
Petr

> Thanks,
> Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
