Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAC23DE92C
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 11:04:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8116C3C58AD
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 11:04:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4C7F93C245D
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 11:04:26 +0200 (CEST)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D675F200B8B
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 11:04:25 +0200 (CEST)
Received: by mail-il1-x135.google.com with SMTP id r5so18883625ilc.13
 for <ltp@lists.linux.it>; Tue, 03 Aug 2021 02:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qj2aAMaCKOkOv3pjuNvGaLuywLSjBRkzfGuW2WwxrvU=;
 b=GXcoo/MYpIuIhshrZOXb5tmNzVDbDzsHjUs6su3z6pmeH+vJFapVmYgll7/xhpAcLo
 0iTwdztjuQ2vy4uJY3tKdJaSi7rDYQnII23epgmnHPNp8DKQAzKq3Pdnsz8yrANdSXym
 QGNyb/bJTseedvnsK1KimIXg8XDhCEpJs8mOHfxkHO8Au00qLlR3ouNwglTnEwe6hXKy
 knt8F2rVxkRABak1buwtRjd0tTTWj0Vvrtht6v6ZmmAUbxBmC6k9scNBBBUUlg1FA+1T
 KnUcjv5uHQGIFbK3iU6PViWvqIkF2dSOrCKASOB2pwh0ktDV0v9gzm+Uml2z9GKEP7m6
 tG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qj2aAMaCKOkOv3pjuNvGaLuywLSjBRkzfGuW2WwxrvU=;
 b=MLICYxhwh6u8nW+RvBmigDtJ9rFPQqNJ//qj1i4O7akfniN1cGAQV2IbvNGqa8IyM6
 1lWN7clvUeYd8b0PLjtcYMC7tcmCqzRuK9yQuPnIrt984sBmDDycQvDQCvmlPViW92nm
 tkSu1axfM7eH8OTW6cx8IpkTBxsE5ja69Jq8p+CEF2XCnGMQYPAedpROONGQNDtlxUAp
 X2U3l6F1B3Y5nCiWeD0XxF2+5jrSEBp82ljY+31TbrRBrlNUGx6xUZiBWP/wXLIcS7L0
 +ltv+Rh5eAPvWkxqI0mp3T5mPwAV7azEuwTETQNZLlzf+rkBD0PKCX2p/rDY2BF7VoxO
 axyA==
X-Gm-Message-State: AOAM532efjRDp5/pfpm77kkXhYFcWyNioHcCkaxdHkX4AfiUzojE40c3
 f6p73nxnc6FYYROsWj496NPd2w769laAI1gAbZ4=
X-Google-Smtp-Source: ABdhPJywg/32gcJfmOoe0KUQKoC8WWd8mK2awKsaAOOxPey+N5VGaF0M8XLl//l/Naf3UX+dEJzFhaJFml2HvSRF/hU=
X-Received: by 2002:a05:6e02:1bcc:: with SMTP id
 x12mr900886ilv.275.1627981464743; 
 Tue, 03 Aug 2021 02:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210802214645.2633028-1-krisman@collabora.com>
 <20210802214645.2633028-7-krisman@collabora.com>
In-Reply-To: <20210802214645.2633028-7-krisman@collabora.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 3 Aug 2021 12:04:13 +0300
Message-ID: <CAOQ4uxg3MPfMeMPpzompend0n3rH3b1+fFbzUSHsMGRJX0ruEg@mail.gmail.com>
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

Better use fanotify_save_fid(MOUNT_PATH"/"TCASE2_BAD_DIR, &tcase2_bad_fid)

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
