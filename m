Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A703A3DE898
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 10:42:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6BC2A3C8133
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 10:42:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6C0753C2C99
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 10:42:29 +0200 (CEST)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D8F92600666
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 10:42:28 +0200 (CEST)
Received: by mail-io1-xd2d.google.com with SMTP id y1so233958iod.10
 for <ltp@lists.linux.it>; Tue, 03 Aug 2021 01:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3V77oViv0XYlTBqXdkkWQBA0edv1sYPU0QfQcSuYzf4=;
 b=RxS1gZtRwZXokDQnkjXJJLbRZQn3nDzXZZFERpLvf7HhCKx2jPxmv7p2Fdm5rLqspq
 sp911Ba6LIpHi8RPMEGc8WdlbQA4+CEBaeWEiAWvTsLOVEucvTDXqDL4D5aBnCv3bc77
 kJLFo4At1VD3j6J5dC2TUJkKQdZ9cZehvxGVhHX1ADWGszUZHwXjLmymFLTLawXusyTf
 qBZ1hCb0UtqDVraXqhZ6Ktw5YgLTWt97maSnQ6Qqlc6+sl7qnNyFcJWJlYw6BOtBf64A
 eI5r1yMn5re++vUqASEbjkyKLvnRa3xUjxLK8f51g+ah+9X0sJh16hqiReoeQq9DL2Wx
 B4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3V77oViv0XYlTBqXdkkWQBA0edv1sYPU0QfQcSuYzf4=;
 b=TY4lt0YprFSbPS5Ll98l9Ze6Nws6eAWSziLOuxsg/B/AkYAEb5b6iPCkm1bfZ2hhjm
 0mP8OJ6nnO2a0UOOs7DnUzfVoN68zTCzo2gj2hsLkYUI/FpBJltPKz4V8+SkkeZsyB6I
 5ZlDWS6JuA3uhVD3IJuszw4J8HPnVdmlcxKb6cNhX6lsErIpcJVnfngGfTdOs+JHUO2p
 O2juR/4hcjQQcb1dpmcbUtlG4T8Wu/7MdasVPdYN2KGApji4g7HCiEeyIvZHq8VJzraY
 4Qv3IGVllf+u5TxkT1ttgEAG7lx7OK+jEkeKfu5yUG1fOsFxm1XZQtTTMu5DvK1hueQb
 i7bQ==
X-Gm-Message-State: AOAM533jJz5Ub5Aw0Ezy19fVX75vGxTN4S7sruzZ1AxQi/ryoIg2LGF5
 a/u9jiPI+6fohbPr0PvBPwbxZaRcEs6gH1ZJRlQ=
X-Google-Smtp-Source: ABdhPJy6QwItcOMWcc2V/SuuX+hs6i/S/v6H58kQ5Zkck7Slb4U/vQol3er0yx1TUMKcx+Eb8dt1uSTXK+CT651wC5A=
X-Received: by 2002:a05:6638:1036:: with SMTP id
 n22mr14836075jan.81.1627980147689; 
 Tue, 03 Aug 2021 01:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210802214645.2633028-1-krisman@collabora.com>
 <20210802214645.2633028-3-krisman@collabora.com>
In-Reply-To: <20210802214645.2633028-3-krisman@collabora.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 3 Aug 2021 11:42:16 +0300
Message-ID: <CAOQ4uxhDUZND7Ak9vL-_vR50KSoewyKNzFsTsGP+UeDQmB2Rhg@mail.gmail.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/7] syscalls/fanotify20: Validate the generic
 error info
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
> Implement some validation for the generic error info record emitted by
> the kernel.  The error number is fs-specific but, well, we only support
> ext4 for now anyway.
>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> ---
>  .../kernel/syscalls/fanotify/fanotify20.c     | 59 ++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
>
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify20.c b/testcases/kernel/syscalls/fanotify/fanotify20.c
> index 50531bd99cc9..fd5cfb8744f1 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify20.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify20.c
> @@ -37,6 +37,14 @@
>
>  #ifndef FAN_FS_ERROR
>  #define FAN_FS_ERROR           0x00008000
> +
> +#define FAN_EVENT_INFO_TYPE_ERROR      4
> +
> +struct fanotify_event_info_error {
> +       struct fanotify_event_info_header hdr;
> +       __s32 error;
> +       __u32 error_count;
> +};
>  #endif

Those defines go in fanotify.h

>
>  #define BUF_SIZE 256
> @@ -47,11 +55,54 @@ int fd_notify;
>
>  static const struct test_case {
>         char *name;
> +       int error;
> +       unsigned int error_count;
>         void (*trigger_error)(void);
>         void (*prepare_fs)(void);
>  } testcases[] = {
>  };
>
> +struct fanotify_event_info_header *get_event_info(
> +                                       struct fanotify_event_metadata *event,
> +                                       int info_type)
> +{
> +       struct fanotify_event_info_header *hdr = NULL;
> +       char *start = (char *) event;
> +       int off;
> +
> +       for (off = event->metadata_len; (off+sizeof(*hdr)) < event->event_len;
> +            off += hdr->len) {
> +               hdr = (struct fanotify_event_info_header *) &(start[off]);
> +               if (hdr->info_type == info_type)
> +                       return hdr;
> +       }
> +       return NULL;
> +}
> +
> +#define get_event_info_error(event)                                    \
> +       ((struct fanotify_event_info_error *)                           \
> +        get_event_info((event), FAN_EVENT_INFO_TYPE_ERROR))

This helper and macro would be very useful in fanotify.h for other tests to use.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
