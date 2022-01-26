Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FC549C585
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jan 2022 09:51:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E2D6E3C95FF
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jan 2022 09:51:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 944223C8D84
 for <ltp@lists.linux.it>; Wed, 26 Jan 2022 09:51:03 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 87E37600114
 for <ltp@lists.linux.it>; Wed, 26 Jan 2022 09:51:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643187061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3vHaSMCDBF6plMBfV8EikHugjJIjvP42G0Mo87cTfyg=;
 b=YbV1KXj9NDIuWyB4PZjbGyJCtpSnWzN0aqvgQtW8HvgJsHsBFJyJCGbsQMRccI72MNG4g7
 xYrLBGAxV3RK3hyrErRCa7e/PaKmc6/Fwp7tKsssUx5zH53tidLxWTckpmh3gSYaP6RfKt
 KXlipGdOdye9fS3SSLpAoJemokmkIZw=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-D3djB_iZPPSS34fYKrE-xQ-1; Wed, 26 Jan 2022 03:50:59 -0500
X-MC-Unique: D3djB_iZPPSS34fYKrE-xQ-1
Received: by mail-oi1-f197.google.com with SMTP id
 v204-20020acaded5000000b002c896f409c4so12898084oig.6
 for <ltp@lists.linux.it>; Wed, 26 Jan 2022 00:50:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3vHaSMCDBF6plMBfV8EikHugjJIjvP42G0Mo87cTfyg=;
 b=Nqb5JWS0lSaePX68Bi6uCpTCd7wRXYuVzpSnjBEDVKJkh7c8BYUHbM7051xbG93hoB
 UUi8lYwRp/ST8TyGlBL2yEg/oXfnBbB5fIc4JFXWtGXDcsO+sTd6SUdUA8G7hmVhGGCc
 P/KkZGyOppQwl2Lxuhm0w1EZcYLKskrqlJqnzZ1kla2ldb7JO+gcp98/NqHSdVj4eVeW
 e1mZn3+SRU3ssZx96N+meJdOgVkKo59CkdpCUrw5YbBfeQIQtlQpHel7V3IscmlJ2De1
 xbry0fLbqnoLn1JZuMTfbQLt/XeABg0HZ47eV+5wMwbujCodTjih5beKxffV789qFFqH
 pypw==
X-Gm-Message-State: AOAM533q4Zhqev/ky7f6+xQNYyBXiULIN9ZbPaAlY9vSrcrXIvkh/PUw
 Xwq6r1DYpz4zbQAmJJQOoK4FDz25A1oFCSEe4bWZOy5O/QjYccYoFYf6/wzzDEhg0ZQqaHlyoSS
 GNPKXAMGgddYDZ+TPuesTwGLXEXk=
X-Received: by 2002:a05:6808:1445:: with SMTP id
 x5mr3186935oiv.339.1643187058948; 
 Wed, 26 Jan 2022 00:50:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybVtcBMfWpMOpfLzIfFUqwEi6Q7188Se5jReJoFU02mQM15kVxNQZr0CNCO8mUNWd38o237BCWhgQ7JXtAWhs=
X-Received: by 2002:a05:6808:1445:: with SMTP id
 x5mr3186922oiv.339.1643187058579; 
 Wed, 26 Jan 2022 00:50:58 -0800 (PST)
MIME-Version: 1.0
References: <20220125131655.10072-1-andrea.cervesato@suse.de>
In-Reply-To: <20220125131655.10072-1-andrea.cervesato@suse.de>
From: Jan Stancek <jstancek@redhat.com>
Date: Wed, 26 Jan 2022 09:50:41 +0100
Message-ID: <CAASaF6xt9b5YPnz2AA51GJMXswpk1PWg2zgyAp=42syhkXQX=A@mail.gmail.com>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Rewrite process_vm_readv02.c test with new LTP
 API
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

On Tue, Jan 25, 2022 at 2:17 PM Andrea Cervesato
<andrea.cervesato@suse.de> wrote:
>
> Removed pipe and replaced with shared memory.
> Replaced TST_CHECKPOINT_INIT usage with .needs_checkpoints from the new
> LTP API.
>
> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.de>

<snip>

> -static void child_invoke(void)
> +static void child_invoke(const char *data, int length, pid_t pid_alloc)
>  {
> -       char *lp, *rp;
> -       char buf[BUFSIZ];
> +       char *lp;
>         struct iovec local, remote;
>
> -       /* get addr from pipe */
> -       SAFE_CLOSE(tst_exit, pipe_fd[1]);
> -       SAFE_READ(tst_exit, 0, pipe_fd[0], buf, BUFSIZ);
> -       SAFE_CLOSE(tst_exit, pipe_fd[0]);
> -       if (sscanf(buf, "%p", &rp) != 1)
> -               tst_brkm(TBROK | TERRNO, tst_exit, "sscanf");
> -
> -       lp = SAFE_MALLOC(tst_exit, len + 1);
> +       lp = SAFE_MALLOC(length + 1);

Seems we don't need that "+ 1", since we copy and compare only 'length',
but that's just a nit.

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
