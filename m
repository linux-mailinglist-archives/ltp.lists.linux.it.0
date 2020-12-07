Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4349D2D1314
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 15:07:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F11F43C6289
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Dec 2020 15:07:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 8A30E3C2C7F
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 15:07:15 +0100 (CET)
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C788A600A62
 for <ltp@lists.linux.it>; Mon,  7 Dec 2020 15:07:14 +0100 (CET)
Received: by mail-il1-x142.google.com with SMTP id k8so12256684ilr.4
 for <ltp@lists.linux.it>; Mon, 07 Dec 2020 06:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ofbU7rGxXqunGkuuM456XHXErx0E76yhEdy+Dtt0vRU=;
 b=ZGgkKXsnVR0LAEalCYKLTrs62aarro85gNwXy7tJk4CZdQ2tDNJZIiPd0bHLxF6f32
 Fu8VGToYRJSyeHYVzQdYMNr0ARsgFrZNhi2jgZAuS7o/UKJ8eUbVuiX269H+DcR7BjRL
 I5e3U4ChR29bsvL5oKCGPSZ1uQdjJ3DGjnARnbeoQxTZ+3OM+U00vcl/TtXwTGC6Z3G/
 aiksH9+eVtuMQlp67BZAZFwqizAz/wupmbxMTkfWIFuyqBK4OOUURoH/BrN5azdza+Eo
 yi7iGoo2E4JLC002/uGBPtRW5DGpNZUnRP6l0FH5V5eEuU6R5GnAAirVPhHOcu7Zsfdw
 IQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ofbU7rGxXqunGkuuM456XHXErx0E76yhEdy+Dtt0vRU=;
 b=TpkpUZOd3aJjuJFRHs9aaDXU3RVJq2LaFsRj/g3LU/Idju5xl4kG/ozzMU/kJAfpC1
 N77XQONvqytcY5DgfLZEjCNWivz7UzcWb4D1k9ynhLjs5gRF+de9NBlVg8zCPsitMG80
 RAu4owxjVs4/6uZ79WD93MzMnwWYJS7US3WyG/nDGv36jST5dnAPxS+wLEYgPeuVksBP
 ABkXemfK9PRNSJhb5Gd5AEP8KGQMY9oh7gvduuI/Cosp4Rqi8SmoBizLQKGGIt3mTpj1
 8Za/UTk2cUjCA40kPqUTdAuXK9lsIOlC0JDCzNuRhUHywxb5W/3+0Xjt4ty7jHo2/K27
 49IA==
X-Gm-Message-State: AOAM533LSOI47VkfEAcV8BvzjuFvbVT20Zk98SKSuJC8r5GUeWzvCVx2
 L/x6V58ikCXjegM8caq2j9I6li+R/XaWdnQT4n/B062KDrs=
X-Google-Smtp-Source: ABdhPJzsoVcN7JGcWWg5iw5xf88JWWNWTuqzBvIvUXnD7qbGMs9B4iS3VPdXNczpjNYUSAw0vF+V9BnssmEQ69iDicQ=
X-Received: by 2002:a92:6403:: with SMTP id y3mr22068342ilb.72.1607350033604; 
 Mon, 07 Dec 2020 06:07:13 -0800 (PST)
MIME-Version: 1.0
References: <20201204095930.866421-1-amir73il@gmail.com>
 <20201204095930.866421-4-amir73il@gmail.com>
 <X84VqaD4+FqAix5h@pevik>
In-Reply-To: <X84VqaD4+FqAix5h@pevik>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 7 Dec 2020 16:07:02 +0200
Message-ID: <CAOQ4uxiCtAJVyVau3un2AnMNmn1Yub18sG10YopLRySmLAcpnw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/5] syscalls/fanotify09: Read variable length
 events
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
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Dec 7, 2020 at 1:44 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Amir,
>
> > In preparation of testing events with filename info, teach the
> > how to read variable length events and parse the name info.
>
> This commit broke umount() on old kernels. (LTP lib doing multiple attempts is
> useless here). Not sure what exactly is being used, it's not by staing in
> mounted directory. Any idea how to fix it?
>

--- a/testcases/kernel/syscalls/fanotify/fanotify09.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
@@ -265,6 +265,7 @@ static void test_fanotify(unsigned int n)
        for (i = 1; i < NUM_GROUPS; i++) {
                ret = read(fd_notify[i], event_buf, FAN_EVENT_METADATA_LEN);
                if (ret > 0) {
+                       event = (struct fanotify_event_metadata *)event_buf;
                        event_res(TFAIL, i, event, "");
                        if (event->fd != FAN_NOFD)
                                SAFE_CLOSE(event->fd);

The fix exists in the following patch, therefore I did not notice the
mid series regression.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
