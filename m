Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B83F198AC0
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Mar 2020 05:59:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB7CC3C3178
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Mar 2020 05:59:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A788A3C312F
 for <ltp@lists.linux.it>; Tue, 31 Mar 2020 05:59:45 +0200 (CEST)
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 883B71400993
 for <ltp@lists.linux.it>; Tue, 31 Mar 2020 05:59:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585627182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tvMEo7V/MFfTA2u3XEK0YDamTQNnfBkZpb0FV6F3EsE=;
 b=fYm6eBjmX1Hev6i0U8h5kuUvkaWCOqx1SFlK/WzfpRKUYG4YrXgTp3gmVM9FehLLZ3yFs8
 9Jki3ss2DHeIyb//EZkuRJ7xouljKLKm0kuX+NoGtsyRq34NkwL8wFupddV57/pCxeYBBg
 oNlhPnXmsxtYhzmEsiBNw/uuHaPiMCs=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-8RhnT9G5MqOM1rEhSK5vwQ-1; Mon, 30 Mar 2020 23:59:38 -0400
X-MC-Unique: 8RhnT9G5MqOM1rEhSK5vwQ-1
Received: by mail-lf1-f72.google.com with SMTP id k15so6617244lfc.11
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 20:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SMqUsfVCfeRVHOXoWGunkeWqpsfUkWZu2OGI6JjPp0c=;
 b=sQj+lXAd8lnpkfBRlUjSVOUoPX1BYOSvrfqU7TUF8VkMNwFS14H8oKQvt8HJ95sCtm
 o7ZtLPRSC8p4bbvZSUg3eMTRkjoQOIKH62kkTuogZHXqrWVzBQ4+hvlmv/DvES7tVqxg
 e1uNEIptGLHPDZC2p8xEpOjI6KtHE1O+R1aseLfZCdtmnTwMnUHDJGLX/4/nkAEYNKxs
 2TrXgN30OSSOr0//dVRFiEldO8qnoPvNwEacdC1kgSOJegoztR+6f/udCive978lpToq
 B9K30/ww/D+vQqWa78zQKsUjwd+/eZVYfLHxnfQlVXli6ZNcdZN1Ss6pxf1VAlatPQ+G
 mxpg==
X-Gm-Message-State: AGi0PuYw2B1b3ZAOULVYGKqrCjSg8wg8feRFMzreMZ2SGl65dPjfJ3fz
 JZkFlFfnvrW51NRqekFraY6c5pCgXrY4pEATCVt3sosolcFN7zpaEbjJeZ4k0l0iFiYUeUz8Pt4
 6Mnhxf4eZS/3BX1PpvuljzEGYuYI=
X-Received: by 2002:ac2:58c6:: with SMTP id u6mr9982154lfo.60.1585627176871;
 Mon, 30 Mar 2020 20:59:36 -0700 (PDT)
X-Google-Smtp-Source: APiQypKvgfgjwju+afn4SQznbQZNlWCx1Vm/2T4gAVl9kEEIvtCnDuFdh9KeH+NN6A7ZLKVWgcwixdrMqeKnr7vyczg=
X-Received: by 2002:ac2:58c6:: with SMTP id u6mr9982146lfo.60.1585627176674;
 Mon, 30 Mar 2020 20:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200330124338.6764-1-pvorel@suse.cz>
 <20200330124338.6764-6-pvorel@suse.cz>
 <CAEemH2dQfpn9mEBY=CFfVj_8dLETD7zh4=j3KP-bt95m_CCBxg@mail.gmail.com>
 <20200330200250.GB8636@dell5510>
In-Reply-To: <20200330200250.GB8636@dell5510>
From: Li Wang <liwang@redhat.com>
Date: Tue, 31 Mar 2020 11:59:25 +0800
Message-ID: <CAEemH2drjb8-yRc2jusEjHZvx6OM6q5Tx4+YEW4+iXsr0Pv9HA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/5] Use SAFE_CMD()
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
Content-Type: multipart/mixed; boundary="===============1975135012=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1975135012==
Content-Type: multipart/alternative; boundary="0000000000009cbd0c05a21e989b"

--0000000000009cbd0c05a21e989b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Tue, Mar 31, 2020 at 4:03 AM Petr Vorel <pvorel@suse.cz> wrote:

+ I needed to put back static inline for safe_cmd() (it was in previous
> version,
> it's really needed). So there is latest version available on
> https://github.com/pevik/ltp/tree/needs_cmds.v2.fixes
>
> Diff from v2 below.
>

Awesome work! ACK for this(needs_cmds.v2.fixes + Diff).

--=20
Regards,
Li Wang

--0000000000009cbd0c05a21e989b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hi Petr,</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Mar 31, 2020 at 4:03 AM Petr Vorel &l=
t;<a href=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt; wrote:</div><div=
 dir=3D"ltr" class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
+ I needed to put back static inline for safe_cmd() (it was in previous ver=
sion,<br>
it&#39;s really needed). So there is latest version available on<br>
<a href=3D"https://github.com/pevik/ltp/tree/needs_cmds.v2.fixes" rel=3D"no=
referrer" target=3D"_blank">https://github.com/pevik/ltp/tree/needs_cmds.v2=
.fixes</a><br><br>
Diff from v2 below.<br></blockquote><div><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Awesome work! ACK for this(needs_cmds.v2.fix=
es + Diff).</div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gm=
ail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></di=
v></div></div></div>

--0000000000009cbd0c05a21e989b--


--===============1975135012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1975135012==--

