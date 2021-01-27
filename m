Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC60305C6F
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 14:06:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D1A43C7A21
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jan 2021 14:06:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id BD0253C4FA4
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 14:06:09 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id BEB43200B96
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 14:06:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611752767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BLb/kiKW+mioDi+o+N0gMnScrh4LRPnO3c8eA6KEo64=;
 b=Ht4fmfzY1jfbyZVb6yjHRi9gL70vTbTEmhSC9idTZ8mBfqS+rvoIpr1ZYUOYVHVQs6dxxn
 WyS8Q0eAvlAe7p2AxC3etJ+KNhJV3k15Bq2hrS6zjM/s9Shq8Wlnirpqe1DO3J7rAm3/v8
 aCmdgbtAzzgyKqEWqu1u/M/c9p7WucY=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-TeLgdvGrOguwNNU1VzP3vg-1; Wed, 27 Jan 2021 08:06:04 -0500
X-MC-Unique: TeLgdvGrOguwNNU1VzP3vg-1
Received: by mail-yb1-f198.google.com with SMTP id c12so2290970ybf.1
 for <ltp@lists.linux.it>; Wed, 27 Jan 2021 05:06:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BLb/kiKW+mioDi+o+N0gMnScrh4LRPnO3c8eA6KEo64=;
 b=M2got9zqEnXoc4z2EBn8wCIUqshghMGD5YDxvQwfADFylPl9Ac8l0M4c2rS/jkR7nq
 WyUNVDaZu4znBqk01fvjVymlwZ18ZhO4it3KifGzzkRpQYFRPxrJNJIWT73sZ6iyJev9
 XPsBXxbkIDMoqdI6BPswfAtVLYOY7UPRYoEOlHOOIxQVibZXZkj1ZCyphD565Zm6xDxt
 tKHiI6oEli8MpiCGxk7HwSGIYXQXCFI2f1E/23lZs1c6eA5YtXZShbYkRCT8sObroQJl
 U4LfwLOdBPpiioVEB175FVRorDS/drRFzqjpPdQObCkiXEeKlRWhBdkD9qbILd2lNoYt
 1ZuA==
X-Gm-Message-State: AOAM532mMn8bgudFYnU4Ix+t4Aygp8xZZk6KgjI5CPd6HfEpjxsJ73AH
 QqW79MzBJmjvu5noUz9gkdgzYgKNNF+B8qVokx8eYNvhMo6bX/WJoEzKAvRv03EGk9P7/nvvwey
 ED1oBz7MhYEiSWg2rQuhy96s9zt0=
X-Received: by 2002:a25:1646:: with SMTP id 67mr4773573ybw.97.1611752764419;
 Wed, 27 Jan 2021 05:06:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfd7x61VyWvuf81X734W8VFJLcOoqfiESd45H4UpauCTjIAZC6P1arP+pVAzYX3urvmPcgFeYUsOWdrWluL6k=
X-Received: by 2002:a25:1646:: with SMTP id 67mr4773552ybw.97.1611752764206;
 Wed, 27 Jan 2021 05:06:04 -0800 (PST)
MIME-Version: 1.0
References: <20210127115606.28985-1-mdoucha@suse.cz>
 <YBFWrJoS1tVmWGFx@yuki.lan>
 <2021012720143348660139@chinatelecom.cn> <YBFcc/lc+KkC49Gq@yuki.lan>
In-Reply-To: <YBFcc/lc+KkC49Gq@yuki.lan>
From: Li Wang <liwang@redhat.com>
Date: Wed, 27 Jan 2021 21:05:52 +0800
Message-ID: <CAEemH2fe3qA230XhkU3Jwt52gcX0mRXj8XULjwjYzeq4v1rRog@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fix tst_pollute_memory() safety margin for huge
 systems
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
Cc: ltp <ltp@lists.linux.it>,
 "liuxp11@chinatelecom.cn" <liuxp11@chinatelecom.cn>
Content-Type: multipart/mixed; boundary="===============0175451705=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0175451705==
Content-Type: multipart/alternative; boundary="000000000000fa05a305b9e16ec3"

--000000000000fa05a305b9e16ec3
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 27, 2021 at 8:27 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > According my test,malloc amount greater than available memory,then
> invoke the oom-killer.
>
> However that does not mean that allocating MemAvailable or slightly less
> than MemAvailable is safe. In fact it's not, at least that I've been
> told be kernel developers. I will try to figure out something safe
> enough with their help.
>

If we only hope to avoid trigger OOM during allocating until the
MAP_FAILED, I think the knob 'proc/sys/vm/overcommit_memory'
maybe helpful.

e.g.

  set overcommit_memory = 2, overcommit_ratio = 85 or 90;
  ... memory allocating as much as you can ...
  restore the value of overcommit_*

-- 
Regards,
Li Wang

--000000000000fa05a305b9e16ec3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jan 27, 2021 at 8:27 PM Cyril Hrubis &lt;<a href=3D=
"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; According my test,malloc amount greater than available memory,then inv=
oke the oom-killer.<br>
<br>
However that does not mean that allocating MemAvailable or slightly less<br=
>
than MemAvailable is safe. In fact it&#39;s not, at least that I&#39;ve bee=
n<br>
told be kernel developers. I will try to figure out something safe<br>
enough with their help.<br></blockquote><div><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">If we only hope to avoid trigger OOM dur=
ing allocating until the</div><div dir=3D"ltr"><div class=3D"gmail_default"=
>MAP_FAILED, I think the knob &#39;proc/sys/vm/overcommit_memory&#39;</div>=
<div class=3D"gmail_default">maybe=C2=A0helpful.</div><div class=3D"gmail_d=
efault"><br></div><div class=3D"gmail_default">e.g.</div><div class=3D"gmai=
l_default"><br></div><div class=3D"gmail_default">=C2=A0 set overcommit_mem=
ory =3D 2, overcommit_ratio<span class=3D"gmail_default"> =3D 85 or 90;</sp=
an></div></div><div><span class=3D"gmail_default">=C2=A0 ... memory allocat=
ing as much as you can ...</span></div><div class=3D"gmail_default" style=
=3D"font-size:small">=C2=A0 restore the value of overcommit_*</div></div><d=
iv><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"=
ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000fa05a305b9e16ec3--


--===============0175451705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0175451705==--

