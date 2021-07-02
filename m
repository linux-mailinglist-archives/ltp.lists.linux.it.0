Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 945F53BA02A
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:02:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17C603C8D51
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Jul 2021 14:02:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A2B983C6AD7
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:02:11 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7304A1A014DD
 for <ltp@lists.linux.it>; Fri,  2 Jul 2021 14:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625227329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fe6VPeYIXz4OysyqOwXCK2LqRu18fRQJ7K/ZYNMVW2M=;
 b=GWyJS/joXIt3sCkX5iBDzEKz1GqTNe7aj70t5Nx/dMeNm3sbs9rL5u5cLXCK20z+LFbcmO
 wqNZpwHZFRY8tIp+pE96TQwPKhoiyEsXCXtUNG8Zy/HRUzwKFKw0wA49fT6d0rvQmSh7E+
 iIbjS35+krDx4w2HmY8qowj3af2chX0=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-3HuRUvPCOuC4a39qxhfoXg-1; Fri, 02 Jul 2021 08:02:07 -0400
X-MC-Unique: 3HuRUvPCOuC4a39qxhfoXg-1
Received: by mail-yb1-f199.google.com with SMTP id
 x11-20020a056902102bb0290559967a5646so12748572ybt.8
 for <ltp@lists.linux.it>; Fri, 02 Jul 2021 05:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fe6VPeYIXz4OysyqOwXCK2LqRu18fRQJ7K/ZYNMVW2M=;
 b=itIE+zg4VPzwAb1cA43v0sevTf+BNDMX+OAdxdb5bbXLiU/ujvdTkZT1Npjim8m5gA
 TlVPdyvpSUOBx28qkPTLvynKnOAUWJEU3oYJVxtPMMxhbKDmc7gjLGGu6Os9Ls7XXtBD
 3Rl/6fn87DXduXJ6qA0BfWLbWHzrOlI0pjEzf76y/VrAYMK3rRy/bhV8YqHDaRDBOavA
 jQZ8ZdJrpPnPRv0BS82B7xUJfIySId1GKUSqB5l8xvWnV5C5HkY3oHsdsRojhvOZWxnj
 /DTSwHzagh9sDNQ9EelaoQEK7ViJM4JtHNc6uVzmt36eIXaCj44oJixyj5EJXhln15GP
 lotg==
X-Gm-Message-State: AOAM532r9ZN+61TZ+CYOOCQ4UkA651Qje2oW+rTTJgqCUCC6hMTZKXUt
 nhNj7GmDYBXsw8m0ho2PUGanV921uHjRs5TbvYDx7k4oISzPbhOtWFFvCS5W3wubqYNRdESyL7/
 nHk9ax4oxPv+VDF80KarbDw18TkU=
X-Received: by 2002:a25:abc3:: with SMTP id v61mr6418736ybi.366.1625227326719; 
 Fri, 02 Jul 2021 05:02:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweziYG7oW2gDkvtASM7Bt/VxzGcD8x8CCp0r2TNF1+z9Hc5HXpGNNsoJG2YoKmsF45f7nEyGGVvuuKHh23E3s=
X-Received: by 2002:a25:abc3:: with SMTP id v61mr6418704ybi.366.1625227326443; 
 Fri, 02 Jul 2021 05:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210701055208.715395-1-liwang@redhat.com> <YN7afAs3Mup5UbIf@yuki>
In-Reply-To: <YN7afAs3Mup5UbIf@yuki>
From: Li Wang <liwang@redhat.com>
Date: Fri, 2 Jul 2021 20:01:54 +0800
Message-ID: <CAEemH2dJ4FYh-7-8C5na-uB1jg31mdV8wC+7w_DHG1463XudHA@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
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
Subject: Re: [LTP] [PATCH 1/2] lib: limit the size of tmpfs in LTP
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
Content-Type: multipart/mixed; boundary="===============2019285793=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============2019285793==
Content-Type: multipart/alternative; boundary="00000000000078f02205c622b95b"

--00000000000078f02205c622b95b
Content-Type: text/plain; charset="UTF-8"

Cyril Hrubis <chrubis@suse.cz> wrote:



> > +char *limit_tmpfs_mount_size(const char *mnt_data, unsigned int size);
>
> If we want this function to be public it has to be prefixed with 'tst_'.
>
> Also do we really need this to be public?
>

No, we don't. I put it in the tst_device.c only hope to make use of the
DEV_SIZE_MB definition, and now seems this is a bad idea.

Looks like we should move it back to tst_test.c and state it as a static
function.



>
> > +static char tmpfs_buf[1024];
>
> Can we please, instead of adding a global variable, pass the buffer and
> it's size to the limit_tmpfs_mount size, and then create the path on the
> stack in the prepare device function?
>
>
Sure.


