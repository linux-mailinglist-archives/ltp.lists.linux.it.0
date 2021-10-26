Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A10D43ABCD
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Oct 2021 07:43:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9FBA53C6788
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Oct 2021 07:43:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 76D343C2A3D
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 07:43:48 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3A9FD1401232
 for <ltp@lists.linux.it>; Tue, 26 Oct 2021 07:43:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635227026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t+5sLBPTmT9TRALDnHUfzg8tbPisMf/w8OyYg6B9Qug=;
 b=QmnQTVzT7zeps35f1Dvrzhcx+3GfTKej4d36o1bGudr3zbo5YQF9ChngngPpXv4dAIsP2p
 fJv9VxXnG+K19EXdVALlXoIsONPnMhWSnUFLX8X9stCjdQYBXKaPl0n5LFY41PI5IwWWHZ
 /O90OXfFHiRVS39KuWFOL4xytRAxX6s=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-QEkAu9pzOxyOHpMYLo6SWw-1; Tue, 26 Oct 2021 01:43:44 -0400
X-MC-Unique: QEkAu9pzOxyOHpMYLo6SWw-1
Received: by mail-yb1-f200.google.com with SMTP id
 f92-20020a25a465000000b005bea37bc0baso21209865ybi.5
 for <ltp@lists.linux.it>; Mon, 25 Oct 2021 22:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t+5sLBPTmT9TRALDnHUfzg8tbPisMf/w8OyYg6B9Qug=;
 b=kxW5rbZAdaC+oQpjZT9Lpkeq0lWjUIBuqzD+54QZo99SELFHenkDX+W9wi9PHq0e4l
 i47n2GSTFNGoPImeP28cjB0ylRYvanFtcW1CrLFzGf6BQnbODUqqYcH3jHhCQ8Wh8U5v
 Oi5RwMhf4yCukzeFRC1KVycXlMArf/j4b+CvTXOP/xUgwP3MIYqASGuJRr1kna8b+41C
 h5EFEGSDSqnL5PljpWGoY6hvjhw2YHbZ/uDy5tepnO2U/SCx3Z2gJEHZZUFtsqg/gJSZ
 Rv41ZDWL8yWXxRsfUi8xHZ7GqSNb7QVguGtubtnV3fSShr/QYux4C4rt/kzZB/pAaSZ/
 wxXw==
X-Gm-Message-State: AOAM530HJXKTl0UbPY8cwXz32cCOddaIFKt8uOfA324DI1vQbGEZV4zU
 gjM2uYnts4ZdbXoSHhBpM1HcXIhgSBNixpKQJNcbreKSoWEfj0gv7r+eUBot211sqLKQM/ZEnkl
 R6sgcIZZ6mouOXrz59OyfAGfZsXo=
X-Received: by 2002:a25:b4c:: with SMTP id 73mr1842421ybl.316.1635227024319;
 Mon, 25 Oct 2021 22:43:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+JrEIDQBBaQ0X5khjxNFma/uhkmEIELghv2RsiTo3RTqPFOoxq8UPvbYYEBW1YnlSEKTY/8do4Oik8c8igm8=
X-Received: by 2002:a25:b4c:: with SMTP id 73mr1842410ybl.316.1635227024114;
 Mon, 25 Oct 2021 22:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211026052849.25944-1-tangmeng@uniontech.com>
In-Reply-To: <20211026052849.25944-1-tangmeng@uniontech.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 26 Oct 2021 13:43:32 +0800
Message-ID: <CAEemH2czvJptg3w-4h6nrKasbqtjJQF5BvhQWt5GGXpQ1+KF6w@mail.gmail.com>
To: tangmeng <tangmeng@uniontech.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] link/link02: Convert to new API
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
Content-Type: multipart/mixed; boundary="===============1401277002=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1401277002==
Content-Type: multipart/alternative; boundary="000000000000e65c1705cf3af5f8"

--000000000000e65c1705cf3af5f8
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 26, 2021 at 1:29 PM tangmeng <tangmeng@uniontech.com> wrote:

> Signed-off-by: tangmeng <tangmeng@uniontech.com>
>

Reviewed-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--000000000000e65c1705cf3af5f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Oct 26, 2021 at 1:29 PM tangmeng &lt;<a hre=
f=3D"mailto:tangmeng@uniontech.com">tangmeng@uniontech.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: ta=
ngmeng &lt;<a href=3D"mailto:tangmeng@uniontech.com" target=3D"_blank">tang=
meng@uniontech.com</a>&gt;<br></blockquote><div><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">Reviewed-by: Li Wang &lt;<a href=3D"m=
ailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</div></div><div><br></di=
v>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>R=
egards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000e65c1705cf3af5f8--


--===============1401277002==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1401277002==--

