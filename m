Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 516432130F0
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 03:21:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 008363C247C
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Jul 2020 03:21:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id F419F3C0B90
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 03:21:15 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 4D61D1000967
 for <ltp@lists.linux.it>; Fri,  3 Jul 2020 03:21:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593739272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J69cf2cZOnFeeVuK/ntLKHN+t3bBtii3fiJcIMCtrpk=;
 b=HE9UGCZcPM2wju7PKOQbMeK4nCyD9S+Qalnab6jM5eNlthtYs5AA7OhiF6BmhyAaI0r8XJ
 mYzr3wofY4oTNdUkckMj+QXawEr9N2AJSw6eCgRF+eyYfZHfDm0rhcyoI36Hu5Il8p7PaD
 RvGE6rC3VRhJvBs6H1ky9FUV2T4AU8E=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-Geyd22dyNd6cJb3agtub6w-1; Thu, 02 Jul 2020 21:21:10 -0400
X-MC-Unique: Geyd22dyNd6cJb3agtub6w-1
Received: by mail-lj1-f199.google.com with SMTP id e3so14558149ljp.14
 for <ltp@lists.linux.it>; Thu, 02 Jul 2020 18:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J69cf2cZOnFeeVuK/ntLKHN+t3bBtii3fiJcIMCtrpk=;
 b=A9G83nv1Hw0B2NdRJ2UaxDQy7Z52qAHCWuzdTovvc/zFjfY/bNpkqRdzwcgDShmdgi
 zZGax6Jc2iEUPLLP8zVSpkaY3iILlGd3m6Pw21byDS6O9iziJYsJ3ewfnEnBjAYwP63T
 L9dxfF20vv7WkMlpynmsEMebMxKrnfd76lICWRW2FcDtc/UqYKHF8AqyVEGwRHrTugXF
 w4xfdeSJvTFSZE+A2l0pHeXBePNpzlP2mq3e8q6cFp4UGZAl3FwB9LP6D9rgFGoAUWC+
 Oqf1kHUR1cJeNle3GoCGLiGdpV4piRfeNpbFCszi9wc6H77UgQ080oBuSokBb+yJ8OW/
 HkFg==
X-Gm-Message-State: AOAM530FJ0Y2gfSXgq/dMlzCRbdnKimSFSq6dRjzH3RAf2pxy2n5m5R3
 dW/ntg9yovpSquj/zboKtCPOHsp0v4MaUIQyVXCej3nAVG8+GDkWfNxar7TIwS3uxQfv3KvFyS5
 IUaMetqqFD3L6zTsYZxc4SOlwkSM=
X-Received: by 2002:a19:701:: with SMTP id 1mr19898020lfh.138.1593739269064;
 Thu, 02 Jul 2020 18:21:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxemas6W1QXc67Bj0qqcZKmVj0RuWkY51T3AfvOxHDapoIt1gDraCHpcIn567XQN8UYBtCZS/FOxfHWmlDwwZI=
X-Received: by 2002:a19:701:: with SMTP id 1mr19898007lfh.138.1593739268882;
 Thu, 02 Jul 2020 18:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200701151456.851-1-mdoucha@suse.cz>
 <20200701151456.851-2-mdoucha@suse.cz>
 <CAEemH2f2D9xBYxeQ33w0thxZFpkSHK3gn1bBQWMZSA=X5y-AWQ@mail.gmail.com>
 <d0bd1421-500a-bc84-bd0a-7b5f25ade684@suse.cz>
In-Reply-To: <d0bd1421-500a-bc84-bd0a-7b5f25ade684@suse.cz>
From: Li Wang <liwang@redhat.com>
Date: Fri, 3 Jul 2020 09:20:56 +0800
Message-ID: <CAEemH2eCD8vMH38guqwiPR64qePVYkCR0EkUsvDZXP3Vs_1OfQ@mail.gmail.com>
To: Martin Doucha <mdoucha@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] Add test for CVE 2017-1000405
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
Content-Type: multipart/mixed; boundary="===============1126489156=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1126489156==
Content-Type: multipart/alternative; boundary="000000000000fc9f1d05a97f56aa"

--000000000000fc9f1d05a97f56aa
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 2, 2020 at 8:15 PM Martin Doucha <mdoucha@suse.cz> wrote:

> On 02. 07. 20 11:48, Li Wang wrote:
> >
> > Martin Doucha <mdoucha@suse.cz <mailto:mdoucha@suse.cz>> wrote:
> >
> >     ...
> >     +static void *alloc_zero_page(void *baseaddr)
> >     +{
> >     +       int i;
> >     +       void *ret;
> >     +
> >     +       /* Find aligned chunk of address space. MAP_HUGETLB doesn't
> >     work. */
> >     +       for (i = 0; i < 16; i++, baseaddr += thp_size) {
> >     +               ret = mmap(baseaddr, thp_size, PROT_READ,
> >     +                       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> >
> >
> > I'm wondering why here request the READ ONLY memory, shouldn't we write
> > something into the write_thp loopingly then?
>
> We do write into it. Except we do it through /proc/self/mem file
> descriptor. I didn't try with PROT_WRITE but presume that mapping the
> memory as read-only is important for confusing the kernel into thinking
> that the address space doesn't need to be copied on write.
>
> Nevertheless, I've tested the reproducer on a vulnerable kernel and it
> works reliably.
>

Thanks for the explanation, I helped merge the patchset v3.

-- 
Regards,
Li Wang

--000000000000fc9f1d05a97f56aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 2, 2020 at 8:15 PM Martin Doucha &lt;<a=
 href=3D"mailto:mdoucha@suse.cz">mdoucha@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On 02. 07. 20 11:48, Li Wan=
g wrote:<br>
&gt; <br>
&gt; Martin Doucha &lt;<a href=3D"mailto:mdoucha@suse.cz" target=3D"_blank"=
>mdoucha@suse.cz</a> &lt;mailto:<a href=3D"mailto:mdoucha@suse.cz" target=
=3D"_blank">mdoucha@suse.cz</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;=C2=A0 =C2=A0 =C2=A0+static void *alloc_zero_page(void *baseaddr)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+{<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0void *ret;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Find aligned chunk o=
f address space. MAP_HUGETLB doesn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0work. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 16=
; i++, baseaddr +=3D thp_size) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ret =3D mmap(baseaddr, thp_size, PROT_READ,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);<br>
&gt; <br>
&gt; <br>
&gt; I&#39;m wondering why here request the READ ONLY memory, shouldn&#39;t=
 we write<br>
&gt; something into the write_thp loopingly then?<br>
<br>
We do write into it. Except we do it through /proc/self/mem file<br>
descriptor. I didn&#39;t try with PROT_WRITE but presume that mapping the<b=
r>
memory as read-only is important for confusing the kernel into thinking<br>
that the address space doesn&#39;t need to be copied on write.<br>
<br>
Nevertheless, I&#39;ve tested the reproducer on a vulnerable kernel and it<=
br>
works reliably.<br></blockquote><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">Thanks for the explanation, I helped merge =
the patchset v3.</div></div></div><div><br></div>-- <br><div dir=3D"ltr" cl=
ass=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wan=
g<br></div></div></div></div>

--000000000000fc9f1d05a97f56aa--


--===============1126489156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1126489156==--

