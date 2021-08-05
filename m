Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D5E3E1E25
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 23:50:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC64C3C7FBD
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 23:50:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 780613C03FF
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 23:50:20 +0200 (CEST)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E3C26601019
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 23:50:19 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 8988E1F44365
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Amir Goldstein <amir73il@gmail.com>
Organization: Collabora
References: <20210802214645.2633028-1-krisman@collabora.com>
 <20210802214645.2633028-7-krisman@collabora.com>
 <CAOQ4uxizX0ar7d9eYgazcenQcA7Ku7quEZOLbcaxKJiY0sTPLA@mail.gmail.com>
 <87k0l1hkuz.fsf@collabora.com>
 <CAOQ4uxis23+T3=+R+9rKkxtZLtS4S4LJ6RBgG0AEHsg4=MJyRA@mail.gmail.com>
Date: Thu, 05 Aug 2021 17:50:11 -0400
In-Reply-To: <CAOQ4uxis23+T3=+R+9rKkxtZLtS4S4LJ6RBgG0AEHsg4=MJyRA@mail.gmail.com>
 (Amir Goldstein's message of "Wed, 4 Aug 2021 08:27:46 +0300")
Message-ID: <87tuk3ef3g.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 6/7] syscalls/fanotify20: Test file event with
 broken inode
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
Cc: Ext4 <linux-ext4@vger.kernel.org>, kernel@collabora.com,
 Khazhismel Kumykov <khazhy@google.com>, LTP List <ltp@lists.linux.it>,
 Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Hi Amir,

thanks for the review.

Amir Goldstein <amir73il@gmail.com> writes:
> Well, I would not expect a FAN_FS_ERROR event to ever have 0 error
> value. Since this test practically only tests ext4, I do not think it
> is reasonable
> for the test to VERIFY a bug. It is fine to write this test with expectations
> that are not met and let it fail.

This gave me a good chuckle. :)  I will check for a
EXT4_ERR_EFSCORRUPTED and propose a fix on ext4.

>
> But a better plan would probably be to merge the patches up to 5 to test
> FAN_FS_ERROR and then add more test cases after ext4 is fixed
> Either that or you fix the ext4 problem along with FAN_FS_ERROR.
>
> Forgot to say that the test needs to declare .needs_cmds "debugfs".
>
> In any case, as far as prerequisite to merging FAN_FS_ERROR
> your WIP tests certainly suffice.
> Please keep your test branch around so we can use it to validate
> the kernel patches.
> I usually hold off on submitting LTP tests for inclusion until at least -rc3
> after kernel patches have been merged.

As requested, I will not send a new version of the test for now. I
published them on the following unstable branch:

  https://gitlab.collabora.com/krisman/ltp -b fan-fs-error

The v1, as submitted in this thread is also available at:

  https://gitlab.collabora.com/krisman/ltp -b fan-fs-error-v1

Thanks,

-- 
Gabriel Krisman Bertazi

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
