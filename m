Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7534AC25B
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Feb 2022 16:04:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 390603C9B3D
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Feb 2022 16:04:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1D9D83C986A
 for <ltp@lists.linux.it>; Mon,  7 Feb 2022 16:04:37 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4CE551000672
 for <ltp@lists.linux.it>; Mon,  7 Feb 2022 16:04:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644246274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ulkipSWuQUnYiIl8K2n0+p057P3+yI1Lu6lyw6MV9MQ=;
 b=Kd0y9XeDvQZKe4moxb1v9ApPepP7HiqyiIG1UMkFgDtg9TwbIDLBk+meIQ7ubfx72fT853
 9jyw02iG8VkFC9Uy4vK0MwQA3hxC2g4zHjRtzWQhK1kvJH2KH19DMPl9g9EJlfnzl1JHz0
 EouIgLHciRInAqtyVIbXGgKzDArnyYA=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-avr6o3URMfKOMbBAeJpCvQ-1; Mon, 07 Feb 2022 10:04:33 -0500
X-MC-Unique: avr6o3URMfKOMbBAeJpCvQ-1
Received: by mail-oo1-f70.google.com with SMTP id
 v10-20020a4ade8a000000b003177422e81dso2856120oou.3
 for <ltp@lists.linux.it>; Mon, 07 Feb 2022 07:04:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ulkipSWuQUnYiIl8K2n0+p057P3+yI1Lu6lyw6MV9MQ=;
 b=6873ykKqvrpqbz1crC46SP0kIyJafJnOU2ubVm+BIryx01ehDiTqkX678fHo/ikRnf
 4niFy1zIRdKrO4cOQzM3B6rs+HoM28VAN6bn4wwbazq3D6uZ5jW5skhyqYjAGXWKC6an
 xyRhZqPzzYG11SltlX5N/hK5BklNO+ch0aE5XDL/nzMNDvf5WzqygOQufTDLoANYoDX3
 w46sJkVxrCKduBvubQ6ZB+G3e0+yDbACWL8bzJ88xjui/OzsLksmeJMyv7h9GoAcbXY0
 uQv2oLyl6St5QqgWhKlGOZ2rLwDHbwUnQ0m2fDQz18EQoKSsE7mQNm7NV9u+pD+RWjli
 ETIQ==
X-Gm-Message-State: AOAM531nOEvL7zaB4THMiYJWp7UtJ3b8PpCMv+RqS/sG1GzbU4Ifh/M2
 6Sl5Ass86929UPcNkp4oY2N1b3yNhkQYpo7zxpQv3NcTubUL53dipj+Qu1DVpNIcNSwYmAhew7M
 atrBQy8+fiLn7JqC2Ly1ELYnlTow=
X-Received: by 2002:a05:6830:1493:: with SMTP id
 s19mr60505otq.85.1644246272434; 
 Mon, 07 Feb 2022 07:04:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxukxr7TSoi+wPNtEJhn+Tt4BCLhLgnMQoIVn+mMliPWenVUo5D+u9UsgXYu0kG7WaKaCdxKRyLyXZfP+yVbgk=
X-Received: by 2002:a05:6830:1493:: with SMTP id
 s19mr60488otq.85.1644246272122; 
 Mon, 07 Feb 2022 07:04:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643980361.git.jstancek@redhat.com>
 <c59ce5a253c3c8022fe465027c9310c29827ffa6.1643980361.git.jstancek@redhat.com>
 <YgEW0xQU46sy30uU@yuki>
In-Reply-To: <YgEW0xQU46sy30uU@yuki>
From: Jan Stancek <jstancek@redhat.com>
Date: Mon, 7 Feb 2022 16:04:16 +0100
Message-ID: <CAASaF6zg7tzXzH7PFMCMzzNfcfa1fZQzvt-88KzaMcj7PyrK4Q@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] syscalls/mkdir09: rewrite in new LTP API
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

On Mon, Feb 7, 2022 at 1:53 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> Hi!
> > +/*
> > + * Child routine which attempts to remove directories from the
> > + * test directory which do not exist.
> > + */
> > +static void test2(int child_num)
> >  {
> > -     /* Child routine which attempts to remove directories from the
> > -      * test directory which do not exist. Runs until a SIGTERM
> > -      * signal is received. Exits with an error if the proper
> > -      * error is not detected or if the remove operation is
> > -      * successful.
> > -      */
> >
>
> This empty line here looks a bit strange and the same for the test3().
> Other than that and the suggestion from Li it looks good.
>
> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

Thanks, pushed with suggested changes.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
