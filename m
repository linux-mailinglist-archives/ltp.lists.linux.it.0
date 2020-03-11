Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FB4181867
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 13:45:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 124A33C5F47
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Mar 2020 13:45:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 16C3C3C5F24
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 13:45:33 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 540E61000CBC
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 13:45:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583930730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WsJDAW0KJ27mQ1j7uj9UqppDY77F5aOCrLfa8690giA=;
 b=JWP4VUwT2jF/w07+1jsToq5tPVlkmb9dz1sfvbJAt0iZHLmKmg+jeVEExwp/nZzEf6Sirq
 KoLVf8zc8p3yQM0jaWKByaDhEfQdxpG3oH/lDao3TI9HICB7QYtraN2mBTnTJZpNXgs7mp
 vojNpLlOsy1stfJEC/XcxpEU4vbNl/c=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-bJx2i6UIO3WjqGQo5x_meA-1; Wed, 11 Mar 2020 08:45:26 -0400
X-MC-Unique: bJx2i6UIO3WjqGQo5x_meA-1
Received: by mail-oi1-f197.google.com with SMTP id y82so964434oig.11
 for <ltp@lists.linux.it>; Wed, 11 Mar 2020 05:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o3S8bRlezDXojG2Nq4QOCpHjuUSVYjewrTFTuscBjmo=;
 b=VZ7igISZ/Py7DsIwu4f/gczTIkaFyes5/W7SSOd2SSHwEN7d7c2yCFB6N89azv/2eE
 O0wCfc9lH0HyPdHvFTq/UNM54uQq+JWrUVU5tKxyKcrFnA8jqCIIKYpHQVSs+/VdvkWw
 TqSIj7xDbkieWk7xKclicWOetQ3jGa4iPtVHpb1GgfhltRRbJ6c0oScL075TyN0vRtpA
 G0mXHuWK8wkjC+csUH4SOnvHOCgt1AS6Vt7ozBvrxleeDmnju9/i24GEimzoqSY9hV/5
 njeIwcEwJml5LUfDULmTPTnwDIrEuisLmBxtLywVfK3VXV6G8RjWUQDyfzKI/PO8lp0W
 BUvg==
X-Gm-Message-State: ANhLgQ0sPtmZPGJawsWhKMklcFcFMB50fYZFqtS2sTgUAkQ8zOTWT2Fr
 953EIFlbwm257UXuJ4z2i7NMI4pNyMEtQsHbbK/oyhXhp2HnjW5F0mcFpyZ78PleAc+NJBhg1Kf
 oh9nc1R55jPPrB6r/pciq6U0gBCs=
X-Received: by 2002:aca:1913:: with SMTP id l19mr1696431oii.47.1583930725457; 
 Wed, 11 Mar 2020 05:45:25 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt6+1opoVpZmppi/gRi5BwWRq/109EU0YaJANwqk8ZrXAy0b4jwE3pjN9oXnwWBJNb3+CuzQyEBJjc2rx1MX/E=
X-Received: by 2002:aca:1913:: with SMTP id l19mr1696403oii.47.1583930725108; 
 Wed, 11 Mar 2020 05:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1582779464.git.viresh.kumar@linaro.org>
 <2071e47d7d8cb3e7f8bc6558e86999eddd9c3762.1582779464.git.viresh.kumar@linaro.org>
 <20200306124546.GA3375@rei.lan>
 <CAEemH2drJyp5kU21jS7Ej+-q6hTysb5oDNM+3KiWsmPoLAbMQA@mail.gmail.com>
 <20200311102620.GB3802@rei.lan>
In-Reply-To: <20200311102620.GB3802@rei.lan>
From: Li Wang <liwang@redhat.com>
Date: Wed, 11 Mar 2020 20:45:13 +0800
Message-ID: <CAEemH2fqKvEU8+FBvTunv8VCOzXf0SMCHe6Ky9neFKQX51cZ7g@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V5 01/10] tst_device: Add tst_is_mounted() helper
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
Cc: Vikas.Kumar2@arm.com, Vincent Guittot <vincent.guittot@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0503036477=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0503036477==
Content-Type: multipart/alternative; boundary="0000000000003827b305a0939c7b"

