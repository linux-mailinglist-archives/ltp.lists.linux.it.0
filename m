Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C4010C3D3
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 07:10:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6CD7D3C2275
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Nov 2019 07:10:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 8B53D3C1836
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 07:10:19 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 75D9E1A01A67
 for <ltp@lists.linux.it>; Thu, 28 Nov 2019 07:10:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574921416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LLJMQSxq9jB6jeQfdjuQQssrAbAGhZtxiHKw5z669nI=;
 b=QgmnJyCRgZzgYakv3DpnuFc0krUl26Xpz0fvhkPT/ec7hc9wMx5SuBjs7VLpC7JxBO+j+m
 6PYMx2lIbKazIE2ytvPX3zaLtWqAOkVofOdQrOuzGGyw3pCogIV33ZNKYuM4U5ylplqAb5
 fdRkEwhc42bZLxbq6+Ara6KS920Vwbc=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-CmAMypXgMICcszeQdcj4-w-1; Thu, 28 Nov 2019 01:10:13 -0500
Received: by mail-ot1-f72.google.com with SMTP id h15so13126919otr.11
 for <ltp@lists.linux.it>; Wed, 27 Nov 2019 22:10:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VlbMPl2TMWCd8otgTXNUg6ConYAfzh16AXfM5VrMqaQ=;
 b=CNnDxqZfxj/wqEOdcpzAgGKVuAzamrgoag51H9c5bwXM5SzglaBssQVgICjwBtFjtH
 iDVMqDFgaolKnOel5SZ9bjAVzQpz5iMXnDoJ4P6utEbrzu01Xplq6e/yQScDOJEGoWRS
 /cVN8rt8fhTTBqd0rbLPKl/4KTcQOlcD17Um0BzsvACNHYo24ERUN5fVUkj3XOp3sqDb
 PWCo/qEw5je/mAMSCfwLJ7Gbqi7gVHGF2vMt4nIED017X7S+MSNMNmFlTzfoPzGbVPDh
 8GEzjp7w+cei/rVg/RqhAHgfnCxY1zVzA3d6jOqmEMEPJBbKFzL8KxoFrgnaiydrbeaC
 UEog==
X-Gm-Message-State: APjAAAV9b1ofLCPGGRvT+Ap24kKFo++CqEt0Hnf6+7k4gu9yEugBVmvU
 e/dGsohDBO9flC4Z7AOdKPTeIGRCGWT2K0D+xc5zcTDwOC2l0iQbaxaaUe+PjOcf7Kn4ma2lZyV
 OdjM5bHc8uzjkmWoToKO6wEYbGas=
X-Received: by 2002:a05:6830:164f:: with SMTP id
 h15mr4811280otr.17.1574921412162; 
 Wed, 27 Nov 2019 22:10:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqwFr/a6hrkQz3j7CF9NFmauGICpLceILlcbU018LOdg5PgYCaY61USkA/ul3J8yQkNHRPKQJMcymwdAievh8OY=
X-Received: by 2002:a05:6830:164f:: with SMTP id
 h15mr4811270otr.17.1574921411808; 
 Wed, 27 Nov 2019 22:10:11 -0800 (PST)
MIME-Version: 1.0
References: <20191119094156.20348-1-liwang@redhat.com>
 <1860355560.12961927.1574161647388.JavaMail.zimbra@redhat.com>
 <CAEemH2cN8qv_YpsFKJazcOKEvgfjXpacZOV_Er-0bjK86=6VpQ@mail.gmail.com>
 <c9d278e6-5700-6c16-019b-1770a6ede0ff@suse.cz>
 <CAEemH2dZCm5MVyhzWiFKVK-jt+UUw65u5CRFk-moUVUgpDHHWg@mail.gmail.com>
 <d76d2ad2-f302-3cd5-0c9f-5d96a6a4bd55@suse.cz>
 <986ec24a-0318-8217-52eb-816bbec5fb75@suse.cz>
In-Reply-To: <986ec24a-0318-8217-52eb-816bbec5fb75@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Thu, 28 Nov 2019 14:10:00 +0800
Message-ID: <CAEemH2dnBv+9t=Pk0iX8r8sG06CgueByw1PXZD+61erQfX0uZQ@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
X-MC-Unique: CmAMypXgMICcszeQdcj4-w-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_fill_fs: enhance the filesystem filling
 routine
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
Content-Type: multipart/mixed; boundary="===============0668114064=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0668114064==
Content-Type: multipart/alternative; boundary="0000000000004cee1a059861f739"

--0000000000004cee1a059861f739
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2019 at 10:29 PM Martin Doucha <mdoucha@suse.cz> wrote:

> Hello,
> here's something fun which I've discovered while playing with
> fallocate05 test on XFS:
> - fallocate(x blocks)
> - tst_fill_fs()
> - write(x blocks) - OK
> - write(1 block) - ENOSPC
> - fallocate(1 block) - OK
> - write(1 block) - OK
> - fallocate(1 block) - ENOSPC
>
> Somehow, fallocate() can find another free block on XFS which wasn't
> available to write() at first. But then that block becomes write()able.
>

That's interesting.

It does prove that an xfs filesystem can't be really fill full. As FS dev
says though a filesystem return -ENOSPC, after some internal bookkeeping,
flushing, then have space available again.

And that also means to increases FALLOCATE_SIZE is a wise way to avoid this
problem.


>
> --
> Martin Doucha   mdoucha@suse.cz
> QA Engineer for Software Maintenance
> SUSE LINUX, s.r.o.
> CORSO IIa
> Krizikova 148/34
> 186 00 Prague 8
> Czech Republic
>
>

--=20
Regards,
Li Wang

--0000000000004cee1a059861f739
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small"></d=
iv><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Wed, Nov 27, 2019 at 10:29 PM Martin Doucha &lt;<a href=3D"mai=
lto:mdoucha@suse.cz">mdoucha@suse.cz</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Hello,<br>
here&#39;s something fun which I&#39;ve discovered while playing with<br>
fallocate05 test on XFS:<br>
- fallocate(x blocks)<br>
- tst_fill_fs()<br>
- write(x blocks) - OK<br>
- write(1 block) - ENOSPC<br>
- fallocate(1 block) - OK<br>
- write(1 block) - OK<br>
- fallocate(1 block) - ENOSPC<br>
<br>
Somehow, fallocate() can find another free block on XFS which wasn&#39;t<br=
>
available to write() at first. But then that block becomes write()able.<br>=
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">That&#39;s interesting.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">It does prove that an xfs filesystem can&#39;t be really fill f=
ull. As FS dev says though a=C2=A0<span style=3D"color:rgb(0,0,0);white-spa=
ce:pre-wrap">filesystem return -ENOSPC,</span>=C2=A0after some internal boo=
kkeeping, flushing, then have space available again.=C2=A0</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">And that also means to=C2=A0<span style=
=3D"color:rgb(0,0,0);white-space:pre-wrap">increases FALLOCATE_SIZE is a wi=
se way to avoid this problem.</span></div></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Martin Doucha=C2=A0 =C2=A0<a href=3D"mailto:mdoucha@suse.cz" target=3D"_bla=
nk">mdoucha@suse.cz</a><br>
QA Engineer for Software Maintenance<br>
SUSE LINUX, s.r.o.<br>
CORSO IIa<br>
Krizikova 148/34<br>
186 00 Prague 8<br>
Czech Republic<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li =
Wang<br></div></div></div></div>

--0000000000004cee1a059861f739--


--===============0668114064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0668114064==--

