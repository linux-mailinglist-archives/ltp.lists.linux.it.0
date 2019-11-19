Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E82E101595
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Nov 2019 06:45:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 428CA3C2272
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Nov 2019 06:45:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 5601B3C131B
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 06:45:54 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 8AF4F1402C52
 for <ltp@lists.linux.it>; Tue, 19 Nov 2019 06:45:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574142351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/IUoztfMTdkzLEV2FRak0FGB2RFUxxdkd6xY9KQKPqQ=;
 b=UOeXx/FHt6VN/Z3ukSipTjkMOuq27hPeo9uSnTBQ0G9UELmV2BXaMHATrPF1S2SQkTJv5s
 2bYG2vSt8ddyXgpJm8LHUHPnTAStvHcWOUvfs+vzt7VSfn+hllD42K3ab1wZ+WRt+Ql+64
 o+VPmHzRaQm6jOHD4NZyjQNiYCwN60M=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-licmJSdIMLSvSDK89fBlBA-1; Tue, 19 Nov 2019 00:45:47 -0500
Received: by mail-ot1-f69.google.com with SMTP id 60so11414931otd.19
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 21:45:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6+m3kGCrvhnGg/mzAgyNxmZXTSffZmx47wYysBTtYy8=;
 b=CG+5QRGS2lyK6L50xocmBbG8m0WpwDYhRZLuBAkEfJLYaykEYpkcnhsZLtHMxyC+CP
 S6LaV7pt58bfu1Xgo32DoTnhquLewcdC+WlRhSL4Lgj9FJ3VH0zPZYR5wMj1zKQZuhQ5
 Qys+zN1LhIGfyH02Fw/Uf+qfzKRXDkLWCgAluf7ssiUYx25ASl6Ryq/P1MkIi0gHbvTg
 CESLShdjBOshg2VCAD3Exo3sqpNxD2uwYa9TPZiLutJs6iitmn9zMWiy4Rv8VyokQ0o6
 L6uvlbg/1bbdBRetTP3IzHbXG9z+aqPoHIDAkNOilNBexZedydekwj3m4O5v4sfH9nDe
 w95g==
X-Gm-Message-State: APjAAAVXfibDJb4M8JvnhEc3C+jcJ324gK/3Eva7g6wGEIsBLsUA9nZH
 3hRpYQNlj7vlbqHZsHdUxJxVXFNIFUAAu4zjYYONmUfJb1YfhpzP9hzNh5+1xCkQkB3lpgcVI5d
 s1nrMwPtSvIqEiWeOUSYt4tOo1Ug=
X-Received: by 2002:aca:ad03:: with SMTP id w3mr2430972oie.96.1574142346878;
 Mon, 18 Nov 2019 21:45:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqylSeDWf9vDj3c8VN2hJqyrk+Dm1aDFBvkzXf7hGaa4M0GmR5TuTtWgzvCug4u0PCANfL0au+z1kMNHiwC19bM=
X-Received: by 2002:aca:ad03:: with SMTP id w3mr2430954oie.96.1574142346612;
 Mon, 18 Nov 2019 21:45:46 -0800 (PST)
MIME-Version: 1.0
References: <d8ad4bab26557fdf70e7ebc3f771bbb37ae889d7.1574093242.git.jstancek@redhat.com>
 <202fcb5a-c110-abdf-c305-7a0f5b6c1efc@suse.cz>
In-Reply-To: <202fcb5a-c110-abdf-c305-7a0f5b6c1efc@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Tue, 19 Nov 2019 13:45:35 +0800
Message-ID: <CAEemH2cDVF6Hv=KUmFo8eF2fdgvQqdMTmwZPnwRRffhDTFa-tw@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
X-MC-Unique: licmJSdIMLSvSDK89fBlBA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fallocate05: increase FALLOCATE_SIZE
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
Content-Type: multipart/mixed; boundary="===============0316005980=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0316005980==
Content-Type: multipart/alternative; boundary="0000000000006576ed0597ac9373"

--0000000000006576ed0597ac9373
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2019 at 12:19 AM Martin Doucha <mdoucha@suse.cz> wrote:

> On 11/18/19 5:08 PM, Jan Stancek wrote:
> > write() returning ENOSPC doesn't guarantee that filesystem after
> > some internal book-keeping, flushing, finishing transactions, etc.
> > won't still find some extra space.
> >
> > Increase FALLOCATE_SIZE to minimize chance of hitting sporadic
> > failures when that happens.
>
> We're planning to rewrite fallocate05 this week and FALLOCATE_SIZE will
> be removed entirely. The test must use a multiple of the real file
> system block size, otherwise it'll test different things on different
> platforms.
>

Sounds good. Thanks!

But it'd be better to merge Jan's patch first because there will still need
time for new patch reviewing.

--=20
Regards,
Li Wang

--0000000000006576ed0597ac9373
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Nov 19, 2019 at 12:19 AM Martin Doucha &lt;=
<a href=3D"mailto:mdoucha@suse.cz">mdoucha@suse.cz</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On 11/18/19 5:08 PM, Jan =
Stancek wrote:<br>
&gt; write() returning ENOSPC doesn&#39;t guarantee that filesystem after<b=
r>
&gt; some internal book-keeping, flushing, finishing transactions, etc.<br>
&gt; won&#39;t still find some extra space.<br>
&gt; <br>
&gt; Increase FALLOCATE_SIZE to minimize chance of hitting sporadic<br>
&gt; failures when that happens.<br>
<br>
We&#39;re planning to rewrite fallocate05 this week and FALLOCATE_SIZE will=
<br>
be removed entirely. The test must use a multiple of the real file<br>
system block size, otherwise it&#39;ll test different things on different<b=
r>
platforms.<br></blockquote><div><br></div><div><div class=3D"gmail_default"=
 style=3D"font-size:small">Sounds good. Thanks!</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">But it&#39;d be better to merge Jan&#39;s patch firs=
t because there will still need time for new patch reviewing.</div></div></=
div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div d=
ir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000006576ed0597ac9373--


--===============0316005980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0316005980==--