--0000000000003827b305a0939c7b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2020 at 6:26 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> Hi!
> > > Also this does not even handle the case that the command is missing.
> > >
> > > Looking at the v4 version, all we need is to correctly parse each lin=
e
> > > from from /proc/mounts. I would just use strsep() with space as a
> > > delimited and took first token that starts with a slash i.e. '/', the=
n
> > > we can just strcmp() it against the path. Or do I miss something?
> > >
> >
> > I'm afraid strcmp() can not satisfy the requirement for us. As you know
> LTP
> > creates the MNTPOINT in temp dir that means it could not accurately mat=
ch
> > the string path which extracts from /proc/mounts with a slash.
> >
> > e.g
> > #define MNTPOINT "fallocate"
> > ...
> > /dev/loop4 on /tmp/FPp7kh/fallocate type xfs
> > (rw,relatime,seclabel,attr2,inode64,logbufs=3D8,logbsize=3D32k,noquota)
> > ...
> > strcmp("/tmp/FPp7kh/fallocate", MNTPOINT) will never ruturn 0 to us.
> >
> > What I can think of is to use strrchr() to cut the string after last '/=
',
> > but that can only work for test mount fs in LTP ways. Other situations
> > might not satisfy.
>
> Hmm, for that we have to have compose the path for the comparsion
> anyways, since unless we pass an absoule path we can never be user if we
> have a right match or not. There may be leftover mount points from a
> failed tests that have faile to cleanup properly as well.
>
> So I guess that we need one more function, with tmpdir in name, that
> would compose the right path for us and then call the tst_is_mntpoint().
>

+1 it makes sense to me.


>
> I would have called that:
>
> int tst_is_mntpoint_at_tmpdir(const char *path);
>

Hmm, the return value shouldn't the full right path, why return int here?
or I misunderstand here?

--=20
Regards,
Li Wang

--0000000000003827b305a0939c7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Mar 11, 2020 at 6:26 PM Cyril Hrubis &lt;<a=
 href=3D"mailto:chrubis@suse.cz">chrubis@suse.cz</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
&gt; &gt; Also this does not even handle the case that the command is missi=
ng.<br>
&gt; &gt;<br>
&gt; &gt; Looking at the v4 version, all we need is to correctly parse each=
 line<br>
&gt; &gt; from from /proc/mounts. I would just use strsep() with space as a=
<br>
&gt; &gt; delimited and took first token that starts with a slash i.e. &#39=
;/&#39;, then<br>
&gt; &gt; we can just strcmp() it against the path. Or do I miss something?=
<br>
&gt; &gt;<br>
&gt; <br>
&gt; I&#39;m afraid strcmp() can not satisfy the requirement for us. As you=
 know LTP<br>
&gt; creates the MNTPOINT in temp dir that means it could not accurately ma=
tch<br>
&gt; the string path which extracts from /proc/mounts with a slash.<br>
&gt; <br>
&gt; e.g<br>
&gt; #define MNTPOINT &quot;fallocate&quot;<br>
&gt; ...<br>
&gt; /dev/loop4 on /tmp/FPp7kh/fallocate type xfs<br>
&gt; (rw,relatime,seclabel,attr2,inode64,logbufs=3D8,logbsize=3D32k,noquota=
)<br>
&gt; ...<br>
&gt; strcmp(&quot;/tmp/FPp7kh/fallocate&quot;, MNTPOINT) will never ruturn =
0 to us.<br>
&gt; <br>
&gt; What I can think of is to use strrchr() to cut the string after last &=
#39;/&#39;,<br>
&gt; but that can only work for test mount fs in LTP ways. Other situations=
<br>
&gt; might not satisfy.<br>
<br>
Hmm, for that we have to have compose the path for the comparsion<br>
anyways, since unless we pass an absoule path we can never be user if we<br=
>
have a right match or not. There may be leftover mount points from a<br>
failed tests that have faile to cleanup properly as well.<br>
<br>
So I guess that we need one more function, with tmpdir in name, that<br>
would compose the right path for us and then call the tst_is_mntpoint().<br=
></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fon=
t-size:small">+1 it makes sense to me.</div></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
I would have called that:<br>
<br>
int tst_is_mntpoint_at_tmpdir(const char *path);<br></blockquote><div><br><=
/div><div><div class=3D"gmail_default" style=3D"font-size:small">Hmm, the r=
eturn=C2=A0value shouldn&#39;t the full right path, why return int here? or=
 I misunderstand here?</div></div></div><div><br></div>-- <br><div dir=3D"l=
tr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>=
Li Wang<br></div></div></div></div>

--0000000000003827b305a0939c7b--


--===============0503036477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0503036477==--

