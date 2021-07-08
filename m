Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCBB3BF5BE
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 08:44:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 90B9B3C681A
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 08:44:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 176973C4DB0
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 08:44:50 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E88A9600748
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 08:44:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625726688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N5gynopZD9q3VGEVRB2c5AOPO/QODPRGwhT/yCs2SYI=;
 b=IGhcP2lDZ2/CqJh9SYRkOQPwAQb3BGGfFm35uOw/Or+qx/QZcBj11HNck2DRFQO6yIkK26
 cVb8i8EXwdxH/3UpKeJvMoEQLxxVuUgAbGJSYO+zKmHOJlRQpJTNkiZxX6yGyFYOd2Z066
 vmqO9Ywi76RW/m9X1hoHx3MmG1QmM+E=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-gYl6VFYPNGSXvf5IElGnkA-1; Thu, 08 Jul 2021 02:44:47 -0400
X-MC-Unique: gYl6VFYPNGSXvf5IElGnkA-1
Received: by mail-ua1-f70.google.com with SMTP id
 h16-20020ab038500000b029029ec7ce7c99so293491uaw.14
 for <ltp@lists.linux.it>; Wed, 07 Jul 2021 23:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N5gynopZD9q3VGEVRB2c5AOPO/QODPRGwhT/yCs2SYI=;
 b=cVicZiUwzIzmWo47+7nUslQs44oorfEz5euVJCvQI+VSzTMoAGhll9Hc2Ygpa2g6Md
 gIMdSzyIYYvdm8jxQwgT9XWApx2Uh4SGkqgSuaw4cHu9w4djDU9n4HEsx34yNbTvFQFQ
 xd3MeQtEMsA846uKCg+FlPvLH9afuxtGtmmcYvft7aGEG5m3fPJtp/98FjrrjXj7PPSh
 U1XvFSn+0UY3Yk3FBT8gl+rpI8Jsa5MWA5D10U49L70o4DcY3aZo2VDnIqAOkTfSTV4N
 w6QDqUsEHbILyfV55YawTXGQKPSBBXUMIZ46ij3/CdG2uproxAAujgOZafKNfd1ovDWG
 39ww==
X-Gm-Message-State: AOAM531OZSBiHwTQHDQ+QYkyBNrs9mL7sdDoW7veWPlo0XNgBd+rxNvf
 xngcB+EZn1dVrjEvH/JHhay6XL60tEzgblYAlEbWz8CN81dUhporVaeU15l1Y3ah0D3aWekSmqe
 tH1Uf6qNKS7qZzEGe4Drv5l1b6Qk=
X-Received: by 2002:a25:f8b:: with SMTP id 133mr35668129ybp.86.1625726209844; 
 Wed, 07 Jul 2021 23:36:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOku2nsPvX0QpYQxw23NvN5jMimLl+12/weOqj0QOeptjt1P2MrMjcgaZrzqetQnfEhaqsJD7oawpVMLK7jpg=
X-Received: by 2002:a25:f8b:: with SMTP id 133mr35668115ybp.86.1625726209652; 
 Wed, 07 Jul 2021 23:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210705082527.855688-1-liwang@redhat.com> <YOV0bemK+1NI0Cz4@yuki>
 <CAEemH2dRgd8m0Wtuw=QF0rH8SqOvQ11aTzi6O227q-PYQOYL4w@mail.gmail.com>
In-Reply-To: <CAEemH2dRgd8m0Wtuw=QF0rH8SqOvQ11aTzi6O227q-PYQOYL4w@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 8 Jul 2021 14:36:38 +0800
Message-ID: <CAEemH2eEMMX6CC6-RF+q93bAxv8GMN7LcwZeBtAydsAnys+79g@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] lib: limit the size of tmpfs in LTP
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
Content-Type: multipart/mixed; boundary="===============0381479850=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0381479850==
Content-Type: multipart/alternative; boundary="0000000000003a91bc05c696e14a"

--0000000000003a91bc05c696e14a
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 10:50 AM Li Wang <liwang@redhat.com> wrote:

