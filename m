Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BE56143AE00
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Oct 2021 10:30:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8F2613C6762
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Oct 2021 10:30:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3C3CF3C665E
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 10:30:16 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 98E441000A6C
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 10:30:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635237014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hyC8h1F1eDMUzkSUXDn0M/4yP5eZZI8pX/7M4JCEtvk=;
 b=A+YDQBDBIgNgPz3+MDh1JBscxgmW0l4Ra5hqfzXEsvOYlQTY4q/2s92VcqE+Xpz9UId4ee
 JD+0gs+xG4UydIeIbX/GPc1lmkg/d0SXOBfKHMk8SOTRQTyhPMnzQQZAe2VZXUe2rmgOJl
 SG2BkKL3Rw2rfH/Pah7eZpoRkAlxamM=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-lBHi5-iqP0S8CKldYKN0kg-1; Tue, 26 Oct 2021 04:30:12 -0400
X-MC-Unique: lBHi5-iqP0S8CKldYKN0kg-1
Received: by mail-yb1-f199.google.com with SMTP id
 x68-20020a25ce47000000b005c198858e6bso5177398ybe.21
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 01:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hyC8h1F1eDMUzkSUXDn0M/4yP5eZZI8pX/7M4JCEtvk=;
 b=Xuq4jJ00+S6AKrK9r3C4UwsKl5T6svu6D+YHQuakp6rXNPbycc4Oy1D8hdJu4jBVHA
 WYXV5XTfS179JF8doAK7v0zB7xBmnu3HNlA6Sa6vC0HzuXSN7bNTcIxfaBH9bYLUrxYq
 Pss2bY2pq/Ah19dKHDIfyk0wdKF5+2Bf54tcCcIQd6EtBuFY0duG/HQqcAZGQfxXTP0c
 ZR/Rwn/a6NYo8hNtLjRySROV6o6bBddhVCq70NW9nZpt9rQxLNlDpMAS67CpyBTMSnRR
 AJ1/HHfpDp7u9a5AXPLLI73WQ1GfUYaVZ0BFwoA/D71t+6xXkwSSJqy6kR3zWmb5H8tv
 drDA==
X-Gm-Message-State: AOAM531zcl05iVktnUKwCLduK/g7rdS/Rmh3c8UTfQkhK+5ey/RvCwr+
 tCsK3GZT8ozHYcMOeErnuz9E/3zfWr6FYpOmVOCvLWVeUyVmAE9nvOgdykam/LlVlPfFYaebg5t
 irZvN8OXUOOieDWU1Mv/7yDerwTw=
X-Received: by 2002:a25:5607:: with SMTP id k7mr1376454ybb.425.1635237012046; 
 Tue, 26 Oct 2021 01:30:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzc7aJbkNXLGMG4/Il66/JMMGZGHU3RSQpMlKPsd7br13SueUZ0A6kljG3+F2I7JecQADp+eYM6stASxWBVnIk=
X-Received: by 2002:a25:5607:: with SMTP id k7mr1376438ybb.425.1635237011814; 
 Tue, 26 Oct 2021 01:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211025160134.9283-1-chrubis@suse.cz>
 <20211025160134.9283-7-chrubis@suse.cz>
 <CAEemH2dQcUW5k3Rv-n3=CrznqwpFta3P28QrB0oVZPZH6PyNuw@mail.gmail.com>
 <YXeqxPwYuAVvrMdv@yuki>
 <CAEemH2eGMNYRDo8drkEesqqBG1HfNAX2O=WPenCa1W0v-S-Lmg@mail.gmail.com>
 <YXe0owmFqLAYkJwo@yuki>
In-Reply-To: <YXe0owmFqLAYkJwo@yuki>
From: Li Wang <liwang@redhat.com>
Date: Tue, 26 Oct 2021 16:29:58 +0800
Message-ID: <CAEemH2fFq0dDhx9zHA=+Yt2OLVZ5VLDnRdxmLgnPE90tyNBrdA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 6/6] lib: Add tst_set_runtime() & remove
 tst_set_timeout()
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
Content-Type: multipart/mixed; boundary="===============0918000309=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0918000309==
Content-Type: multipart/alternative; boundary="0000000000003695f905cf3d497c"

--0000000000003695f905cf3d497c
Content-Type: text/plain; charset="UTF-8"

>
> Ah, right, that should be fixed. Anything else that should be fixed?
>

No more from my side, the rest looks quite good.

-- 
Regards,
Li Wang

--0000000000003695f905cf3d497c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
Ah, right, that should be fixed. Anything else that should be fixed?<br></b=
lockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-si=
ze:small">No more from my side, the rest looks quite good.</div></div></div=
><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000003695f905cf3d497c--


--===============0918000309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0918000309==--

