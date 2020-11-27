Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 528AC2C68C2
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 16:36:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D6B93C63CA
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 16:36:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 44B183C5DE4
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 16:36:15 +0100 (CET)
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BF1272010A4
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 16:36:14 +0100 (CET)
Received: by mail-il1-x143.google.com with SMTP id b8so4927488ila.13
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 07:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zOq6b7u3bzu0aTRFXzovUd3whpn2GklzSqYmLieYMN4=;
 b=imBa3uJemMZkJVJoTMhP/izpxYvxlyAE73WVtl60dx031Dp+B4HwzOByzEr9oUxqTz
 2ivLXqo13noJvjZr9MdWBKQBjHm59Tpi7HDYCOI/oq3nODeUcr7KY+qFejLMwgRcmg+s
 AckRag5MJevrMmHZfwBmDywWH8O78pBstLCuKOf/yFI5W4Wu2a6a1MJ/eZ3ryWW+24ga
 Vc0RiXX7HJ/v7482JZRCRrnGIGzn4sSMP9gA6SimcWcMgu6qSd8z3upkqavxHPD9do/+
 UEz4hrfx7siHCjKd9gin3gxrIYaDkxT++iqjgeifGaJ8VhP5iqiybmoRzIvOTZHp7sLb
 1cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zOq6b7u3bzu0aTRFXzovUd3whpn2GklzSqYmLieYMN4=;
 b=FWGxJXjTL3XJZf9/Oe/1h4YNJvyxNbVQxnlF+J5PbGnGuShRCU90KCYf27io8S8AnN
 rELIsXW1d5tIPqf7qpDvjIrjiEQoYxhYRvpFIGekUFtNzS2gTK67SMSAqligrrX70jQk
 zI4TjjwVfn99cyBrfGlL0xfOiX3OoKh2n7AtLLyvpY8VvkJ9rt28q2lMdw/bl/cMnUD9
 rVcyrfwQ7/b2RWd61j6E/HYhb0OinvoYj1oBunYqB8vWckZtxWM3V1AAXwWvk271xPdA
 LZX1iJ9H7xb7uaj/izN4qVDEUPvCba1aCy1Xfr178CP5iWIfoOGrcF4rzyawvmpnZxx2
 wvag==
X-Gm-Message-State: AOAM531MlYfN7Na+23TAqmm9vL6+YtqsLQaSYEjcsW+pY+MzIlMKZ6WJ
 KfFv/gqVVcU1UWvXlDDWyLXeCYYina5uqpUF740=
X-Google-Smtp-Source: ABdhPJymLfp5EldnrNMw/pP4etuhVCanOKNbf0JW2zjNshPW6Kraehnm9A7mLlHAtBgvKpJg2PpzHfR/V2XDd/DXsTc=
X-Received: by 2002:a92:6403:: with SMTP id y3mr7851460ilb.72.1606491373504;
 Fri, 27 Nov 2020 07:36:13 -0800 (PST)
MIME-Version: 1.0
References: <20201126214121.6836-1-pvorel@suse.cz>
In-Reply-To: <20201126214121.6836-1-pvorel@suse.cz>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 27 Nov 2020 17:36:02 +0200
Message-ID: <CAOQ4uxhbHmtTcub3KKOdtOC6JXm+5jThYMROFqhK6UpAps82NA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 0/6] Introduce SAFE_FANOTIFY_MARK() macro +
 cleanup
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Nov 26, 2020 at 11:41 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Amir,
>
> another cleanup version, hopefully the last.
> Sorry for lengthy comments.

Don't be :)

