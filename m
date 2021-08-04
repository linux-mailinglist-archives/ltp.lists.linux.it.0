Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2C33DFB0D
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 07:28:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D037C3C7FF0
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Aug 2021 07:28:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 54BE53C65B1
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 07:27:59 +0200 (CEST)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 45001200342
 for <ltp@lists.linux.it>; Wed,  4 Aug 2021 07:27:59 +0200 (CEST)
Received: by mail-io1-xd2f.google.com with SMTP id y200so1140082iof.1
 for <ltp@lists.linux.it>; Tue, 03 Aug 2021 22:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=myrdhhON69Xr522LEUNLiwzWKFEr4/kgK5HyBkBCT/8=;
 b=JjcTHMcBmeemkKemmngFwCPa0WIeHGJFIT57s9r2IaxcWScthYEZgIHndhKbvfH6gC
 7bUCUIrXJaAZICtuXlznR4AzEJy+LbTfK+yJRy6Fa/c+FMh0AovRs1ynbccoukkY7ydb
 yrg1QjErBvv0u4wWOqAo+DfZByNcjFAfLaSKWjEXJo85au+K+RRKhCRI3/wq4UGEeFax
 j3VE4TZ5afX3PHf8IDRT/fCsKRT6rth7BvIsf+Mny213I+phifOsl/vxJTUu6IGpXq4o
 elDIfOArcNHX38E1n4lPqRkIXA7wrQJuo2aKyVFx58k4zqJqXBfc79uHhLg1FmilSk+T
 r5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=myrdhhON69Xr522LEUNLiwzWKFEr4/kgK5HyBkBCT/8=;
 b=NJUl+LQSaIJEGW+pOlUpXrx8DMtJAwIQA3gHN174ceATQo5CcBunCg0kpdUEeXvQ5M
 E5pwJeoO3WmULBTHmK/GrxYfY9Cfr7e2Kz4kiHOK1IuYPVoiVUBAbD7sILMHrL16DkTM
 nRJfh5egKlRyO1pGExNnj9ILiZW9S3qxmK3uTpr5l5PIc3MD2PwOPDX8FSKxUy+0oulc
 MuLFCMj9I86KNeHcshjTAwSZjJs3OVCbfb7VeBQnnGs2QBSLF/C1igf2jiF29y0pW6iC
 N9WGVFKvHrHT/L1ucTJ43GPMPyYEHyWXeeSW/J60180RTaKOfBM8AJlExpvGgGntXYHZ
 cJ7Q==
X-Gm-Message-State: AOAM530fM85bahOoRloffm2hedHhDDYsntFRbxOAIQ7cdx+66Cxs6/bt
 qDiELov6S9i3ZA5pAJ+QnEMX9CdkAOssVXpiXC8=
X-Google-Smtp-Source: ABdhPJxkzBjoVilk+g3RjAj5hq747ePxNnyTT1n5EGy0/sBUsXCPyShg6J4MajWobQI0T+jux/ZRfRg5CJO+vYPRmSQ=
X-Received: by 2002:a5e:9901:: with SMTP id t1mr273023ioj.5.1628054877917;
 Tue, 03 Aug 2021 22:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210802214645.2633028-1-krisman@collabora.com>
 <20210802214645.2633028-7-krisman@collabora.com>
 <CAOQ4uxizX0ar7d9eYgazcenQcA7Ku7quEZOLbcaxKJiY0sTPLA@mail.gmail.com>
 <87k0l1hkuz.fsf@collabora.com>
In-Reply-To: <87k0l1hkuz.fsf@collabora.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 4 Aug 2021 08:27:46 +0300
Message-ID: <CAOQ4uxis23+T3=+R+9rKkxtZLtS4S4LJ6RBgG0AEHsg4=MJyRA@mail.gmail.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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

