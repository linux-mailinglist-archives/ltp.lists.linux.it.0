Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 020B44407AC
	for <lists+linux-ltp@lfdr.de>; Sat, 30 Oct 2021 08:16:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C3C3C3C6F22
	for <lists+linux-ltp@lfdr.de>; Sat, 30 Oct 2021 08:16:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A9F253C6F15
 for <ltp@lists.linux.it>; Sat, 30 Oct 2021 08:16:10 +0200 (CEST)
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F15BC10011A4
 for <ltp@lists.linux.it>; Sat, 30 Oct 2021 08:16:09 +0200 (CEST)
Received: by mail-il1-x130.google.com with SMTP id s3so13016809ild.0
 for <ltp@lists.linux.it>; Fri, 29 Oct 2021 23:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pFO/mNItEdLGjwxZFLAiQbdtG+89hH+XVHrgCIQ1kjQ=;
 b=TSn6oGtfLb6Hu4226KjooxKl9PXinGu4eo319lwYNr6n68MUxallOQL3uGe2GP/uCr
 gRlYE4Lz2Jun0gvJqdtlTYOHO86H3epHCf0LBIVj4Mdk2spUmKVVsZV1/c4hb2tDNWe5
 kPxCG1/j3eJn5KKhJXYrV4vkZVAeiBMwiN/NFkUXsMsnWlNUmCZuEUTjjFpq7Cal8bHt
 V9gpaKnVuNW2dhID1jz3ItYaDwIStrjpYAdChxfQjYMUWczEIst8rslvLH6NLK6ThPGc
 ushF2HXCAD6BbGdufq1GSdrnQuCis2QaXfmkMpLj1nwmbtcdOAPbdD+/ZQ18lrrIDsUA
 +/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pFO/mNItEdLGjwxZFLAiQbdtG+89hH+XVHrgCIQ1kjQ=;
 b=lPrpUgdhCU4NfmC0i3XhCjOWbeyM/6aNfRIEzh2gxkOViAHRC8N0WoXrb9G7VyBZrw
 SAedpXLAgmsOSdzNI/F4r7hvEfZuq2XKMXbGcr66qOPa1Y8AaU7NLIHO3FkPE6MBZEnf
 yN7PohVZtqxJuLZ0GeihfLPt8IbjQ24QBI+usU1xBN+VUlNv5AJ3XsmHOWjwfdgovn2z
 KqFb/xrMOQN/FfV3Rpx6MXmwgbBasFunj7HFslVB8fF0txK4BrOfYti/1f1b5NR8Khwe
 Jz/R8TjxQozYxZwIwZcnmPsw2ws4FINe/nCaIRGr9QsbhI8vy6gBX8cko4XgMc32S2UF
 QW3Q==
X-Gm-Message-State: AOAM531UScfxc1HS4fsCZxD569/c/AneooS+BzE4JTlS+044D+YHTj57
 gJJpa/8KUYgioi6h/21JNHyYmFgDRs1gEJNc6gI=
X-Google-Smtp-Source: ABdhPJxBXwq1zk+qt1ch19lfSNm4NOMLxHhLzvJUXLwnfmzmvxPl/B4I+Xvyp5M+rpq29p2i6R8D8ZGff4a55Z+IQCs=
X-Received: by 2002:a92:dc0c:: with SMTP id t12mr2027470iln.198.1635574568787; 
 Fri, 29 Oct 2021 23:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211029211732.386127-1-krisman@collabora.com>
 <20211029211732.386127-4-krisman@collabora.com>
In-Reply-To: <20211029211732.386127-4-krisman@collabora.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 30 Oct 2021 09:15:58 +0300
Message-ID: <CAOQ4uxiwodQm_9+XVY-cWhV6aWKkqTosBfZ0HyAQTVNijJrwuQ@mail.gmail.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/9] syscalls/fanotify21: Introduce
 FAN_FS_ERROR test
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
Cc: kernel@collabora.com, Khazhismel Kumykov <khazhy@google.com>,
 Matthew Bobrowski <repnop@google.com>, Jan Kara <jack@suse.com>,
 Ext4 <linux-ext4@vger.kernel.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Sat, Oct 30, 2021 at 12:18 AM Gabriel Krisman Bertazi
<krisman@collabora.com> wrote:
>
> fanotify21 is a new test validating the FAN_FS_ERROR file system error
> event.  This adds some basic structure for the next patches and a single
> test of error reporting during filesystem abort
>
> The strategy for error reporting testing in fanotify21 goes like this:
>
>   - Generate a broken filesystem
>   - Start FAN_FS_ERROR monitoring group
>   - Make the file system  notice the error through ordinary operations
>   - Observe the event generated
>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
>

Reviewed-by: Amir Goldstein <amir73il@gmail.com>

