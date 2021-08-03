Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A02B43DE907
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 10:56:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 60E5C3C8131
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Aug 2021 10:56:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C81CE3C2DBE
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 10:56:43 +0200 (CEST)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 702D7600956
 for <ltp@lists.linux.it>; Tue,  3 Aug 2021 10:56:43 +0200 (CEST)
Received: by mail-io1-xd2c.google.com with SMTP id r6so15168918ioj.8
 for <ltp@lists.linux.it>; Tue, 03 Aug 2021 01:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7SsFV2iOXhu6gJLnc6G6fBI8/OQbVqmopZT5kD/FcIs=;
 b=hahqrRRSNDxZMk6jEqqdCYQMZnmFhozTgz/v2l2OyEpN0XE9axp4g+uUg0B4IVXtJl
 F8FojYZGy7QoKv/o8/73A+2islxAtMxqrWMb0vHD0d5rixpjAWEwIOlA8uA7ClO4eOtH
 v0WfzPwU+iE+doh5PSZDmUV6dFXL9OIR0cV3p1ehfyw0azdChf3HbahiTMbi1N/PKZks
 WXJfjhngcQa70rOz3AVDuROoTuHCogbGDL3nnpogMQh0fINLmn6ZiZQDw2hRxGH7Pe4K
 JeIGAXr/FRFQ+yBHyVYmbjmRzsuRA/q5XVIj1y3pzhmLI+eEA7ge+hA2IJu/rXe6we8E
 yQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7SsFV2iOXhu6gJLnc6G6fBI8/OQbVqmopZT5kD/FcIs=;
 b=OdOp22i6b4Uo+jZbtFdF+XJh359mXcRfrIzO0S4UCQCM+Bo0iFqzfJ8Do4tzhF17RN
 5yZiz8fO8DHAVM10673cIkCvuI5pe8HCGl7+wlph7MLJfGQh/MayQhtWQIRYiVBC6iNJ
 kvRrSxjBYEZkpMWrf0neYKyGeJLORCgJPiR9JdqlpPu1HzOHA0XgsbOMhcOsNaM8hHKq
 gq+ZMpYfo0QDUN1u/jC90/A8KJK/Ofufia21j85R7GwIh9SrG0UmDyzfThFFz3OdYOJX
 H/eV7m092P3f4hG3OAt0sGADPp7k2fD6SYEK/LVetBAKGxAQhriwV4lB+Oj3jmZ90hOa
 UV4A==
X-Gm-Message-State: AOAM531i3J4JONgES+qXZq0Zt2nCtwRNGgRiiHwshsvVE+QDGbmrn818
 EofCvn6IQB7GQdqbMhECjqU1smpWLb4pHrh+fAE=
X-Google-Smtp-Source: ABdhPJy0vwWcnNizvdeVjYXwq4nHkZgMGj0gupr2wyZ17s8UZye0j+4lfNn2qmtR3XhFEfpxNQ3Mj9FxzlZaECwRnPo=
X-Received: by 2002:a05:6638:1928:: with SMTP id
 p40mr4348179jal.93.1627981002326; 
 Tue, 03 Aug 2021 01:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210802214645.2633028-1-krisman@collabora.com>
 <20210802214645.2633028-4-krisman@collabora.com>
In-Reply-To: <20210802214645.2633028-4-krisman@collabora.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 3 Aug 2021 11:56:31 +0300
Message-ID: <CAOQ4uxjMfJM4FM4tWJWgjbK4a2K1hNJdEBRvwQTh9+5su2N0Tw@mail.gmail.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/7] syscalls/fanotify20: Validate incoming FID in
 FAN_FS_ERROR
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
> Verify the FID provided in the event.  If the testcase has a null inode,
> this is assumed to be a superblock error (i.e. null FH).
>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> ---
>  .../kernel/syscalls/fanotify/fanotify20.c     | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify20.c b/testcases/kernel/syscalls/fanotify/fanotify20.c
> index fd5cfb8744f1..d8d788ae685f 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify20.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify20.c
> @@ -40,6 +40,14 @@
>
>  #define FAN_EVENT_INFO_TYPE_ERROR      4
>
> +#ifndef FILEID_INVALID
> +#define        FILEID_INVALID          0xff
> +#endif
> +
> +#ifndef FILEID_INO32_GEN
> +#define FILEID_INO32_GEN       1
> +#endif
> +
>  struct fanotify_event_info_error {
>         struct fanotify_event_info_header hdr;
>         __s32 error;
> @@ -57,6 +65,9 @@ static const struct test_case {
>         char *name;
>         int error;
>         unsigned int error_count;
> +
> +       /* inode can be null for superblock errors */
> +       unsigned int *inode;

Any reason not to use fanotify_fid_t * like fanotify16.c?

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
