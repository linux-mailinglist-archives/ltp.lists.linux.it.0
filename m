Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D78B3BF410
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 04:50:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E1CD3C9545
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 04:50:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B95133C6852
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 04:50:31 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4D259600C3B
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 04:50:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625712628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c6PD32ALNMbXevkG1U+zr+2+Sh34PJA/Zz//E/ovdek=;
 b=cWH1ugOh3D8TQfDQQo5+PKss659WcdCyccpH7a8YM6cBRpX8W28e1heAnNROp7U2csUe2x
 NSqJL9QRbXqRoQJRo524GbqQPkjPnRtt6nEOiB2cgkdectO5EdYPDHFv6HYfcSxPtM5hyt
 BcTRthEblpo5OSApQBhQuTLBA1uLLMU=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-npYiNOWRN_S2XhsigTOauQ-1; Wed, 07 Jul 2021 22:50:26 -0400
X-MC-Unique: npYiNOWRN_S2XhsigTOauQ-1
Received: by mail-yb1-f199.google.com with SMTP id
 s83-20020a2545560000b029055ae952c336so4924254yba.2
 for <ltp@lists.linux.it>; Wed, 07 Jul 2021 19:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c6PD32ALNMbXevkG1U+zr+2+Sh34PJA/Zz//E/ovdek=;
 b=i+4pYOrzwCSxVR3qitoJX05ZG1gLKvy/0RnqtIwyWtzSrh1umzM9IuCEnVyDkZj5Go
 6H75Y7orPaGp45VAewiVHDiYi4YOBpW+jxFVWc3TT4GHywYUkUSNebBAu5XMvMZPnVX6
 9OyJAfoiEbhSQfVo/kQuc0JE/C8ztvjLsRO1keXjjYvnrCuPaZszcE/lWxvOBEEEOYTM
 8Oa0SYVv4Etkkyl9cYSytDvc+SOGTYfzpGOkJswhonGNeo5IsfvOqnoKPLeA5YSYRxIY
 CbSve9lhXo9W35BbaozPWhlQT1CILHICagaB5l7FoEf37Ie25kOZUIFE12W/54DkaoGF
 id5w==
X-Gm-Message-State: AOAM532RfRzuHXWRtccWfoIeg7qm9+25JD+RAVhClurBjTy0RDy2QkUm
 Y7qTA7+ZMd/g4lGPJ+CIKdyf5ix+ev2BqB6Z5K77AgPwEidMofB0IAx72Ddp/OWm8Yol9twMERE
 TTRvFXXISUIbD6rgJW5Fm8TG1bDo=
X-Received: by 2002:a25:f8b:: with SMTP id 133mr34763868ybp.86.1625712625990; 
 Wed, 07 Jul 2021 19:50:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0FO7hQsPc7w6DrGOJzx3aVdlY/HziaR9yBNmDieS+8wD9KnjFbvRMK29XIrZi2veIRDzWFag+3SCN24nEFxA=
X-Received: by 2002:a25:f8b:: with SMTP id 133mr34763847ybp.86.1625712625697; 
 Wed, 07 Jul 2021 19:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210705082527.855688-1-liwang@redhat.com> <YOV0bemK+1NI0Cz4@yuki>
In-Reply-To: <YOV0bemK+1NI0Cz4@yuki>
From: Li Wang <liwang@redhat.com>
Date: Thu, 8 Jul 2021 10:50:14 +0800
Message-ID: <CAEemH2dRgd8m0Wtuw=QF0rH8SqOvQ11aTzi6O227q-PYQOYL4w@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1516355172=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1516355172==
Content-Type: multipart/alternative; boundary="0000000000008fdc8605c693b796"

--0000000000008fdc8605c693b796
Content-Type: text/plain; charset="UTF-8"

Cyril Hrubis <chrubis@suse.cz> wrote:


>
> > +static char *limit_tmpfs_mount_size(const char *mnt_data,
> > +                     char *buf, size_t buf_size, const char *fs_type)
> > +{
> > +     int fd;
> > +     uint64_t dev_size;
> > +
> > +     if (strcmp(fs_type, "tmpfs"))
> > +             return mnt_data;
> > +
> > +     fd = SAFE_OPEN(tdev.dev, O_RDONLY);
> > +     SAFE_IOCTL(fd, BLKGETSIZE64, &dev_size);
> > +     SAFE_CLOSE(fd);
>
> We can as well add size to the struct tst_device and fill it in when
> device is created, that would be a slightly cleaner solution.
>


That should be fine. But I'm afraid we have to change the return type
for many functions in tst_device.c, because currently most of them
only return a path to the test device. And that will affect more tests.

Or, maybe just create a function to get the device size and pass it
to tdev.size simply?

-- 
Regards,
Li Wang

--0000000000008fdc8605c693b796
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz">chrubis@s=
use.cz</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"> <br>
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
te><div><br></div><div><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">That should be fine. But I&#39;m afraid we have to change the =
return type</div><div class=3D"gmail_default" style=3D"font-size:small">for=
 many functions in tst_device.c, because=C2=A0currently most of them</div><=
div class=3D"gmail_default" style=3D"font-size:small">only return=C2=A0a pa=
th to the test device. And that will affect more tests.</div><div class=3D"=
gmail_default" style=3D"font-size:small"></div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">Or, maybe just create a function to get the device size an=
d pass it</div><div class=3D"gmail_default" style=3D"font-size:small">to td=
ev.size simply?</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></=
div></div></div></div>

--0000000000008fdc8605c693b796--


--===============1516355172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1516355172==--

