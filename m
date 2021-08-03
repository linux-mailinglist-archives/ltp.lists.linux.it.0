Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A58EA3DE97A
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 11:08:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6077C3C6D08
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 11:08:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 15CAE3C262C
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 11:08:24 +0200 (CEST)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9B7F4600054
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 11:08:23 +0200 (CEST)
Received: by mail-io1-xd2e.google.com with SMTP id y1so297263iod.10
 for <ltp@lists.linux.it>; Tue, 03 Aug 2021 02:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PPERkJDmUqGoRJFFlz2gKtkglfVn/RWj0tAIej+ZdiE=;
 b=RRfnOeKlylu8ywyvQb6H0cO0JtzkY429YJjwumfAFf/SZscQirLsajSf5EgYv2OhWq
 El+BUjtEFtcUKnb8LQHJUIkdSccZCEAekR984fMhJfaIs+Oo5IJzSuK4ha2cYZA0Abfv
 yR1boDQpLB3w44V+pyqykhPjYREzPCPFOzN0UL2nGkB92VQAW8lSmfAZUlQszGwvk9iE
 hp8ZO3kb2Xj76uy//HssJIQkcCQhbv2fJ2ZgqOjnsabOX8APjTMy+rMnXIDdoV9nhSoU
 LIrejgyCZpyOpATOn5nZV/JLAhcl0bpF+hAVvcGRloLJ6uaSrD0xfbSwQbuqLGSOAqhs
 VG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PPERkJDmUqGoRJFFlz2gKtkglfVn/RWj0tAIej+ZdiE=;
 b=GEdieCJMDEgbqSpxmtnJPCUKlvFj4KS4WYE268sdhgtT0od/izcIGWELG7UBrky3Lv
 H2GitGFCtMtElNI0QTfq26cqZZLRIL6LY2hxLua1Hidbuq448dv9FsOCchNFIaPiiHbB
 t0Z/uMFU5UQY/VV9G7XHtk3d5B4+JP/RGMxVF+a0xfdqfRyn8Q8MfftfgKkSxg2/1X2j
 wHEKC1IAI7DUah6wg2thP9fSZTeRijGs15JbyHT57l/ArjL1UmkF6K5L58Ue0RGOFMVM
 uq2XQDhjvyUhCSg+TXhHgGAdMBLkEPI5TW4Tn4Y7AWxqwTts5kGVe/NBFJ+z/o8bvhJd
 nIUw==
X-Gm-Message-State: AOAM531mZz/9wACe+1NeX15GiqfSzl8U70xqe3b/iMHi942yW7bvbskM
 lUuJEN9nbVh2VltNEk3tl/U9f9CrlvoiAE/gVn4=
X-Google-Smtp-Source: ABdhPJz6F+shkrmdHDJroNU389Y4xO819lFYsCQG85LzU0uSAHVf0Pu149/WHxn8436j5m8vlPMSZvLTUwVDR0kzFmY=
X-Received: by 2002:a02:908a:: with SMTP id x10mr17967649jaf.30.1627981702512; 
 Tue, 03 Aug 2021 02:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210802214645.2633028-1-krisman@collabora.com>
 <20210802214645.2633028-7-krisman@collabora.com>
In-Reply-To: <20210802214645.2633028-7-krisman@collabora.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 3 Aug 2021 12:08:11 +0300
Message-ID: <CAOQ4uxizX0ar7d9eYgazcenQcA7Ku7quEZOLbcaxKJiY0sTPLA@mail.gmail.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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

On Tue, Aug 3, 2021 at 12:47 AM Gabriel Krisman Bertazi
<krisman@collabora.com> wrote:
>
> This test corrupts an inode entry with an invalid mode through debugfs
> and then tries to access it.  This should result in a ext4 error, which
> we monitor through the fanotify group.
>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> ---
>  .../kernel/syscalls/fanotify/fanotify20.c     | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify20.c b/testcases/kernel/syscalls/fanotify/fanotify20.c
> index e7ced28eb61d..0c63e90edc3a 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify20.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify20.c
> @@ -76,6 +76,36 @@ static void trigger_fs_abort(void)
>                    MS_REMOUNT|MS_RDONLY, "abort");
>  }
>
> +#define TCASE2_BASEDIR "tcase2"
> +#define TCASE2_BAD_DIR TCASE2_BASEDIR"/bad_dir"
> +
> +static unsigned int tcase2_bad_ino;
> +static void tcase2_prepare_fs(void)
> +{
> +       struct stat stat;
> +
> +       SAFE_MKDIR(MOUNT_PATH"/"TCASE2_BASEDIR, 0777);
> +       SAFE_MKDIR(MOUNT_PATH"/"TCASE2_BAD_DIR, 0777);
> +
> +       SAFE_STAT(MOUNT_PATH"/"TCASE2_BAD_DIR, &stat);
> +       tcase2_bad_ino = stat.st_ino;
> +
> +       SAFE_UMOUNT(MOUNT_PATH);
> +       do_debugfs_request(tst_device->dev, "sif " TCASE2_BAD_DIR " mode 0xff");
> +       SAFE_MOUNT(tst_device->dev, MOUNT_PATH, tst_device->fs_type, 0, NULL);
> +}
> +
> +static void tcase2_trigger_lookup(void)
> +{
> +       int ret;
> +
> +       /* SAFE_OPEN cannot be used here because we expect it to fail. */
> +       ret = open(MOUNT_PATH"/"TCASE2_BAD_DIR, O_RDONLY, 0);
> +       if (ret != -1 && errno != EUCLEAN)
> +               tst_res(TFAIL, "Unexpected lookup result(%d) of %s (%d!=%d)",
> +                       ret, TCASE2_BAD_DIR, errno, EUCLEAN);
> +}
> +
>  static const struct test_case {
>         char *name;
>         int error;
> @@ -92,6 +122,14 @@ static const struct test_case {
>                 .error_count = 1,
>                 .error = EXT4_ERR_ESHUTDOWN,
>                 .inode = NULL
> +       },
> +       {
> +               .name = "Lookup of inode with invalid mode",
> +               .prepare_fs = tcase2_prepare_fs,
> +               .trigger_error = &tcase2_trigger_lookup,
> +               .error_count = 1,
> +               .error = 0,
> +               .inode = &tcase2_bad_ino,

Why is error 0?
What's the rationale?

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
