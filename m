Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C99332E92FF
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jan 2021 11:00:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 90F763C3204
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jan 2021 11:00:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 63F603C1D2E
 for <ltp@lists.linux.it>; Mon,  4 Jan 2021 11:00:47 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 3FAF46008CC
 for <ltp@lists.linux.it>; Mon,  4 Jan 2021 11:00:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609754445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FOgrQc5MC4ubcMDt0ks4j5QSUMR9DtGoe3YgneqWj5A=;
 b=Rh+9dcWAmhfG02Q4s0+mUCYQ4gejjVIlYeNqaAuJK/JGpJ+9KW53QbjXATns38Hrws0SoS
 utFkrl/Y0AShbcPiwDhEXHeGSt/6L320kOSmWOfBNoQCLyoGlacyW/SwERKwmldiyG7yDs
 n/p6O4gjdtE7FCtNVRAQWOQyoJ7xtH4=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-tjho6q0XPaOHIctR4f20fA-1; Mon, 04 Jan 2021 05:00:43 -0500
X-MC-Unique: tjho6q0XPaOHIctR4f20fA-1
Received: by mail-yb1-f197.google.com with SMTP id c9so50658844ybs.8
 for <ltp@lists.linux.it>; Mon, 04 Jan 2021 02:00:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FOgrQc5MC4ubcMDt0ks4j5QSUMR9DtGoe3YgneqWj5A=;
 b=UgnxvC6B/hWjGPDeaDywBeDFIy9GvmO5re03KtqsCwS+5+uyd0LBRztA+nsJNli7T/
 sXcMIoi6d4VT/mLXqpV/h12nrIzsnvFpf42+goF2XCi3xKUN5lFAUZiIAp5D9z4rMeUL
 vyJmBVjaeZYPztIZu9YxUzN3nlDAC6VJBookq51U2vxghMqEzM0yiG1LT9jDAIo6Hbys
 W3STqPWL9UVEutiMYFbd2DrGItWemvpFzgO5OUmwWbLEULiX9j1yMTht9GwYaFhYYsu1
 y/m0vkebDnmj/870//R4Nk8w8mWJy0TtVxv3YF09VLqFTdDHheexU1p766CbJJ23jvWY
 C2+A==
X-Gm-Message-State: AOAM533TgtaZCMb5ku1Ox0ZDm6GHg+iiED7CCFmI/WvdPhK1YOPuKp4I
 NSTgxz+HGqbXnj4ZSvIZTyZ/+IOPfm2pSsb+800BaEjwk73DKF6UwsOJEVbknl2tzGjGa/Dzx/g
 rw6IuS+56i1IynXGskq2bzmkxfo0=
X-Received: by 2002:a25:2c58:: with SMTP id
 s85mr105574802ybs.366.1609754442919; 
 Mon, 04 Jan 2021 02:00:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPlMjwoeVZzjL7iOxMuxPpSP5cDTUBOlvhNCc3oCszY7fIgl5MK/iiRi4jtf9worCXWR6UlFq9qGaikNNUdoY=
X-Received: by 2002:a25:2c58:: with SMTP id
 s85mr105574780ybs.366.1609754442658; 
 Mon, 04 Jan 2021 02:00:42 -0800 (PST)
MIME-Version: 1.0
References: <20201216100121.16683-1-rpalethorpe@suse.com>
 <CAEemH2dR+W8ypMED_xqw2JVO7E_Y0Kp+0iS=QVH_h2r0pDBVJA@mail.gmail.com>
 <87h7nxdptp.fsf@suse.de>
In-Reply-To: <87h7nxdptp.fsf@suse.de>
From: Li Wang <liwang@redhat.com>
Date: Mon, 4 Jan 2021 18:00:31 +0800
Message-ID: <CAEemH2ee-kFC2ax+ODL3SKsCrbFPKqfgu9oAPCbVGUCTarn5xw@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 0/5] CGroups
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
Content-Type: multipart/mixed; boundary="===============1737149499=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1737149499==
Content-Type: multipart/alternative; boundary="000000000000bb125605b810299b"

--000000000000bb125605b810299b
Content-Type: text/plain; charset="UTF-8"

Richard Palethorpe <rpalethorpe@suse.de> wrote:


> >> I have done a direct conversion of the test cases to the new API, but
> >> I am not sure that it makes sense to call tst_cgroup_move_current
> >> within the run method of a test because after the first iteration it
> >>
> >
> > Hmm, I feel that is a rare scenario in our real test. Mostly we
> > just need to set it once in a process.
>
> I suppose we can just move it into setup then?
>

For tests that only need a one-time CGroup setting we can, but for
multiple requirements of the same controller in many processes it
seems not working.



> > That's true, but it is mainly caused by different versions of
> > CGroup. We could NOT unify the unsupported behavior, so
> > maybe the wiser choice is to let _CPUSET test skipping(TCONF)
> > directly on CGroup_V2?
>
> Yes. I wonder if tst_cgroup_move_current should return a value to
> indicate it was a NOP? Or maybe it should throw an error when called on
> CGroup_V2 and it would have been a NOP?
>

That sound like we have to handle the returned value/error additionally?
If so, I'd prefer to encapsulate that in CGroup-lib.

-- 
Regards,
Li Wang

--000000000000bb125605b810299b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">Richard Palethorpe &lt;<a href=3D"mailto:rpalethorp=
e@suse.de">rpalethorpe@suse.de</a>&gt; wrote:<br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
&gt;&gt; I have done a direct conversion of the test cases to the new API, =
but<br>
&gt;&gt; I am not sure that it makes sense to call tst_cgroup_move_current<=
br>
&gt;&gt; within the run method of a test because after the first iteration =
it<br>
&gt;&gt;<br>
&gt;<br>
&gt; Hmm, I feel that is a rare scenario in our real test. Mostly we<br>
&gt; just need to set it once in a process.<br>
<br>
I suppose we can just move it into setup then?<br></blockquote><div><br></d=
iv><div><div class=3D"gmail_default" style=3D"font-size:small">For tests th=
at only need a one-time CGroup setting we can, but for</div><div class=3D"g=
mail_default" style=3D"font-size:small">multiple requirements of the same c=
ontroller in many processes it</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">seems not working.</div><br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
&gt; That&#39;s true, but it is mainly caused by different versions of<br>
&gt; CGroup. We could NOT unify the unsupported behavior, so<br>
&gt; maybe the wiser choice is to let _CPUSET test skipping(TCONF)<br>
&gt; directly on CGroup_V2?<br>
<br>
Yes. I wonder if tst_cgroup_move_current should return a value to<br>
indicate it was a NOP? Or maybe it should throw an error when called on<br>
CGroup_V2 and it would have been a NOP?<br></blockquote><div><br></div><div=
><div class=3D"gmail_default" style=3D"font-size:small">That sound like we =
have to handle the returned value/error additionally?</div><div class=3D"gm=
ail_default" style=3D"font-size:small">If so, I&#39;d prefer to encapsulate=
 that in CGroup-lib.</div></div></div><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li=
 Wang<br></div></div></div></div>

--000000000000bb125605b810299b--


--===============1737149499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1737149499==--

