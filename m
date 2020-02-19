Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E141645D1
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 14:40:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 986E93C24D4
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 14:40:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D11F53C2465
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 14:40:26 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id D5A20201401
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 14:40:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582119624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3anmVV6kvxFf+1UGRwnvC4fJw6Qnx3Cf/Wl/Dq6o1yg=;
 b=Uj+jDE/Xkheiu79VhOJ6Ax7XbD3xD4OcCQDglNxqnSblSZcMBT2SMJTC+KwoQZbOOzXm4W
 0tqmk9s17SqqPIBBP6Y/qHJclx7XWR9b90Cs3at/hcfRwPB2bKkX58p5FQKoi1f5odnpp+
 7azfgDIXTA95hI/0k6fz81gUHbTC+fY=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-b98-hlKvMIScZ4MVV08zWQ-1; Wed, 19 Feb 2020 08:40:19 -0500
Received: by mail-vs1-f70.google.com with SMTP id j8so63973vsm.10
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 05:40:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5wX8+5jylvQ8LIcHMrpQbB/9PQCTiTzgWh35StKGR/I=;
 b=O9u/vWnhj0OznmjqgDdYZAlBp551evmuNXkFlg4QIthNa6x/eYPXHBSQ8X/C5BXwyX
 AcKr5G2d09dbRKr5lHrLbjlLIJG4jwSAl+8eEaqmOXZZ1rWD+hcI/7/mdzYhsLkCRR9d
 xPqd+hp89j5c6uCNiDxMickm7j2zZoJ5zyZ1nUTdC1IEcrtd5WVIIXmZUvnZcpuiS68X
 MXvxCBuIOXnMS6FkHFNIuLlGBagKRm1zy6yeuPaOrw/XD11dViv665JHaV03DhtsR+38
 QQg8lwBdlxkF8cy8cXaG57euC2gBLku74dRYM2GKBEfrqRKGdo/eJDTTPV5lTpSNP7qu
 sccA==
X-Gm-Message-State: APjAAAXw1r4kLxp5iezGtRFMjkGr41jL9anhaAk/K1jGGXEBgqSnFWDb
 +mIlE/aa9mQE9u1dHK5aHPTlT41Zb/It/6Ih/RQEMe6aPBu3m/YhBuij9iQBhMqH0txxfviRmqT
 gSgv8UbrP5ZVuje+FUVa9EIXJazQ=
X-Received: by 2002:a67:1244:: with SMTP id 65mr14768304vss.203.1582119618602; 
 Wed, 19 Feb 2020 05:40:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqwUvTKGdvAT+MJP3n2h9/26mle4OkYnhAHONcdNEWS5x2XncXINso36G5KOsfwX3O9iQFccfN2dlApJzCsVX8k=
X-Received: by 2002:a67:1244:: with SMTP id 65mr14768287vss.203.1582119618279; 
 Wed, 19 Feb 2020 05:40:18 -0800 (PST)
MIME-Version: 1.0
References: <20200218115918.32203-1-liwang@redhat.com>
 <0774e1e5-c326-e4aa-8c74-45de61d8276b@163.com>
 <CAEemH2c9v87NWM6k_t4d9Vi3wAYYjwfEJp2Cw-zG9pPHvdtV-Q@mail.gmail.com>
 <701290c2-4cd6-154a-d400-7479c57ec910@163.com>
In-Reply-To: <701290c2-4cd6-154a-d400-7479c57ec910@163.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 19 Feb 2020 21:40:07 +0800
Message-ID: <CAEemH2fUMV4H3sALU4hDz4PXyS_31NXcGZv-zxQML3W_yDXhtg@mail.gmail.com>
To: Xiao Yang <ice_yangxiao@163.com>
X-MC-Unique: b98-hlKvMIScZ4MVV08zWQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cleanup: avoid to generate many redundant obj
 files
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
Content-Type: multipart/mixed; boundary="===============0332072110=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0332072110==
Content-Type: multipart/alternative; boundary="000000000000d71096059eeded2c"

--000000000000d71096059eeded2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Xiao Yang <ice_yangxiao@163.com> wrote:

> Why don't you remove all object files and mix building and link at the
> last phase?
>
As I mentioned the library file shouldn't be deleted.

> And, I don't want to change too much for LTP build rule(I think it works
> correctly), especially in the case directory some of the local libraries
> are reused.  e.g The swapoff test needs linking to ../swapon/libswapon.o,
> that requires libswapon.o is in the correct path.
>
> You can build and link libswapon.c directly, as below:
>
> ---------------------------------
>
> # grep MAKE_TARGETS Makefile
> $(MAKE_TARGETS): %: ../swapon/libswapon.c
>
FWIK, It breaks up the principle of the library design in C compilation, it
just regards the library as a general C file, I think it's a horrible idea.

> ---------------------------------
>
> Sorry, I am not sure if your improvement is the best way.
>
I have never say that's an improvement, that's just a cleanup patch. I just
want the code directory to be cleaner even after compilation.

But if you give a performance evaluation, you will find my build way is a
little faster than previous:).

--=20
Regards,
Li Wang

--000000000000d71096059eeded2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Xiao Yang &lt;<a href=3D"mailto:ice_yangxiao@163.com" target=
=3D"_blank">ice_yangxiao@163.com</a>&gt; wrote:<span class=3D"gmail_default=
"></span><br></div></div><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div bgcolor=3D"#FFFFFF">
    <p>Why don&#39;t you remove all object files and mix building and link
      at the last phase?</p></div></blockquote><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">As I mentioned the library file shouldn&#39=
;t be deleted.</div></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><div bgcolor=3D"#FFFFFF"><blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div>
           =20
            <div style=3D"font-size:small">And, I
              don&#39;t want to change too much for LTP build rule(I think
              it works correctly), especially in the case directory some
              of the local libraries are reused.=C2=A0 e.g The swapoff test
              needs linking to ../swapon/libswapon.o, that
              requires=C2=A0libswapon.o=C2=A0is in the correct path.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>You can build and link libswapon.c directly, as below:</p>
    <p>---------------------------------</p>
    <p># grep MAKE_TARGETS Makefile<br>
      $(MAKE_TARGETS): %: ../swapon/libswapon.c<br></p></div></blockquote><=
div><div class=3D"gmail_default" style=3D"font-size:small">FWIK, It breaks =
up the principle of the library design in C compilation, it just regards th=
e library as a general C=C2=A0file, I think it&#39;s a horrible idea.</div>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div bgcolor=3D"#FF=
FFFF"><p>
    </p>
    <p>---------------------------------<br>
    </p>
    <p>Sorry, I am not sure if your improvement is the best way.</p></div><=
/blockquote><div><span class=3D"gmail_default" style=3D"font-size:small">I =
have never say that&#39;s an improvement, that&#39;s just a cleanup patch. =
I just want the code directory to be cleaner even after compilation.=C2=A0<=
/span></div><div><span class=3D"gmail_default" style=3D"font-size:small"><b=
r></span></div><div><span class=3D"gmail_default" style=3D"font-size:small"=
>But if you give a performance evaluation, you will find my build way is a =
little faster than previous:).</span></div></div><div><br></div>-- <br><div=
 dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div>=
</div></div></div>

--000000000000d71096059eeded2c--


--===============0332072110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0332072110==--