>
> > +char *limit_tmpfs_mount_size(const char *mnt_data, unsigned int size)
> > +{
> > +     unsigned int dev_size = MAX(size, DEV_SIZE_MB);
> > +
> > +     if (mnt_data)
> > +             snprintf(tmpfs_buf, sizeof(tmpfs_buf), "%s,size=%uM",
> mnt_data, dev_size);
> > +     else
> > +             snprintf(tmpfs_buf, sizeof(tmpfs_buf), "size=%uM",
> dev_size);
> > +
> > +     tst_resm(TINFO, "Limiting tmpfs size to %uMB", dev_size);
> > +
> > +     return tmpfs_buf;
> > +}
>
> If we passed the filesystem type to this function here as well we could
> do:
>
>         if (!strcmp(fs_type, "tmpfs"))
>                 return mnt_data;
>
> As a first thing in this function and then we could pass the return
> value from this function to the SAFE_MOUNT() unconditionally.
>

+1 This sounds good.


> > +
> > +             if (!strcmp(tdev.fs_type, "tmpfs"))
> > +                     tst_test->mnt_data = mnt_data;
>
> I guess that we are doing this in order to export the changes in the
> mnt_data to the test, right?
>
> Is that needed for something or are you doing this just in a case that
> somebody will use that?
>

No, you probably mis-read this part.

In contrast, this is just to restore it to the original value,
because we don't want to export the changed tst_test->mnt_data
take effect on other filesystems.

-- 
Regards,
Li Wang

--00000000000078f02205c622b95b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D=
"_blank">chrubis@suse.cz</a>&gt; wrote:<br></div></div><div class=3D"gmail_=
quote"><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
&gt; +char *limit_tmpfs_mount_size(const char *mnt_data, unsigned int size)=
;<br>
<br>
If we want this function to be public it has to be prefixed with &#39;tst_&=
#39;.<br>
<br>
Also do we really need this to be public?<br></blockquote><div><br></div><d=
iv><div class=3D"gmail_default" style=3D"font-size:small">No, we don&#39;t.=
 I put it in the tst_device.c only hope to make use of the </div><div class=
=3D"gmail_default" style=3D"font-size:small">DEV_SIZE_MB definition, and no=
w seems this is a bad idea.<br></div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">Looks like we should move it back to tst_test.c and state it as a st=
atic function.</div></div><div>=C2=A0</div><div>=C2=A0<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"> <br>
&gt; +static char tmpfs_buf[1024];<br>
<br>
Can we please, instead of adding a global variable, pass the buffer and<br>
it&#39;s size to the limit_tmpfs_mount size, and then create the path on th=
e<br>
stack in the prepare device function?<br>
<br>
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">Sure.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"> <br>
&gt; +char *limit_tmpfs_mount_size(const char *mnt_data, unsigned int size)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int dev_size =3D MAX(size, DEV_SIZE_MB);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (mnt_data)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(tmpfs_buf, s=
izeof(tmpfs_buf), &quot;%s,size=3D%uM&quot;, mnt_data, dev_size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(tmpfs_buf, s=
izeof(tmpfs_buf), &quot;size=3D%uM&quot;, dev_size);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tst_resm(TINFO, &quot;Limiting tmpfs size to %uMB=
&quot;, dev_size);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return tmpfs_buf;<br>
&gt; +}<br>
<br>
If we passed the filesystem type to this function here as well we could<br>
do:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!strcmp(fs_type, &quot;tmpfs&quot;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mnt_data;<br=
>
<br>
As a first thing in this function and then we could pass the return<br>
value from this function to the SAFE_MOUNT() unconditionally.<br></blockquo=
te><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:smal=
l">+1 This sounds good.</div></div><div>=C2=A0=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!strcmp(tdev.fs_t=
ype, &quot;tmpfs&quot;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tst_test-&gt;mnt_data =3D mnt_data;<br>
<br>
I guess that we are doing this in order to export the changes in the<br>
mnt_data to the test, right?<br>
<br>
Is that needed for something or are you doing this just in a case that<br>
somebody will use that?<br></blockquote><div><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">No, you probably mis-read this part.=C2=
=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">In contrast, this is =
just to restore it to the original value,=C2=A0</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">because we don&#39;t want to export the ch=
anged tst_test-&gt;mnt_data</div><div class=3D"gmail_default" style=3D"font=
-size:small">take effect on other filesystems.</div></div><div><br></div>--=
 <br><div dir=3D"ltr"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<=
br></div></div></div></div>

--00000000000078f02205c622b95b--


--===============2019285793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============2019285793==--