On Wed, Aug 4, 2021 at 7:52 AM Gabriel Krisman Bertazi
<krisman@collabora.com> wrote:
>
> Amir Goldstein <amir73il@gmail.com> writes:
>
> > On Tue, Aug 3, 2021 at 12:47 AM Gabriel Krisman Bertazi
> > <krisman@collabora.com> wrote:
> >>
> >> This test corrupts an inode entry with an invalid mode through debugfs
> >> and then tries to access it.  This should result in a ext4 error, which
> >> we monitor through the fanotify group.
> >>
> >> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> >> ---
> >>  .../kernel/syscalls/fanotify/fanotify20.c     | 38 +++++++++++++++++++
> >>  1 file changed, 38 insertions(+)
> >>
> >> diff --git a/testcases/kernel/syscalls/fanotify/fanotify20.c b/testcases/kernel/syscalls/fanotify/fanotify20.c
> >> index e7ced28eb61d..0c63e90edc3a 100644
> >> --- a/testcases/kernel/syscalls/fanotify/fanotify20.c
> >> +++ b/testcases/kernel/syscalls/fanotify/fanotify20.c
> >> @@ -76,6 +76,36 @@ static void trigger_fs_abort(void)
> >>                    MS_REMOUNT|MS_RDONLY, "abort");
> >>  }
> >>
> >> +#define TCASE2_BASEDIR "tcase2"
> >> +#define TCASE2_BAD_DIR TCASE2_BASEDIR"/bad_dir"
> >> +
> >> +static unsigned int tcase2_bad_ino;
> >> +static void tcase2_prepare_fs(void)
> >> +{
> >> +       struct stat stat;
> >> +
> >> +       SAFE_MKDIR(MOUNT_PATH"/"TCASE2_BASEDIR, 0777);
> >> +       SAFE_MKDIR(MOUNT_PATH"/"TCASE2_BAD_DIR, 0777);
> >> +
> >> +       SAFE_STAT(MOUNT_PATH"/"TCASE2_BAD_DIR, &stat);
> >> +       tcase2_bad_ino = stat.st_ino;
> >> +
> >> +       SAFE_UMOUNT(MOUNT_PATH);
> >> +       do_debugfs_request(tst_device->dev, "sif " TCASE2_BAD_DIR " mode 0xff");
> >> +       SAFE_MOUNT(tst_device->dev, MOUNT_PATH, tst_device->fs_type, 0, NULL);
> >> +}
> >> +
> >> +static void tcase2_trigger_lookup(void)
> >> +{
> >> +       int ret;
> >> +
> >> +       /* SAFE_OPEN cannot be used here because we expect it to fail. */
> >> +       ret = open(MOUNT_PATH"/"TCASE2_BAD_DIR, O_RDONLY, 0);
> >> +       if (ret != -1 && errno != EUCLEAN)
> >> +               tst_res(TFAIL, "Unexpected lookup result(%d) of %s (%d!=%d)",
> >> +                       ret, TCASE2_BAD_DIR, errno, EUCLEAN);
> >> +}
> >> +
> >>  static const struct test_case {
> >>         char *name;
> >>         int error;
> >> @@ -92,6 +122,14 @@ static const struct test_case {
> >>                 .error_count = 1,
> >>                 .error = EXT4_ERR_ESHUTDOWN,
> >>                 .inode = NULL
> >> +       },
> >> +       {
> >> +               .name = "Lookup of inode with invalid mode",
> >> +               .prepare_fs = tcase2_prepare_fs,
> >> +               .trigger_error = &tcase2_trigger_lookup,
> >> +               .error_count = 1,
> >> +               .error = 0,
> >> +               .inode = &tcase2_bad_ino,
> >
> > Why is error 0?
> > What's the rationale?
>
> Hi Amir,
>
> That is specific to Ext4.  Some ext4 conditions report bogus error codes.  I will
> come up with a kernel patch changing it.
>

Well, I would not expect a FAN_FS_ERROR event to ever have 0 error
value. Since this test practically only tests ext4, I do not think it
is reasonable
for the test to VERIFY a bug. It is fine to write this test with expectations
that are not met and let it fail.

But a better plan would probably be to merge the patches up to 5 to test
FAN_FS_ERROR and then add more test cases after ext4 is fixed
Either that or you fix the ext4 problem along with FAN_FS_ERROR.

Forgot to say that the test needs to declare .needs_cmds "debugfs".

In any case, as far as prerequisite to merging FAN_FS_ERROR
your WIP tests certainly suffice.
Please keep your test branch around so we can use it to validate
the kernel patches.
I usually hold off on submitting LTP tests for inclusion until at least -rc3
after kernel patches have been merged.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
