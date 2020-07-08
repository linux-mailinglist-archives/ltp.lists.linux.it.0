Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37330217F95
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jul 2020 08:31:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E750F3C29B8
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Jul 2020 08:31:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 4CF253C2991
 for <ltp@lists.linux.it>; Wed,  8 Jul 2020 08:30:57 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id D6A03600A57
 for <ltp@lists.linux.it>; Wed,  8 Jul 2020 08:30:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594189855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H5YohnZ87wQ2bK6af5Knzpi58XOrlYQUqAELHwE0Gdc=;
 b=VEZVP7nB4jWetTZzilOzSF3r4MNI4sPP+JmfNH6i76pTU2Gfz/7uKhKLbachLnjT1sbE4P
 ZqzPPogiRJipPeybMcygENfz3+/hn5sZPcEu8ICpJ4HOEUf9N9JQVCYt3AB3Nsu5SiXSLm
 bCVDKxpNzuhZZIoUAvwIYUaPmvVY8Fo=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-fppDUJo5MlOyz5tHQyMdgA-1; Wed, 08 Jul 2020 02:30:51 -0400
X-MC-Unique: fppDUJo5MlOyz5tHQyMdgA-1
Received: by mail-lf1-f70.google.com with SMTP id v25so31575629lfq.3
 for <ltp@lists.linux.it>; Tue, 07 Jul 2020 23:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H5YohnZ87wQ2bK6af5Knzpi58XOrlYQUqAELHwE0Gdc=;
 b=bFie8+9LVVf0G3PX0Kty0rMgGc4iewbSPITLf/ghAEJ+MeUB5kwDQirVu/sIoJIaOG
 9cdRFGCfBpuz8csIFcf+EVJ3q75X5CH9dxGx0ShTq26vtMd7Hz7FeIvPYY88Y8oVR0nA
 CEZZoOpj49QIEH+LJiajIjyXNqRsIxwn7Xngnjl7LEYGJN4SnHkG1HVnhUyoSQZAFRPr
 EsCAJ8HCb/HSsGKLAedh34UnRix0s5PVyxriJE1X+vRogj1Mz9o5CYjMYf1KjY8NljIY
 g9RsS22VM00BIn1lERirVRK12o4OsCD5QB560fpMVLVm+1jeMPUu2NIzDjFrSJ4kvb9N
 lKRQ==
X-Gm-Message-State: AOAM532wwI1JxmtSLJW2bokQtGNApZ3td67miThhOdysARWiJY/zhp/9
 oZ9wKkX5xPHyAh6iYycn8zotW0HPuJjiqUDzVanst1x+szfyzRkprKbv+a8GXepLjTcKk+J11Cy
 3BLziZfnipmXkcHRVFaii7g/0Hws=
X-Received: by 2002:a2e:a484:: with SMTP id h4mr33070826lji.468.1594189849809; 
 Tue, 07 Jul 2020 23:30:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz0wEpxeCRyVyvLaxsF8RqY5cLz6a4EWwxFtTXqACRvjea0bkv5t6OCNOj0fXvzrF0t00FqHzZWEM60VE4kek=
X-Received: by 2002:a2e:a484:: with SMTP id h4mr33070815lji.468.1594189849625; 
 Tue, 07 Jul 2020 23:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200701233133.122801-1-petr.vorel@gmail.com>
 <CAEemH2cHWqRQ+bkUCof8mrK7jfy-DsuA9wegmOT8D-h8F1Cu2g@mail.gmail.com>
 <2c7f1334-0ff1-7530-90fa-7f3ce796a829@linux.ibm.com>
In-Reply-To: <2c7f1334-0ff1-7530-90fa-7f3ce796a829@linux.ibm.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 8 Jul 2020 14:30:37 +0800
Message-ID: <CAEemH2dKAuteO=UWm=M4D4LeW4KVcLdts_AwiLRyYsdur14ESA@mail.gmail.com>
To: Harish <harish@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] numa01.sh: Handle computation error
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
Content-Type: multipart/mixed; boundary="===============2011148334=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2011148334==
Content-Type: multipart/alternative; boundary="000000000000b11e9e05a9e83fb0"

--000000000000b11e9e05a9e83fb0
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 3, 2020 at 11:48 AM Harish <harish@linux.ibm.com> wrote:

> On 7/3/20 8:30 AM, Li Wang wrote:
>
> Hi Petr, Harish,
>
> Though the root cause is from the non-ordered node in a special machine, I
> still think this patch makes sense to numa01, because the function
> get_mem_cur() make code more readable.
>
> So I'm going to merge both this one and Harish's patch, after doing that,
> I will also follow Cyril's comment to remove test8(migrate_pages).
>
> Any objections? or comments?
>
> Makes sense to me.
>

I have pushed both patches, and remove the test8 too.

-- 
Regards,
Li Wang

--000000000000b11e9e05a9e83fb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Jul 3, 2020 at 11:48 AM Harish &lt;<a href=
=3D"mailto:harish@linux.ibm.com">harish@linux.ibm.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <div>On 7/3/20 8:30 AM, Li Wang wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">
          <div style=3D"font-size:small">Hi=C2=A0Petr,
            Harish,</div>
        </div>
        <div><br>
        </div>
        <div>
          <div style=3D"font-size:small">Though the
            root cause is from the non-ordered node in a special
            machine, I still think this patch makes sense to numa01,
            because the function get_mem_cur() make code more readable.</di=
v>
          <div style=3D"font-size:small"><br>
          </div>
          <div style=3D"font-size:small">So I&#39;m
            going to merge both this one and Harish&#39;s patch, after doin=
g
            that, I will also follow Cyril&#39;s comment to remove
            test8(migrate_pages).</div>
          <div style=3D"font-size:small"><br>
          </div>
          <div style=3D"font-size:small">Any
            objections? or comments?<br>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
    <font size=3D"-1">Makes sense to me.<br></font></div></blockquote><div>=
<br></div><div><div class=3D"gmail_default" style=3D"font-size:small">I hav=
e pushed both patches, and remove the test8 too.</div></div></div><div><br>=
</div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><d=
iv>Regards,<br></div><div>Li Wang<br></div></div></div></div>

--000000000000b11e9e05a9e83fb0--


--===============2011148334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2011148334==--