>
> Changes v3->v4:
> * fixed unwanted tst_brk() (quitting the test too early). In the end it
> was problem just in fanotify01.c and fanotify03.c.
>
> In fanotify13.c it was already
>
> tst_test.c:1316: TINFO: Testing on exfat
> fanotify.h:209: TCONF: filesystem exfat does not support file handles
> ...
> tst_test.c:859: TINFO: Trying FUSE...
> fanotify13.c:161: TINFO: Test #0: FAN_REPORT_FID with mark flag: FAN_MARK_INODE
> fanotify13.c:130: TCONF: FAN_REPORT_FID not supported on filesystem type ntfs
> fanotify13.c:161: TINFO: Test #1: FAN_REPORT_FID with mark flag: FAN_MARK_INODE
> fanotify13.c:130: TCONF: FAN_REPORT_FID not supported on filesystem type ntfs
> fanotify13.c:161: TINFO: Test #2: FAN_REPORT_FID with mark flag: FAN_MARK_MOUNT
> fanotify13.c:130: TCONF: FAN_REPORT_FID not supported on filesystem type ntfs
> fanotify13.c:161: TINFO: Test #3: FAN_REPORT_FID with mark flag: FAN_MARK_MOUNT
> fanotify13.c:130: TCONF: FAN_REPORT_FID not supported on filesystem type ntfs
> fanotify13.c:161: TINFO: Test #4: FAN_REPORT_FID with mark flag: FAN_MARK_FILESYSTEM
> fanotify13.c:130: TCONF: FAN_REPORT_FID not supported on filesystem type ntfs
> fanotify13.c:161: TINFO: Test #5: FAN_REPORT_FID with mark flag: FAN_MARK_FILESYSTEM
> fanotify13.c:130: TCONF: FAN_REPORT_FID not supported on filesystem type ntfs
>
> * new commit fanotify: Check for FAN_REPORT_FID support on fs
> This one I hesitated, whether keep EOPNOTSUPP also as fallback in fanotify.h
> On all but one test (fanotify01.c) FAN_REPORT_FID was used in all tests.
>
> The only check I kept untouched is this one from fanotify16.c:
>         fd_notify = fanotify_init(group->flag, 0);
>         if (fd_notify == -1) {
>                 if (errno == EINVAL) {
>                         tst_res(TCONF,
>                                 "%s not supported by kernel", group->name);
>                         return;
>                 }
>
>                 tst_brk(TBROK | TERRNO,
>                         "fanotify_init(%s, 0) failed", group->name);
>         }
>
> Because this:
> fanotify16.c:160: TINFO: Test #0: FAN_REPORT_DFID_NAME monitor filesystem for create/delete/move/open/close
> fanotify16.c:166: TCONF: FAN_REPORT_DFID_NAME not supported by kernel
> fanotify16.c:160: TINFO: Test #1: FAN_REPORT_DFID_NAME monitor directories for create/delete/move/open/close
> fanotify16.c:166: TCONF: FAN_REPORT_DFID_NAME not supported by kernel
> fanotify16.c:160: TINFO: Test #2: FAN_REPORT_DIR_FID monitor filesystem for create/delete/move/open/close
> fanotify16.c:166: TCONF: FAN_REPORT_DIR_FID not supported by kernel
> fanotify16.c:160: TINFO: Test #3: FAN_REPORT_DIR_FID monitor directories for create/delete/move/open/close
> fanotify16.c:166: TCONF: FAN_REPORT_DIR_FID not supported by kernel
> fanotify16.c:160: TINFO: Test #4: FAN_REPORT_DFID_FID monitor filesystem for create/delete/move/open/close
> fanotify16.c:166: TCONF: FAN_REPORT_DFID_FID not supported by kernel
> fanotify16.c:160: TINFO: Test #5: FAN_REPORT_DFID_FID monitor directories for create/delete/move/open/close
> fanotify16.c:166: TCONF: FAN_REPORT_DFID_FID not supported by kernel
> fanotify16.c:160: TINFO: Test #6: FAN_REPORT_DFID_NAME_FID monitor filesystem for create/delete/move/open/close
> fanotify16.c:166: TCONF: FAN_REPORT_DFID_NAME_FID not supported by kernel
> fanotify16.c:160: TINFO: Test #7: FAN_REPORT_DFID_NAME_FID monitor directories for create/delete/move/open/close
> fanotify16.c:166: TCONF: FAN_REPORT_DFID_NAME_FID not supported by kernel
>
> would be replaced by single message which is misleading:
> fanotify16.c:163: TCONF: FAN_REPORT_NAME not supported in kernel?
> if I use
> fd_notify = SAFE_FANOTIFY_INIT(group->flag, 0);
> + that problem with skipping what we don't want to skip (although here
> are skipped all and on old kernel I get
> fanotify.h:342: TCONF: FAN_REPORT_FID not supported in kernel?

That's because you should have tested FAN_REPORT_NAME before
testing FAN_REPORT_FID.

Also, instead of testing FAN_REPORT_NAME you can test for
(flags & FAN_REPORT_DIR_FID) both flags were added together
in the same kernel but FAN_REPORT_NAME cannot be used without
FAN_REPORT_DIR_FID.

>
> and on new kernel problematic fs are skipped anyway:
> fanotify.h:363: TCONF: FAN_REPORT_FID not supported on exfat filesystem
>
> Feel free to suggest what to do or simply send a following patch.
>

I am not sure if my answers addressed all the problems you encountered
with fanotify16. Feel free to leave the remaining problem out of the cleanup
and I will fix it later.

> In following commit "fanotify: Introduce SAFE_FANOTIFY_MARK() macro".
> I'd prefer to keep it (fallback if we forget to add a check), but probably instead of
> "some FAN_REPORT_* flag not supported on %s filesystem",
> there should be
> "FAN_REPORT_FID flag not supported on %s filesystem",
> But on my machine with 5.10.0-rc4-1.gea0f69f-default, this failed on FAN_REPORT_DFID_NAME
> (synonym for (FAN_REPORT_DIR_FID|FAN_REPORT_NAME) => no FAN_REPORT_FID,
> so this would be misleading:
> fanotify16.c:160: TINFO: Test #0: FAN_REPORT_DFID_NAME monitor filesystem for create/delete/move/open/close
> fanotify16.c:177: TCONF: FAN_REPORT_FID not supported on exfat filesystem
>
> * more cleanup in commit "fanotify: Check FAN_REPORT_{FID,NAME} support"
>
> Other changes (suggested mostly by Cyril):
> * rename s/support_exec_events/exec_events_unsupported/
>
> * Add "require_" prefix for functions which use tst_brk()
>
> * use tst_res_() and tst_brk_() for safe_*() functions
>
> BTW fanotify16.c use .dev_fs_flags = TST_FS_SKIP_FUSE, this could be
> added also into fanotify13.c (it'd avoid running ntfs).
>
> If LTP had something like TST_FS_SKIP_MICROSOFT (TST_FS_SKIP_FUSE +
> exfat), could get rid of "FAN_REPORT_FID not supported on foo
> filesystem" testing. But it's already implemented, so it's just a note
> to be ignored.
>

It is better to check support by trying unless there is a very good reason
for special casing filesystems. I don't remember what was the special case
for ntfs that test support checks did not catch.

I guess the TST_FS_SKIP_FUSE flag may not be needed after your fixes?

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