> ---
> Changes since v1:
>   - Move defines to header file.
>   - Move fanotify_mark(2) to do_test (Amir)
>    - Merge abort test here
> ---
>  testcases/kernel/syscalls/fanotify/.gitignore |   1 +
>  testcases/kernel/syscalls/fanotify/fanotify.h |   3 +
>  .../kernel/syscalls/fanotify/fanotify21.c     | 141 ++++++++++++++++++
>  3 files changed, 145 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/fanotify/fanotify21.c
>
> diff --git a/testcases/kernel/syscalls/fanotify/.gitignore b/testcases/kernel/syscalls/fanotify/.gitignore
> index 9554b16b196e..79ad184d578b 100644
> --- a/testcases/kernel/syscalls/fanotify/.gitignore
> +++ b/testcases/kernel/syscalls/fanotify/.gitignore
> @@ -17,4 +17,5 @@
>  /fanotify17
>  /fanotify18
>  /fanotify19
> +/fanotify21
>  /fanotify_child
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
> index 820073709571..99b898554ede 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify.h
> +++ b/testcases/kernel/syscalls/fanotify/fanotify.h
> @@ -124,6 +124,9 @@ static inline int safe_fanotify_mark(const char *file, const int lineno,
>  #ifndef FAN_OPEN_EXEC_PERM
>  #define FAN_OPEN_EXEC_PERM     0x00040000
>  #endif
> +#ifndef FAN_FS_ERROR
> +#define FAN_FS_ERROR           0x00008000
> +#endif
>
>  /* Flags required for unprivileged user group */
>  #define FANOTIFY_REQUIRED_USER_INIT_FLAGS    (FAN_REPORT_FID)
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify21.c b/testcases/kernel/syscalls/fanotify/fanotify21.c
> new file mode 100644
> index 000000000000..9ef687442b7c
> --- /dev/null
> +++ b/testcases/kernel/syscalls/fanotify/fanotify21.c
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2021 Collabora Ltd.
> + *
> + * Author: Gabriel Krisman Bertazi <gabriel@krisman.be>
> + * Based on previous work by Amir Goldstein <amir73il@gmail.com>
> + */
> +
> +/*\
> + * [Description]
> + * Check fanotify FAN_ERROR_FS events triggered by intentionally
> + * corrupted filesystems:
> + *
> + * - Generate a broken filesystem
> + * - Start FAN_FS_ERROR monitoring group
> + * - Make the file system notice the error through ordinary operations
> + * - Observe the event generated
> + */
> +
> +#define _GNU_SOURCE
> +#include "config.h"
> +
> +#include <stdio.h>
> +#include <sys/types.h>
> +#include <errno.h>
> +#include <string.h>
> +#include <sys/mount.h>
> +#include <sys/syscall.h>
> +#include "tst_test.h"
> +#include <sys/fanotify.h>
> +#include <sys/types.h>
> +#include <fcntl.h>
> +
> +#ifdef HAVE_SYS_FANOTIFY_H
> +#include "fanotify.h"
> +
> +#define BUF_SIZE 256
> +static char event_buf[BUF_SIZE];
> +int fd_notify;
> +
> +#define MOUNT_PATH "test_mnt"
> +
> +static void trigger_fs_abort(void)
> +{
> +       SAFE_MOUNT(tst_device->dev, MOUNT_PATH, tst_device->fs_type,
> +                  MS_REMOUNT|MS_RDONLY, "abort");
> +}
> +
> +static struct test_case {
> +       char *name;
> +       void (*trigger_error)(void);
> +} testcases[] = {
> +       {
> +               .name = "Trigger abort",
> +               .trigger_error = &trigger_fs_abort,
> +       },
> +};
> +
> +int check_error_event_metadata(struct fanotify_event_metadata *event)
> +{
> +       int fail = 0;
> +
> +       if (event->mask != FAN_FS_ERROR) {
> +               fail++;
> +               tst_res(TFAIL, "got unexpected event %llx",
> +                       (unsigned long long)event->mask);
> +       }
> +
> +       if (event->fd != FAN_NOFD) {
> +               fail++;
> +               tst_res(TFAIL, "Weird FAN_FD %llx",
> +                       (unsigned long long)event->mask);
> +       }
> +       return fail;
> +}
> +
> +void check_event(char *buf, size_t len, const struct test_case *ex)
> +{
> +       struct fanotify_event_metadata *event =
> +               (struct fanotify_event_metadata *) buf;
> +
> +       if (len < FAN_EVENT_METADATA_LEN) {
> +               tst_res(TFAIL, "No event metadata found");
> +               return;
> +       }
> +
> +       if (check_error_event_metadata(event))
> +               return;
> +
> +       tst_res(TPASS, "Successfully received: %s", ex->name);
> +}
> +
> +static void do_test(unsigned int i)
> +{
> +       const struct test_case *tcase = &testcases[i];
> +       size_t read_len;
> +
> +       SAFE_FANOTIFY_MARK(fd_notify, FAN_MARK_ADD|FAN_MARK_FILESYSTEM,
> +                          FAN_FS_ERROR, AT_FDCWD, MOUNT_PATH);
> +
> +       tcase->trigger_error();
> +
> +       read_len = SAFE_READ(0, fd_notify, event_buf, BUF_SIZE);
> +
> +       SAFE_FANOTIFY_MARK(fd_notify, FAN_MARK_REMOVE|FAN_MARK_FILESYSTEM,
> +                          FAN_FS_ERROR, AT_FDCWD, MOUNT_PATH);
> +
> +       check_event(event_buf, read_len, tcase);
> +}
> +
> +static void setup(void)
> +{
> +       REQUIRE_FANOTIFY_EVENTS_SUPPORTED_ON_FS(FAN_CLASS_NOTIF|FAN_REPORT_FID,
> +                                               FAN_MARK_FILESYSTEM,
> +                                               FAN_FS_ERROR, ".");
> +
> +       fd_notify = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF|FAN_REPORT_FID,
> +                                      O_RDONLY);
> +}
> +
> +static void cleanup(void)
> +{
> +       if (fd_notify > 0)
> +               SAFE_CLOSE(fd_notify);
> +}
> +
> +static struct tst_test test = {
> +       .test = do_test,
> +       .tcnt = ARRAY_SIZE(testcases),
> +       .setup = setup,
> +       .cleanup = cleanup,
> +       .mount_device = 1,
> +       .mntpoint = MOUNT_PATH,
> +       .all_filesystems = 0,

That's probably redundant and the default value anyway.
If you want to stress out that this test cannot be run on other filesystems
maybe add a comment why that is above dev_fs_type.


> +       .needs_root = 1,
> +       .dev_fs_type = "ext4"
> +};
> +

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
