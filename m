Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EE03B7211
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 14:29:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17FB23C8D8F
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 14:29:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6AB8C3C1888
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 14:29:28 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 357131A00665
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 14:29:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624969765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FdTe+2V/Z5rEHp5X3lXXKvb3KMsaZYjBUyfWRByHiJI=;
 b=BCrxpRIrs5J5B4xQLhwzkJZ7wJ4wKUiHxHlR0XGPNSsfzZKYPRmaevDjozm7LK57DV6XHG
 iohZ1YGJCxVwYgwoXfafg/fqwYJizXzhJVdHfWaR8ozm8/yS5xmeKmODqi3kKYAakdpdz0
 r0/oV+iXPYg5wkkynWyZXHa9dNOzMYk=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-XJR8eHM-MNSQ3AsYP05j-A-1; Tue, 29 Jun 2021 08:29:23 -0400
X-MC-Unique: XJR8eHM-MNSQ3AsYP05j-A-1
Received: by mail-yb1-f197.google.com with SMTP id
 z64-20020a257e430000b0290550b1931c8dso20629993ybc.4
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 05:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FdTe+2V/Z5rEHp5X3lXXKvb3KMsaZYjBUyfWRByHiJI=;
 b=Y0WMadinzVCcS7gt51rbw8HSZuff+HohZy5ZQJSebiOSXN5PJxWNlwCASgFTaKkkpJ
 7DDFWsiLAr5mWOkwuhZX+0bTbIqLYz6GOcA6MvxldyBlXj7eN9pPf/881HM7xlXW6p9H
 me9Fur7lOzNbl0yaQxg7gt0aw7fOWGxlYhi/nqKvICdbs3U+RKXkPP8C6gFBj9qQ5z6D
 Coz4feX7ntBULO1mGu82e9W2uhOB9H5SCvsxxvr5REI32vSae+qmDOEDCJO7JCjqku5n
 3o20X/96Ir32PE1A5C9wmJLY0fO9YH6k/pXrhtpXJ/d6D5eIfibo54Gf/kgyh5BsrI0Z
 bU9A==
X-Gm-Message-State: AOAM533azfOV9CZVT939vI80REi2BQoCIFmQ5dsHbhOapFyv0DQ7qaRY
 gbjwsIzoCeoB06qD4idWd1hDVGjyrfgABbDMOAe2bb21dAo8CXbfcFbit9p2k0998rkPPYMaqY5
 /Jienz+laSw/i18G53HukvR6Ab/I=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr37640101ybg.86.1624969763420; 
 Tue, 29 Jun 2021 05:29:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8SUpdHX/uZwLWeE1do4ZCSnbPEFhxXkvf7SzfwAu2/+nMB0BmL1Z3mzs7La/uXW0n3CkK+fjLRUF+7zup6KU=
X-Received: by 2002:a25:b44d:: with SMTP id c13mr37640077ybg.86.1624969763270; 
 Tue, 29 Jun 2021 05:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAEemH2dL=bZdP_X+YkZuOFK2dCV8RTq5CyZYPTrKh+_2yjHK5g@mail.gmail.com>
 <1624965249-7087-1-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1624965249-7087-1-git-send-email-xuyang2018.jy@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Tue, 29 Jun 2021 20:29:11 +0800
Message-ID: <CAEemH2fcsimizmXWzQzavMWz4rOBVwznB9r7aPLgqasYcjfJqA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] lib/newlib_tests/test_macros*.c: Include more
 test macros
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
Content-Type: multipart/mixed; boundary="===============1110015132=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1110015132==
Content-Type: multipart/alternative; boundary="00000000000082c73a05c5e6c19c"

--00000000000082c73a05c5e6c19c
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 29, 2021 at 7:13 PM Yang Xu <xuyang2018.jy@fujitsu.com> wrote:

> 1) test TST_EXP_FD_SILENT macro in test_macros01.c
> 2) test TST_EXP_FAIL2 macro in test_macros02.c
> 3) test TST_EXP_PASS_SILENT macro in test_macros03.c
> 4) add test_macros04.c to test TST_EXP_PID and TST_EXP_PID_SILENT macros
>
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---
> v1->v2:
> 1.add more info for silent macro
> 2.replace scall string with function name
>

Acked-by: Li Wang <liwang@redhat.com>

-- 
Regards,
Li Wang

--00000000000082c73a05c5e6c19c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jun 29, 2021 at 7:13 PM Yang Xu &lt;<a href=
=3D"mailto:xuyang2018.jy@fujitsu.com">xuyang2018.jy@fujitsu.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">1) test TST_=
EXP_FD_SILENT macro in test_macros01.c<br>
2) test TST_EXP_FAIL2 macro in test_macros02.c<br>
3) test TST_EXP_PASS_SILENT macro in test_macros03.c<br>
4) add test_macros04.c to test TST_EXP_PID and TST_EXP_PID_SILENT macros<br=
>
<br>
Signed-off-by: Yang Xu &lt;<a href=3D"mailto:xuyang2018.jy@fujitsu.com" tar=
get=3D"_blank">xuyang2018.jy@fujitsu.com</a>&gt;<br>
---<br>
v1-&gt;v2:<br>
1.add more info for silent macro<br>
2.replace scall string with function name<br></blockquote><div><br></div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Acked-by: Li Wang &lt;=
<a href=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt;</div></div><=
div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D=
"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--00000000000082c73a05c5e6c19c--


--===============1110015132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1110015132==--