> Cyril Hrubis <chrubis@suse.cz> wrote:
>
>
>>
>> > +static char *limit_tmpfs_mount_size(const char *mnt_data,
>> > +                     char *buf, size_t buf_size, const char *fs_type)
>> > +{
>> > +     int fd;
>> > +     uint64_t dev_size;
>> > +
>> > +     if (strcmp(fs_type, "tmpfs"))
>> > +             return mnt_data;
>> > +
>> > +     fd = SAFE_OPEN(tdev.dev, O_RDONLY);
>> > +     SAFE_IOCTL(fd, BLKGETSIZE64, &dev_size);
>> > +     SAFE_CLOSE(fd);
>>
>> We can as well add size to the struct tst_device and fill it in when
>> device is created, that would be a slightly cleaner solution.
>>
>
>
> That should be fine. But I'm afraid we have to change the return type
> for many functions in tst_device.c, because currently most of them
> only return a path to the test device. And that will affect more tests.
>
> Or, maybe just create a function to get the device size and pass it
> to tdev.size simply?
>

With adding new field 'size' in struct tst_device, I'm also planning
to extract that from tst_acquire_device__ and export it as a global
function:
    uint64_t tst_get_device_size(const char *dev_path);

then reuse of it to get block device size in more places, like:
     tdev.size = tst_get_device_size(tdev.dev);   <-- in prepare_device
and
      ltp_dev_size = tst_get_device_size(dev);   <-- in tst_acquire_device__
That would keep most of the function API no change and save
the tdev.size. Is this way OK, or any else?

-- 
Regards,
Li Wang

--0000000000003a91bc05c696e14a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Jul 8, 2021 at 10:50 AM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr"><div style=3D"font-size:small">Cyril Hrubis &lt;<a href=3D"mailto:chr=
ubis@suse.cz" target=3D"_blank">chrubis@suse.cz</a>&gt; wrote:<br></div></d=
iv><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"> <br>
&gt; +static char *limit_tmpfs_mount_size(const char *mnt_data,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0char *buf, size_t buf_size, const char *fs_type)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int fd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0uint64_t dev_size;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (strcmp(fs_type, &quot;tmpfs&quot;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return mnt_data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fd =3D SAFE_OPEN(<a href=3D"http://tdev.dev" rel=
=3D"noreferrer" target=3D"_blank">tdev.dev</a>, O_RDONLY);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_IOCTL(fd, BLKGETSIZE64, &amp;dev_size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(fd);<br>
<br>
We can as well add size to the struct tst_device and fill it in when<br>
device is created, that would be a slightly cleaner solution.<br></blockquo=
te><div><br></div><div><br></div><div style=3D"font-size:small">That should=
 be fine. But I&#39;m afraid we have to change the return type</div><div st=
yle=3D"font-size:small">for many functions in tst_device.c, because=C2=A0cu=
rrently most of them</div><div style=3D"font-size:small">only return=C2=A0a=
 path to the test device. And that will affect more tests.</div><div style=
=3D"font-size:small"></div><div style=3D"font-size:small"><br></div><div st=
yle=3D"font-size:small">Or, maybe just create a function to get the device =
size and pass it</div><div style=3D"font-size:small">to tdev.size simply?</=
div></div></div></blockquote><div>=C2=A0<br></div><div><div class=3D"gmail_=
default" style=3D"font-size:small">With adding new field &#39;size&#39; in =
struct tst_device, I&#39;m also planning</div><div class=3D"gmail_default" =
style=3D"font-size:small">to extract that from tst_acquire_device__ and exp=
ort it as a global</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">function:=C2=A0</div></div></div><div class=3D"gmail_default" style=3D"=
font-size:small">=C2=A0 =C2=A0 uint64_t tst_get_device_size(const char *dev=
_path);<br></div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">then reuse of=
 it to get block device size in more places, like:</div><div class=3D"gmail=
_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0tdev.size =3D tst_g=
et_device_size(<a href=3D"http://tdev.dev">tdev.dev</a>);=C2=A0 =C2=A0&lt;-=
- in=C2=A0prepare_device</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">and</div><div class=3D"gmail_default" style=3D"font-size:small">=
=C2=A0 =C2=A0 =C2=A0 ltp_dev_size =3D tst_get_device_size(dev);=C2=A0 =C2=
=A0&lt;-- in=C2=A0tst_acquire_device__</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"></div><div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">That would keep most of the function API no change and save<=
/div><div class=3D"gmail_default" style=3D"font-size:small">the tdev.size. =
Is this way OK, or any else?</div></div><div><br></div>-- <br><div dir=3D"l=
tr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>=
Li Wang<br></div></div></div></div>

--0000000000003a91bc05c696e14a--


--===============0381479850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0381479850==--

