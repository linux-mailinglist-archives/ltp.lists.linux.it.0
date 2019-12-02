Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 488C310E4ED
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Dec 2019 04:57:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 18C873C2463
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Dec 2019 04:57:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id BD0133C242E
 for <ltp@lists.linux.it>; Mon,  2 Dec 2019 04:57:31 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id A30201000B09
 for <ltp@lists.linux.it>; Mon,  2 Dec 2019 04:57:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575259048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pyv8nRtXP0tP2BH+Vpc6psKvSry1ra/9SZ3Fv2xBADc=;
 b=Crp5WF6OGI+jYozF+ULegCJU/HqW0xXsjDb1YdnfghgLnqcmr38fchL8VrdpGVxdiZCS4h
 g/CB5yFuBtTqhjfIL8AF42uxTOyxKXS8kFERPhVBENP0FqkYrRDjRW1t0Ibo0GLlnX1vrq
 ELAAJKH80KnfXG6rH4o5TKrVaS37FgI=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-kMupi3xYO9OkMzmVly_0oA-1; Sun, 01 Dec 2019 22:57:27 -0500
Received: by mail-oi1-f198.google.com with SMTP id z143so17709066oia.20
 for <ltp@lists.linux.it>; Sun, 01 Dec 2019 19:57:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p5rZUsZaXQ284nixUN+dLUviiXuVVk1mVMz6K6QORsk=;
 b=Xit7uf2QPQMAWgttrHzwCOcU2BRN2hJC3vU58NcNaMQvfNX+nXg6HEknvBch3MUzHS
 VHz2OSev+k5bbz2xcjN3d+FmD+FmIInyNvTCoS1hP58auQUA9uYlV3TB3/QO4b4okkzv
 dw4wfLD8o6EXuf/16l8JIbdj5PyfOuJ/slFFC0AA/pEjhJqMpUr5xQ7oIxOUqFWIaVB7
 GIoqZyIi0sx4ZsPxsT6CQcAWpANKLzafXBcjekp8qzC9SKAzI7L8uncZRO6qGXbbKMW4
 NI1QvOVGy8ISq9ABUZwpBs/I8u4E/Z94r98boS65ydq4b0MSCA48Cb6FYxRDELw3S6ay
 LZrQ==
X-Gm-Message-State: APjAAAWaR8onCm1cc2/HQJlFXQ/+Jed/+Ask4/2yUFwmSpaFdDbRUKnU
 WFRrfFWcaVqA/ASZtt6nA2BN/nrHmXB24cP+UpQkQSp6avIC+eXMyQHvHq/01qKVBD7THnLPAWz
 +FWUbjza/tX+LPTQjnZZCsjra7sM=
X-Received: by 2002:a54:4f8e:: with SMTP id g14mr21659636oiy.144.1575259046787; 
 Sun, 01 Dec 2019 19:57:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqwrwmOz+2XGeFHW+dhgf72zWH4VK+6jBBalbkseqjYxkFPFywf/K2+OhmvYCY/kt5tGnnF3uA9dtSij9GdqVXQ=
X-Received: by 2002:a54:4f8e:: with SMTP id g14mr21659632oiy.144.1575259046531; 
 Sun, 01 Dec 2019 19:57:26 -0800 (PST)
MIME-Version: 1.0
References: <20191128163147.4377-1-mdoucha@suse.cz>
 <20191202032936.GA32335@dell5510>
In-Reply-To: <20191202032936.GA32335@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Mon, 2 Dec 2019 11:57:15 +0800
Message-ID: <CAEemH2d03WLKxJNap2fzMPhEoVQH3EkEQGgwTVCOZxuf+-fOZA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-MC-Unique: kMupi3xYO9OkMzmVly_0oA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Unshare KSM pages before setting max_page_sharing
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
Content-Type: multipart/mixed; boundary="===============0956137061=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0956137061==
Content-Type: multipart/alternative; boundary="000000000000e5faf40598b09314"

--000000000000e5faf40598b09314
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2019 at 11:29 AM Petr Vorel <pvorel@suse.cz> wrote:

> Hi Martin,
>
> > Setting max_page_sharing is possible only when there are no KSM shared
> pages
> > in the system. Otherwise writing to max_page_sharing SysFS file will fa=
il
> > with EBUSY.
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>

Pushed.

>
> Good catch!
>
> BTW at least ksm01 will fail on VM host with running VMs,
> but that's another story not related to this patch.
>

AFAIK, KSM is mainly designed for VMs pages merging. It seems the LTP ksm
test can't run in parallel too, they are suggested to be the only test
without any other ksm-test running in the background. Because ksmd does not
distinguish which process the pages belong to, it just does merging and
counting work in total for the whole system.

If we run ./ksm01 & ./ksm01, it will also fail like below I think.


>
> mem.c:251: FAIL: pages_shared is not 1 but 3629.
> mem.c:251: FAIL: pages_sharing is not 98302 but 113789.
> mem.c:251: FAIL: pages_volatile is not 0 but 12.
> mem.c:251: FAIL: pages_unshared is not 1 but 48519.
>


--=20
Regards,
Li Wang

--000000000000e5faf40598b09314
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Dec 2, 2019 at 11:29 AM Petr Vorel &lt;<a h=
ref=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Martin,<br>
<br>
&gt; Setting max_page_sharing is possible only when there are no KSM shared=
 pages<br>
&gt; in the system. Otherwise writing to max_page_sharing SysFS file will f=
ail<br>
&gt; with EBUSY.<br>
<br>
Reviewed-by: Petr Vorel &lt;<a href=3D"mailto:pvorel@suse.cz" target=3D"_bl=
ank">pvorel@suse.cz</a>&gt;<br></blockquote><div><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Pushed.</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
Good catch!<br>
<br>
BTW at least ksm01 will fail on VM host with running VMs,<br>
but that&#39;s another story not related to this patch.<br></blockquote><di=
v><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">AFA=
IK, KSM is mainly designed=C2=A0for VMs pages merging. It seems the LTP ksm=
 test can&#39;t run in parallel too, they are suggested to be the only test=
 without any other ksm-test running in the background. Because ksmd does no=
t distinguish=C2=A0which process the pages belong to, it just does merging=
=C2=A0and counting work in total for the whole system.</div></div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">If we run ./ksm01 &amp; ./ksm01, it wil=
l also fail like below I think.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
mem.c:251: FAIL: pages_shared is not 1 but 3629.<br>
mem.c:251: FAIL: pages_sharing is not 98302 but 113789.<br>
mem.c:251: FAIL: pages_volatile is not 0 but 12.<br>
mem.c:251: FAIL: pages_unshared is not 1 but 48519.<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--000000000000e5faf40598b09314--


--===============0956137061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0956137061==--

